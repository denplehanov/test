package buisness
{
	import buisness.dataObjects.FieldSettings;
	import buisness.dataObjects.PlantInfo;
	import buisness.events.ServiceEvent;
	
	import utils.AppSettings;
	
	import view.Log;

	// сервис для получение списка возможных овощей 
	public class GetPlantsInvoker extends BaseService
	{
		//-----------------------------
		public function GetPlantsInvoker()
		{
			super("getPlants.php");
		}
		//-----------------------------
		public function invoke():void
		{
			Log.instance.writeLog("invoke getPlants");
			service.send();
		}
		
		//--------------------------------------
		public override function onFault():void
		{
			Log.instance.writeLog("fault getPlants");
		}
		
		//--------------------------------------
		public override function onResult(xml:XML):void
		{
			Log.instance.writeLog("result getPlants");

			// возврат полученных объекта 
			var countrySettings:FieldSettings=new FieldSettings();
			var resourceRoot:String=xml.child("back").attribute("path")+"/";
			countrySettings.backImageSrc=AppSettings.ServerURL+resourceRoot+xml.child("back").attribute("image");

			for each(var node:XML in xml.children())
			{
				switch(node.name().toString().toLowerCase())
				{
					case "plant":
						var plantInfo:PlantInfo=new PlantInfo();
						plantInfo.plantID=Number(node.attribute("id"));
						plantInfo.plantName=node.attribute("name");
						plantInfo.stage_1_url=AppSettings.ServerURL+resourceRoot+plantInfo.plantName+"/"+node.attribute("image_1");
						plantInfo.stage_2_url=AppSettings.ServerURL+resourceRoot+plantInfo.plantName+"/"+node.attribute("image_2");
						plantInfo.stage_3_url=AppSettings.ServerURL+resourceRoot+plantInfo.plantName+"/"+node.attribute("image_3");
						plantInfo.stage_4_url=AppSettings.ServerURL+resourceRoot+plantInfo.plantName+"/"+node.attribute("image_4");
						plantInfo.stage_5_url=AppSettings.ServerURL+resourceRoot+plantInfo.plantName+"/"+node.attribute("image_5");
						countrySettings.plantDefList.push(plantInfo);
						break;
				}
			}

			Services.instance.dispatchEvent(new ServiceEvent(ServiceEvent.PLANTS_RECIEVED,countrySettings));
		}
		//--------------------------------------
	}
}