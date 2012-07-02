package pkgParty
{
	import character.Character;
	
	import mx.collections.ArrayList;

	[Bindable]
	public class Party
	{
		private var name:String = null;
		private var maxPopulation:int = 0;
		private var currPopulation:int = 0;
		private var arr_chars:ArrayList = null;
		private var currChar:Character = null;
		private var currCharIndex:int = -1;
		private var expBonus:int = 0;     // Experience Bonus by percent for all members of the party
		private var denBonus:int = 0;     // Dendarii Bonus by percent for all members of the party
		private var runBonus:int = 0;     // Increased chance of successfully running from combat
		private var incMonsterFreq:int = 0;   // Increased chance of a random dungeon encounter
		private var decMonsterFreq:int = 0;   // Decreased chance of random dungeon encounter
		
		public function Party(name:String, maxPopulation:int)
		{
			this.name = name;
			this.maxPopulation = maxPopulation;
			this.currPopulation = 0;
			this.arr_chars = new ArrayList();
		}
		
		
		public function getName():String {
			return this.name;
		}
		public function setName(name:String):void {
			this.name = name;
		}
		
		public function getMaxPopulation():int {
			return this.maxPopulation;
		}
		public function setMaxPopulation(max:int):void {
			this.maxPopulation = max;
		}
		
		public function getCurrPopulation():int {
			return this.currPopulation;
		}
		public function setCurrPopulation(max:int):void {
			this.currPopulation = max;
		}
		public function incCurrPopulation():void {
			this.currPopulation++;
		}
		public function decCurrPopulation():void {
			this.currPopulation--;
		}
		
		public function getCurrChar():Character {
			return this.currChar;
		}
		public function setCurrChar(char:Character):void {
			this.currChar = char;
		}
		
		public function getCurrCharIndex():int {
			return this.currCharIndex;
		}
		public function setCurrCharIndex(index:int):void {
			this.currCharIndex = index;
		}
				
		public function addChar(char:Character):Boolean{
			if (char == null){
				return false;
			}
			if(currPopulation == maxPopulation){
				return false;
			}
			this.currPopulation++;
			this.arr_chars.addItem(char);
			return true;
		}
		public function delChar():Boolean{
			return true;
		}
		public function getCharAt(index:int):Character {
		   return (Character)(this.arr_chars.getItemAt(index));	
		}
		
		public function getExpBonus():int {
			return this.expBonus;
		}
		public function addExpBonus(bonus:int):void {
			this.expBonus += bonus;
		}
		public function remExpBonus(bonus:int):void {
			this.expBonus -= bonus;
			if (this.expBonus < 0) expBonus = 0;
		}
		
		public function getDenBonus():int {
			return this.denBonus;
		}
		public function addDenBonus(bonus:int):void {
			this.denBonus += bonus;
		}
		public function remDenBonus(bonus:int):void {
			this.denBonus -= bonus;
			if (this.denBonus < 0) denBonus = 0;
		}
		
		public function getRunBonus():int {
			return this.runBonus;
		}
		public function addRunBonus(bonus:int):void {
			this.runBonus += bonus;
		}
		public function remRunBonus(bonus:int):void {
			this.runBonus -= bonus;
			if (this.runBonus < 0) runBonus = 0;
		}
		
		public function getIncMonsterFreq():int {
			return this.incMonsterFreq;
		}
		public function addIncMonsterFreq(bonus:int):void {
			this.incMonsterFreq += bonus;
		}
		public function remIncMonsterFreq(bonus:int):void {
			this.incMonsterFreq -= bonus;
			if (this.incMonsterFreq < 0) incMonsterFreq = 0;
		}
		
		public function getDecMonsterFreq():int {
			return this.decMonsterFreq;
		}
		public function addDecMonsterFreq(bonus:int):void {
			this.decMonsterFreq += bonus;
		}
		public function remDecMonsterFreq(bonus:int):void {
			this.decMonsterFreq -= bonus;
			if (this.decMonsterFreq < 0) decMonsterFreq = 0;
		}
		
		
	}
}