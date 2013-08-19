package src {
	import flash.events.IEventDispatcher;
	
	/** @author Kristian Welsh */
	public interface IBase extends IEventDispatcher {
		function select():void;
		function deselect():void;
		function isNull():Boolean;
	}
}