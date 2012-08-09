package character
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import pkgInventory.Item;
	import pkgInventory.ItemGroup;
	import pkgInventory.ItemStack;
	
	import views.PartyView;

	//character's base class for all charaters
	[Bindable]
	public class Character
	{
		
		
		//overview
		public var name:Attribute = null;
		public var gender:Attribute = null;
		public var character_class:Attribute = null;
		private var classNum:int = -1;
		private var faction:int = 0;
		
		//key metrics
		public var health_current:Attribute = null;
		public var health_max:Attribute = null;
		public var total_experience:Attribute = null;
		public var experience_to_level:Attribute = null;//
		public var level:Attribute = null;
		public var spirae_current:Attribute = null;
		public var spirae_max:Attribute = null;
		public var denarii:Attribute = null;
		public var stater:Attribute = null;
		//abilities
		public var fitness:Attribute = null;
		public var mental_prowess:Attribute = null;
		public var spirituality:Attribute = null;
		public var eloquence:Attribute = null;
		public var coordination:Attribute = null;
		//combat
		public var hit:Attribute = null;
		public var avoidance:Attribute = null;
		public var phys_dmg:Attribute = null;
		public var magic_dmg:Attribute = null;
		public var damage_type:Attribute = null;
		//resistances
		public var damage_resistance:Attribute = null;
		public var cold_resistance:Attribute = null;
		public var heat_resistance:Attribute = null;
		public var magic_resistance:Attribute = null;
		//others
		public var career_changes:Attribute = null;
		public var party_position:Attribute = null;
		
		//@Hoang <<
		public static const MAX_NUMBER_ITEMGROUP:int = 20;
		public static const MAX_ITEM_STACK_SIZE:int = 20;
		public static const MAX_NUMBER_OF_SLOTS_IN_INVENTORY:int = 21;    // TODO: Make dynamic/expandable through new bags, spells or shop purchases.
		public var inventory:Inventory;
		
		// >>Hoang
		
		public var current_items:ItemGroup = new ItemGroup("current_items",17);
		public var appearance_basebody:String = null;//file name to character's default image
		public var appearance_basehead:String = null;//file name to character's default image
		public var appearance_weapon:String = null;//file name to character's default image
		public var appearance_offhand:String = null;//file name to character's default image
		public var appearance_torso:String = null;//file name to character's default image
		public var appearance_head:String = null;//file name to character's default image
		public var appearance_legs:String = null;//file name to character's default image
		public var appearance_feet:String = null;//file name to character's default image
		public var appearance_shoulders:String = null;//file name to character's default image
		public var appearance_hands:String = null;//file name to character's default image

		
		public var attribute_list:ArrayCollection = new ArrayCollection();//data provider for data grid of attributes component
		public var item_benefit:ArrayCollection = new ArrayCollection();//data provider for data grid of item benefits component
		public var item_material:ArrayCollection = new ArrayCollection();//data provider for data grid of item materials component

		public var skills_level:Vector.<int> = new Vector.<int>();
		public var skills_exp:Vector.<int> = new Vector.<int>();
		
		
		
		public function Character(name:String,gender:String, character_class:String="Undecided",
								  health_current:int=100, health_max:int=100, total_experience:int=0,experience_to_level:int=0,level:int=0, 
								  spirae_current:int=0, spirae_max:int=0, denarii:int=0, stater:int=0,
								  fitness:int=0,mental_prowess:int=0, spirituality:int=0, eloquence:int=0, coordination:int=0,
								  hit:int=0, avoidance:int=0, damage_min:int=0, damage_max:int=1, damage_type:String="Fists",
								  magic_dmg_min:int=0, magic_dmg_max:int=0,
								  damage_resistance:int=0,cold_resistance:int=0, heat_resistance:int=0, magic_resistance:int=0, 
								  party_position:int=0, career_changes:int=0, 
								  appearance_basebody:String="", appearance_basehead:String="", appearance_weapon:String="",
								  appearance_offhand:String="", appearance_torso:String="", appearance_head:String="",
		                          appearance_legs:String="", appearance_feet:String="", appearance_shoulders:String="",
		                          appearance_hands:String="")
		{
			// Set base status passed in on contructors.
			// TODO: load from db calls
			this.name = new Attribute("Name",name);
			this.gender = new Attribute("Gender",gender);
			this.character_class = new Attribute("Class", character_class);
			if ((character_class == "Defender") || (character_class == "Champion") || ( character_class == "Guardian")) classNum = 0;
			if ((character_class == "Berserker") || (character_class == "Brute") || ( character_class == "Frenzied")) classNum = 1;
			if ((character_class == "Tempus Diem Fur") || (character_class == "Tempus Crepusculum Fur") || ( character_class == "Tempus Nox Fur")) classNum = 2;
			if ((character_class == "Scout") || (character_class == "Forerunner") || ( character_class == "Shadow of Fear")) classNum = 3;
			if ((character_class == "Elementalist") || (character_class == "Shaman") || ( character_class == "Magi")) classNum = 4;
			if ((character_class == "Summoner") || (character_class == "Spirit Guide") || ( character_class == "Warlock")) classNum = 5;
			if ((character_class == "Hand of Grace") || (character_class == "Crimson Order") || ( character_class == "Shadow of Death")) classNum = 6;
			if ((character_class == "Enhancer") || (character_class == "Artificer") || ( character_class == "Scions of Ge")) classNum = 7;
			
			
			this.health_current = new Attribute("Health",health_current);
			this.health_max = new Attribute("Maximum Health",health_max);
			this.total_experience = new Attribute("Total Experience",total_experience,0);
			this.level = new Attribute("Level", level,level);
			this.career_changes = new Attribute("Career Changes", career_changes);
	
			if ((total_experience == 0) && (experience_to_level == 0))
				this.experience_to_level = new Attribute("Experience to Level", this.levelComputation());
			else
				this.experience_to_level = new Attribute("Experience to Level",experience_to_level);
			this.spirae_current = new Attribute("Spirae", spirae_current);
			this.spirae_max = new Attribute("Maximum Spirae", spirae_max);
			this.denarii = new Attribute("Denarii", denarii);
			this.stater = new Attribute("Stater", stater);
			
			this.fitness = new Attribute("Fitness", fitness, fitness);
			this.mental_prowess = new Attribute("Mental Prowess", mental_prowess,mental_prowess);
			this.spirituality = new Attribute("Spirituality", spirituality,spirituality);
			this.eloquence = new Attribute("Eloquence", eloquence,eloquence);
			this.coordination = new Attribute("Coordination", coordination,coordination);
			
			this.hit = new Attribute("Hit", hit);
			this.avoidance = new Attribute("Avoidance", avoidance);		
			this.phys_dmg = new Attribute("Phys. Damage", damage_min, damage_max);
			this.damage_type = new Attribute("Damage type",damage_type);
			this.magic_dmg = new Attribute("Magic Damage", magic_dmg_min, magic_dmg_max);
	
			this.damage_resistance = new Attribute("Damage", damage_resistance);
			this.cold_resistance = new Attribute("Cold", cold_resistance);
			this.heat_resistance = new Attribute("Heat", heat_resistance);
			this.magic_resistance = new Attribute("Magic", magic_resistance);
			
			this.party_position = new Attribute("Party Position",party_position);
			this.appearance_basebody = appearance_basebody;
			this.appearance_basehead = appearance_basehead;
			this.appearance_weapon = appearance_weapon;
			this.appearance_offhand = appearance_offhand;
			this.appearance_torso = appearance_torso;
			this.appearance_head = appearance_head;
			this.appearance_legs = appearance_legs;
			this.appearance_feet = appearance_feet;
			this.appearance_shoulders = appearance_shoulders;
			this.appearance_hands = appearance_hands;
			
			// Skills initialization
			// Note: skills[0] is presently unused
			for (var i:int = 0; i<201; ++i) {
				skills_level[i] = -1;
				skills_exp[i] = 0;
			}
			// TODO: This hardcodes a new character's 1st two skills as lv 1. In the future, loading should be dynamic based on characters known info crossref with db.
			var offset:int = 1+25*classNum;
			skills_level[offset] = 1;
			skills_level[offset+1] = 1;
						
			_createAttributeLists();
			
			
			
			// Create empty placeholder stacks for the current character's worn items
			var itemS1:ItemStack = new ItemStack(1);
			itemS1.owner = this;
			var itemS2:ItemStack = new ItemStack(1);
			itemS2.owner = this;
			var itemS3:ItemStack = new ItemStack(1);
			itemS3.owner = this;
			var itemS4:ItemStack = new ItemStack(1);
			itemS4.owner = this;
			var itemS5:ItemStack = new ItemStack(1);
			itemS5.owner = this;
			var itemS6:ItemStack = new ItemStack(1);
			itemS6.owner = this;
			var itemS7:ItemStack = new ItemStack(1);
			itemS7.owner = this;
			var itemS8:ItemStack = new ItemStack(1);
			itemS8.owner = this;
			var itemS9:ItemStack = new ItemStack(1);
			itemS9.owner = this;
			var itemS10:ItemStack = new ItemStack(1);
			itemS10.owner = this;
			var itemS11:ItemStack = new ItemStack(1);
			itemS11.owner = this;
			var itemS12:ItemStack = new ItemStack(1);
			itemS12.owner = this;
			var itemS13:ItemStack = new ItemStack(1);
			itemS13.owner = this;
			var itemS14:ItemStack = new ItemStack(1);
			itemS14.owner = this;
			var itemS15:ItemStack = new ItemStack(1);
			itemS15.owner = this;
			var itemS16:ItemStack = new ItemStack(1);
			itemS16.owner = this;
			var itemS17:ItemStack = new ItemStack(1);
			itemS17.owner = this;
			
			
			current_items.addOneStack(itemS1);
			current_items.addOneStack(itemS2);
			current_items.addOneStack(itemS3);
			current_items.addOneStack(itemS4);
			current_items.addOneStack(itemS5);
			current_items.addOneStack(itemS6);
			current_items.addOneStack(itemS7);
			current_items.addOneStack(itemS8);
			current_items.addOneStack(itemS9);
			current_items.addOneStack(itemS10);
			current_items.addOneStack(itemS11);
			current_items.addOneStack(itemS12);
			current_items.addOneStack(itemS13);
			current_items.addOneStack(itemS14);
			current_items.addOneStack(itemS15);
			current_items.addOneStack(itemS16);
			current_items.addOneStack(itemS17);
			
			
			this.inventory = new Inventory(MAX_NUMBER_OF_SLOTS_IN_INVENTORY);
			
			// Empty Stacks for Inventory:
			var iStack1:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack1.owner = this;
			var iStack2:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack2.owner = this;
			var iStack3:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack3.owner = this;
			var iStack4:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack4.owner = this;
			var iStack5:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack5.owner = this;
			var iStack6:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack6.owner = this;
			var iStack7:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack7.owner = this;
			var iStack8:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack8.owner = this;
			var iStack9:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack9.owner = this;
			var iStack10:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack10.owner = this;
			var iStack11:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack11.owner = this;
			var iStack12:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack12.owner = this;
			var iStack13:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack13.owner = this;
			var iStack14:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack14.owner = this;
			var iStack15:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack15.owner = this;
			var iStack16:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack16.owner = this;
			var iStack17:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack17.owner = this;
			var iStack18:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack18.owner = this;
			var iStack19:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack19.owner = this;
			var iStack20:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack20.owner = this;
			var iStack21:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			iStack21.owner = this;
			
			// Special stack to allow for drag-n-drop interaction with the background on the inventory panel.
			var iStackBG:ItemStack = new ItemStack(9999);
			iStackBG.owner = this;

			
			// Items:
			// Todo: Should not be created here, just passed into the Character and assigned to inv here.
			// *** Benefit Types: Fitness, Mental, Spirit, Eloquence, Coordination, Health, Spirae, Experience Bonus, 
			//    Gold Bonus, Avoidance, Hit, Dmg Res, Cold Res, Heat Res, Magic Res, Max Phys Dmg, Min Phys Dmg, 
			//    Max Magic Dmg, Min Magic Dmg, Wander, Construction Cost, increased monster freq and decreased monster freq.

			// push items to stacks
//			iStack1.pushItem(newItem1);
			iStack1.owner = this;
//			iStack2.pushItem(newItem2);
			iStack2.owner = this;
//			iStack3.pushItem(newItem3);
			iStack3.owner = this;
//			iStack4.pushItem(newItem6);
			iStack4.owner = this;
//			iStack5.pushItem(newItem7);
			iStack5.owner = this;
//			iStack6.pushItem(newItem9);
			iStack6.owner = this;
//			iStack7.pushItem(newItem10);
			iStack7.owner = this;
//			iStack8.pushItem(newItem11);
			iStack8.owner = this;
//			iStack9.pushItem(newItem12);
			iStack9.owner = this;
//			iStack10.pushItem(newItem13);
			iStack10.owner = this;
//			iStack11.pushItem(newItem14);
			iStack11.owner = this;
//			iStack12.pushItem(newItem15);
			iStack12.owner = this;
//			iStack13.pushItem(newItem16);
			iStack13.owner = this; 
//			iStack14.pushItem(newItem17);
			iStack14.owner = this; 
			iStack15.owner = this; // Empty Inv slot
			iStack16.owner = this; // Empty Inv slot
			iStack17.owner = this; // Empty Inv slot
			iStack18.owner = this; // Empty Inv slot
			iStack19.owner = this; // Empty Inv slot
			iStack20.owner = this; // Empty Inv slot
			iStack21.owner = this; // Empty Inv slot
			iStackBG.owner = this; // Background for Inventory panel
			iStackBG.displayPath = "assets/HUD/Inventory/Blank.png";
			
			inventory.iStack1 = iStack1;
			inventory.iStack2 = iStack2;
			inventory.iStack3 = iStack3;
			inventory.iStack4 = iStack4;
			inventory.iStack5 = iStack5;
			inventory.iStack6 = iStack6;
			inventory.iStack7 = iStack7;
			inventory.iStack8 = iStack8;
			inventory.iStack9 = iStack9;
			inventory.iStack10 = iStack10;
			inventory.iStack11 = iStack11;
			inventory.iStack12 = iStack12;
			inventory.iStack13 = iStack13;
			inventory.iStack14 = iStack14;
			inventory.iStack15 = iStack15;
			inventory.iStack16 = iStack16;
			inventory.iStack17 = iStack17;
			inventory.iStack18 = iStack18;
			inventory.iStack19 = iStack19;
			inventory.iStack20 = iStack20;
			inventory.iStack21 = iStack21;
			inventory.iStackBG = iStackBG;			
			

		}
		
		
		
		// This function will process character inventories on load. TODO: Rework completely when DB is used.
		public function invLoader(itemID:int):void {
			var newItem:Item = null;
			
			// Mark: Hardcoded items currently in the game. Will load from database later.
			item_benefit.removeAll();
			item_material.removeAll();
			switch (itemID) {
				case 1 : 
					item_benefit.addItem(new Attribute("Min Phys Dmg", 1));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 2));
					item_material.addItem(new Attribute("90000", 5));
					newItem = new Item(1,"Dagger","a notched dagger","notched daggers", 1, 6, 0, 14, "This notched and dull iron dagger has seen better days.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Dagger_Icon_Rank_01.jpg", item_benefit, item_material);
					break;
				case 4 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 3));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 5));		
					item_material.addItem(new Attribute("90002", 5));
					newItem = new Item(4,"Mace","a bronze mace", "bronze maces", 1, 15, 0, 14, "This utilitarian mace will bash heads with the best of them. However, the relatively soft nature of bronze makes it constantly have a battered look to it.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Mace_Icon_Rank_01.jpg",item_benefit, item_material);
					break;
				case 5 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 45));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 62));		
					item_benefit.addItem(new Attribute("Fitness", 2));		
					item_material.addItem(new Attribute("90000", 17));
					newItem = new Item(5,"Mace","a crowned spike mace", "crowned spiked maces", 2, 33, 0, 14, "This functional iron mace has spikes on the end to allow for a limited form of thrust damage when the unfortunate recipient leaves an opening.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Mace_Icon_Rank_02.jpg",item_benefit, item_material);
					break;
				case 7 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 18));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 42));		
					item_benefit.addItem(new Attribute("Mental", 2));
					item_benefit.addItem(new Attribute("Spirae", 12));		
					item_material.addItem(new Attribute("90004", 14));
					item_material.addItem(new Attribute("90005", 2));
					newItem = new Item(7,"Wand","a bloody yew wand", "blood yew wands", 2, 35, 0, 14, "This wand was obviously put together by someone of skill years ago. You can sense the power contained within it by the merest of touches.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Wand_Icon_Rank_02.jpg", item_benefit, item_material);
					break;
				case 13 : 
					item_benefit.addItem(new Attribute("Min Phys Dmg", 36));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 129));
					item_benefit.addItem(new Attribute("Health", 4));
					item_benefit.addItem(new Attribute("Fitness", 2));
					item_material.addItem(new Attribute("90000", 5));
					item_material.addItem(new Attribute("90003", 8));
					newItem = new Item(13,"Broadsword","an ornate broadsword", "ornate broadswords", 2, 35, 0, 14, "This wickedly curved blade is a common weapon used by mercenaries in close combat situations. It can be founda t almost any shop, but this one is of particularly good quality.", false, true, false, true, true, true, false,"assets/OotE/InvIcons/Broadsword_Icon_Rank_02.jpg", item_benefit, item_material);
					break;
				case 15 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 37));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 155));		
					item_benefit.addItem(new Attribute("Eloquence", 2));
					item_benefit.addItem(new Attribute("Fitness", 2));		
					item_material.addItem(new Attribute("90003", 14));
					newItem = new Item(15,"Longsword","an ornate longsword", "ornate longswords", 2, 35, 0, 14, "This blade can be seen at the hip of many leaders in military and civilian authority. It has the keen edge of a weapon able to perform well in combat but it also has the look many would be proud to have at their side when making a good impression on others.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Longsword_Icon_Rank_02.jpg",item_benefit, item_material);
					break;
				case 16 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 1));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 10));		
					item_material.addItem(new Attribute("90000", 6));
					newItem = new Item(16,"Greatsword","a worn iron greatsword", "worn iron greatswords", 1, 18, 0, 14, "This huge weapon is a symbol of power, strength and death. Without a doubt, no warrior would be afraid with one of these on his or her hip.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Greatsword_Icon_Rank_01.jpg", item_benefit, item_material);
					break;
				case 18 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 2));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 5));		
					item_material.addItem(new Attribute("90001", 4));
					newItem = new Item(18,"Shortbow","an oaken shortbow", "oaken shortbows", 1, 11, 1, 14, "This smoothly carved shortbow has limited range but can certainly get the job done. Each end is curved adding a touch of style and strength that only human hunters with elfish training would know how to create.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Shortbow_Icon_Rank_01.jpg",item_benefit, item_material);
					break;
				case 19 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 29));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 129));		
					item_benefit.addItem(new Attribute("Spirit", 2));
					item_benefit.addItem(new Attribute("Coordination", 2));		
					item_material.addItem(new Attribute("90001", 14));
					newItem = new Item(19,"Shortbow","a dwarven shortbow", "dwarven shortbows", 2, 33, 1, 14, "This shortbow has been crafted of fine woods and polished until it nearly gleams. The earth gave her blessing in crafting this shortbow", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Shortbow_Icon_Rank_02.jpg",item_benefit, item_material);
					break;
				case 22 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 2));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 8));		
					item_material.addItem(new Attribute("90001", 6));
					newItem = new Item(22,"Recurvebow", "a hunter's recurve bow", "hunter's recurve bows", 1, 17, 1, 14, "This basic curved bow allows for more punch when it hits and, as such, is a favorite of most hunteres as it is rare for game to run far after taken with an arrow from this weapon.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/RecurveBow_Icon_Rank_01.jpg",item_benefit, item_material);
					break;
				case 25 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 24));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 138));		
					item_benefit.addItem(new Attribute("Coordination", 2));
					item_benefit.addItem(new Attribute("Fitness", 1));		
					item_material.addItem(new Attribute("90001", 3));
					item_material.addItem(new Attribute("90003", 10));			
					newItem = new Item(25,"Throwing Axe","a hooked throwing axe", "hooked throwing axes", 2, 34, 1, 14, "One glance at this axe reminds you of the old saying: never bring a sword to a ranged fight. Without a doubt, you would want this on your side if you faced someone with a sword.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/ThrowingAxe_Icon_Rank_02.jpg",item_benefit, item_material);
					break;
				case 26 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 2));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 7));		
					item_material.addItem(new Attribute("90000", 6));
					newItem = new Item(26,"Rapier","a basic cross-hilt rapier", "cross-hilt rapiers", 1, 12, 0, 14, "This rapier looks fancier than it is. The thin blade makes for good quick movements, but its poor construction makes it vulternatble to heavier blows.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Rapier_Icon_Rank_01.jpg",item_benefit, item_material);
					break;
				case 27 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 1));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 6));		
					item_material.addItem(new Attribute("90000", 3));
					newItem = new Item(27,"Throwing Knife","a training throwing knife", "training throwing knives", 1, 8, 1, 14, "This blade is balanced for throwing. However, it is of poor craftsmanship and has been around the block a few times.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/ThrowingKnife_Icon_Rank_01.jpg",item_benefit, item_material);
					break;
				case 28 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 3));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 8));		
					item_material.addItem(new Attribute("90001", 6));
					newItem = new Item(28,"Staff","a crystal-topped staff", "crystal-topped staves", 1, 14, 0, 14, "This staff is of very simple design considering the power it holds. A master of the staff can generally beat any sword wielder, even when the staff is as basic as this one.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Staff_Icon_Rank_01.jpg",item_benefit, item_material);
					break;
				case 29 :
					item_benefit.addItem(new Attribute("Min Phys Dmg", 44));
					item_benefit.addItem(new Attribute("Max Phys Dmg", 149));		
					item_benefit.addItem(new Attribute("Mental", 1));
					item_benefit.addItem(new Attribute("Fitness", 2));		
					item_material.addItem(new Attribute("90001", 14));
					newItem = new Item(29,"Staff"," an enchanted staff", "enchanted staves", 2, 34, 0, 14, "This staff has been infused with power of some kind. The knarled limb looks like it would be more fail than it actually is.", false, true, false, true, true, true, false, "assets/OotE/InvIcons/Staff_Icon_Rank_02.jpg",item_benefit, item_material);
					break;
				case 10000 :
					item_benefit.addItem(new Attribute("Fitness", 2));
					item_material.addItem(new Attribute("90005", 5));
					newItem = new Item(10000,"Ring","a plain gold ring", "plain gold rings", 1, 20, 10, 9, "This simple loop of metal is commonly worn by men of any race as it symbolizes unity and strength.", false, true, false, true, true, true, false, "assets/Misc/Ring_Icon_Rank_01.png", item_benefit, item_material);
					break;
				case 10001 :
					item_benefit.addItem(new Attribute("Spirae", 20));
					item_benefit.addItem(new Attribute("Mental", 2));
					item_material.addItem(new Attribute("90005", 7));
					item_material.addItem(new Attribute("90010", 12));
					newItem = new Item(10001,"Ring","a designer's emerald ring", "designer emerald rings", 2, 34, 10, 9, "A band of gold has been topped with a well cut emerald of unusually high quality.", false, true, false, true, true, true, false, "assets/Misc/Ring_Icon_Rank_02.png", item_benefit, item_material);
					break;
			}

			if (newItem == null) {
				trace("Bad inventory id for current items: "+itemID.toString());
				return;
			}
			var item:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			item.owner = this;
			item.pushItem(newItem);
			inventory.addItem(item,1);
			
		}
		
		
		// Increment/decrement experience
		public function addExperience(expGained:int):void{
			
			this.total_experience.setValue(this.total_experience.getValue() + expGained);
			this.experience_to_level.setValue(this.experience_to_level.getValue() - expGained);
			
		}
		
		
		
		public function levelComputation():int{

			var avgXp:int = 350;
			var numOfBattles:int = 2 + level.getValue();
			var multiclass:Number = 1 + (career_changes.getValue()^2 / 10);
			var classMultiplier:Number;
			switch (this.classNum) {
				case 0 : 
					classMultiplier = 1; 
					break;
				case 1 : 
					classMultiplier = 1.05; 
					break;
				case 2 : 
					classMultiplier = 0.95; 
					break;
				case 3 : 
					classMultiplier = 1.15; 
					break;
				case 4 : 
					classMultiplier = 1.3; 
					break;
				case 5 : 
					classMultiplier = 1.2; 
					break;
				case 6 : 
					classMultiplier = 1.1; 
					break;
				case 7 : 
					classMultiplier = 1.2; 
					break;
			}
			
			
		//	(average exp / battle of level x) *(# of battles to level)*(multiclass multiplier)*(class multiplier)
			return (avgXp * numOfBattles * multiclass * classMultiplier);
		}
		
		
		public function getClassNum():int { return this.classNum; }
		
		public function setClassNum(cn:int):void { this.classNum = cn; }
		
		public function getFaction():int { return this.faction; }
		
		public function setFaction(faction:int):void { this.faction = faction; }
		
		private function _createAttributeLists():void{
			attribute_list.addItem(name);
			attribute_list.addItem(gender);
			attribute_list.addItem(character_class);
			
			attribute_list.addItem(health_current);
			attribute_list.addItem(health_max);
			attribute_list.addItem(total_experience);
			attribute_list.addItem(experience_to_level);
			attribute_list.addItem(level);	
			attribute_list.addItem(spirae_current);
			attribute_list.addItem(spirae_max);
			attribute_list.addItem(denarii);
			attribute_list.addItem(stater);				
			
			attribute_list.addItem(fitness);
			attribute_list.addItem(mental_prowess);
			attribute_list.addItem(spirituality);
			attribute_list.addItem(eloquence);
			attribute_list.addItem(coordination);
			
			attribute_list.addItem(hit);
			attribute_list.addItem(avoidance);			
			attribute_list.addItem(phys_dmg);
			attribute_list.addItem(damage_type);
			attribute_list.addItem(magic_dmg);
			
			attribute_list.addItem(damage_resistance);
			attribute_list.addItem(cold_resistance);
			attribute_list.addItem(heat_resistance);
			attribute_list.addItem(magic_resistance);
			
			attribute_list.addItem(party_position);
			attribute_list.addItem(career_changes);
			
//			attribute_list.sort= new Sort();
//			attribute_list.sort.fields = [new SortField("text",true)]
//			attribute_list.refresh();
		}
		
	}
}