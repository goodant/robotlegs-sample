package org.robotlegs.view 
{
	import flash.events.MouseEvent;
	import org.robotlegs.model.ImageModel;
	import org.robotlegs.events.GalleryEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class MainPanelTileMediator extends Mediator
	{
		[Inject]
		public var view:MainPanelTile;
		
		[Inject]
		public var imageModel:ImageModel;
		
		public function MainPanelTileMediator() { }
		
		override public function onRegister():void
		{
			eventMap.mapListener(view.btnBack, MouseEvent.CLICK, backClickHandler);
			eventMap.mapListener(view.btnNext, MouseEvent.CLICK, nextClickHandler);
		}
		
		override public function onRemove():void
		{
			view.destroy();
			view = null;
		}
		
		private function backClickHandler(event:MouseEvent):void
		{
			imageModel.indexClick--;
			if (imageModel.indexClick < 0) imageModel.indexClick = imageModel.totalCount - 2; 
			eventDispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.IMAGE_CLICK));
		}

		private function nextClickHandler(event:MouseEvent):void
		{
			imageModel.indexClick++;
			if (imageModel.indexClick > imageModel.totalCount - 1) imageModel.indexClick = 0; 
			eventDispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.IMAGE_CLICK));
		}
	}
}