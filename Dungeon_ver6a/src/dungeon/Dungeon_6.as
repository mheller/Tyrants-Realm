﻿package  dungeon{
	
	import away3d.containers.*;
	import away3d.core.base.*;
	import away3d.core.clip.Clipping;
	import away3d.core.clip.RectangleClipping;
	import away3d.core.render.Renderer;
	import away3d.core.utils.*;
	import away3d.debug.AwayStats;
	import away3d.events.MouseEvent3D;
	import away3d.lights.DirectionalLight3D;
	import away3d.lights.PointLight3D;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Vector3D;
	import flash.media.Sound;
	import flash.net.*;
	import flash.ui.Keyboard;
	import flash.xml.*;
	
	import hud.*;
	
	import mx.accessibility.UIComponentAccProps;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	
	import objects.brokencrate.Brokencrate;
	import objects.crate.Crate;
	import objects.chest.Chest;
	import objects.openchest.Openchest;
	
	import spark.components.Application;
	
	import tileset.box.Box;
	import tileset.corner.Corner;
	import tileset.end.End;
	import tileset.floor.Floor;
	import tileset.hall.Hall;
	import tileset.wall.Wall;
	
	public class Dungeon_6 extends UIComponent{
		public var map:Map;
		private var _view : View3D;
			
		private const _velocity: Number = 80;
		private const _angularVelocity: Number =5;
		private const _collisionVelocity: Number =50;
		private const _minCollisionVelocity: Number = 15;
		private var _distanceFromWall:Number = 350;//value will be changed in init_3D()
		
		public static const gridWidth:int  = 1000;//cubic width
		public static const gridDepth:int  = 1000;//cubic depth 
		public static const gridHeight:int = 1000;//cubic height
		
		public static const sub_grid_width:Number = gridWidth/3;
		public static const sub_grid_height:Number = gridHeight/3;
		public static const sub_grid_depth:Number = gridHeight/3;
		
		
		private var _grids:Array;
		private var _numGridsX:int=0;
		private	var _numGridsZ:int=0;
		
		private var _keyUp : Boolean = false; 
		private var _keyDown : Boolean = false;
		private var _keyLeft : Boolean = false; 
		private var _keyRight : Boolean = false;
		
		private const tileType:Array = new Array(Corner,End,Floor,Hall,Wall,Box);
		private const deltaY:Array = new Array(0,0,0,0,0,0);//deltaY of each tile's type
		
		private const objectType:Array = new Array(Crate,Chest);
		
		private const _visibleDistance:int = 3;
		
		private var _light:PointLight3D = null;
		
		//public function Dungeon_6(map:Map) {
		public function Dungeon_6() {
			init();
		}
		
		public function init():void{
			if (map !=null){
				_grids = map.map_array;
				//trace("grid[0][0] type = "+_grids[0][5].type);
				_numGridsX = map.numGridsX;
				_numGridsZ = map.numGridsY;
				_init3D();
			}
		}
		
		private function _init3D():void{
			_view = new View3D();
//			_view.x = 400;
//			_view.y = 300;
			_view.x = stage.stageWidth/2 ;//set center of viewport as funtion of application width
			_view.y = stage.stageHeight/2;//and height
			_distanceFromWall = stage.stageWidth/4;//set min distance between camera and wall as function of application width instead of 350

//			_view.clipping = new RectangleClipping({minX:0,minY:0,maxX:900,maxY:600});;
			addChild(_view);
			
			_view.camera.moveTo(6500,350,1000);//dense : 500,300,2000);
						
			_initScene();	
			
//			var stat: AwayStats = new AwayStats(_view);
//			addChild(stat);
					
			this.addEventListener(Event.ENTER_FRAME, _start3D);
			addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
			addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		}
		
		private function _initScene():void{
			var curCamGridX:int = (int)(_view.camera.x/gridWidth);
			var curCamGridZ:int = (int)(_view.camera.z/gridDepth);
			
			for (var i:int = Math.max(curCamGridX-_visibleDistance,0) ; i<Math.min(curCamGridX+_visibleDistance+1,_numGridsX); i++){
				for (var j:int = Math.max(curCamGridZ-_visibleDistance,0); j<Math.min(curCamGridZ+_visibleDistance+1,_numGridsZ); j++){
					if (_grids[i][j] != null)
						addTile(_grids[i][j].type,i,j,_grids[i][j].rotation);
				}
			}
			//init scence
			//var scene:Scene3D = new Scene3D();
//			//init light
//			_light = new PointLight3D(
//				{ x:_view.camera.x, y:_view.camera.y, z:_view.camera.z,
//					brightness:5, ambient:30, diffuse:500, specular:180 } );
//			//light.position = _view.camera.position;
//			_view.scene.addChild(_light);// .addChild(light);
		}
		
		private function addTile(type:int, gridX:int, gridZ:int, rotation:int):void{
			//if the tile was not added
			if (_grids[gridX][gridZ].tile == null){
				var tile:Mesh = new tileType[type-1]();			
				tile.x = gridX*gridWidth + gridWidth/2;
				tile.z = gridZ*gridDepth + gridDepth/2;
				tile.y = deltaY[type-1] + gridHeight/2;//-(2*tile.maxY-gridHeight-deltaY[type-1]))/2;//suppose left corner's y-coordinate is 0 
				tile.pushback =true;
				tile.rotationY = rotation*90;
				tile.visible = true;		
				_grids[gridX][gridZ].tile = tile;
				_view.scene.addChild(tile);
				_grids[gridX][gridZ].explored = true;
				
				
				
				//add objects into the tile
				if (_grids[gridX][gridZ].objects != null){
					for (var i:int= 0;i<_grids[gridX][gridZ].objects.length;i++){
						var dungeon_object:DungeonObject = DungeonObject(Grid(_grids[gridX][gridZ]).objects[i]);						
						var mesh:Mesh = new objectType[dungeon_object.id];
						//Alert.show(dungeon_object.id.toString());
						mesh.x = gridX*gridWidth + gridWidth/2*(int)((dungeon_object.h_loc-1)/3);
						mesh.y = mesh.objectHeight/2+ sub_grid_height*(dungeon_object.v_loc-1);
						mesh.z = gridZ*gridDepth + gridDepth/2*((dungeon_object.h_loc-1)%3);
						
						trace("x,z : "+(int)((dungeon_object.h_loc-1)/3)+","+(dungeon_object.h_loc-1)%3);
						trace("h_loc,v_loc : "+dungeon_object.h_loc+","+dungeon_object.v_loc);
						
						// Clicking on Crate
						mesh.addEventListener(MouseEvent3D.MOUSE_DOWN,onInteractWithDungeonObject);
						//mesh.objectHeight
						_view.scene.addChild(mesh);
						
					}	
				}
				
			}
			//if the tile was already added, make it visible
			else {
				_grids[gridX][gridZ].tile.visible = true;
			}
			
		}
		
		//function for handling interactions with dungeon object, just for quick proving, structure codes later
		private function onInteractWithDungeonObject(e:MouseEvent3D):void{
			var mesh:Mesh = e.target as Mesh;
			if (mesh is Crate){
				//play sound
				var crate_sound:Sound = new Sound(new URLRequest("objects/crate/crate_smash.mp3"));
				crate_sound.play(1,1);
				//init broken crate
				var brokencrate:Mesh = new Brokencrate();
				brokencrate.x = mesh.x;
				brokencrate.y = mesh.y;
				brokencrate.z = mesh.z;
				//remove crate
				_view.scene.removeChild(mesh);
				//show broken crate 
				_view.scene.addChild(brokencrate);
				
				//show pop up window for rewarding
				Alert.show("Reward: in construction"); //Alert.show("Crate : x="+ mesh.x.toString()+" y="+mesh.y.toString()+" z="+mesh.z.toString());
				
				//hide the broken crate
				//_view.scene.removeChild(brokencrate);
			}
			else if (mesh is Chest) {
				//play sound
				var chest_sound:Sound = new Sound(new URLRequest("objects/chest/open_chest.mp3"));
				chest_sound.play(1,1);
				//init open chest
				var openchest:Mesh = new Openchest();
				openchest.x = mesh.x;
				openchest.y = mesh.y + (openchest.objectHeight - mesh.objectHeight)/2;//openchest and chest can have different size
				openchest.z = mesh.z;
				
				//remove chest
				_view.scene.removeChild(mesh);
				//show open chest 
				_view.scene.addChild(openchest);
				
				//show pop up window for rewarding
				//Alert.show("Reward: in construction"); //Alert.show("Crate : x="+ mesh.x.toString()+" y="+mesh.y.toString()+" z="+mesh.z.toString());
				
			}
		}
		
		private function _updateScene(newCamPosX:int, newCamPosZ:int):void{
			//find Camera's current and new grid positions
			var curCamGridX:int = (int)(_view.camera.x/gridWidth);
			var curCamGridZ:int = (int)(_view.camera.z/gridDepth);
			var newCamGridX:int = (int)(newCamPosX/gridWidth);
			var newCamGridZ:int = (int)(newCamPosZ/gridDepth);
			var i:int;
			var d:int;
			if (newCamGridZ!=curCamGridZ){
				
				if (newCamGridZ>curCamGridZ)
					d = _visibleDistance;
				else
					d = -_visibleDistance;
					
				for (i = Math.max(newCamGridX-_visibleDistance,0); i<Math.min(newCamGridX+_visibleDistance+1,_numGridsX); i++){
					if (newCamGridZ+d>=0 && newCamGridZ+d<_numGridsZ &&_grids[i][newCamGridZ+d] != null) {
						addTile(_grids[i][newCamGridZ+d].type,i,newCamGridZ+d,_grids[i][newCamGridZ+d].rotation);
					}
				}
				
				for (i = Math.max(curCamGridX-_visibleDistance,0); i<Math.min(curCamGridX+_visibleDistance+1,_numGridsX); i++){
					if (curCamGridZ-d>=0 && curCamGridZ-d<_numGridsZ &&_grids[i][curCamGridZ-d] != null)
						//_view.scene.removeChild(_grids[i][curCamGridZ-d].tile);
						//can remove the tile, and add again or make it invisible and visible again
						_grids[i][curCamGridZ-d].tile.visible = false;
						//var myTween:Tween = new Tween(_grids[i][curCamGridZ-d].tile, "alpha", Strong.easeOut, 1, 0, 2, true);

				}
			}
			
			if (newCamGridX!=curCamGridX){
				if (newCamGridX>curCamGridX)
					d = _visibleDistance;
				else
					d = -_visibleDistance;
					
				for (i = Math.max(newCamGridZ-_visibleDistance,0); i<Math.min(newCamGridZ+_visibleDistance+1,_numGridsZ); i++){
					if (newCamGridX+d>=0 && newCamGridX+d<_numGridsX &&_grids[newCamGridX+d][i] != null) {
						addTile(_grids[newCamGridX+d][i].type,newCamGridX+d,i,_grids[newCamGridX+d][i].rotation);
					}
				}
				
				for (i = Math.max(curCamGridZ-_visibleDistance,0); i<Math.min(curCamGridZ+_visibleDistance+1,_numGridsZ); i++){
					if (curCamGridX-d>=0 && curCamGridX-d<_numGridsX &&_grids[curCamGridX-d][i] != null)
						//_view.scene.removeChild(_grids[i][curCamGridZ-d].tile);
						//can remove the tile, and add again or make it invisible and visible again
						_grids[curCamGridX-d][i].tile.visible = false;
						//var myTween:Tween = new Tween(_grids[i][curCamGridZ-d].tile, "alpha", Strong.easeOut, 1, 0, 2, true);
				}
			}
				
		}
		
		private function _start3D(e:Event):void{
			var newCamPosX:int;
			var newCamPosZ:int;
			
//			this.stage.focus = this;   Moved to TyrantsRealm.reportMouse.Down
			if(_keyLeft)
			{
				_view.camera.rotationY -= _angularVelocity; 				
			}
			else if(_keyRight)
			{
				_view.camera.rotationY += _angularVelocity; 				
			}
			
			if (_keyUp || _keyDown)
			{
				if(_keyUp)
				{
					newCamPosX = _view.camera.x+_velocity*Math.sin(_view.camera.rotationY*Math.PI/180);
					newCamPosZ = _view.camera.z+_velocity*Math.cos(_view.camera.rotationY*Math.PI/180);	
				}
				else 
				{
					newCamPosX = _view.camera.x-_velocity*Math.sin(_view.camera.rotationY*Math.PI/180);
					newCamPosZ = _view.camera.z-_velocity*Math.cos(_view.camera.rotationY*Math.PI/180);
				}
				var collisionType:int = _detectCollision(newCamPosX,newCamPosZ);
				//if there is no collision
				if (collisionType == 0 ){
					_updateScene(newCamPosX,newCamPosZ);
					_view.camera.x = newCamPosX;
					_view.camera.z = newCamPosZ;
				}
				//else , if there is collision or door, react
				else {
					//if there is a door on the moving direction,react
					if (!_teleportingEffect())
						//else, effect : sliding
						switch (collisionType){
						case 1 : _reactCollisionX(newCamPosX, newCamPosZ);
								  break;
						case 2 : _reactCollisionZ(newCamPosX, newCamPosZ);
								  break;
						//case 3 : _reactCollisionXZ();}
					}
				}
			}
			_view.render();			
		}
		
		private function _teleportingEffect():Boolean{
			var curCamGridX:int = (int)(_view.camera.x/gridWidth);
			var curCamGridZ:int = (int)(_view.camera.z/gridDepth);
			var newCamPosX:int;
			var newCamPosZ:int;
			//check if there is a door in this grid
			if (_grids[curCamGridX][curCamGridZ].collisions != null){
				//if there is a door, check if door allowed moving direction is the same as player direction
				//***right now, not care about the type of door
				//trace("door", curCamGridX,  curCamGridZ, _grids[curCamGridX][curCamGridZ].collision.direction);
				for ( var i:int= 0; i<_grids[curCamGridX][curCamGridZ].collisions.length; i++){
					switch ((Collision)(_grids[curCamGridX][curCamGridZ].collisions[i]).direction){
						case 0: if (int(_view.camera.z) == (curCamGridZ+1)*gridDepth-_distanceFromWall){
									newCamPosZ = (curCamGridZ+1)*gridDepth+_distanceFromWall;
									_updateScene(_view.camera.x,newCamPosZ);
									_view.camera.z = newCamPosZ;
									return true;
								}
								//trace("0");
								break;
								
						case 1: if (int(_view.camera.x) == (curCamGridX+1)*gridWidth-_distanceFromWall){
									newCamPosX = (curCamGridX+1)*gridWidth+_distanceFromWall;
									_updateScene(newCamPosX,_view.camera.z);
									_view.camera.x = newCamPosX ;
									return true;
								}
									//trace("1");
								break;
								
						case 2: if (int(_view.camera.z) == curCamGridZ*gridDepth+_distanceFromWall){
									newCamPosZ = curCamGridZ*gridDepth-2*_distanceFromWall;
									_updateScene(_view.camera.x,newCamPosZ);
									_view.camera.z = newCamPosZ;
									return true;
								}
								//trace("2");
								break;
								
						case 3: if (int(_view.camera.x) == curCamGridX*gridWidth+_distanceFromWall){
									newCamPosX = curCamGridX*gridWidth-2*_distanceFromWall;
									_updateScene(newCamPosX,_view.camera.z);
									_view.camera.x = newCamPosX;
									return true;
								}
								//trace("3");
								break;
					}
				}
			}
			return false;
		}
		
		private function _reactCollisionX(newCamPosX:int, newCamPosZ:int):void{
			
			
			var curCamGridX:int = (int)(_view.camera.x/gridWidth);
			var curCamGridZ:int = (int)(_view.camera.z/gridDepth);
			if (_view.camera.x == curCamGridX*gridWidth+_distanceFromWall || _view.camera.x == (curCamGridX+1)*gridWidth-_distanceFromWall){
				//calculate z new position
				var collisionAngle:Number = Math.atan(Math.abs(_view.camera.x-newCamPosX)/Math.abs(_view.camera.z - newCamPosZ));
				var slideZ:Number = _collisionVelocity*Math.cos(collisionAngle);
				if (Math.abs(slideZ)>_minCollisionVelocity){
					if (_view.camera.z > newCamPosZ)
						slideZ = -slideZ; 
					_updateScene(_view.camera.x,_view.camera.z+slideZ);
					_view.camera.z = _view.camera.z+slideZ;
				}
				
			}
			else {
				//collision on the left wall 
				if (Math.abs(_view.camera.x - curCamGridX*gridWidth) < Math.abs(_view.camera.x - (curCamGridX+1)*gridWidth)){
					_view.camera.z -= (_view.camera.x - (curCamGridX*gridWidth+_distanceFromWall))*1/Math.tan(_view.camera.rotationY*Math.PI/180);
					_view.camera.x = curCamGridX*gridWidth+_distanceFromWall;
				}
				
				//collision on the right wall
				else{
					_view.camera.z += ((curCamGridX+1)*gridWidth-_distanceFromWall-_view.camera.x)*1/Math.tan(_view.camera.rotationY*Math.PI/180);
					_view.camera.x = (curCamGridX+1)*gridWidth-_distanceFromWall;
				}
			}
		}
		
		private function _reactCollisionZ(newCamPosX:int, newCamPosZ:int):void{
			//trace("z");
			var curCamGridX:int = (int)(_view.camera.x/gridWidth);
			var curCamGridZ:int = (int)(_view.camera.z/gridDepth);
			if (_view.camera.z == curCamGridZ*gridDepth+_distanceFromWall || _view.camera.z == (curCamGridZ+1)*gridDepth-_distanceFromWall){
				//calculate x new position
				var collisionAngle:Number = Math.atan(Math.abs(_view.camera.x-newCamPosX)/Math.abs(_view.camera.z - newCamPosZ));
				var slideX:Number = _collisionVelocity*Math.cos(collisionAngle);
				if (Math.abs(slideX)>_minCollisionVelocity){
					if (_view.camera.x > newCamPosX)
						slideX = -slideX; 
					_updateScene(_view.camera.x+slideX,_view.camera.z);
					_view.camera.x = _view.camera.x+slideX;
				}
				
			}
			else {
				//collision on the bottom wall 
				if (Math.abs(_view.camera.z - curCamGridZ*gridDepth) < Math.abs(_view.camera.z - (curCamGridZ+1)*gridDepth)){
					_view.camera.x -= (_view.camera.z - (curCamGridZ*gridDepth+_distanceFromWall))*Math.tan(_view.camera.rotationY*Math.PI/180);
					_view.camera.z = curCamGridZ*gridDepth+_distanceFromWall;
				}
				//collision on the top wall
				else{
					_view.camera.x += ((curCamGridZ+1)*gridDepth-_distanceFromWall-_view.camera.z)*Math.tan(_view.camera.rotationY*Math.PI/180);
					_view.camera.z = (curCamGridZ+1)*gridDepth-_distanceFromWall;
				}
			}
		}
		
		private function _reactCollisionXZ():void{
			
		}
		
		// return 0: no collision,
		//1 : collsion with wall parallel with x-axis, 
		//2 : collision with wall parallel with y-axis,
		//3 : collision with wall parallel with x-axis, and wall parallel with y-axis
		//4 : wrong detection
		private function _detectCollision(newCamPosX:int, newCamPosZ:int):int{
			//find Camera's current and new grid positions
			var curCamGridX:int = (int)(_view.camera.x/gridWidth);
			var curCamGridZ:int = (int)(_view.camera.z/gridDepth);
			
			var curTileType:int = _grids[curCamGridX][curCamGridZ].type;
			var curTileRoation:int = _grids[curCamGridX][curCamGridZ].rotation;
			//check collision base on current grid position and new camera position
			var collisionType:int=0;
			switch (curTileType){
				case 1 : collisionType = _detectCornerCollision(curCamGridX, curCamGridZ, newCamPosX, newCamPosZ, curTileRoation);
						 break;
				case 2 : collisionType = _detectEndCollision(curCamGridX, curCamGridZ, newCamPosX, newCamPosZ, curTileRoation);
						 break;
				case 4 : collisionType = _detectHallCollision(curCamGridX, curCamGridZ, newCamPosX, newCamPosZ, curTileRoation);
						 break;
				case 5 : collisionType = _detectWallCollision(curCamGridX, curCamGridZ, newCamPosX, newCamPosZ, curTileRoation);
						 break;
				case 6 : collisionType = _detectBoxCollision(curCamGridX, curCamGridZ, newCamPosX, newCamPosZ, curTileRoation);
						 break;	
			}
			//if there is no collision in current grid, check collision with inner corner
			var newCamGridX:int = (int)(newCamPosX/gridWidth);
			var newCamGridZ:int = (int)(newCamPosZ/gridDepth);
				
			if (collisionType == 0 && curTileType != 2 && curTileType != 4 && (newCamGridX != curCamGridX || newCamGridZ != curCamGridZ)){
				if (_grids[newCamGridX][newCamGridZ] == null)
					return 4;
				//trace("floor1");
				return 0;
				var newTileRoation:int = _grids[newCamGridX][newCamGridZ].rotation;
				var newTileType:int = _grids[newCamGridX][newCamGridZ].type;
				
				if ((newTileType == 1 && _detectCornerCollision(newCamGridX, newCamGridZ, newCamPosX, newCamPosZ, newTileRoation)==0) 
					|| (newTileType == 5 && _detectWallCollision(newCamGridX, newCamGridZ, newCamPosX, newCamPosZ, newTileRoation)==0)
					|| (newTileType == 2 && _detectEndCollision(newCamGridX, newCamGridZ, newCamPosX, newCamPosZ, newTileRoation)==0)
					|| (newTileType == 4 && _detectHallCollision(newCamGridX, newCamGridZ, newCamPosX, newCamPosZ, newTileRoation)==0)
					|| newTileType == 3)
					return 0;
//					
//				//trace("floor2");
				return 4;
			}
			
			return collisionType;
			
		}
		
		private function _detectBoxCollision(curCamGridX:int, curCamGridZ:int, newCamPosX:int, newCamPosZ:int, rotation:int):int{
			var leftCondition:int = curCamGridX*gridWidth+_distanceFromWall;
			var rightCondition:int = (curCamGridX+1)*gridWidth- _distanceFromWall;
			var downCondition:int = curCamGridZ*gridDepth + _distanceFromWall;
			var topCondition:int = (curCamGridZ+1)*gridDepth - _distanceFromWall;
			
			if (newCamPosX>leftCondition && newCamPosX<rightCondition && newCamPosZ> downCondition && newCamPosZ<topCondition)
				return 0;
			else if ((newCamPosX<leftCondition || newCamPosX>rightCondition) && newCamPosZ> downCondition && newCamPosZ<topCondition)
				return 1;
			else if (newCamPosX>leftCondition && newCamPosX<rightCondition && (newCamPosZ>topCondition || newCamPosZ<downCondition))
				return 2;
			else
				return 3;
				
			return 4;
		}
		
		
		private function _detectCornerCollision(curCamGridX:int, curCamGridZ:int, newCamPosX:int, newCamPosZ:int, rotation:int):int{
		
			var leftCondition:int = curCamGridX*gridWidth+_distanceFromWall;
			var rightCondition:int = (curCamGridX+1)*gridWidth- _distanceFromWall;
			var downCondition:int = curCamGridZ*gridDepth + _distanceFromWall;
			var topCondition:int = (curCamGridZ+1)*gridDepth - _distanceFromWall;
			
			switch (rotation){
				case 0 :if (newCamPosX>leftCondition && newCamPosZ<topCondition)
							return 0;
						else if (newCamPosX<leftCondition && newCamPosZ<topCondition)
						 	return 1;
						else if (newCamPosX>leftCondition && newCamPosZ>topCondition)
						 	return 2;
						else 
						 	return 3;
				case 1 :if (newCamPosX<rightCondition && newCamPosZ<topCondition)
							return 0;
						else if (newCamPosX>rightCondition && newCamPosZ<topCondition)
							return 1;
						else if (newCamPosX<rightCondition && newCamPosZ>topCondition)
							return 2;
						else
							return 3;
				case 2 :if (newCamPosX<rightCondition && newCamPosZ>downCondition)
							return 0;
						if (newCamPosX>rightCondition && newCamPosZ>downCondition)
							return 1;
						if (newCamPosX<rightCondition && newCamPosZ<downCondition)
							return 2;
						else
							return 3;
				case 3 :if (newCamPosX>leftCondition && newCamPosZ>downCondition)
							return 0;
						else if (newCamPosX<leftCondition && newCamPosZ>downCondition)
							return 1;
						else if (newCamPosX>leftCondition && newCamPosZ<downCondition)
							return 2;
						else
							return 3;
			}
			return 4;
		}
		
		private function _detectEndCollision(curCamGridX:int, curCamGridZ:int, newCamPosX:int, newCamPosZ:int, rotation:int):int{
			
			var leftCondition:int = curCamGridX*gridWidth+_distanceFromWall;
			var rightCondition:int = (curCamGridX+1)*gridWidth- _distanceFromWall;
			var downCondition:int = curCamGridZ*gridDepth + _distanceFromWall;
			var topCondition:int = (curCamGridZ+1)*gridDepth - _distanceFromWall;
			
			
			switch (rotation){
				case 0 :if (newCamPosX>leftCondition && newCamPosX<rightCondition && newCamPosZ<topCondition)
							return 0;
						else if ((newCamPosX<leftCondition || newCamPosX>rightCondition) && newCamPosZ<topCondition)
							return 1;
						else if (newCamPosX>leftCondition && newCamPosX<rightCondition && newCamPosZ>topCondition)
							return 2;
						else
							return 3;
				case 1 :if (newCamPosX<rightCondition &&  newCamPosZ>downCondition && newCamPosZ<topCondition)
							return 0;
						else if (newCamPosX>rightCondition &&  newCamPosZ>downCondition && newCamPosZ<topCondition)
							return 1;
						else if (newCamPosX<rightCondition &&  (newCamPosZ<downCondition || newCamPosZ>topCondition))
							return 2;
						else
							return 3;
				case 2 :if (newCamPosX>leftCondition && newCamPosX<rightCondition && newCamPosZ>downCondition)
							return 0;
						else if ((newCamPosX<leftCondition || newCamPosX>rightCondition) && newCamPosZ>downCondition)
							return 1;
						else if (newCamPosX>leftCondition && newCamPosX<rightCondition && newCamPosZ<downCondition)
							return 2;
						else
							return 3;
				case 3 :if (newCamPosX>leftCondition && newCamPosZ>downCondition && newCamPosZ<topCondition)
							return 0;
						else if (newCamPosX<leftCondition && newCamPosZ>downCondition && newCamPosZ<topCondition)
							return 1;
						else if (newCamPosX>leftCondition && (newCamPosZ<downCondition || newCamPosZ>topCondition))
							return 2;
						else
							return 3;
			}
			return 4;
		}
		
		private function _detectHallCollision(curCamGridX:int, curCamGridZ:int, newCamPosX:int, newCamPosZ:int, rotation:int):int{
			
			var leftCondition:int = curCamGridX*gridWidth+_distanceFromWall;
			var rightCondition:int = (curCamGridX+1)*gridWidth- _distanceFromWall;
			var downCondition:int = curCamGridZ*gridDepth + _distanceFromWall;
			var topCondition:int = (curCamGridZ+1)*gridDepth - _distanceFromWall;
			
			switch (rotation){
				case 0 :if (newCamPosX>leftCondition && newCamPosX<rightCondition)
							return 0;
						else
							return 1;
				case 1 :if (newCamPosZ>downCondition && newCamPosZ<topCondition)
							return 0;
						else 
							return 2;
				case 2 :if (newCamPosX>leftCondition && newCamPosX<rightCondition)
							return 0;
						else
							return 1;
				case 3 :if (newCamPosZ>downCondition && newCamPosZ<topCondition)
							return 0;
						else
							return 2;
			}
			return 4;
		}
		
		private function _detectWallCollision(curCamGridX:int, curCamGridZ:int, newCamPosX:int, newCamPosZ:int, rotation:int):int{
			
			var leftCondition:int = curCamGridX*gridWidth+_distanceFromWall;
			var rightCondition:int = (curCamGridX+1)*gridWidth- _distanceFromWall;
			var downCondition:int = curCamGridZ*gridDepth + _distanceFromWall;
			var topCondition:int = (curCamGridZ+1)*gridDepth - _distanceFromWall;
			
			switch (rotation){
				case 0 :if (newCamPosX>leftCondition)
							return 0;
						else
							return 1;
				case 1 :if (newCamPosZ<topCondition)
							return 0;
						else
							return 2;
				case 2 :if (newCamPosX<rightCondition)
							return 0;
						else 
							return 1;
				case 3 :if (newCamPosZ>downCondition)
							return 0;
						else 
							return 2;
			}
			return 4;
		}
		
		private function _onKeyDown(ev : KeyboardEvent) : void{
			if (ev.charCode == 119 || ev.keyCode == Keyboard.UP) { 
				_keyUp = true;
			} else if (ev.charCode == 97 || ev.keyCode == Keyboard.LEFT) {
				_keyLeft = true;
			} else if (ev.charCode == 115 || ev.keyCode == Keyboard.DOWN) {
				_keyDown = true;
			} else if (ev.charCode == 100 || ev.keyCode == Keyboard.RIGHT) {
				_keyRight = true;
			}
		}
			
		private function _onKeyUp(ev : KeyboardEvent) : void{
			if (ev.charCode == 119 || ev.keyCode == Keyboard.UP) { 
				_keyUp = false;
			} else if (ev.charCode == 97 || ev.keyCode == Keyboard.LEFT) {
				_keyLeft = false;
			} else if (ev.charCode == 115 || ev.keyCode == Keyboard.DOWN) {
				_keyDown = false;
			} else if (ev.charCode == 100 || ev.keyCode == Keyboard.RIGHT) {
				_keyRight = false;
			}
		}
		
		
		public function getCurCamPos():Vector3D{
			return _view.camera.position;
		}
		
		public function getCurCamRot():Number{
			return _view.camera.rotationY;
		}
	}
	
}
