package org.robotlegs.view 
{
	import com.greensock.TweenNano;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class MainPanelTile extends Sprite
	{
		private var _btnBack:mcBtnBack;
		private var _btnNext:mcBtnNext;
		private var _template:imageScreen;
		private var _index:int;

		public function MainPanelTile() 
		{
			_index = index;
			_template = new imageScreen();
			addChild(_template);

			_btnBack = new mcBtnBack();
			_btnBack.x = (_template.width - _btnBack.width) / 2 - 20;
			_btnBack.y = _template.height - _btnBack.height - 36;
			addChild(_btnBack);
			
			_btnNext = new mcBtnNext();
			_btnNext.x = (_template.width - _btnNext.width) / 2 + 20;
			_btnNext.y = _btnBack.y;
			addChild(_btnNext);
		}
		
		public function addImage(image:Bitmap, index:int):void
		{
			var width:int = _template.tvGlass.width;
			var height:int = _template.tvGlass.height;
			var diff:Number = Math.max(_template.tvGlass.width / image.width, _template.tvGlass.height / image.height);
			image.width *= diff;
			image.height *= diff;
			image.x = - image.width / 2;
			image.y = - image.height / 2;
			image.name = "image" + index;
			image.smoothing = true;
			_template.imageCanvas.addChild(image);
			_template.imageCanvas.mask = _template.tvGlass;
		}
		
		public function showImage(index:int):void
		{
			var image_count:int = _template.imageCanvas.numChildren;
			for (var i:int = 0; i < image_count; i++)
			{
				var img:DisplayObject = _template.imageCanvas.getChildByName("image" + i);
				if (i == index) {
					TweenNano.to(img, 0.3, {alpha:1});
				} else {
					if (img.alpha > 0) {
						TweenNano.to(img, 0.3, {alpha:0});
					}
				}
			}
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get template():imageScreen
		{
			return _template;
		}
		
		public function get btnBack():mcBtnBack
		{
			return _btnBack;
		}
		
		public function get btnNext():mcBtnNext
		{
			return _btnNext;
		}
		
		public function destroy():void
		{
			removeChild(_template);
			_template = null;
		}
		
	}
}