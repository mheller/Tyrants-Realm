package dungeon  { 
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	public class Grid {
		
		
		public var type: int;
		public var rotation:int;
		public var tile:Mesh = null;
		public var collision:Collision=null;
		public var explored:Boolean=false;
		public var objects:Array = null;
		public function Grid() {
			// constructor code
		}
		
	}
	
}
