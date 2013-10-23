package src.view {
	import flash.display.MovieClip;
	import src.view.BaseView;
	/** @author Kristian Welsh */
	public class NullBaseView extends MovieClip implements IBaseView {
		public static var nullBaseView:NullBaseView;
		
		static public function makeNullBaseView():NullBaseView {
			if (nullBaseView == null)
				nullBaseView = new NullBaseView();
			return nullBaseView;
		}
		
		public function select():void { }
		public function deselect():void { }
		public function setView(colour:uint, view:BaseView, number:int):void { }
		
		public function getNextBaseView(graphics:BaseViewGraphics):IBaseView {
			return graphics.creator;
		}
	}
}