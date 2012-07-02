package character
{
	[Bindable]
	public class Attribute
	{
		public var text:String = null;
		public var value:Object = null;
		private var max_value:Object = null;
				
		public function Attribute(text:String,value:Object, max_value:Object=null)
		{
			this.text = text;
			this.value = value;
			this.max_value = max_value;
		}
		
		public function getText():String {
			return this.text;
		}
		public function setText(txt:String):void {
			this.text = txt;
		}
		
		public function getValue():Object {
			return this.value;
		}
		public function setValue(val:Object):void {
			this.value = val;
		}
		
		public function getMaxValue():Object {
			return this.max_value;
		}
		public function setMaxValue(max:Object):void {
			this.max_value = max;
		}
	}
}