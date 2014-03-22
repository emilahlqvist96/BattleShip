package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Emil Ahlqvist
	 */
	public class Tile extends Sprite
	{

		[Embed(source="vatten.png")]
		public static var WaterImage:Class;

		[Embed(source="miss.png")]
		public static var MissImage:Class;

		[Embed(source="hit.png")]
		public static var HitImage:Class;

		public var shipOrNot:Boolean = false;
		public var isItPressed:Boolean = false;

		public function Tile() 
		{
			var waterBox:Bitmap = new WaterImage();
			this.addChild(waterBox);
		}

		public function becomeShip():void 
		{
			shipOrNot = true;
		}
	}
}