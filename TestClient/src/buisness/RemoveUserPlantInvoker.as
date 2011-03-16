package buisness
{
	import buisness.dataObjects.FieldSettings;
	import buisness.dataObjects.PlantInfo;
	import buisness.dataObjects.UserPlantInfo;
	import buisness.events.ServiceEvent;
	
	import view.Log;
	
	// сервис для удаления овоща пользователя
	public class RemoveUserPlantInvoker extends BaseService
	{
		//--------------------------------------
		public function RemoveUserPlantInvoker()
		{
			super("userPlantControl.php");
		}
		//--------------------------------------
		public function invoke(userPlantInfo:UserPlantInfo):void
		{
			var postdata:Object = {};
			postdata["action"] = 3;
			postdata["userPlantID"] = userPlantInfo.userPlantID;
			service.request=postdata;
			service.send(postdata);

			Log.instance.writeLog("invoke removeUserPlant");
		}
		
		//--------------------------------------
		public override function onFault():void
		{
			Log.instance.writeLog("fault removeUserPlant");
		}
		
		//--------------------------------------
		public override function onResult(xml:XML):void
		{
			Log.instance.writeLog("result removeUserPlant");
			
			var plantInfo:PlantInfo=FieldSettings.inctance.getPlantInfoByPlantID(Number(xml.attribute("plantID")));
			var userPlantInfo:UserPlantInfo=new UserPlantInfo(plantInfo);
			userPlantInfo.userPlantID=Number(xml.attribute("id"));
			userPlantInfo.x=Number(xml.attribute("x"));
			userPlantInfo.y=Number(xml.attribute("y"));
			userPlantInfo.gRate=Number(xml.attribute("growth_rate"));
			userPlantInfo.isServerCommited=true;
			
			// возврат удаленного объекта 
			Services.instance.dispatchEvent(new ServiceEvent(ServiceEvent.USER_PLANT_REMOVED,userPlantInfo));
		}
		//--------------------------------------
	}
}