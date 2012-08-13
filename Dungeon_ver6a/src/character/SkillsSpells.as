package character
{
	import character.Character;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	
	[Bindable]
	public class SkillsSpells
	{
		
		private var id:int = 0;
		private var name:String = "";
		private var target_type:int = -1;
		private var availability:int = -1;
		private var duration_type:int = -1;
		private var duration_formula:String = "";
		private var dmg_formula:String = "";
		private var dmg_type:String = "";
		private var cast_msg:String = "";
		private var cost:int = 0;
		private var desc:String = "";
		
		
		public function SkillsSpells(id:int) 
		{
			this.id = id;
			switch (id) {
				case 0 : return;
				case 1 :
					name = "Lunge";
					target_type = 0;
					cost = 2;
					availability = 0;
					duration_type = 0;
					return;
				case 2 :
					name = "Block";
					target_type = 5;
					cost = 3;
					availability = 0;
					duration_type = 2;
					return;
				case 3 :
					name = "Bash";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 2;
					return;
				case 4 :
					name = "Sidestep";
					target_type = 5;
					cost = 4;
					availability = 0;
					duration_type = 5;
					return;
				case 5 :
					name = "Guard";
					target_type = 1;
					cost = 4;
					availability = 0;
					duration_type = 2;
					return;
				case 6 :
					name = "Self-confidence";
					target_type = 5;
					cost = 5;
					availability = 0;
					duration_type = 1;
					return;
				case 7 :
					name = "Iron Chi";
					target_type = 0;
					cost = 10;
					availability = 0;
					duration_type = 0;
					return;
				case 8 :
					name = "Feint";
					target_type = 0;
					cost = 12;
					availability = 0;
					duration_type = 0;
					return;
				case 9 :
					name = "Blinding Powder";
					target_type = 0;
					cost = 13;
					availability = 0;
					duration_type = 2;
					return;
				case 10 :
					name = "Restraint";
					target_type = 4;
					cost = 14;
					availability = 0;
					duration_type = 2;
					return;
				case 11 :
					name = "Focus";
					target_type = 5;
					cost = 16;
					availability = 0;
					duration_type = 1;
					return;
				case 12 :
					name = "Battle Shout";
					target_type = 2;
					cost = 16;
					availability = 0;
					duration_type = 2;
					return;
				case 13 :
					name = "Heroism";
					target_type = 4;
					cost = 18;
					availability = 1;
					duration_type = 3;
					return;
				case 14 :
					name = "Inspiration";
					target_type = 4;
					cost = 20;
					availability = 0;
					duration_type = 2;
					return;
				case 15 :
					name = "Righteous Fury";
					target_type = 2;
					cost = 25;
					availability = 0;
					duration_type = 0;
					return;
				case 16 :
					name = "Turtle Up";
					target_type = 5;
					cost = 26;
					availability = 0;
					duration_type = 2;
					return;
				case 17 :
					name = "True Aim";
					target_type = 5;
					cost = 22;
					availability = 0;
					duration_type = 2;
					return;
				case 18 :
					name = "Selfless Guardianship";
					target_type = 4;
					cost = 28;
					availability = 0;
					duration_type = 2;
					return;
				case 19 :
					name = "Spinning Decapitation";
					target_type = 0;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 20 :
					name = "Coordinated Assault";
					target_type = 4;
					cost = 36;
					availability = 0;
					duration_type = 2;
					return;
				case 21 :
					name = "Juggernaught";
					target_type = 2;
					cost = 50;
					availability = 0;
					duration_type = 2;
					return;
				case 22 :
					name = "War Cry";
					target_type = 3;
					cost = 42;
					availability = 0;
					duration_type = 2;
					return;
				case 23 :
					name = "Dust Storm";
					target_type = 2;
					cost = 69;
					availability = 0;
					duration_type = 2;
					return;
				case 24 :
					name = "Hurricane";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 0;
					return;
				case 25 :
					name = "Heroic Defense";
					target_type = 4;
					cost = 120;
					availability = 0;
					duration_type = 2;
					return;
				case 26 :
					name = "Wild Swing";
					target_type = 0;
					cost = 2;
					availability = 0;
					duration_type = 0;
					return;
				case 27 :
					name = "Blood Fever";
					target_type = 5;
					cost = 3;
					availability = 0;
					duration_type = 1;
					return;
				case 28 :
					name = "Tackle";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 2;
					return;
				case 29 :
					name = "Screaming Challenge";
					target_type = 6;
					cost = 4;
					availability = 0;
					duration_type = 2;
					return;
				case 30 :
					name = "Eyes of a Madman";
					target_type = 0;
					cost = 4;
					availability = 0;
					duration_type = 0;
					return;
				case 31 :
					name = "Furious Strike";
					target_type = 0;
					cost =5;
					availability = 0;
					duration_type = 0;
					return;
				case 32 :
					name = "Rush";
					target_type = 2;
					cost = 10;
					availability = 0;
					duration_type = 2;
					return;
				case 33 :
					name = "Intercept";
					target_type = 3;
					cost = 12;
					availability = 0;
					duration_type = 1;
					return;
				case 34 :
					name = "Dash";
					target_type = 0;
					cost = 14;
					availability = 0;
					duration_type = 0;
					return;
				case 35 :
					name = "Temper Craze";
					target_type = 5;
					cost = 14;
					availability = 0;
					duration_type = 1;
					return;
				case 36 :
					name = "Leric Focus";
					target_type = 4;
					cost = 16;
					availability = 0;
					duration_type = 2;
					return;
				case 37 :
					name = "Heated Mayhem";
					target_type = 0;
					cost = 16;
					availability = 0;
					duration_type = 0;
					return;
				case 38 :
					name = "Face Slap";
					target_type = 5;
					cost = 18;
					availability = 0;
					duration_type = 2;
					return;
				case 39 :
					name = "Blood Fury";
					target_type = 2;
					cost = 20;
					availability = 0;
					duration_type = 0;
					return;
				case 40 :
					name = "Crazied Shrieking";
					target_type = 2;
					cost = 25;
					availability = 0;
					duration_type = 0;
					return;
				case 41 :
					name = "Flying Tackle";
					target_type = 2;
					cost = 26;
					availability = 0;
					duration_type = 2;
					return;
				case 42 :
					name = "Heated Chaos";
					target_type = 2;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 43 :
					name = "Dementia";
					target_type = 3;
					cost = 28;
					availability = 0;
					duration_type = 2;
					return;
				case 44 :
					name = "Numbing Slap";
					target_type = 4;
					cost = 48;
					availability = 0;
					duration_type = 2;
					return;
				case 45 :
					name = "Heated Massacre";
					target_type = 3;
					cost = 36;
					availability = 0;
					duration_type = 0;
					return;
				case 46 :
					name = "Battle Chant";
					target_type = 4;
					cost = 50;
					availability = 0;
					duration_type = 1;
					return;
				case 47 :
					name = "Blood Lust";
					target_type = 4;
					cost = 42;
					availability = 0;
					duration_type = 1;
					return;
				case 48 :
					name = "Whirling Leg Sweep";
					target_type = 3;
					cost = 69;
					availability = 0;
					duration_type = 1;
					return;
				case 49 :
					name = "Loki's Loon";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 0;
					return;
				case 50 :
					name = "Berserker Maelstrom";
					target_type = 3;
					cost = 120;
					availability = 0;
					duration_type = 0;
					return;
				case 51 :
					name = "Hestca Penoa";
					target_type = 6;
					cost = 2;
					availability = 3;
					duration_type = 0;
					return;
				case 52 :
					name = "Jab";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 0;
					return;
				case 53 :
					name = "Sneak";
					target_type = 5;
					cost = 3;
					availability = 0;
					duration_type = 2;
					return;
				case 54 :
					name = "Appraise";
					target_type = 6;
					cost = 10;
					availability = 1;
					duration_type = 0;
					return;
				case 55 :
					name = "Toss";
					target_type = 0;
					cost = 4;
					availability = 0;
					duration_type = 0;
					return;
				case 56 :
					name = "Snake Strike";
					target_type = 0;
					cost = 5;
					availability = 0;
					duration_type = 2;
					return;
				case 57 :
					name = "Backstab";
					target_type = 0;
					cost = 10;
					availability = 0;
					duration_type = 0;
					return;
				case 58 :
					name = "Directed Chemical Warfare";
					target_type = 0;
					cost = 12;
					availability = 0;
					duration_type = 1;
					return;
				case 59 :
					name = "Tread Softly";
					target_type = 4;
					cost = 14;
					availability = 1;
					duration_type = 3;
					return;
				case 60 :
					name = "Sadistic Ripost";
					target_type = 0;
					cost = 14;
					availability = 0;
					duration_type = 0;
					return;
				case 61 :
					name = "Dart-n-Dash";
					target_type = 0;
					cost = 16;
					availability = 0;
					duration_type = 2;
					return;
				case 62 :
					name = "Dust Toss";
					target_type = 0;
					cost = 9;
					availability = 0;
					duration_type = 0;
					return;
				case 63 :
					name = "Spinning Jab";
					target_type = 2;
					cost = 17;
					availability = 0;
					duration_type = 0;
					return;
				case 64 :
					name = "Dust Spray";
					target_type = 2;
					cost = 20;
					availability = 0;
					duration_type = 0;
					return;
				case 65 :
					name = "Diversion";
					target_type = 2;
					cost = 25;
					availability = 0;
					duration_type = 2;
					return;
				case 66 :
					name = "Sector Warfare";
					target_type = 2;
					cost = 26;
					availability = 0;
					duration_type = 1;
					return;
				case 67 :
					name = "The Golden Rule";
					target_type = 6;
					cost = 26;
					availability = 0;
					duration_type = 1;
					return;
				case 68 :
					name = "Slash-n-Sprint";
					target_type = 2;
					cost = 28;
					availability = 0;
					duration_type = 2;
					return;
				case 69 :
					name = "Assassinate";
					target_type = 0;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 70 :
					name = "Greedy Scavenger";
					target_type = 6;
					cost = 36;
					availability = 0;
					duration_type = 1;
					return;
				case 71 :
					name = "Dust Storm";
					target_type = 3;
					cost = 50;
					availability = 0;
					duration_type = 0;
					return;
				case 72 :
					name = "Slaughter House";
					target_type = 2;
					cost = 65;
					availability = 0;
					duration_type = 0;
					return;
				case 73 :
					name = "Mass Diversion";
					target_type = 3;
					cost = 69;
					availability = 0;
					duration_type = 2;
					return;
				case 74 :
					name = "Chaotic Warfare";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 1;
					return;
				case 75 :
					name = "Exploding Shrapnel";
					target_type = 3;
					cost = 120;
					availability = 0;
					duration_type = 2;
					return;
				case 76 :
					name = "Snap Attack";
					target_type = 0;
					cost = 2;
					availability = 0;
					duration_type = 0;
					return;
				case 77 :
					name = "Inspect";
					target_type = 6;
					cost = 2;
					availability = 3;
					duration_type = 0;
					return;
				case 78 :
					name = "Scout";
					target_type = 6;
					cost = 3;
					availability = 1;
					duration_type = 3;
					return;
				case 79 :
					name = "Grim Lunge";
					target_type = 0;
					cost = 4;
					availability = 0;
					duration_type = 0;
					return;
				case 80 :
					name = "Disarm";
					target_type = 6;
					cost = 4;
					availability = 3;
					duration_type = 0;
					return;
				case 81 :
					name = "True Aim";
					target_type = 0;
					cost = 5;
					availability = 0;
					duration_type = 0;
					return;
				case 82 :
					name = "Hobble";
					target_type = 0;
					cost = 10;
					availability = 0;
					duration_type = 2;
					return;
				case 83 :
					name = "Pathfinding";
					target_type = 4;
					cost = 12;
					availability = 1;
					duration_type = 3;
					return;
				case 84 :
					name = "Chemical Burns";
					target_type = 0;
					cost = 13;
					availability = 0;
					duration_type = 0;
					return;
				case 85 :
					name = "Evaluate";
					target_type = 0;
					cost = 14;
					availability = 0;
					duration_type = 0;
					return;
				case 86 :
					name = "Infiltrate";
					target_type = 6;
					cost = 16;
					availability = 3;
					duration_type = 5;
					return;
				case 87 :
					name = "Critical Zone";
					target_type = 0;
					cost = 16;
					availability = 0;
					duration_type = 0;
					return;
				case 88 :
					name = "Treated Weapon";
					target_type = 0;
					cost = 18;
					availability = 0;
					duration_type = 0;
					return;
				case 89 :
					name = "Find Stairs";
					target_type = 4;
					cost = 18;
					availability = 1;
					duration_type = 0;
					return;
				case 90 :
					name = "Swift Hobble";
					target_type = 2;
					cost = 25;
					availability = 0;
					duration_type = 2;
					return;
				case 91 :
					name = "Fused Spirae";
					target_type = 0;
					cost = 26;
					availability = 0;
					duration_type = 0;
					return;
				case 92 :
					name = "Fluid Vorpals";
					target_type = 2;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 93 :
					name = "Earthen Instability";
					target_type = 2;
					cost = 28;
					availability = 0;
					duration_type = 0;
					return;
				case 94 :
					name = "Obscuring Vision";
					target_type = 2;
					cost = 30;
					availability = 0;
					duration_type = 2;
					return;
				case 95 :
					name = "Consulting";
					target_type = 6;
					cost = 0;
					availability = 3;
					duration_type = 3;
					return;
				case 96 :
					name = "Ranged Coordination";
					target_type = 4;
					cost = 50;
					availability = 0;
					duration_type = 1;
					return;
				case 97 :
					name = "Lightning Hobble";
					target_type = 3;
					cost = 42;
					availability = 0;
					duration_type = 2;
					return;
				case 98 :
					name = "Torrential Death";
					target_type = 3;
					cost = 69;
					availability = 0;
					duration_type = 0;
					return;
				case 99 :
					name = "Dance of Mourning";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 0;
					return;
				case 100 :
					name = "Rocking the Foundation";
					target_type = 3;
					cost = 120;
					availability = 0;
					duration_type = 0;
					return;
				case 101 :
					name = "Flame Bolt";
					target_type = 0;
					cost = 2;
					availability = 0;
					duration_type = 0;
					return;
				case 102 :
					name = "Illumination";
					target_type = 4;
					cost = 3;
					availability = 1;
					duration_type = 3;
					return;
				case 103 :
					name = "Iceball";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 0;
					return;
				case 104 :
					name = "Earthen Encasement";
					target_type = 0;
					cost = 4;
					availability = 0;
					duration_type = 0;
					return;
				case 105 :
					name = "Spark";
					target_type = 0;
					cost = 4;
					availability = 0;
					duration_type = 0;
					return;
				case 106 :
					name = "Magnetic Lines";
					target_type = 4;
					cost = 5;
					availability = 0;
					duration_type = 3;
					return;
				case 107 :
					name = "Northern Wind";
					target_type = 2;
					cost = 10;
					availability = 0;
					duration_type = 0;
					return;
				case 108 :
					name = "Freedom's Grasp";
					target_type = 4;
					cost = 12;
					availability = 1;
					duration_type = 0;
					return;
				case 109 :
					name = "Detonate";
					target_type = 0;
					cost = 7;
					availability = 0;
					duration_type = 0;
					return;
				case 110 :
					name = "Void Pocket";
					target_type = 2;
					cost = 14;
					availability = 0;
					duration_type = 0;
					return;
				case 111 :
					name = "Butterfly Wings";
					target_type = 4;
					cost = 16;
					availability = 1;
					duration_type = 3;
					return;
				case 112 :
					name = "Conflagaration";
					target_type = 2;
					cost = 16;
					availability = 0;
					duration_type = 0;
					return;
				case 113 :
					name = "Spirae Disarm";
					target_type = 6;
					cost = 5;
					availability = 3;
					duration_type = 0;
					return;
				case 114 :
					name = "Planar Shift";
					target_type = 4;
					cost = 20;
					availability = 1;
					duration_type = 0;
					return;
				case 115 :
					name = "Basilisk's Gaze";
					target_type = 2;
					cost = 25;
					availability = 0;
					duration_type = 0;
					return;
				case 116 :
					name = "Wall of Ice";
					target_type = 4;
					cost = 26;
					availability = 0;
					duration_type = 5;
					return;
				case 117 :
					name = "Elemental Blessing";
					target_type = 4;
					cost = 30;
					availability = 0;
					duration_type = 5;
					return;
				case 118 :
					name = "Wyrm's Breath";
					target_type = 2;
					cost = 28;
					availability = 0;
					duration_type = 0;
					return;
				case 119 :
					name = "Implode";
					target_type = 0;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 120 :
					name = "Chain Lightning";
					target_type = 2;
					cost = 36;
					availability = 0;
					duration_type = 0;
					return;
				case 121 :
					name = "Blizzard";
					target_type = 3;
					cost = 50;
					availability = 0;
					duration_type = 0;
					return;
				case 122 :
					name = "Spiraetechnics";
					target_type = 2;
					cost = 42;
					availability = 0;
					duration_type = 0;
					return;
				case 123 :
					name = "Wall of Fire";
					target_type = 4;
					cost = 69;
					availability = 0;
					duration_type = 1;
					return;
				case 124 :
					name = "Lightning Storm";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 0;
					return;
				case 125 :
					name = "Firestorm";
					target_type = 0;
					cost = 120;
					availability = 0;
					duration_type = 0;
					return;
				case 126 :
					name = "Falcon";
					target_type = 4;
					cost = 2;
					availability = 2;
					duration_type = 4;
					return;
				case 127 :
					name = "Mental Jab";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 0;
					return;
				case 128 :
					name = "Morale Conflict";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 0;
					return;
				case 129 :
					name = "Phase Zombie";
					target_type = 6;
					cost = 4;
					availability = 0;
					duration_type = 0;
					return;
				case 130 :
					name = "Butterbar Scout";
					target_type = 4;
					cost = 5;
					availability = 2;
					duration_type = 4;
					return;
				case 131 :
					name = "Penetrating Stare";
					target_type = 4;
					cost = 8;
					availability = 1;
					duration_type = 0;
					return;
				case 132 :
					name = "Soul Vapor";
					target_type = 4;
					cost = 10;
					availability = 2;
					duration_type = 4;
					return;
				case 133 :
					name = "Dispel Illusion";
					target_type = 3;
					cost = 12;
					availability = 0;
					duration_type = 0;
					return;
				case 134 :
					name = "Mind Melt";
					target_type = 0;
					cost = 7;
					availability = 0;
					duration_type = 0;
					return;
				case 135 :
					name = "Invisibility";
					target_type = 1;
					cost = 14;
					availability = 0;
					duration_type = 1;
					return;
				case 136 :
					name = "Ogre Magi";
					target_type = 4;
					cost = 16;
					availability = 2;
					duration_type = 4;
					return;
				case 137 :
					name = "Dream Web";
					target_type = 2;
					cost = 16;
					availability = 0;
					duration_type = 5;
					return;
				case 138 :
					name = "Twilight of Concealment";
					target_type = 4;
					cost = 24;
					availability = 0;
					duration_type = 2;
					return;
				case 139 :
					name = "Dread Bear";
					target_type = 4;
					cost = 20;
					availability = 2;
					duration_type = 4;
					return;
				case 140 :
					name = "Mental Corruption";
					target_type = 2;
					cost = 25;
					availability = 0;
					duration_type = 0;
					return;
				case 141 :
					name = "Frost Elemental";
					target_type = 4;
					cost = 26;
					availability = 2;
					duration_type = 4;
					return;
				case 142 :
					name = "Fire Elemental";
					target_type = 4;
					cost = 30;
					availability = 2;
					duration_type = 4;
					return;
				case 143 :
					name = "Lightning Storm";
					target_type = 3;
					cost = 28;
					availability = 0;
					duration_type = 0;
					return;
				case 144 :
					name = "Eye of Corrunder";
					target_type = 4;
					cost = 30;
					availability = 2;
					duration_type = 3;
					return;
				case 145 :
					name = "Uber Wiziliche";
					target_type = 4;
					cost = 36;
					availability = 2;
					duration_type = 4;
					return;
				case 146 :
					name = "Ghosting";
					target_type = 4;
					cost = 50;
					availability = 1;
					duration_type = 3;
					return;
				case 147 :
					name = "Broadcast";
					target_type = 4;
					cost = 42;
					availability = 1;
					duration_type = 3;
					return;
				case 148 :
					name = "Warlord of Ultoric";
					target_type = 4;
					cost = 69;
					availability = 2;
					duration_type = 4;
					return;
				case 149 :
					name = "Psionic Cyclone";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 0;
					return;
				case 150 :
					name = "Divinae Draconis";
					target_type = 4;
					cost = 4;
					availability = 2;
					duration_type = 4;
					return;
				case 151 :
					name = "Divine Warmth";
					target_type = 1;
					cost = 2;
					availability = 2;
					duration_type = 0;
					cast_msg = " feels a warmth washing away the pain and is healed.";
					desc = "Getting hurt through the course of your quest is to be expected. This allows the caster to mend minor injuries and continue on.";
					return;
				case 152 :
					name = "Off the Cuff";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 0;
					return;
				case 153 :
					name = "Precognitive Flash";
					target_type = 5;
					cost = 3;
					availability = 0;
					duration_type = 2;
					return;
				case 154 :
					name = "Light of Inner Peace";
					target_type = 1;
					cost = 4;
					availability = 2;
					duration_type = 3;
					return;
				case 155 :
					name = "Fickle Divine";
					target_type = 0;
					cost = 4;
					availability = 2;
					duration_type = 0;
					return;
				case 156 :
					name = "Life Channel";
					target_type = 0;
					cost = 6;
					availability = 0;
					duration_type = 0;
					return;
				case 157 :
					name = "Westbound Soul";
					target_type = 0;
					cost = 5;
					availability = 0;
					duration_type = 0;
					return;
				case 158 :
					name = "Purifying Treatment";
					target_type = 1;
					cost = 12;
					availability = 2;
					duration_type = 0;
					return;
				case 159 :
					name = "External Radiance";
					target_type = 1;
					cost = 13;
					availability = 2;
					duration_type = 3;
					return;
				case 160 :
					name = "Light of Serenity";
					target_type = 4;
					cost = 14;
					availability = 2;
					duration_type = 3;
					return;
				case 161 :
					name = "Cycle of Undeath";
					target_type = 2;
					cost = 16;
					availability = 0;
					duration_type = 0;
					return;
				case 162 :
					name = "Sanctification";
					target_type = 1;
					cost = 16;
					availability = 2;
					duration_type = 0;
					return;
				case 163 :
					name = "Negation of Wellbeing";
					target_type = 2;
					cost = 18;
					availability = 2;
					duration_type = 0;
					return;
				case 164 :
					name = "Precognitive Vision";
					target_type = 4;
					cost = 20;
					availability = 0;
					duration_type = 2;
					return;
				case 165 :
					name = "Warming Emanations";
					target_type = 4;
					cost = 25;
					availability = 2;
					duration_type = 0;
					return;
				case 166 :
					name = "Living Flesh";
					target_type = 1;
					cost = 30;
					availability = 2;
					duration_type = 0;
					return;
				case 167 :
					name = "Restore Soul";
					target_type = 1;
					cost = 32;
					availability = 2;
					duration_type = 0;
					return;
				case 168 :
					name = "Wholly Mended";
					target_type = 1;
					cost = 35;
					availability = 2;
					duration_type = 0;
					return;
				case 169 :
					name = "Life Dispersal";
					target_type = 2;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 170 :
					name = "Blinding Health";
					target_type = 4;
					cost = 26;
					availability = 2;
					duration_type = 3;
					return;
				case 171 :
					name = "Yin Yang of Balance";
					target_type = 4;
					cost = 61;
					availability = 2;
					duration_type = 0;
					return;
				case 172 :
					name = "Living Absorption";
					target_type = 4;
					cost = 50;
					availability = 0;
					duration_type = 0;
					return;
				case 173 :
					name = "Chain of Ressurection";
					target_type = 4;
					cost = 79;
					availability = 2;
					duration_type = 0;
					return;
				case 174 :
					name = "Concussion of Corruption";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 0;
					return;
				case 175 :
					name = "Living Harmony";
					target_type = 4;
					cost = 120;
					availability = 2;
					duration_type = 0;
					return;
				case 176 :
					name = "Moonbeam";
					target_type = 0;
					cost = 2;
					availability = 0;
					duration_type = 0;
					return;
				case 177 :
					name = "Book of Dance";
					target_type = 1;
					cost = 3;
					availability = 2;
					duration_type = 3;
					return;
				case 178 :
					name = "Trip";
					target_type = 0;
					cost = 3;
					availability = 0;
					duration_type = 0;
					return;
				case 179 :
					name = "Book of Theory";
					target_type = 1;
					cost = 4;
					availability = 2;
					duration_type = 3;
					return;
				case 180 :
					name = "Minor Deflection";
					target_type = 1;
					cost = 4;
					availability = 0;
					duration_type = 1;
					return;
				case 181 :
					name = "Book of Communications";
					target_type = 1;
					cost = 6;
					availability = 2;
					duration_type = 3;
					return;
				case 182 :
					name = "Vicious Twist";
					target_type = 1;
					cost = 10;
					availability = 0;
					duration_type = 2;
					return;
				case 183 :
					name = "Book of Meditation";
					target_type = 1;
					cost = 12;
					availability = 2;
					duration_type = 3;
					return;
				case 184 :
					name = "Timorous";
					target_type = 0;
					cost = 10;
					availability = 0;
					duration_type = 2;
					return;
				case 185 :
					name = "Book of Body Sculpting";
					target_type = 1;
					cost = 14;
					availability = 2;
					duration_type = 3;
					return;
				case 186 :
					name = "Skin of Stone";
					target_type = 1;
					cost = 15;
					availability = 2;
					duration_type = 3;
					return;
				case 187 :
					name = "Mists of Avalon";
					target_type = 1;
					cost = 16;
					availability = 0;
					duration_type = 2;
					return;
				case 188 :
					name = "Distraction";
					target_type = 0;
					cost = 18;
					availability = 0;
					duration_type = 2;
					return;
				case 189 :
					name = "Avarice";
					target_type = 6;
					cost = 10;
					availability = 0;
					duration_type = 1;
					return;
				case 190 :
					name = "Major Deflection";
					target_type = 4;
					cost = 25;
					availability = 0;
					duration_type = 1;
					return;
				case 191 :
					name = "Whirlwind of Blades";
					target_type = 6;
					cost = 26;
					availability = 0;
					duration_type = 0;
					return;
				case 192 :
					name = "Dispel";
					target_type = 3;
					cost = 30;
					availability = 0;
					duration_type = 0;
					return;
				case 193 :
					name = "Confusion";
					target_type = 4;
					cost = 28;
					availability = 0;
					duration_type = 2;
					return;
				case 194 :
					name = "Leeching Vapors";
					target_type = 0;
					cost = 30;
					availability = 0;
					duration_type = 2;
					return;
				case 195 :
					name = "Luck of the Trevaris";
					target_type = 4;
					cost = 36;
					availability = 0;
					duration_type = 1;
					return;
				case 196 :
					name = "Flitting Chaos";
					target_type = 3;
					cost = 50;
					availability = 0;
					duration_type = 2;
					return;
				case 197 :
					name = "Hopeless Dread";
					target_type = 3;
					cost = 42;
					availability = 0;
					duration_type = 3;
					return;
				case 198 :
					name = "Vorpal Endowment";
					target_type = 4;
					cost = 69;
					availability = 0;
					duration_type = 2;
					return;
				case 199 :
					name = "Living Weapons";
					target_type = 3;
					cost = 96;
					availability = 0;
					duration_type = 2;
					return;
				case 200 :
					name = "Tome of Universal Understanding";
					target_type = 4;
					cost = 120;
					availability = 2;
					duration_type = 3;
					return;

			} 
		}
		
		
		public function getName():String { return this.name; }
		
		public function getTargetType():int { return this.target_type; }
		
		public function getCost():int { return this.cost; }
		
		public function getAvailability():int { return this.availability; }
		
		public function getDurationType():int { return this.duration_type; }
		
		public function getDurationFormula():String { return this.duration_formula; }
		
		public function getDmgType():String { return this.dmg_type; }
		
		public function getDmgFormula():String { return this.dmg_formula; }
		
		public function getDesc():String { return this.desc; }
		
		public function getCastMsg():String { return this.cast_msg; }
		
		// TODO:
		public function castDuration(src:Character):int {
			return 0;
		}
		
		
		// TODO
		public function castDamage(src:Character):int {
			
		}

		// TODO	
		//		public function castEnemyIndividual(char:Character, npc:NPC; id:int):void {
		
		//		}

		
		// TODO	
		//		public function castEnemyGroup(char:Character, npc_group:NPCGroup):void {
		
		//		}

		// TODO	
		//		public function castEnemyAll(char:Character, npcs:ArrayCollection):void {
		
		//		}
		
		
		// TODO
		public function castParty(caster:Character, id:int):void {
			
		}
		
		
		// TODO
		public function castSelf(caster:Character, id:int):void {
			
		}
		
		
		
		public function castFriendlyIndividual(caster:Character, target:Character, id:int):void {
			var lvl:int = caster.skills_level[id];
			switch(id) {
				case 151:
					var healing:int = (10+lvl) * .01 * target.health_max.getValue();
					target.incCurrHealth(healing);
					caster.decCurrSpirae(this.cost);
					caster.skills_exp[id]++;
					caster.skills_level[id] = Math.floor(caster.skills_exp[id] / 10) + 1;
					break;
			}
			
			
		}
		
		
		// TODO
		public function castSpecial(caster:Character, id:int):void {
			
		}
	}
}