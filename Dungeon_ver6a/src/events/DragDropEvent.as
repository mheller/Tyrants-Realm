package events
{
	import flash.events.Event;
	
	
	public class DragDropEvent extends Event
	{
		public static var DRAG_FROM_CHARACTER:String = "drag_from_character";
		public static var DRAG_FROM_INVENTORY:String = "drag_from_inventory";
		
		public var src:Object;
		public var tar:Object;
		
		public function DragDropEvent(type:String, source:Object, target:Object)
		{
			super(type,true);
			this.src = source;
			this.tar = target;
		}
		override public function clone():Event{
			return new DragDropEvent(type,src,tar);
		}
	}
}