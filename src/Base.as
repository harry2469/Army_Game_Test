package src {
	import src.events.BaseEvent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
	import flash.utils.Timer;
	import src.events.BaseEvent;
	
	public class Base extends MovieClip implements IBase{
		static private const REGEN_RATE:Number = 1;
		
		private var _main:Main;
		private var _population:int;
		protected var _colour:String;
		
		private var _timer:Timer = new Timer(1000);
		
		private function set population(value:int):void {
			_population = value;
			pop.text = "" + value;
		}
		
		public function Base(colour:uint, x:int, y:int, starting_pop:int, MAIN:Main):void {
			_main = MAIN;
			this.x = x;
			this.y = y;
			initColour(colour);
			population = starting_pop;
			deselect();
			addListeners();
		}
		
		private function initColour(colour:uint):void {
			var colourTransform:ColorTransform = new ColorTransform();
			colourTransform.color = colour;
			pop.transform.colorTransform = colourTransform;
			base_graphics.transform.colorTransform = colourTransform;
		}
		
		private function addListeners():void {
			this.addEventListener(MouseEvent.CLICK, dispatchSelectEvent);
			_timer.addEventListener(TimerEvent.TIMER, regenPop);
			_timer.start();
		}
		
		private function dispatchSelectEvent(e:MouseEvent):void {
			dispatchEvent(new BaseEvent(BaseEvent.SELECTED, this));
		}
		
		private function regenPop(event:TimerEvent):void {
			population = _population + REGEN_RATE;
		}
		
		public function select():void {
			selector.visible = true;
		}
		
		public function deselect():void {
			selector.visible = false;
		}
		
		public function isNull():Boolean {
			return false;
		}
	}
}