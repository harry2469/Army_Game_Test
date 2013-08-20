package src.view {
	import flash.display.MovieClip;
	import src.events.BaseEvent;
	import src.IBaseView;
	import src.view.BaseView;
	/** @author Kristian Welsh */
	public class NullBaseView extends MovieClip implements IBaseView {
		public static const NULL_BASE_VIEW:NullBaseView = new NullBaseView();
		
		public function select():void { }
		public function deselect():void { }
		public function setView(colour:uint, view:BaseView, number:int):void { }
		
		public function isNull():Boolean {
			return true;
		}
	}
}