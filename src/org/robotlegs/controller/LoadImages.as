package org.robotlegs.controller 
{
	import org.robotlegs.stocks.Stocks;
	import org.robotlegs.events.GalleryEvent;
	import org.robotlegs.model.ImageModel;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import org.robotlegs.mvcs.Command;
	
	public class LoadImages extends Command
	{
		public function LoadImages() { }
		
		[Inject]
		public var imageModel:ImageModel;
		
		override public function execute():void
		{
			_fileList = Stocks.IMAGES_LIST;
			_total = _fileList.length;
			var loader:Loader;
			for (var i:int = 0; i < _total; i++)
			{
				loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadHandler);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
				loader.load(new URLRequest(_fileList[i]));
			}
		}
		
		private var _fileList:Vector.<String>;
		private var _total:uint;
		private var _loaded:uint = 0;
		private var _images:Array = [];
		
		private function imageLoadHandler(event:Event):void
		{
			var info:LoaderInfo = LoaderInfo(event.currentTarget);
			_images[Stocks.IMAGES_LIST.indexOf(info.url)] = info.content;
			info.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageLoadHandler);
			info.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			_loaded++;
			if (_loaded >= _total)
			{
				imageModel.addImages(_images);
				eventDispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.LOAD_COMPLETE));
			}
		}
		
		private function errorHandler(event:ErrorEvent):void
		{
			throw new Error("images source is empty");
		}
	}
}