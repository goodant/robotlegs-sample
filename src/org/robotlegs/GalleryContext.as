package org.robotlegs
{
	import flash.external.ExternalInterface;

	import flash.display.DisplayObjectContainer;
	import org.robotlegs.controller.*;
	import org.robotlegs.model.*;
	import org.robotlegs.view.*;
	import org.robotlegs.events.GalleryEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.controller.ImageClickCommand;
	import org.robotlegs.view.MainPanelTileMediator;
	
	public class GalleryContext extends Context
	{		
		public function GalleryContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{

			// Controller
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadImages, ContextEvent, true);
			commandMap.mapEvent(GalleryEvent.LOAD_COMPLETE, CreateMainPanelCommand, GalleryEvent, true);
			commandMap.mapEvent(GalleryEvent.IMAGE_CLICK, ImageClickCommand, GalleryEvent);
			
			// View
			mediatorMap.mapView(MainPanelTile, MainPanelTileMediator);

			// Services
			injector.mapSingleton(ImageModel);


			super.startup();
		}
	
	}
}