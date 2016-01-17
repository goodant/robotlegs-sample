package org.robotlegs.controller 
{
	import org.robotlegs.view.MainPanelTile;
	import org.robotlegs.model.ImageModel;
	import org.robotlegs.mvcs.Command;
	
	public class ImageClickCommand extends Command
	{
		public function ImageClickCommand() { }
		
		[Inject]
		public var imageModel:ImageModel;
		
		override public function execute():void
		{
			var imageCanvas:MainPanelTile = contextView.stage.getChildByName("imageCanvas") as MainPanelTile;
			imageCanvas.showImage(imageModel.indexClick);
		}
	}
}