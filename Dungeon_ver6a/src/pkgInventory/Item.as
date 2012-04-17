package pkgInventory
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.Sort;
	import mx.collections.SortField;

	public class Item
	{
		public var numAtributes:int;
		public var list_attributes:ArrayList;
		public var displayPath: String;
		public var itemID: int;
		public var itemTitle: String;
		public var itemShortName: String;
		public var itemShortNamePlural: String;
		public var itemTier: int;
		public var itemValue: int;
		public var itemType: int;
		public var itemSlot: int;
		public var itemTooltip: String;
		public var category: int;
		public var isConstructed: Boolean;
		public var isEnhanceable: Boolean;
		public var isStackable: Boolean;
		public var isSellable: Boolean;
		public var isDropable: Boolean;
		public var isTradeable: Boolean;
		public var isCursed: Boolean;
		public var item_benefit:ArrayCollection = new ArrayCollection();		
		public var item_material:ArrayCollection = new ArrayCollection();		

		// Types: 0 = Melee
		//        1 = Ranged
		//        2 = Robe
		//        3 = Tunic
		//        4 = Chain
		//        5 = Plate
		//        6 = Speedup
		//        7 = Benefit
		//        8 = Material
		//        9 = Quest
		//        10 = General Armor
		// Slot:  0 = None
		//        1 = Head
		//        2 = Torso
		//        3 = Legs
		//        4 = Feet
		//        5 = Hands
		//        6 = Shoulders
		//        7 = Cloak
		//        8 = Offhand
		//        9 = Ring
		//        10 = Neck
	    //        11 = Belt
		//        12 = Attachment (Belt)
		//        13 = Trailing
		//        14 = Weapon
		// Benefit Types: 	0 = None
		// 					1 = Fitness
		//					2 = Mental
		//					3 = Spirit
		//					4 = Eloquence
		//					5 = Coordination
		//					6 = Health
		//					7 = Spirae
		//					8 = Experience Bonus
		//					9 = Gold Bonus
		//					10 = Avoidance
		//					11 = Hit
		//					12 = Damage Resistance
		//					13 = Cold Resistance
		//					14 = Heat Resistance
		//					15 = Magic Resistance
		//					16 = Maximum Physical Damage
		//					17 = Minimum Physical Damage
		//					18 = Maximum Magic Damage
		//					19 = Minimum Magic Damage
		//					20 = Wander
		//					21 = Construction Cost
		// 					22 = Increased Monster Frequency
		//					23 = Decreased Monseter Frequency
		public function Item(itemID:int, itemTitle:String, itemShortName:String, itemShortNamePlural:String, 
							 itemTier:int, itemValue:int, itemType:int, itemSlot: int, 
							 itemTooltip: String, isConstructed:Boolean, 
							 isEnhanceable:Boolean, isStackable:Boolean, 
							 isSellable:Boolean, isDropable:Boolean, isTradeable:Boolean,
							 isCursed:Boolean, 
							 displayPath:String, item_benefit:ArrayCollection=null, item_material:ArrayCollection=null)	{
			this.itemID = itemID;
			this.itemTitle = itemTitle;
			this.itemShortName = itemShortName;
			this.itemShortNamePlural = itemShortNamePlural;
			this.itemTier = itemTier;
			this.itemValue = itemValue;
			this.itemType = itemType;
			this.itemSlot = itemSlot;
			this.isConstructed = isConstructed;
			this.isEnhanceable - isEnhanceable;
			this.isStackable = isStackable;
			this.isSellable = isSellable;
			this.isDropable = isDropable;
			this.isTradeable = isTradeable;
			this.isCursed = isCursed;
			this.displayPath = displayPath; // This will go away when connecting to the database
			if (item_benefit != null) {
				for (var i:int=0; i < item_benefit.length; ++i){
					this.item_benefit.addItem(item_benefit.getItemAt(i));
				}
			}
			if (item_material != null) {
				for (var j:int=0; j < item_material.length; ++j){
					this.item_material.addItem(item_material.getItemAt(j));
				}
			}
		}

		
		
//		public function Item(itemType:int, itemName:String, displayPath:String, numAtributes:int, list_attributes:ArrayList){			
//			this.itemType = itemType;
//			this.itemName = itemName;
//			this.displayPath = displayPath;
//			this.numAtributes = numAtributes;
//			this.list_attributes = list_attributes;
//		}
		
		
		
	}
}