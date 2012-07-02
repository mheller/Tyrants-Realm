package character
{
	
	/* This information is that of the player's account. All other fields saved in the database will be fetched as needed to manage security issues */
	public class Account
	{
		
		private var account_id:uint = 0;
		
		public function Account(account_id:uint)
		{
			this.account_id = account_id;
		}
		
		public function getAccountID():uint {
			return this.account_id;
		}
		
	}
}