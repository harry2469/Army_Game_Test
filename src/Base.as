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
		
		private var _parent:DisplayObjectContainer;
		private var _view:BaseView;
		private var _population:int;
		protected var _colour:String;
		
		private var _timer:Timer = new Timer(1000);
		
		private function set population(value:int):void {
			_population = value;
			_view.setPopulation(value);
		}
		
		public function Base(colour:uint, x:int, y:int, starting_pop:int, parent:DisplayObjectContainer):void {
			_view = new BaseView(parent, x, y, this);
			_parent = parent;
			initColour(colour);
			population = starting_pop;
			deselect();
			addListeners();
		}
		
		private function initColour(colour:uint):void {
			_view.changeColour(colour);
		}
		
		private function addListeners():void {
			_view.addEventListener(MouseEvent.CLICK, dispatchSelectEvent);
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