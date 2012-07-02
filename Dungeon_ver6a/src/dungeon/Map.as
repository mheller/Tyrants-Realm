package dungeon
{
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Vector3D;
	import flash.net.*;
	import flash.ui.Keyboard;
	import flash.xml.*;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.utils.object_proxy;
	
	[Bindable]
	public class Map extends UIComponent
	{
		public var map_xml:XML;		
		public var map_array:Array;
		public var numGridsX:int=0;
		public var numGridsZ:int=0;
		
		public function Map()
		{
			_loadXML();	
		}	
		
		private function _loadXML():void{
			
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, _finishedLoadingXMLResources);
			xmlLoader.load(new URLRequest("dungeon/XML/Den/Den-Sample-Sparse-LV1.xml"));
			//xmlLoader.load(new URLRequest("http://web.pdx.edu/~hptran/Dungeon/Den-Sample-Dense-LV1.xml"));
		}
		
		private function _finishedLoadingXMLResources(e:Event):void{
			map_xml = new XML(e.target.data);
			trace(map_xml);
			_parseXML();
			dispatchEvent(new Event("finishedLoadingMapXML",true));
			
		}
		
		
		
		private function _parseXML():void{
			var grids:XMLList = map_xml.Grid;	
			
			var i:int;
			var j:int;
			var x:int;
			var z:int;

			//get size of dungeon
			for (i= 0 ; i<grids.length(); i++){
				x 	 = parseInt(grids[i].attribute("X").toString());
				z 	 = parseInt(grids[i].attribute("Y").toString());
				if (x>numGridsX)
					numGridsX = x;
				if (z>numGridsZ)
					numGridsZ = z;
			}
			numGridsX+=1;
			numGridsZ+=1;
		
			//inialize grids
			map_array = new Array(numGridsX);
			for (i=0; i<numGridsX; i++){
				map_array[i] = new Array(numGridsZ);
				for (j=0; j<numGridsZ; j++){
					map_array[i][j] = null;
				}
			}
			
			//assign attribute values for each grid
			for ( i= 0 ; i<grids.length(); i++){
				x 	 = parseInt(grids[i].attribute("X").toString());
				z 	 = parseInt(grids[i].attribute("Y").toString());
				
				map_array[x][z] = new Grid();
				for each (var o:XML in grids[i].*){
					if (o.name()=="Wall"){
						map_array[x][z].type = parseInt(grids[i].Wall.attribute("WallType").toString());
						map_array[x][z].rotation = parseInt(grids[i].Wall.attribute("WallRotation").toString());
						for each (var object:XML in grids[i].Wall.*){
							map_array[x][z].collision = new Collision();
							map_array[x][z].collision.type = parseInt(grids[i].Wall.Collision.attribute("Type").toString());
							map_array[x][z].collision.direction = parseInt(grids[i].Wall.Collision.attribute("Direction").toString());			
						}		
					}
					else if (o.name() == "Obj"){
						var dungeon_object:DungeonObject = new DungeonObject();
						dungeon_object.id = parseInt(grids[i].Obj.attribute("Id").toString());
						dungeon_object.h_loc = parseInt(grids[i].Obj.attribute("HLoc").toString());
						dungeon_object.v_loc = parseInt(grids[i].Obj.attribute("VLoc").toString());
						//Alert.show(dungeon_object.h_loc.toString());
						if (map_array[x][z].objects == null)
							map_array[x][z].objects = new Array();
						map_array[x][z].objects.push(dungeon_object);
					}
				}
			}			
		}
	}
}