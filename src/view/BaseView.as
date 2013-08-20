package src.view {
	import flash.display.*;
	import flash.geom.*;
	import src.Base;
	import src.events.BaseEvent;
	
	/** @author Kristian Welsh */
	public class BaseView implements IBaseView {
		private var _art:MovieClip;
		
		public function BaseView(position:Point, colour:uint, model:Base, container:DisplayObjectContainer) {
			super();
			_art = new BaseViewGraphics(this);
			container.addChild(_art);
			_art.x = position.x;
			_art.y = position.y;
			deselect();
			changeColour(colour);
			setPopulation(model.startingPopulation);
			model.addEventListener(BaseEvent.POPULATION_CHANGED, updatePopulation);
		}
		
		public function changeColour(colour:uint):void {
			var colourTransform:ColorTransform = new ColorTransform();
			colourTransform.color = colour;
			_art.pop.transform.colorTransform = colourTransform;
			_art.base_graphics.transform.colorTransform = colourTransform;
		}
		
		public function select():void {
			_art.selector.visible = true;
		}
		
		public function deselect():void {
			_art.selector.visible = false;
		}
		
		private function updatePopulation(event:BaseEvent):void {
			setPopulation(event.population);
		}
		
		private function setPopulation(value:int):void {
			_art.pop.text = "" + value;
		}
		
		public function isNull():Boolean {
			return false;
		}
		
		public function get art():MovieClip {
			return _art;
		}
	}
}