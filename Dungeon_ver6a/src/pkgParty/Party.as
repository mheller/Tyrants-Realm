package pkgParty
{
	import character.Character;
	
	import mx.collections.ArrayList;

	[Bindable]
	public class Party
	{
		public var name:String = null;
		public var maxPopulation:int = 0;
		public var currPopulation:int = 0;
		public var arr_chars:ArrayList = null;
		public var currChar:Character = null;
		public var currCharIndex:int = -1;
		
		public function Party(name:String, maxPopulation:int)
		{
			this.name = name;
			this.maxPopulation = maxPopulation;
			this.currPopulation = 0;
			this.arr_chars = new ArrayList();
		}
		
		public function addChar(char:Character):Boolean{
			if (char == null){
				return false;
			}
			if(currPopulation == maxPopulation){
				return false;
			}
			this.currPopulation ++;
			this.arr_chars.addItem(char);
			return true;
		}
		
		public function delChar():Boolean{
			return true;
		}
		
		
		
	}
}