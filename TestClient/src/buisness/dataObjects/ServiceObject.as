package buisness.dataObjects
{
	// базовый класс для объекта возвращаемого сервисом 
	public class ServiceObject
	{
		// объект изменен пользователем 
		public var isUserChanged:Boolean=false;
		// объект сохранен сервисом 
		public var isServerCommited:Boolean=true;
		
		
		public function ServiceObject()
		{
		}
	}
}