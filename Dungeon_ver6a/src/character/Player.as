package character
{
	import character.Account;
	import character.Server;
	
	public class Player
	{
		
		private var player_id:uint = 0;
		private var player_name:String;
		private var player_server:character.Server;
		private var player_account:character.Account;
		private var town_coordinate_X:int = 0;
		private var town_coordinate_Y:int = 0;
		private var faction:int = 0;
		private var denarii:Number = 500;
		private var stater:Number = 100
		private var pvp_wins:int = 0;
		private var pvp_losses:int = 0;
		private var num_of_battles:int = 0;
		private var lowest_dungeon_level_entered:int = 1;
		private var highest_boss_level_killed:int = 0;
		private var highest_boss_killed:int = 0;
		private var highest_NPC_level_killed:int = 0;
		private var highest_NPC_killed:int = 0;
		private var num_of_quests_completed:int = 0;
		private var num_of_dailies_completed:int = 0;
		private var num_of_raids_completed:int = 0;
		private var num_of_new_craftings:int = 0;
		private var num_of_upgrades_performed:int = 0;
		private var highest_upgrade_level:int = 0;
		private var constructionTimeBonus:int = 0;
		private var constructionCostBonus:int = 0;
		
		public function Player(player_id:uint, player_name:String, player_server:character.Server, player_account:character.Account, town_coordinate_X:int, town_coordinate_Y:int,
		                        faction:int)
		{
			this.player_id = player_id;
			this.player_name = player_name;
			this.player_server = player_server;
			this.player_account = player_account;
			this.town_coordinate_X = town_coordinate_X;
			this.town_coordinate_Y = town_coordinate_Y;
			this.faction = faction;
		}

	
		// player_id
		public function getPlayerID():uint {
			return this.player_id;
		}
		public function setPlayerID(player_id:uint):void {
			this.player_id = player_id;
		}
	
	
		// player_name
		public function getPlayerName():String {
			return this.player_name;
		}
		public function setPlayerName(player_name:String):void {
			this.player_name = player_name;
		}

		// player_server
		public function getPlayerServer():character.Server {
			return this.player_server;
		}
		public function setPlayerServer(player_server:character.Server):void {
			this.player_server = player_server;
		}

		// player_account
		public function getPlayerAccount():character.Account {
			return this.player_account;
		}
		public function setPlayerAccount(player_account:character.Account):void {
			this.player_account = player_account;
		}

		// town_coordinate_X
		public function getTownCoodinateX():int {
			return this.town_coordinate_X;
		}
		public function setTownCoordinateX(town_coordinate_X:int):void {
			this.town_coordinate_X = town_coordinate_X;
		}
		
		// town_coordinate_Y
		public function getTownCoordinateY():int {
			return this.town_coordinate_Y;
		}
		public function setTownCoordinateY(town_coordinate_Y:int):void {
			this.town_coordinate_Y = town_coordinate_Y;
		}
		
		// faction
		public function getFaction():int {
			return this.faction;
		}
		public function setFaction(faction:int):void {
			this.faction = faction;
		}
		
		// denarii
		public function getDenarii():Number {
			return this.denarii;
		}
		public function setDenarii(denarii:Number):void {
			this.denarii = denarii;
		}
		public function incDenarii(denarii:Number):void {
			this.denarii = this.denarii + denarii;
		}
		public function decDenarii(denarii:Number):void {
			this.denarii = this.denarii - denarii;
			if (this.denarii < 0) this.denarii = 0;
		}
		
		// stater
		public function getStater():Number {
			return this.stater;
		}
		public function setStater(stater:Number):void {
			this.stater = stater;
		}
		public function incStater(stater:Number):void {
			this.stater = this.stater + stater;
		}
		public function decStater(stater:Number):void {
			this.stater = this.stater - stater;
			if (this.stater < 0) this.stater = 0;
		}

		// pvp_wins
		public function getPVPWins():int {
			return this.pvp_wins;
		}
		public function setPVPWins(pvp_wins:int):void {
			this.pvp_wins = pvp_wins;
		}
		public function incPVPWins():void {
			this.pvp_wins++;
		}
		
		// pvp_losses
		public function getPVPLosses():int {
			return this.pvp_losses;
		}
		public function setPVPLosses(pvp_losses:int):void {
			this.pvp_losses = pvp_losses;
		}
		public function incPVPLosses():void {
			this.pvp_losses++;
		}
		
		// num_of_battles
		public function getNumOfBattles():int {
			return this.num_of_battles;
		}
		public function incNumOfBattles(num_of_battles:int):void {
			this.num_of_battles = num_of_battles;
		}
		
		// lowest_dungeon_level_entered
		public function getLowestDungeonLevelEntered():int {
			return this.lowest_dungeon_level_entered;
		}
		public function incLowestDungeonLevelEntered(lowest_dungeon_level_entered:int):void {
			if (this.lowest_dungeon_level_entered < lowest_dungeon_level_entered) this.lowest_dungeon_level_entered = lowest_dungeon_level_entered;
		}
		
		// highest_boss_level_killed
		public function getHighestBossLevelKilled():int {
			return this.highest_boss_level_killed;
		}
		public function incHighestBossLevelKilled(highest_boss_level_killed:int):void {
			if (this.highest_boss_level_killed < highest_boss_level_killed) this.highest_boss_level_killed = highest_boss_level_killed;
		}
		
		// highest_boss_killed
		public function getHighestBossKilled():int {
			return this.highest_boss_killed;
		}
		public function incHighestBossKilled(highest_boss_killed:int):void {
			if (this.highest_boss_killed < highest_boss_killed) this.highest_boss_killed = highest_boss_killed;
		}
		
		// highest_NPC_level_killed
		public function getHighestNPCLevelKilled():int {
			return this.highest_NPC_level_killed;
		}
		public function incHighestNPCLevelKilled(highest_NPC_level_killed:int):void {
			if (this.highest_NPC_level_killed < highest_NPC_level_killed) this.highest_NPC_level_killed = highest_NPC_level_killed;
		}
		
		// highest_NPC_killed
		public function getHighestNPCKilled():int {
			return this.highest_NPC_killed;
		}
		public function incHighestNPCKilled(highest_NPC_killed:int):void {
			if (this.highest_NPC_killed < highest_NPC_killed) this.highest_NPC_killed = highest_NPC_killed;
		}
		
		// num_of_quests_completed
		public function getNumOfQuestsCompleted():int {
			return this.num_of_quests_completed;
		}
		public function incNumOfQuestsCompleted():void {
			this.num_of_quests_completed++;
		}
		
		// num_of_dailies_completed
		public function getNumOfDailiesCompleted():int {
			return this.num_of_dailies_completed;
		}
		public function incNumOfDailiesCompleted():void {
			this.num_of_dailies_completed++;
		}
		
		// num_of_raids_completed
		public function getNumOfRaidsCompleted():int {
			return this.num_of_raids_completed;
		}
		public function incNumOfRaidsCompleted():void {
			this.num_of_raids_completed++;
		}
		
		// num_of_new_craftings
		public function getNumOfNewCraftings():int {
			return this.num_of_new_craftings;
		}
		public function incNumOfNewCraftings():void {
			this.num_of_new_craftings++;
		}
		
		// num_of_upgrades_performed
		public function getNumOfUpgradesPerformed():int {
			return this.num_of_upgrades_performed;
		}
		public function incNumOfUpgradesPerformed():void {
			this.num_of_upgrades_performed++;
		}
		
		// highest_upgrade_level
		public function getHighestUpgradeLevel():int {
			return this.highest_upgrade_level;
		}
		public function incHighestUpgradeLevel(highest_upgrade_level:int):void {
			if (this.highest_upgrade_level < highest_upgrade_level) this.highest_upgrade_level = highest_upgrade_level;
		}
	
		// Construction Time Bonus
		public function getConstructionTimeBonus():int {
			return this.constructionTimeBonus;
		}
		public function incConstructionTimeBonus(constructionTimeBonus:int):void {
			this.constructionTimeBonus += constructionTimeBonus;
		}
		public function remConstructionTimeBonus(constructionTimeBonus:int):void {
			this.constructionTimeBonus -= constructionTimeBonus;
			if (this.constructionTimeBonus < 0) constructionTimeBonus = 0;
		}
		
		// Construction Cost Bonus
		public function getConstructionCostBonus():int {
			return this.constructionCostBonus;
		}
		public function incConstructionCostBonus(constructionCostBonus:int):void {
			this.constructionCostBonus += constructionCostBonus;
		}
		public function remConstructionCostBonus(constructionCostBonus:int):void {
			this.constructionCostBonus -= constructionCostBonus;
			if (this.constructionCostBonus < 0) constructionCostBonus = 0;
		}
		
	}
}