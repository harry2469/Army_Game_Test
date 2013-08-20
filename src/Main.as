package src {
	import flash.events.MouseEvent;
	import src.events.BaseEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import src.events.BaseEvent;
	
	/**
	 * Must currently be built from the .fla fule untill the view is independant from the .fla's library assets
	 * @author Kristian Welsh
	 */
	public class Main extends Sprite {
		private var _bases:Vector.<IBase> = new Vector.<IBase>();
		public var _selected:IBase = NullBase.NULL_BASE;
		
		public function Main():void {
			if (stage != null) // Stage may be null if .swf file is loded in another .swf file but not added to the stage yet
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initVars();
			addBases();
		}
		
		private function initVars():void {
			_bases.push(new RedBase(250, 100, 50, this));
			_bases.push(new GreenBase(150, 300, 50, this));
			_bases.push(new BlueBase(350, 300, 50, this));
		}
		
		private function addBases():void {
			for (var i:uint = 0; i < _bases.length; i++) {
				addChild(_bases[i] as MovieClip);
				_bases[i].addEventListener(BaseEvent.CLICKED, selectIfAppropiate);
			}
		}
		
		private function selectIfAppropiate(event:BaseEvent):void {
			if (!_selected.isNull())
				selected = NullBase.NULL_BASE;
			else
				selected = event.base;
		}
		
		private function set selected(value:IBase):void {
			_selected.deselect();
			_selected = value;
			_selected.select();
		}
	}
}