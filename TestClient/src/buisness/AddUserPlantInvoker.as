package buisness
{
	import buisness.dataObjects.FieldSettings;
	import buisness.dataObjects.PlantInfo;
	import buisness.dataObjects.UserPlantInfo;
	import buisness.events.ServiceEvent;
	import flash.events.Event;
	import view.Log;
	
	// сервис для добавления овоща пользователя 
	//--------------------------------------
	public class AddUserPlantInvoker extends BaseService
	{
		//--------------------------------------
		
		public function AddUserPlantInvoker()
		{
			super("userPlantControl.php");
		}
		
		//--------------------------------------
		public function invoke(userPlantInfo:UserPlantInfo):void
		{
			if(!userPlantInfo.isUserChanged) return;
			
			userPlantInfo.isServerCommited=false;
			var postdata:Object = {};
			postdata["action"] = 1;
			postdata["userID"] = Services.instance.SID;
			postdata["userPlantID"] = userPlantInfo.userPlantID;
			postdata["plantID"] = userPlantInfo.plantInfo.plantID;
			postdata["x"] = userPlantInfo.x;
			postdata["y"] = userPlantInfo.y;
			service.send(postdata);

			Log.instance.writeLog("invoke saveUserPlant");
		}
		
		//--------------------------------------
		public override function onFault():void
		{
			Log.instance.writeLog("fault saveUserPlant");
		}
		
		//--------------------------------------
		public override function onResult(xml:XML):void
		{
			Log.instance.writeLog("result saveUserPlant");
			
			// возврат созданного объекта 
			
			var plantInfo:PlantInfo=FieldSettings.inctance.getPlantInfoByPlantID(Number(xml.attribute("plantID")));
			var userPlantInfo:UserPlantInfo=new UserPlantInfo(plantInfo);
			userPlantInfo.userPlantID=Number(xml.attribute("id"));
			userPlantInfo.x=Number(xml.attribute("x"));
			userPlantInfo.y=Number(xml.attribute("y"));
			userPlantInfo.gRate=Number(xml.attribute("growth_rate"));
			userPlantInfo.isServerCommited=true;
			
			Services.instance.dispatchEvent(new ServiceEvent(ServiceEvent.USER_PLANT_ADDED,userPlantInfo));
		}
		//--------------------------------------
		
	}
}