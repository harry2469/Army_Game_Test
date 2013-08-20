package src.view {
	/** @author Kristian Welsh */
	public interface IBaseView {
		function select():void;
		function deselect():void;
		function get isNull():Boolean;
	}
}