package src {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import src.events.BaseEvent;
	import src.view.BaseView;
	import src.view.IBaseView;
	import src.view.NullBaseView;
	
	/**
	 * Must currently be built from the .fla fule untill the view is independant from the .fla's library assets
	 * @author Kristian Welsh
	 */
	public class Main extends Sprite {
		private var _baseModels:Vector.<Base> = new Vector.<Base>();
		private var _baseViews:Vector.<BaseView> = new Vector.<BaseView>();
		
		// TODO: load these from an XML file.
		private var _positions:Vector.<Point> = Vector.<Point>([new Point(250, 100), new Point(150, 300), new Point(350, 300)]);
		private var _startingPopulations:Vector.<uint> = Vector.<uint>([10, 20, 30]);
		private var _colours:Vector.<uint> = Vector.<uint>([0xFF0000, 0x00FF00, 0x0000FF]);
		
		public var _selected:IBaseView = NullBaseView.NULL_BASE_VIEW;
		
		public function Main():void {
			if (stage != null) // Stage may be null if .swf file is loded in another .swf file but not added to the stage yet
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initBaseModels();
			initBaseViews();
			addBases();
		}
		
		private function initBaseModels():void {
			for (var i:uint = 0; i < _positions.length; i++)
				_baseModels.push(new Base(_startingPopulations[i]));
		}
		
		private function initBaseViews():void {
			for (var i:uint = 0; i < _baseModels.length; i++)
				_baseViews.push(new BaseView(_positions[i], _colours[i], _baseModels[i], this));
		}
		
		private function addBases():void {
			for (var i:uint = 0; i < _baseViews.length; i++)
				_baseViews[i].addEventListener(MouseEvent.CLICK, selectIfAppropiate);
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