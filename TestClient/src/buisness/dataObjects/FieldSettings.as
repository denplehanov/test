package buisness.dataObjects
{
	// общие даные приложения
	public class FieldSettings extends ServiceObject
	{
		public static var inctance:FieldSettings; 
		
		// url фона
		public var backImageSrc:String; 
		// массив возможных видов овощей
		public var plantDefList:Array=new Array();

		
		public function FieldSettings()
		{
			super();
			inctance=this;
		}
		
		// вернуть вид овоща по ID 
		public function getPlantInfoByPlantID(id:int):PlantInfo
		{
			var i:int=plantDefList.length;
			while(i--)
			{
				if(plantDefList[i].plantID==id)
					return plantDefList[i];
			}
			
			return null;
		}
	}
}