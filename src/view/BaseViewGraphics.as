package src.view {
	import flash.display.*;
	import flash.geom.ColorTransform;
	import src.view.BaseView;
	/** @author Kristian Welsh */
	public class BaseViewGraphics extends MovieClip {
		private var _creator:BaseView;
		public function BaseViewGraphics(creator:BaseView, container:DisplayObjectContainer) {
			super();
			_creator = creator;
			container.addChild(this);
		}
		
		public function setPosition(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
		}
		
		public function setColourTransform(colour:uint):void {
			var colourTransform:ColorTransform = new ColorTransform();
			colourTransform.color = colour;
			pop.transform.colorTransform = colourTransform;
			base_graphics.transform.colorTransform = colourTransform;
		}
		
		public function get creator():BaseView {
			return _creator;
		}
		
		public function select():void {
			selector.visible = true;
		}
		
		public function deselect():void {
			selector.visible = false;
		}
		
		public function setText(value:String):void {
			pop.text = value;
		}
	}
}