package src.view {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import src.events.BaseEvent;
	import src.IBase;
	import src.IBaseView;
	import src.Main;
	
	/** @author Kristian Welsh */
	public class BaseView extends MovieClip implements IBaseView {
		
		public function BaseView(x:Number, y:Number, model:IBase, container:DisplayObjectContainer) {
			super();
			container.addChild(this);
			super.x = x;
			super.y = y;
			deselect();
		}
		
		public function changeColour(colour:uint):void {
			var colourTransform:ColorTransform = new ColorTransform();
			colourTransform.color = colour;
			pop.transform.colorTransform = colourTransform;
			base_graphics.transform.colorTransform = colourTransform;
		}
		
		public function select():void {
			selector.visible = true;
		}
		
		public function deselect():void {
			selector.visible = false;
		}
		
		public function setPopulation(value:int):void {
			pop.text = "" + value;
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}