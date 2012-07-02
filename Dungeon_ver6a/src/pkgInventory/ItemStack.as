package pkgInventory
{
	import character.Character;
	
	import mx.controls.Alert;

	[Bindable]
	public class ItemStack
	{
		// attributes
		public var item:Item;
		public var currSize:int;
		public var maxSize: int;
		public var displayPath:String;
		public var itemType:int;
		public var owner:Character;
		
		
		// constructor : empty Stack
		public function ItemStack(maxSize:int) {
			this.maxSize = maxSize;
			this.currSize =0;
			this.maxSize = maxSize;
			this.displayPath = null;
			this.itemType = -1;
			
		}
		
		// @HOANG: swap item stack, only in the case that both stacks have the same max size
		public function swapWithStack(otherStack:ItemStack):Boolean{
			if(otherStack == null){
				return false;
			}
			if(otherStack.maxSize != this.maxSize){
				return false;
			}
			
			var otherItem:Item = otherStack.item;
			var otherCurrSize:int = otherStack.currSize;
			var otherMaxSize: int = otherStack.maxSize;
			var otherDisplayPath:String = otherStack.displayPath;
			var otherItemType:int = otherStack.itemType;
			
			
			
			return true;
		}
		
		// push 1 item to the stack
		public function pushItem(newItem:Item):Boolean{
			// the stack is empty, then set this stack has properties of inserted item
			if((this.currSize==0) && (this.currSize<this.maxSize)){
				this.item = newItem;
				this.currSize+=1;
				this.displayPath = newItem.displayPath;
				this.itemType = newItem.itemType;
				return true;
			}
			
			// if added Item is the same type, then add it = update size of stack
			if((this.itemType == newItem.itemType) && (this.currSize < this.maxSize)){
				if(this.item.isStackable == false){
					Alert.show("This item: "+this.item.itemShortName +" is not stackable");
					return false;
				}
				this.currSize += 1;
				return true;
			}else{
				return false;
			}
		}
		
		//push items from other stack of the same type
		public function pushItemFromSimilarStack(otherStack:ItemStack): Boolean{
			
			// if the current item stack is null
			if(this.currSize == 0){
				this.item = otherStack.item;
				this.itemType = otherStack.itemType;
				this.displayPath = otherStack.displayPath;
				
				if(this.maxSize < otherStack.currSize){
					var remain:int = this.maxSize - this.currSize;
					this.currSize = this.maxSize;
					otherStack.currSize -= remain;
				}else{
					this.currSize = otherStack.currSize;
					otherStack.currSize = 0;
					otherStack.item = null;
					otherStack.itemType = -1;
					otherStack.displayPath = null;			
				}
				return true;
			}
			
			if(this.itemType != otherStack.itemType){
				return false;
			}
			
			if(this.currSize == this.maxSize){
				return false;
			}

			if(this.item.isStackable == false){
				Alert.show("This item is not stackable");
				return false;
			}

			
			if((this.currSize+otherStack.currSize) > this.maxSize){
				var _remain:int = this.maxSize - this.currSize;
				this.currSize = this.maxSize;
				otherStack.currSize -= _remain;
				return true;
			}
			
			// else : the same type + had enough space, then add:
			this.currSize+= otherStack.currSize;
			otherStack.currSize = 0;
			otherStack.item = null;
			otherStack.itemType = -1;
			otherStack.displayPath = null;			
			return true;
		}
		

		//push items from other stack of the same type
		public function moveStacks(otherStack:ItemStack, startLoc:ItemStackView, endLoc:ItemStackView, swapLoc:ItemStackView): Boolean{
			var startToolTip:String;
			var endToolTip:String;

			// If the endLoc is empty, then perform a simple move
			if(this.currSize == 0){
				startToolTip = otherStack.item.itemTooltip;

				this.item = otherStack.item;
				this.itemType = otherStack.itemType;
				this.displayPath = otherStack.displayPath;
				this.owner = otherStack.owner;
				
				if(this.maxSize < otherStack.currSize){
					var remain:int = this.maxSize - this.currSize;
					this.currSize = this.maxSize;
					otherStack.currSize -= remain;
				}else{
					this.currSize = otherStack.currSize;
					otherStack.currSize = 0;
					otherStack.item = null;
					otherStack.itemType = -1;
					otherStack.displayPath = null;
					otherStack.owner = null;
					
				}
				startLoc.toolTip = "";
				endLoc.toolTip = startToolTip;
				return true;
			}

			
			
			// If the items aren't the same, then do a swap, otherwise skip and try to stack.
			if(this.item.itemID != otherStack.item.itemID){

				var storage:ItemStack = new ItemStack(otherStack.maxSize);
				
				// Backup the endLoc itemStack
				storage.item = this.item;
				storage.itemType = this.itemType;
				storage.displayPath = this.displayPath;
				storage.currSize = this.currSize;
				storage.owner = this.owner;
				startToolTip = startLoc.toolTip;
				startLoc.toolTip = "";
				
				// Copy startLoc to endLoc
				this.item = startLoc.itemStack.item;
				this.itemType = startLoc.itemStack.itemType;
				this.displayPath = startLoc.itemStack.displayPath;
				this.currSize = startLoc.itemStack.currSize;
				this.owner = startLoc.itemStack.owner;
				endToolTip = endLoc.toolTip;
				endLoc.toolTip = startToolTip;

				// Clean up startLoc
				otherStack.currSize = 0;
				otherStack.item = null;
				otherStack.itemType = -1;
				otherStack.displayPath = null;
				otherStack.owner = null;

				// Copy backup to swapLoc
				swapLoc.itemStack.item = storage.item;
				swapLoc.itemStack.itemType = storage.itemType;
				swapLoc.itemStack.displayPath = storage.displayPath;
				swapLoc.itemStack.currSize = storage.currSize;
				swapLoc.itemStack.owner = storage.owner;
				swapLoc.toolTip = endToolTip;
				
				
				return true;
			}
			
			// Slot can't merge as full
			if(this.currSize == this.maxSize){
				return false;
			}
			
			// Slot types aren't stackable
			if(this.item.isStackable == false){
				Alert.show("This item is not stackable");
				return false;
			}
			
			// Move as many as can fit and stop
			// Items are left in startLoc so no change in tooltips needed
			if((this.currSize+otherStack.currSize) > this.maxSize){
				var _remain:int = this.maxSize - this.currSize;
				this.currSize = this.maxSize;
				otherStack.currSize -= _remain;
				return true;
			}
			
			// else : the same type + had enough space, then add:
			// Add stack and remove from source
			this.currSize+= otherStack.currSize;
			otherStack.currSize = 0;
			otherStack.item = null;
			otherStack.itemType = -1;
			otherStack.displayPath = null;
			
			startLoc.toolTip = "";
			
			return true;
		}
		
		
		
		
		
		
		
		// pop 1 item out of the stack
		public function popItem():Boolean{
			if (this.currSize >0){
				this.currSize	-= 1;
				if(this.currSize == 0){ // stack is empty
					this.currSize = 0;
					this.item = null;
					this.itemType = -1;
					this.displayPath = null;			
				}
				return true;
			}else{
				return false;
			}
		}
		
		// push n items to the stack
		public function push_n_items(newItem:Item, n:int):Boolean {
			if((this.itemType == newItem.itemType) && ((this.currSize+n) < this.maxSize)){
				this.currSize += 1;
				return true;
			}else{
				return false;
			}
		}
		
		// pop n items out of the stack
		public function pop_n_items(n:int): Boolean	{
			if(this.currSize > n){
				this.currSize -= n;
				if(this.currSize == 0){ // stack is empty
					this.currSize = 0;
					this.item = null;
					this.itemType = -1;
					this.displayPath = null;			
				}
				return true;
			}else{
				return false;
			}
		}
		
		// pop all items out of the stack
		public function popAllItems():Boolean{
			if(pop_n_items(this.currSize)){
				this.item = null;
				this.itemType = -1;
				this.displayPath = null;
				return true;
			}
			return false;
		}

		
	}
}