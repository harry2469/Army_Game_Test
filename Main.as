package{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	public class Main extends MovieClip{
		private var _bases:Array;
		public var _selected:Base;
		public function Main():void{
			initVars();
			addBases();
		}
		private function initVars():void{
			var _base1:Base = new RedBase(250,100,50,this);
			var _base2:Base = new GreenBase(150,300,50,this);
			var _base3:Base = new BlueBase(350,300,50,this);
			_bases=[_base1,_base2,_base3];
		}
		private function addBases():void{
			for (var i:uint=0; i<_bases.length; i++){
				addChild(_bases[i]);
			}
		}
		public function deselectAll():void{
			for(var i:uint=0; i<_bases.length; i++){
				_bases[i].deselectBase();
			}
		}
	}
}