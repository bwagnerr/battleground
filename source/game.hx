package;

import com.eclecticdesignstudio.motion.Actuate;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.display.Tilesheet;
import nme.Assets;
import nme.display.BitmapData;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.geom.Rectangle;
import nme.geom.Point;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.text.TextFormatAlign;
import nme.Lib;
import neko.Sys;

class Game extends Sprite {

	private var window_width:Int;
	private var window_height:Int;
	private var player1:Character;
	private var player2:Character;
	private var keyPressed:Bool = false;

	public function new () {
		super ();
		initialSetup();
		prepareCharacters();
	}

	private function initialSetup():Void{
		window_width = Lib.initWidth;
		window_height = Lib.initHeight;
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN,monitorKeyboard);
	}

	private function gameLoop(event:Event):Void{
		draw();
	}

	private function draw(){
		graphics.clear();
		drawBackground();
		graphics.drawTiles(player1.draw(), player1.currentPosition());
		graphics.drawTiles(player2.draw(), player2.currentPosition());
	}

	private function update(){

	}

	private function drawBackground():Void{
		var background:Background = new Background(null, window_width, window_height);
		graphics.drawTiles(background, background.getTilePositions(), true);
	}

	private function prepareCharacters():Void{
		player1 = new Character('human');
		player2 = new Character(128,128,'skeleton');
	}

	private function monitorKeyboard(event:KeyboardEvent):Void{
		trace(event.keyCode);
		switch(event.keyCode){
			case 38: player1.walkUp();
			case 40: player1.walkDown();
			case 37: player1.walkLeft();
			case 39: player1.walkRight();
			case 87: player2.walkUp();
			case 83: player2.walkDown();
			case 65: player2.walkLeft();
			case 68: player2.walkRight();
		}
	}

	public static function main () {
		Lib.current.addChild(new Game());
	}

}
