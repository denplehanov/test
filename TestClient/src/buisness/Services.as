package buisness
{
	import buisness.dataObjects.PlantInfo;
	import buisness.dataObjects.UserPlantInfo;
	
	import flash.events.EventDispatcher;
	
	import view.Log;
	
	//точка доступа к сервисам приложения
	public class Services extends EventDispatcher
	{
		public static var instance:Services=null;
		 
		//-------------
		private var _addUserPlantInvoker:AddUserPlantInvoker;
		private var _saveUserPlantInvoker:SaveUserPlantInvoker;
		private var _removeUserPlantInvoker:RemoveUserPlantInvoker;
		private var _getPlantsInvoker:GetPlantsInvoker;
		private var _registerUserInvoker:RegisterUserInvoker;
		private var _getUserPlantsInvoker:GetUserPlantsInvoker;
		private var _growUserPlantsInvoker:GrowUserPlantsInvoker;
		

		//-------------
		public function Services()
		{
			instance=this;
			_getPlantsInvoker=new GetPlantsInvoker();
			_registerUserInvoker=new RegisterUserInvoker();
			_addUserPlantInvoker=new AddUserPlantInvoker();
			_saveUserPlantInvoker=new SaveUserPlantInvoker();
			_removeUserPlantInvoker=new RemoveUserPlantInvoker();
			_getUserPlantsInvoker=new GetUserPlantsInvoker();
			_growUserPlantsInvoker=new GrowUserPlantsInvoker();
		}
		
		//-------------
		public function getPlants():void
		{
			_getPlantsInvoker.invoke();
		}
		//-------------
		public function getUserPlants():void
		{
			_getUserPlantsInvoker.invoke();
		}
		//-------------
		public function addUserPlant(userPlantInfo:UserPlantInfo):void
		{
			_addUserPlantInvoker.invoke(userPlantInfo);
		}
		
		//-------------
		public function saveUserPlant(userPlantInfo:UserPlantInfo):void
		{
			_saveUserPlantInvoker.invoke(userPlantInfo);
		}
		//-------------
		public function removeUserPlant(userPlantInfo:UserPlantInfo):void
		{
			_removeUserPlantInvoker.invoke(userPlantInfo);
		}
		//-------------
		public function growUserPlants():void
		{
			_growUserPlantsInvoker.invoke();
		}
		
		//-------------
		public function registerUser(userLogin:String,userPwd:String):void
		{
			_registerUserInvoker.invoke(userLogin,userPwd);
		}
		
		// аналог идентификатора сессии пользователя 
		public function get SID():int
		{
			return _registerUserInvoker.sid; 
		}
		//-------------
	}
}