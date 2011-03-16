package buisness
{
	import buisness.dataObjects.FieldSettings;
	import buisness.dataObjects.PlantInfo;
	import buisness.dataObjects.UserPlantInfo;
	import buisness.events.ServiceEvent;
	
	import utils.AppSettings;
	
	import view.Field;
	import view.Log;

	// сервис для получение списка овощей пользователя
	public class GetUserPlantsInvoker extends BaseService
	{
		//-----------------------------
		public function GetUserPlantsInvoker()
		{
			super("getUserPlants.php");
		}
		//-----------------------------
		public function invoke():void
		{
			Log.instance.writeLog("invoke getCountry");
			
			var postdata:Object = {};
			postdata["sid"] = Services.instance.SID;
			service.send(postdata);
		}
		//--------------------------------------
		public override function onFault():void
		{
			Log.instance.writeLog("fault getCountry");
		}
		
		//--------------------------------------
		public override function onResult(xml:XML):void
		{
			Log.instance.writeLog("result getCountry");
			// возврат полученных объекта 
			var ret:Array=new Array();
			for each(var node:XML in xml.field.children())
			{
				var plantInfo:PlantInfo=FieldSettings.inctance.getPlantInfoByPlantID(Number(node.attribute("plantID")));
				var userPlantUnfo:UserPlantInfo=new UserPlantInfo(plantInfo);
				userPlantUnfo.userPlantID=Number(node.attribute("id"));
				userPlantUnfo.x=Number(node.attribute("x"));
				userPlantUnfo.y=Number(node.attribute("y"));
				userPlantUnfo.gRate=Number(node.attribute("growth_rate"));
				ret.push(userPlantUnfo);
			}
			Services.instance.dispatchEvent(new ServiceEvent(ServiceEvent.USER_PLANTS_RECIEVED,ret));
		}
		//--------------------------------------
	}
}