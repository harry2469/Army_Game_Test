package src {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Timer;
	import src.events.BaseEvent;
	import src.view.BaseView;
	
	public class Base extends MovieClip {
		static private const REGEN_AMOUNT:Number = 1;
		static private const REGEN_RATE:Number = 1000;
		
		private var _startingPopulation:uint = 0;
		private var _population:int;
		
		public function get startingPopulation():uint {
			return _startingPopulation;
		}
		
		public function Base(startingPopulation:uint):void {
			_startingPopulation = startingPopulation;
			_population = _startingPopulation;
			regularlyRegeneratePopulation();
		}
		
		private function regularlyRegeneratePopulation():void {
			var populationRegenTimer:Timer = new Timer(REGEN_RATE);
			populationRegenTimer.addEventListener(TimerEvent.TIMER, regenPop);
			populationRegenTimer.start();
		}
		
		private function dispatchSelectEvent(e:MouseEvent):void {
			dispatchEvent(new BaseEvent(BaseEvent.CLICKED, this));
		}
		
		private function regenPop(event:TimerEvent):void {
			population = _population + REGEN_AMOUNT;
		}
		
		private function set population(value:int):void {
			_population = value;
			dispatchEvent(new BaseEvent(BaseEvent.POPULATION_CHANGED, this, value));
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}