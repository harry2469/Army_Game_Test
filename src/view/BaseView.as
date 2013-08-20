package src.view {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import src.Base;
	import src.events.BaseEvent;
	import src.IBaseView;
	
	/** @author Kristian Welsh */
	public class BaseView extends MovieClip implements IBaseView {
		
		public function BaseView(x:Number, y:Number, colour:uint, model:Base, container:DisplayObjectContainer) {
			super();
			container.addChild(this);
			super.x = x;
			super.y = y;
			deselect();
			changeColour(colour);
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
		
		public function setPopulation(value:int):void {
			pop.text = "" + value;
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}