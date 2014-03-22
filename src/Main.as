package 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;

	/**
	 * ...
	 * @author Emil Ahlqvist
	 */
	public class Main extends Sprite 
	{

		private var gameScene:Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>();
		private var gameScore:int = 0;
		private var gameScoreBoard:TextField = new TextField();
		private var gameTitle:TextField = new TextField();
		public var s:Sprite = new Sprite();
		public var textFormat:TextFormat = new TextFormat();
		private var t:TextField = new TextField();
		private var hitGameScore:int = 0;
		private var xForShip:int = Math.round(Math.random() * 9);
		private var yForShip:int = Math.round(Math.random() * 9);
		private var shipUpOrDown:int = Math.round(Math.random() * 10);




		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, spawnSquares);


			gameScoreBoard.text = "Misses: " + gameScore + "\n" + "Hits: " + hitGameScore;
			gameScoreBoard.border = true;
			gameScoreBoard.x = 600;
			gameScoreBoard.width = 400;
			gameScoreBoard.height = 800;
			addChild(gameScoreBoard);
			
			gameTitle.border = true;
			textFormat.size = 50;	
			gameTitle.text = "BATTLE SHIP";				
			gameTitle.width = 600;
			gameTitle.height = 90;
			addChild(gameTitle);
			gameTitle.setTextFormat(textFormat);
			
			startGame();
			
			
			if (shipUpOrDown > 5) 
			{
				gameScene[xForShip][yForShip].becomeShip();
				gameScene[xForShip + 1][yForShip].becomeShip();
				gameScene[xForShip + 2][yForShip].becomeShip();
			}
			else
			{
				gameScene[xForShip][yForShip].becomeShip();
				gameScene[xForShip][yForShip + 1].becomeShip();
				gameScene[xForShip][yForShip + 2].becomeShip();
			}

		}

		public function clickSquare(m:MouseEvent):void 
		{
			if (Tile(m.target).isItPressed)
			{
				t.text = " ";
			}
			else if (Tile(m.target).shipOrNot) 
			{
				var HitImage:Bitmap = new Tile.HitImage();
				m.target.addChild(HitImage);
				m.target.isItPressed = true;
				hitGameScore ++;
				gameScoreBoard.text = "Misses: " + gameScore + "\n" + "Hits: " + hitGameScore;

			}
			else
			{
				var MissImage:Bitmap = new Tile.MissImage();
				m.target.addChild(MissImage);
				m.target.isItPressed = true;
				gameScore ++;
				gameScoreBoard.text = "Misses: " + gameScore + "\n" + "Hits: " + hitGameScore;
			}


		}

		public function spawnSquares(e:KeyboardEvent):void 
		{

			switch (e.keyCode) 
			{
				case Keyboard.SPACE:


			}

		}

		public function startGame():void 
		{
			for (var i:int = 0; i < 10; i++) 
			{
				var enRad:Vector.<Tile> = new Vector.<Tile>();
				
					for (var j:int = 0; j < 10; j++) 
					{	
						var tileBox:Tile = new Tile();
						addChild(tileBox);
						tileBox.addEventListener(MouseEvent.CLICK, clickSquare);
						enRad.push(tileBox);
						tileBox.x = 10 + i * (50);
						tileBox.y = 100 + j * (50);
					}
				gameScene.push(enRad);
			}
		}

	}

}