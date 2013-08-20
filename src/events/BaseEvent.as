package src.events {
	import flash.events.Event;
	import src.Base;
	
	/** @author Kristian Welsh */
	public class BaseEvent extends Event {
		static public const CLICKED:String = "clicked";
		static public const POPULATION_CHANGED:String = "population changed";
		
		private var _base:Base;
		private var _population:int;
		
		public function BaseEvent(type:String, base:Base = null, newPopulation:int = 0, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_base = base;
			_population = newPopulation;
		}
		
		public override function clone():Event {
			return new BaseEvent(type, base, population, bubbles, cancelable);
		}
		
		public override function toString():String {
			return formatToString("BaseEvent", "type", "base", "population", "bubbles", "cancelable", "eventPhase");
		}
		
		public function get base():Base {
			return _base;
		}
		
		public function get population():int {
			return _population;
		}
	}
}