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
		public var numGridsY:int=0;
		public var randomNPCs:Array;
		public var map_type:String;
		public var map_id:int=0;
		public var map_level:int=0;
		public var special:int=0;
		public var tileset:int=0;
		
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
			var y:int;

			//get size of dungeon
			for (i= 0 ; i<grids.length(); i++){
				x 	 = parseInt(grids[i].attribute("X").toString());
				y 	 = parseInt(grids[i].attribute("Y").toString());
				if (x>numGridsX)
					numGridsX = x;
				if (y>numGridsY)
					numGridsY = y;
			}
			numGridsX+=1;
			numGridsY+=1;
		
			// Map header
			map_id = parseInt(map_xml.attribute("ID").toString());
			map_type = map_xml.attribute("Type").toString();
			map_level = parseInt(map_xml.attribute("Level").toString());
			special = parseInt(map_xml.attribute("Special").toString());
			tileset = parseInt(map_xml.attribute("Tileset").toString());
			
			//inialize map grid
			map_array = new Array(numGridsX);
			for (i=0; i<numGridsX; i++){
				map_array[i] = new Array(numGridsY);
				for (j=0; j<numGridsY; j++){
					map_array[i][j] = null;
				}
			}
			
			//assign attribute values for each grid of the map
			for ( i= 0 ; i<grids.length(); i++){
				x 	 = parseInt(grids[i].attribute("X").toString());
				y 	 = parseInt(grids[i].attribute("Y").toString());
				
				map_array[x][y] = new Grid();
				for each (var o:XML in grids[i].*){
					if (o.name()=="Wall"){
						map_array[x][y].type = parseInt(grids[i].Wall.attribute("WallType").toString());
						map_array[x][y].rotation = parseInt(grids[i].Wall.attribute("WallRotation").toString());
						for each (var object:XML in grids[i].Wall.*){
							if (map_array[x][y].collisions == null)
								map_array[x][y].collisions = new Array();
							var collision_object:Collision = new Collision();
							collision_object.type = parseInt(grids[i].Wall.Collision.attribute("Type").toString());
							collision_object.direction = parseInt(grids[i].Wall.Collision.attribute("Direction").toString());
							map_array[x][y].collisions.push(collision_object);
							
						}		
					}
					else if (o.name() == "Obj"){
						var dungeon_object:DungeonObject = new DungeonObject();
						dungeon_object.id = parseInt(grids[i].Obj.attribute("ID").toString());
						dungeon_object.h_loc = parseInt(grids[i].Obj.attribute("HLoc").toString());
						dungeon_object.v_loc = parseInt(grids[i].Obj.attribute("VLoc").toString());
						//Alert.show(dungeon_object.h_loc.toString());
						if (map_array[x][y].objects == null)
							map_array[x][y].objects = new Array();
						map_array[x][y].objects.push(dungeon_object);
					}
					else if (o.name() == "Quest"){
						var quest_object:Quest = new Quest();
						quest_object.id = parseInt(grids[i].Quest.attribute("Id").toString());
						if (map_array[x][y].quests == null)
							map_array[x][y].quests = new Array();
						map_array[x][y].quests.push(quest_object);
					}
					else if (o.name() == "Effect"){
						var effect_object:Effect = new Effect();
						effect_object.id = parseInt(grids[i].Effect.attribute("ID").toString());
						effect_object.h_loc = parseInt(grids[i].Effect.attribute("HLoc").toString());
						effect_object.v_loc = parseInt(grids[i].Effect.attribute("VLoc").toString());
						if (map_array[x][y].effects == null)
							map_array[x][y].effects = new Array();
						map_array[x][y].effects.push(effect_object);
					}
					else if (o.name() == "FixedNPC"){
						for each (var battleNPC:XML in grids[i].FixedNPC.*){
							if (map_array[x][y].battle == null)
								map_array[x][y].battle = new Array();
						
							var fixed_npc:FixedNPC = new FixedNPC();
							fixed_npc.id = parseInt(grids[i].FixedNPC.FNPC.attribute("ID").toString());
							fixed_npc.qty_min = parseInt(grids[i].FixedNPC.FNPC.attribute("QtyMin").toString());
							fixed_npc.qty_max = parseInt(grids[i].FixedNPC.FNPC.attribute("QtyMax").toString());
							fixed_npc.boss_num = parseInt(grids[i].FixedNPC.FNPC.attribute("Boss").toString());
							map_array[x][y].battle.push(fixed_npc);
						}
					}
				}
			}
			
			// Random NPCs
			for each (var RandNPC:XML in map_xml.RandomNPC.*){
				if (this.randomNPCs == null)
					this.randomNPCs = new Array();
				var rand_npc:RandomNPC = new RandomNPC();
				rand_npc.id = parseInt(map_xml.RandomNPC.NPC.attribute("ID").toString());
				rand_npc.qty_min = parseInt(map_xml.RandomNPC.NPC.attribute("QtyMin").toString());
				rand_npc.qty_max = parseInt(map_xml.RandomNPC.NPC.attribute("QtyMax").toString());
				rand_npc.boss_num = parseInt(map_xml.RandomNPC.NPC.attribute("Boss").toString());
				this.randomNPCs.push(rand_npc);	
			}		
			
		}
	}
}