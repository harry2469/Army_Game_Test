package src {
	import flash.display.MovieClip;
	/** @author Kristian Welsh */
	public class NullBase extends MovieClip implements IBase {
		
		public static const NULL_BASE:NullBase = new NullBase();
		
		public function select():void {
		
		}
		
		public function deselect():void {
		
		}
		
		public function isNull():Boolean {
			return true;
		}
	}
}