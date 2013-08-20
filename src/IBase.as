package src {
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	import src.view.BaseView;
	
	/** @author Kristian Welsh */
	public interface IBase extends IEventDispatcher {
		function setView(colour:uint, view:BaseView, number:int):void;
		function select():void;
		function deselect():void;
		function isNull():Boolean;
	}
}