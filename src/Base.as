package src {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Timer;
	import src.events.BaseEvent;
	import src.view.BaseView;
	
	public class Base extends MovieClip {
		static private const REGEN_AMOUNT:Number = 1;
		static private const REGEN_RATE:Number = 1000;
		
		private var _view:BaseView;
		private var _population:int;
		protected var _colour:String;
		
		private var _populationRegenTimer:Timer = new Timer(REGEN_RATE);
		
		private function set population(value:int):void {
			_population = value;
			dispatchEvent(new BaseEvent(BaseEvent.POPULATION_CHANGED, this, value));
		}
		
		public function Base():void {
			regularlyRegeneratePopulation();
		}
		
		public function setView(value:BaseView, starting_pop:int):void {
			_view = value;
			population = starting_pop;
		}
		
		private function regularlyRegeneratePopulation():void {
			_populationRegenTimer.addEventListener(TimerEvent.TIMER, regenPop);
			_populationRegenTimer.start();
		}
		
		private function dispatchSelectEvent(e:MouseEvent):void {
			dispatchEvent(new BaseEvent(BaseEvent.CLICKED, this));
		}
		
		private function regenPop(event:TimerEvent):void {
			population = _population + REGEN_AMOUNT;
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}