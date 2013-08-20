package src.view {
	
	import flash.display.*;
	import flash.geom.*;
	import src.Base;
	import src.events.BaseEvent;
	
	/** @author Kristian Welsh */
	public class BaseView implements IBaseView {
		private var _art:BaseViewGraphics;
		
		public function get isNull():Boolean {
			return false;
		}
		
		public function get art():MovieClip {
			return _art;
		}
		
		public function BaseView(position:Point, colour:uint, model:Base, container:DisplayObjectContainer) {
			super();
			_art = new BaseViewGraphics(this, container);
			initValues(position, colour, model);
			listenForPositionChanges(model);
		}
		
		private function initValues(position:Point, colour:uint, model:Base):void {
			_art.setPosition(position.x, position.y);
			setPopulation(model.startingPopulation);
			deselect();
			_art.setColourTransform(colour);
		}
		
		private function listenForPositionChanges(model:Base):void {
			model.addEventListener(BaseEvent.POPULATION_CHANGED, updatePopulation);
		}
		
		public function select():void {
			_art.select()
		}
		
		public function deselect():void {
			_art.deselect()
		}
		
		private function updatePopulation(event:BaseEvent):void {
			setPopulation(event.population);
		}
		
		private function setPopulation(value:int):void {
			_art.setText(""+value);
		}
	}
}