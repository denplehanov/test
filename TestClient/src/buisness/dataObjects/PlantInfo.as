package buisness.dataObjects
{
	import mx.controls.Image;

	// общий вид овоща
	public class PlantInfo extends ServiceObject
	{
		// url изображений по стадиям роста
		public var stage_1_url:String;
		public var stage_2_url:String;
		public var stage_3_url:String;
		public var stage_4_url:String;
		public var stage_5_url:String;

		public var plantID:int=0;
		public var plantName:String="";
		public  var maxGrowVal:int=5;

		// кэш изображений по стадиям роста
		private var _image1:Image;
		private var _image2:Image;
		private var _image3:Image;
		private var _image4:Image;
		private var _image5:Image;
		
		
		// вернуть изображение для стадии роста
		public function getImageByGRate(gRate:int):Image
		{
			var image:Image;
			
			switch(gRate)
			{
				case 1:
					if(_image1==null)
					{
						_image1=new Image();
						_image1.source=stage_1_url;
					}
					image=_image1;
					break;
				case 2:
					if(_image2==null)
					{
						_image2=new Image();
						_image2.source=stage_2_url;
					}
					image=_image2;
					break;
				case 3:
					if(_image3==null)
					{
						_image3=new Image();
						_image3.source=stage_3_url;
					}
					image=_image3;
					break;
				case 4:
					if(_image4==null)
					{
						_image4=new Image();
						_image4.source=stage_4_url;
					}
					image=_image4;
					break;
				case 5:
					if(_image5==null)
					{
						_image5=new Image();
						_image5.source=stage_5_url;
					}
					image=_image5;
					break;
			}
			return image;
		}
		
	}
}