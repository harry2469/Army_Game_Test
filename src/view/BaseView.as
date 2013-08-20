package src.view {
	import flash.display.*;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import src.Base;
	import src.events.BaseEvent;
	
	/** @author Kristian Welsh */
	public class BaseView extends MovieClip implements IBaseView {
		
		public function BaseView(position:Point, colour:uint, model:Base, container:DisplayObjectContainer) {
			super();
			container.addChild(this);
			super.x = position.x;
			super.y = position.y;
			deselect();
			changeColour(colour);
			setPopulation(model.startingPopulation);
			model.addEventListener(BaseEvent.POPULATION_CHANGED, updatePopulation);
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
		
		private function updatePopulation(event:BaseEvent):void {
			setPopulation(event.population);
		}
		
		private function setPopulation(value:int):void {
			pop.text = "" + value;
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}