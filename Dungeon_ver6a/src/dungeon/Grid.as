package dungeon  { 
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	public class Grid {
		
		
		public var type: int;
		public var rotation:int;
		public var tile:Mesh = null;
		public var explored:Boolean=false;
		public var collisions:Array=null;
		public var objects:Array = null;
		public var battle:Array = null;
		public var effects:Array = null;
		public var quests:Array = null;

		public function Grid() {
			// constructor code
			
		}
		
	}
	
}
