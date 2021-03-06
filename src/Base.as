﻿package src {
	import flash.events.*;
	import flash.utils.Timer;
	import src.events.BaseEvent;
	
	public class Base extends EventDispatcher {
		static private const REGEN_AMOUNT:Number = 1;
		static private const REGEN_RATE:Number = 1000;
		
		private var _startingPopulation:uint = 0;
		private var _population:int;
		
		public function get startingPopulation():uint {
			return _startingPopulation;
		}
		
		private function set population(value:int):void {
			_population = value;
			dispatchEvent(new BaseEvent(BaseEvent.POPULATION_CHANGED, this, value));
		}
		
		public function Base(startingPopulation:uint):void {
			_startingPopulation = startingPopulation;
			_population = _startingPopulation;
			regularlyRegeneratePopulation();
		}
		
		private function regularlyRegeneratePopulation():void {
			var timer:Timer = new Timer(REGEN_RATE);
			timer.addEventListener(TimerEvent.TIMER, regenPop);
			timer.start();
		}
		
		private function regenPop(event:TimerEvent):void {
			population = _population + REGEN_AMOUNT;
		}
	}
}