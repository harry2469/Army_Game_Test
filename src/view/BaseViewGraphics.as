package src.view {
	import flash.display.MovieClip;
	import src.view.BaseView;
	/** @author Kristian Welsh */
	public class BaseViewGraphics extends MovieClip {
		public var creator:BaseView;
		public function BaseViewGraphics(creator:BaseView) {
			super();
			this.creator = creator;
		}
	}
}