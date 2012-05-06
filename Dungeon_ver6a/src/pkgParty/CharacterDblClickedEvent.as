package pkgParty
{
	import character.Character;
	
	import flash.events.Event;
	
	import mx.states.OverrideBase;
	
	public class CharacterDblClickedEvent extends Event
	{
		public var char:Character;
		public var indexCharInParty:int;
		
		public function CharacterDblClickedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, char:Character=null, index:int = -1)
		{
			super(type, bubbles, cancelable);
			this.char = char;
			this.indexCharInParty = index;
		}
		
		override public function clone():Event{
			return new CharacterDblClickedEvent(type,bubbles,cancelable,char);
		}
		
	}
}