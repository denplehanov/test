package utils
{
	import mx.controls.Alert;

	// обработчик исключений приложения
	public class ExceptionManager
	{
		public static function processException(e:Error):void
		{
			Alert.show(e.message,"error");
		}
	}
}