package{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import Main;
	public class Base extends MovieClip{
		
		private var _main:Main;
		private var _colourtrans:ColorTransform;
		private var _population:int;
		protected var _colour:String;
		private var _selected:Boolean;
		
		private var _timer:Timer = new Timer(1000);
		
		public function Base(colour:uint,X:int,Y:int,starting_pop:int,MAIN:Main):void{
			initVars(colour,X,Y,starting_pop,MAIN);
			addListeners();
		}
		private function initVars(colour:uint,X:int,Y:int,starting_pop:int,MAIN:Main):void{
			_main=MAIN;
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
			pop.transform.colorTransform = _colourtrans;
			base_graphics.transform.colorTransform = _colourtrans;
		}
		
		private function addListeners():void{
			_timer.addEventListener(TimerEvent.TIMER, regenPop);
			_timer.start();
			addEventListener(MouseEvent.CLICK, selectBase);
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
			if(_main._selected==null){
				
				_main._selected=this;
				_selected=true;
				selector.visible=true;
				
			} else if(_main._selected==this) {
				
				deselectBase();
				
			} else {
				
				_main.deselectAll();
				
			}
		}
		
		public function deselectBase(){
			_main._selected=null;
			_selected=false;
			selector.visible=false;
		}
	}
}