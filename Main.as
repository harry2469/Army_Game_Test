package{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	public class Main extends MovieClip{
		private var _base1:Base;
		private var _base2:Base;
		private var _base3:Base;
		public function Main():void{
			_base1 = new RedBase(250,100,50);
			_base2 = new BlueBase(150,300,50);
			_base3 = new GreenBase(350,300,50);
			stage.addChild(_base1);
			stage.addChild(_base2);
			stage.addChild(_base3);
		}
	}
}