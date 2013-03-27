package{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	public class Base extends MovieClip{
		
		private var _colourtrans:ColorTransform;
		private var _population:int;
		protected var _colour:String;
		
		private var _timer:Timer = new Timer(1000);
		
		public function Base(colour:uint,X:int,Y:int,starting_pop:int):void{
			initVars(colour,X,Y,starting_pop);
			addListeners();
		}
		private function initVars(colour:uint,X:int,Y:int,starting_pop:int):void{
			initPos(X,Y);
			initColour(colour);
			updatePop(starting_pop);
			deselectBase();
		}
		private function initPos(X:int,Y:int){
			x=X;
			y=Y;
		}
		private function initColour(colour:uint):void{
			_colourtrans = transform.colorTransform;
			_colourtrans.color = colour;
			transform.colorTransform = _colourtrans;
		}
		
		private function addListeners():void{
			_timer.addEventListener(TimerEvent.TIMER, regenPop);
			_timer.start();
			_timer.addEventListener(MouseEvent.CLICK, selectBase);
		}
		
		private function regenPop(event:TimerEvent):void{
			addToPop(1);
		}
		
		private function addToPop(num:int):void{
			updatePop(_population+num);
		}
		
		private function updatePop(num:int):void{
			_population=num
			pop.text=num.toString();
		}
		
		private function selectBase(event:MouseEvent):void{
			selector.visible=true
		}
		
		private function deselectBase():void{
			selector.visible=false
		}
	}
}