package pkgInventory
{
	import mx.collections.ArrayList;
	
	[Bindable]
	public class ItemGroup
	{
		public static const MAX_ITEM_STACK_SIZE:int = 10;
		
		public var maxSize:int; 	// max number of itemstack in an itemGroup
		public var currSize:int;	// current number of itemstack in an itemGroup
		public var list_itemStacks:ArrayList;
		public var groupName:String;
		
		public function ItemGroup(name:String, maxsize:int)	{
			this.groupName = name;
			this.maxSize = maxsize;
			this.currSize = 0;
			this.list_itemStacks = new ArrayList(); 
		}
		
		// initiate an item group
		public function initialItemGroup():void{
			var i:int;
			for(i=0;i<this.maxSize;i++){
				var iStack:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
				var newItem:Item = new Item(0,/*@Huy for overlaying@ "item_"+ */i.toString(),"assets/"+i.toString()+".jpg");
				iStack.pushItem(newItem);
				this.addOneStack(iStack);
			}
		}
		
		// @Hoang : add one item stack to the item group
		public function addOneStack(iStack :ItemStack):Boolean{
			if(this.currSize<this.maxSize){
				this.list_itemStacks.addItem(iStack);
				this.currSize++;
				return true;
			}
			return false;
		} 
		
		// @Hoang : add n empty item stack to the item group
		public function add_n_empty_itemStack(n:int):Boolean{
			if((this.currSize+n)<this.maxSize){
				var i:int
				for(i=0;i<n;i++){
					this.list_itemStacks.addItem(new ItemStack(MAX_ITEM_STACK_SIZE));
				}
				return true;
			}
			return false;
		}
		
		//@Hoang : remove item group
		public function removeItemStack(index:int):Boolean{
			if(currSize < 0){
				trace("inventory is empty");
				return false;
			}
			if( (index>=0) && (index<currSize-1) ){
				this.list_itemStacks.removeItemAt(index);
				this.currSize--;
				return true;
			}
			return false;
		}
		
		
	}
}