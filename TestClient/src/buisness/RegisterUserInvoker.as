package buisness
{
	import buisness.events.ServiceEvent;
	
	import flash.events.Event;
	
	import view.Log;
	

	// сервис для авторизации пользователя
	public class RegisterUserInvoker extends BaseService
	{
		// ID сессии
		public var sid:int=0;
		// Имя пользователя
		public var userName:String="";

		//--------------------------------------
		public function RegisterUserInvoker()
		{
			super("registerUser.php");
		}
		
		//--------------------------------------
		public function invoke(userLogin:String,userPWD:String):void
		{
			var postdata:Object = {};
			postdata["login"] = userLogin;
			postdata["pwd"] = userPWD;
			service.send(postdata);
			Log.instance.writeLog("invoke registerUser");
		}
		//--------------------------------------
		public override function onFault():void
		{
			Log.instance.writeLog("fault registerUser");
			
			Services.instance.dispatchEvent(new ServiceEvent(ServiceEvent.LOGIN_FAULT));
		}
		//--------------------------------------
		public override function onResult(xml:XML):void
		{
			Log.instance.writeLog("result registerUser");
			
			sid=Number(xml.attribute("sid"));
			userName=xml.attribute("name");
			
			Services.instance.dispatchEvent(new ServiceEvent(ServiceEvent.LOGIN_SUCCESS));
		}
		//--------------------------------------
	}
}