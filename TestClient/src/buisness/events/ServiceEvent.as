package buisness.events
{
	import flash.events.Event;
	
	// событие сервиса
	public class ServiceEvent extends Event
	{
		public static const LOGIN_SUCCESS:String = "ServiceEvent.LOGIN_SUCCESS";
		public static const LOGIN_FAULT:String = "ServiceEvent.LOGIN_FAULT";
		public static const PLANTS_RECIEVED:String = "ServiceEvent.PLANTS_RECIEVED";
		public static const USER_PLANTS_RECIEVED:String = "ServiceEvent.USER_PLANTS_RECIEVED";
		public static const USER_PLANT_ADDED:String = "ServiceEvent.USER_PLANT_ADDED";
		public static const USER_PLANT_SAVED:String = "ServiceEvent.USER_PLANT_SAVED";
		public static const USER_PLANT_REMOVED:String = "ServiceEvent.USER_PLANT_REMOVED";
		public static const USER_PLANTS_GROWED:String = "ServiceEvent.USER_PLANTS_GROWED";
		
		// передаваемые данные
		public var eventData:Object;

		
		public function ServiceEvent(type:String, eventData:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventData=eventData;
			super(type, bubbles, cancelable);
		}
	}
}