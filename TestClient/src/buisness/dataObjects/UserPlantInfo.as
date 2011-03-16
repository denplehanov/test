package buisness.dataObjects
{
	// данные овоща пользователя
	public class UserPlantInfo extends ServiceObject
	{
		public var userPlantID:int=0;
		public var plantInfo:PlantInfo=null;

		public var gRate:int=1;
		public var x:int=1;
		public var y:int=1;
		
		public function UserPlantInfo(plantInfo:PlantInfo)
		{
			this.plantInfo=plantInfo;
		}
		
	}
}