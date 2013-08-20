package src {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.utils.Timer;
	import src.events.BaseEvent;
	import src.view.BaseView;
	
	public class Base extends MovieClip implements IBase {
		static private const REGEN_RATE:Number = 1;
		
		private var _view:BaseView;
		private var _population:int;
		protected var _colour:String;
		
		private var _timer:Timer = new Timer(1000);
		
		private function set population(value:int):void {
			_population = value;
			_view.setPopulation(value);
		}
		
		public function Base():void {
			addListeners();
		}
		
		public function setView(colour:uint, value:BaseView, starting_pop:int):void {
			_view = value;
			population = starting_pop;
			_view.changeColour(colour);
			deselect();
		}
		
		private function addListeners():void {
			_timer.addEventListener(TimerEvent.TIMER, regenPop);
			_timer.start();
		}
		
		private function dispatchSelectEvent(e:MouseEvent):void {
			dispatchEvent(new BaseEvent(BaseEvent.CLICKED, this));
		}
		
		private function regenPop(event:TimerEvent):void {
			population = _population + REGEN_RATE;
		}
		
		public function select():void {
			dispatchEvent(new BaseEvent(BaseEvent.SELECTED, this));
		}
		
		public function deselect():void {
			dispatchEvent(new BaseEvent(BaseEvent.DESELECTED, this));
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}