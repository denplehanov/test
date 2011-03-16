package buisness
{
	import flash.events.EventDispatcher;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import utils.AppSettings;
	import utils.ExceptionManager;

	// базовый класс сервиса приложения 
	public class BaseService 
	{
		protected var service:HTTPService;
		
		public function BaseService(methodName:String)
		{
			service=new HTTPService();
			service.url=AppSettings.ServerURL+methodName;
			// получем данные в поддерживаемом формате XML 
			service.resultFormat="e4x";
			service.addEventListener(ResultEvent.RESULT ,onServiceResult);
			service.addEventListener(FaultEvent.FAULT, onServiceFault);
		}
		
		
		// обработчик ошибки вызова 
		private function onServiceFault(e:FaultEvent):void
		{
			onFault();
			ExceptionManager.processException(new Error(e.fault.faultString));
		}
		
		// обработчик успешного вызова 
		private function onServiceResult(e:ResultEvent):void
		{
			if(!(e.result is XML))
			{
				ExceptionManager.processException(new Error("can`t recieve xml document"));
				onFault();
				return;
			}
			
			
			XML.ignoreWhitespace=true;
			var xml:XML=e.result as XML;
			
			// XML содержит информацию об ошибке (обработка на стороне сервера)  
			var errorString:String=xml.attribute("message");
			if(errorString!="")
			{
				ExceptionManager.processException(new Error(errorString));
				onFault();
				return;
			}
			
			onResult(xml);
			
		}
		
		// виртуальные функции для перегрузки в порождаемых классах
		public virtual function onResult(result:XML):void
		{
		}
		public virtual function onFault():void
		{
		}
	}
}