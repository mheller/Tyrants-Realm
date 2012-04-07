package character
{
	[Bindable]
	public class Attribute
	{
		public var text:String = null;
		public var value:Object = null;
		public var max_value:Object = null;
				
		public function Attribute(text:String,value:Object, max_value:Object=null)
		{
			this.text = text;
			this.value = value;
			this.max_value = max_value;
		}
	}
}