package character
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import pkgInventory.Item;
	import pkgInventory.ItemGroup;
	import pkgInventory.ItemStack;

	//character's base class for all charaters
	[Bindable]
	public class Character
	{
		//overview
		public var name:Attribute = null;
		public var gender:Attribute = null;
		public var character_class:Attribute = null;
		//key metrics
		public var health:Attribute = null;
		public var total_experience:Attribute = null;
		public var experience_to_level:Attribute = null;//
		public var level:Attribute = null;
		public var spirae:Attribute = null;
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
		public var damage:Attribute = null;//min/max damage
		public var damage_type:Attribute = null;
		//resistances
		public var damage_resistance:Attribute = null;
		public var cold_resistance:Attribute = null;
		public var heat_resistance:Attribute = null;
		public var magic_resistance:Attribute = null;
		//others
		public var carrer_changes:Attribute = null;
		public var party_position:Attribute = null;
		
		//@Hoang <<
		public static const MAX_NUMBER_ITEMGROUP:int = 5;
		public static const MAX_ITEM_STACK_SIZE:int = 5;
		public var inventory:Inventory;
		// >>Hoang
		
		public var current_items:ItemGroup = new ItemGroup("current_items",14);
		public var appearance:String = null;//file name to character's default image
		public var attribute_list:ArrayCollection = new ArrayCollection();//data provider for data grid of attributes component


		public function Character(name:String,gender:String, character_class:String="N/A",
								  health:int=100, total_experience:int=0,experience_to_level:int=0,level:int=0, spirae:int=0, denarii:int=0, stater:int=0,
								  fitness:int=0,mental_prowess:int=0, spirituality:int=0, eloquence:int=0, coordination:int=0,
								  hit:int=0, avoidance:int=0, damage:int=0, damage_type:String="N/A",
								  damage_resistance:int=0,cold_resistance:int=0, heat_resistance:int=0, magic_resistance:int=0, 
								  party_position:int=0, carrer_changes:int=0)
		{
			
			this.name = new Attribute("Name",name);
			this.gender = new Attribute("Gender",gender);
			this.character_class = new Attribute("Character_class", character_class);
			
			this.health = new Attribute("Health",health,100);
			this.total_experience = new Attribute("Total Experiences",total_experience,0);
			this.experience_to_level = new Attribute("Experience to Level",experience_to_level);
			this.level = new Attribute("Level", level,0);
			this.spirae = new Attribute("Spirae", spirae);
			this.denarii = new Attribute("Denarii", denarii);
			this.stater = new Attribute("Stater", stater);
			
			this.fitness = new Attribute("Fitness", fitness, 100);
			this.mental_prowess = new Attribute("Mental Prowess", mental_prowess,100);
			this.spirituality = new Attribute("Spirituality", spirituality,100);
			this.eloquence = new Attribute("Eloquence", eloquence,100);
			this.coordination = new Attribute("Coordination", coordination,100);
			
			this.hit = new Attribute("Hit", hit);
			this.avoidance = new Attribute("Avoidance", avoidance);		
			this.damage = new Attribute("Damage", damage);
			this.damage_type = new Attribute("Damage type",damage_type);
			
			this.damage_resistance = new Attribute("Damage Resistance", damage_resistance);
			this.cold_resistance = new Attribute("Cold Resistance", cold_resistance);
			this.heat_resistance = new Attribute("Heat Resistance", heat_resistance);
			this.magic_resistance = new Attribute("Magic Resistance", magic_resistance);
			
			this.party_position = new Attribute("Party position",party_position);
			this.carrer_changes = new Attribute("Carrer Changes", carrer_changes);
			
			
			this.appearance = "assets/"+this.name.value+".jpg";
			trace("init apperance" + appearance);
			
			_createAttributeLists();
			
			
			
			//*** HUY create current_items
			var itemS1:ItemStack = new ItemStack(1);
			var itemS2:ItemStack = new ItemStack(1);
			var itemS3:ItemStack = new ItemStack(1);
			var itemS4:ItemStack = new ItemStack(1);
			var itemS5:ItemStack = new ItemStack(1);
			var itemS6:ItemStack = new ItemStack(1);
			var itemS7:ItemStack = new ItemStack(1);
			var itemS8:ItemStack = new ItemStack(1);
			var itemS9:ItemStack = new ItemStack(1);
			var itemS10:ItemStack = new ItemStack(1);
			var itemS11:ItemStack = new ItemStack(1);
			var itemS12:ItemStack = new ItemStack(1);
			var itemS13:ItemStack = new ItemStack(1);
			var itemS14:ItemStack = new ItemStack(1);
			
			
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
			
			
			//@Hoang 	<<
			this.inventory = new Inventory(MAX_NUMBER_ITEMGROUP);
			//this.inventory.initialInventory();
			// create item groups : 
			
			// Groups:
			//var iGroup1:ItemGroup = new ItemGroup("group_1",10);
			//var iGroup2:ItemGroup = new ItemGroup("group_2",5);

			// add groups to inventory
			//this.inventory.addGroup(iGroup1);
			//this.inventory.addGroup(iGroup2);

			// Stacks:
			var iStack1:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack2:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack3:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack4:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack5:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack6:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack7:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack8:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack9:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);
			var iStack10:ItemStack = new ItemStack(MAX_ITEM_STACK_SIZE);

			
			// Items:
			var newItem1:Item = new Item(1,"item1","assets/1.jpg",1,true);
			var newItem2:Item = new Item(2,"item2","assets/2.jpg",1,false);
			var newItem3:Item = new Item(3,"item3","assets/3.jpg");
			var newItem4:Item = new Item(4,"item4","assets/4.jpg");
			var newItem5:Item = new Item(5,"item5","assets/5.jpg");
			var newItem6:Item = new Item(1,"item1","assets/1.jpg",1,true);
			var newItem7:Item = new Item(2,"item2","assets/2.jpg",1,false);
			var newItem8:Item = new Item(3,"item3","assets/3.jpg");
			var newItem9:Item = new Item(4,"item4","assets/4.jpg");
			var newItem10:Item = new Item(5,"item5","assets/5.jpg");
			var newItem11:Item = new Item(1,"item1","assets/1.jpg",1,true);
			var newItem12:Item = new Item(2,"item2","assets/2.jpg",1,false);
			var newItem13:Item = new Item(3,"item3","assets/3.jpg");
			var newItem14:Item = new Item(4,"item4","assets/4.jpg");
			var newItem15:Item = new Item(5,"item5","assets/5.jpg");

			
			// push items to stacks
			iStack1.pushItem(newItem1);
			iStack2.pushItem(newItem2);
			iStack3.pushItem(newItem3);
			iStack4.pushItem(newItem6);
			iStack5.pushItem(newItem7);
			//iStack1.pushItem(newItem9);
			
			iStack6.pushItem(newItem9);
			iStack7.pushItem(newItem10);
			iStack8.pushItem(newItem11);
			iStack9.pushItem(newItem12);
			iStack10.pushItem(newItem13);
			//iStack6.pushItem(newItem14);
			//iStack7.pushItem(newItem15);

			
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
						
			// push stacks to groups
//			iGroup1.addOneStack(iStack1);
//			iGroup1.addOneStack(iStack2);
//			iGroup1.addOneStack(iStack3);
//			iGroup1.addOneStack(iStack4);
//			iGroup1.addOneStack(iStack5);
//			iGroup1.addOneStack(iStack6);
//			iGroup1.addOneStack(iStack7);
//			iGroup1.addOneStack(iStack8);
//			iGroup1.addOneStack(iStack9);
//			iGroup1.addOneStack(iStack10);
			//	>> Hoang

		}
		
		private function _createAttributeLists():void{
			attribute_list.addItem(name);
			attribute_list.addItem(gender);
			attribute_list.addItem(character_class);
			
			attribute_list.addItem(health);
			attribute_list.addItem(total_experience);
			attribute_list.addItem(experience_to_level);
			attribute_list.addItem(level);	
			attribute_list.addItem(spirae);
			attribute_list.addItem(denarii);
			attribute_list.addItem(stater);				
			
			attribute_list.addItem(fitness);
			attribute_list.addItem(mental_prowess);
			attribute_list.addItem(spirituality);
			attribute_list.addItem(eloquence);
			attribute_list.addItem(coordination);
			
			attribute_list.addItem(hit);
			attribute_list.addItem(avoidance);			
			attribute_list.addItem(damage);
			attribute_list.addItem(damage_type);
			
			attribute_list.addItem(damage_resistance);
			attribute_list.addItem(cold_resistance);
			attribute_list.addItem(heat_resistance);
			attribute_list.addItem(magic_resistance);
			
			attribute_list.addItem(party_position);
			attribute_list.addItem(carrer_changes);
			
//			attribute_list.sort= new Sort();
//			attribute_list.sort.fields = [new SortField("text",true)]
//			attribute_list.refresh();
		}
		
	}
}