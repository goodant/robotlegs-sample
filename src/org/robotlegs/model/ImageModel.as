package org.robotlegs.model 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import org.robotlegs.mvcs.Actor;
	
	public class ImageModel extends Actor
	{
		private var _images:Vector.<Bitmap>;
		private var _indexClick:int;

		public function ImageModel() { }
		
		public function addImages(value:Array):void
		{
			if (!_images)
				_images = new Vector.<Bitmap>();
			for (var i:int = 0; i < value.length; i++)
			{
				_images.push(value[i]);
			}
		}
		
		public function get indexClick():int
		{
			return _indexClick;
		}
		
		public function set indexClick(value:int):void
		{
			_indexClick = value;
		}
		
		public function cloneImage(i:int):Bitmap
		{
			var data:BitmapData = new BitmapData(_images[i].width, _images[i].height, false);
			data.draw(_images[i]);
			var cloneData:BitmapData = data.clone();
			var cloneBitmap:Bitmap = new Bitmap(cloneData);
			return cloneBitmap;
		}
		
		public function getImage():Bitmap
		{
			return _images[_indexClick];
		}
		
		public function get totalCount():int
		{
			return _images.length;
		}
		
	}
}