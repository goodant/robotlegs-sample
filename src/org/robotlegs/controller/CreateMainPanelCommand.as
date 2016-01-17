package org.robotlegs.controller 
{
	import flash.external.ExternalInterface;
	
	import org.robotlegs.model.ImageModel;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.view.MainPanelTile;
	import org.robotlegs.view.MainPanelTileMediator;
	
	public class CreateMainPanelCommand extends Command
	{

		public function CreateMainPanelCommand() { }
		
		[Inject]
		public var imageModel:ImageModel;
		
		override public function execute():void
		{
			var imageCanvas:MainPanelTile = new MainPanelTile();
			imageCanvas.name = "imageCanvas";
			contextView.stage.addChild(imageCanvas);
			mediatorMap.createMediator(imageCanvas);
			
			var length:uint = imageModel.totalCount;
			for (var i:int = 0; i < length; i++)
			{
				imageCanvas.addImage(imageModel.cloneImage(i), i);
			}
		}
		
	}
}