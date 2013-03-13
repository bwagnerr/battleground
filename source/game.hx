package;

import nme.display.Sprite;
import nme.display.Tilesheet;
import nme.Assets;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.text.TextFormatAlign;
import nme.Lib;

class Game extends Sprite {

	private var window_width:Int;
	private var window_height:Int;
	private var map:Map;
	private var keyPressed:Bool = false;

	public function new () {
		super ();
		initialSetup();
		generateMap();
		prepareCharacter();
		generateNPCS();
	}

	private function initialSetup():Void{
		window_width = Lib.initWidth;
		window_height = Lib.initHeight;
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, gameLoop);

	}

	private function gameLoop(event:Event):Void{
		draw();
		update();
	}

	private function draw(){
		graphics.clear();
		map.draw();
	}

	private function update(){

	}

	private function generateMap():Void{
		map = new Map(window_width, window_height);
		addChild(map);
	}


	private function prepareCharacter():Void{
		var player1:Character = new Character(null, 'human', false);
		map.addPlayer(player1);
	}

	private function generateNPCS():Void{
		for(i in 0...10){
			map.addNPC(new Character(null, 'skeleton'));
		}
	}

	public static function main () {
		Lib.current.addChild(new Game());
	}

}
