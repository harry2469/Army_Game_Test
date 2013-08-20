package src.view {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import src.Base;
	import src.events.BaseEvent;
	
	/** @author Kristian Welsh */
	public class BaseView extends MovieClip {
		
		public function BaseView(parent:DisplayObjectContainer, x:int, y:int, model:Base) {
			super();
			parent.addChild(this);
			super.x = x;
			super.y = y;
			model.addEventListener(BaseEvent.SELECTED, select);
			model.addEventListener(BaseEvent.DESELECTED, deselect);
		}
		
		public function changeColour(colour:uint):void {
			var colourTransform:ColorTransform = new ColorTransform();
			colourTransform.color = colour;
			pop.transform.colorTransform = colourTransform;
			base_graphics.transform.colorTransform = colourTransform;
		}
		
		public function select(event:BaseEvent):void {
			selector.visible = true;
		}
		
		public function deselect(event:BaseEvent):void {
			selector.visible = false;
		}
		
		public function setPopulation(value:int):void {
			pop.text = "" + value;
		}
	}
}