package org.robotlegs.events
{
	import flash.events.Event;
	
	public class GalleryEvent extends Event
	{
		public function GalleryEvent(type:String, data:* = null):void
		{
			super(type);
			_data = data;
		}
		
		public static const IMAGE_CLICK		:String = "imageClick";
		public static const LOAD_COMPLETE	:String = "loadComplete";
		
		override public function clone():Event
		{
			return new GalleryEvent(type, _data);
		}
		
		override public function toString():String
		{
			return formatToString("GalleryEvent", "type", "data");
		}
		
		public function get data():* { return _data; }
		
		private var _data:*;
	}
}