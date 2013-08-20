package src {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.events.BaseEvent;
	import src.view.BaseView;
	import src.view.NullBaseView;
	
	/**
	 * Must currently be built from the .fla fule untill the view is independant from the .fla's library assets
	 * @author Kristian Welsh
	 */
	public class Main extends Sprite {
		private var _baseModels:Vector.<Base> = new Vector.<Base>();
		private var _baseViews:Vector.<BaseView> = new Vector.<BaseView>();
		public var _selected:IBaseView = NullBaseView.NULL_BASE_VIEW;
		
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
			_baseModels.push(new Base());
			_baseViews.push(new BaseView(250, 100, _baseModels[_baseModels.length - 1], this));
			_baseModels[_baseModels.length - 1].setView(0xFF0000, _baseViews[_baseViews.length - 1], 50);
			
			_baseModels.push(new Base());
			_baseViews.push(new BaseView(150, 300, _baseModels[_baseModels.length - 1], this));
			_baseModels[_baseModels.length - 1].setView(0x00FF00, _baseViews[_baseViews.length - 1], 50);
			
			_baseModels.push(new Base());
			_baseViews.push(new BaseView(350, 300, _baseModels[_baseModels.length - 1], this));
			_baseModels[_baseModels.length - 1].setView(0x0000FF, _baseViews[_baseViews.length - 1], 50);
		}
		
		private function addBases():void {
			for (var i:uint = 0; i < _baseModels.length; i++) {
				addChild(_baseModels[i] as MovieClip);
				_baseModels[i].addEventListener(BaseEvent.CLICKED, selectIfAppropiate);
				_baseViews[i].addEventListener(MouseEvent.CLICK, selectIfAppropiate);
			}
		}
		
		private function selectIfAppropiate(event:MouseEvent):void {
			if (!_selected.isNull())
				selected = NullBaseView.NULL_BASE_VIEW;
			else
				selected = event.target.parent;
		}
		
		private function set selected(value:IBaseView):void {
			_selected.deselect();
			_selected = value;
			_selected.select();
		}
	}
}