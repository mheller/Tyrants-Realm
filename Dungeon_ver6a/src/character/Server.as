package character
{
	//character's base class for all charaters
	[Bindable]
	public class Server
	{
		
		private var server_id:uint = 1;
		private var server_name:String = "";
		private var server_ip:String = "0.0.0.0";   // (Mark): May need port # 
		private var server_hostname:String = "";
		private var next_reboot_date:Date;
		
		public function Server(server_id:uint,server_name:String, server_ip:String, server_hostname:String) 
		{
			this.server_id = server_id;
			this.server_name = server_name;
			this.server_ip = server_ip;
			this.server_hostname = server_hostname;
		}
		
		
		// server_id
		public function setServerId(server_id:uint): void {
			this.server_id = server_id;
		}
		public function getServerId(): uint {
			return this.server_id;
		}
		
		// server_name
		public function setServerName(server_name:String): void {
			this.server_name = server_name;
		}
		public function getServerName(): String {
			return this.server_name;
		}
		
		
		// server_ip
		public function setServerIP(server_name:String): void {
			this.server_ip = server_ip;
		}
		public function getServerIP(): String {
			return this.server_ip;
		}
		
		// server_hostname
		public function setServerHostname(server_hostname:String): void {
			this.server_hostname = server_hostname;
		}
		public function getServerHostname(): String {
			return this.server_hostname;
		}
		

		// next reboot time and date
		public function setNextServerRebootDate(next_reboot_date:Date): void {
			this.next_reboot_date = next_reboot_date;
		}
		public function getNextServerRebootDate(): Date {
			return this.next_reboot_date;
		}
		
	}
}