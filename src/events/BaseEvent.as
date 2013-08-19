package src.events {
	import flash.events.Event;
	import src.Base;
	
	/** @author Kristian Welsh */
	public class BaseEvent extends Event {
		public static const SELECTED:String = "selected";
		
		private var _base:Base;
		
		public function BaseEvent(type:String, base:Base, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_base = base;
		}
		
		public override function clone():Event {
			return new BaseEvent(type, base, bubbles, cancelable);
		}
		
		public override function toString():String {
			return formatToString("BaseEvent", "type", "base", "bubbles", "cancelable", "eventPhase");
		}
		
		public function get base():Base {
			return _base;
		}
	}
}