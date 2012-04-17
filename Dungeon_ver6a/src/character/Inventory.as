package character
{
	import mx.collections.ArrayList;
	
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

		// @Hoang << 
		// initialInventory
		// ->create item group as a pre-setting mode: no need to create item group or stack from the character,
		// assume number of item group is a fixed number
		// >> Hoang
		public function initialInventory():void{
			var i:int;
			for(i=0;i<this.currSize;i++){
				var iGroup:ItemGroup = new ItemGroup("group_"+i.toString(10),10);
				iGroup.initialItemGroup();
				//this.addGroup(iGroup);
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