package character
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import pkgInventory.ItemGroup;
	import pkgInventory.ItemStack;

	[Bindable]
	public class Inventory
	{
		public var maxSize:int;	// maximum number of itemGroups inside an inventory
		public var currSize:int;	// current number of itemGroups inside an inventory
		//public var list_itemGroup:ArrayList; // list of item groups
		
		public var list_itemStack:ArrayList; // list of 10 item stacks
		
		public var iStack1:ItemStack;
		public var iStack2:ItemStack;
		public var iStack3:ItemStack;
		public var iStack4:ItemStack;
		public var iStack5:ItemStack;
		public var iStack6:ItemStack;
		public var iStack7:ItemStack;
		public var iStack8:ItemStack;
		public var iStack9:ItemStack;
		public var iStack10:ItemStack;
		public var iStack11:ItemStack;
		public var iStack12:ItemStack;
		public var iStack13:ItemStack;
		public var iStack14:ItemStack;
		public var iStack15:ItemStack;
		public var iStack16:ItemStack;
		public var iStack17:ItemStack;
		public var iStack18:ItemStack;
		public var iStack19:ItemStack;
		public var iStack20:ItemStack;
		public var iStack21:ItemStack;
		public var iStackBG:ItemStack;
		
		public var item_benefit:ArrayCollection = new ArrayCollection();//data provider for data grid of item benefits component
		public var item_material:ArrayCollection = new ArrayCollection();//data provider for data grid of item materials component

		
/*		public function Inventory(maxSize: int, list_itemGroup:ArrayList){
				this.maxSize = maxSize;
				this.list_itemGroup = list_itemGroup;
		}*/
		public function Inventory(maxSize: int){
			this.maxSize = maxSize;
			this.currSize =0;
			//this.list_itemGroup = new ArrayList();
			
			// initial a list of 10 item stacks;
			this.list_itemStack = new ArrayList();
		}

		public function addItem(item:ItemStack, qty:int):void {

			for (var i:int=0; i < qty; i++) {
				
				// Find the next available or stackable spot
				var tempItemStack:ItemStack = nextAvailableInventorySpot(item,item);
				if (tempItemStack.currSize == 0) {
					tempItemStack.currSize++;
					tempItemStack.displayPath = item.displayPath;
					tempItemStack.item = item.item;
					tempItemStack.itemType = item.itemType;
				}
				else {  // nextAvailableInventorySpot already tests for reaching max stacksize.
					tempItemStack.currSize++;
				}
			}
		}
		
		
		
		//@ Hoang: add a new Stack to inventory
		public function addStack(newStack:ItemStack) :Boolean{
			if (this.currSize < this.maxSize){
				this.list_itemStack.addItem(newStack);
				this.currSize++;
				return true;
			}
			return false;
		}
		
		// @Hoang: remove a STACK from inventory
		public function removeStack(index:int):Boolean{
			if(currSize < 0){
				trace("there is no stack in inventory");
				return false;
			}
			if( (index>=0) && (index<currSize-1) ){
				this.list_itemStack.removeItemAt(index);
				this.currSize--;
				return true;
			}
			return false;
		}

		public function nextAvailableInventorySpot(src:ItemStack, vacatingStack:ItemStack):ItemStack {
			var tempItemStack:ItemStack;
			var source:ItemStack = src;
			tempItemStack = this.iStack1;   // inv slot 1
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize)
					return tempItemStack;
			}	
			tempItemStack = this.iStack2; // inv slot 2
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack3; // inv slot 3
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;					
				}						
			}	
			tempItemStack = this.iStack4; // inv slot 4
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;					
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
					
				}						
			}	
			tempItemStack = this.iStack5;   // inv slot 5
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack6; // inv slot 6
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;			
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
					
				}						
			}	
			tempItemStack = this.iStack7;  // inv slot 7
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
					
				}						
			}	
			tempItemStack = this.iStack8; // inv slot 8
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack9;  // inv slot 9
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack10;  // inv slot 10
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
				
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
					
				}						
			}	
			tempItemStack = this.iStack11;  // inv slot 11
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack12;  // inv slot 12
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack13;  // inv slot 13
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack14;  // inv slot 14
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack15;  // inv slot 15
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack16;  // inv slot 16
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack17;  // inv slot 17
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack18;  // inv slot 18
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack19;  // inv slot 19
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack20;  // inv slot 20
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			tempItemStack = this.iStack21;  // inv slot 21
			if (tempItemStack.currSize == 0) {
				// First open spot
				return tempItemStack;
			}
			else { // Not empty, but maybe stackable?
				if (tempItemStack == vacatingStack)
					return tempItemStack;
				if (tempItemStack.item.itemID == source.item.itemID && tempItemStack.item.isStackable && tempItemStack.currSize < tempItemStack.maxSize){
					return tempItemStack;
				}						
			}	
			return null;			
		}

//		//@ Hoang: add a new Group to inventory
//		public function addGroup(newGroup:ItemGroup) :Boolean{
//			if (this.currSize < this.maxSize){
//				this.list_itemGroup.addItem(newGroup);
//				this.currSize++;
//				return true;
//			}
//			return false;
//		}
//		
//		// @Hoang: remove a group from inventory
//		public function removeGroup(index:int):Boolean{
//			if(currSize < 0){
//				trace("inventory is empty");
//				return false;
//			}
//			if( (index>=0) && (index<currSize-1) ){
//				this.list_itemGroup.removeItemAt(index);
//				this.currSize--;
//				return true;
//			}
//			return false;
//		}
		
		
	}
}