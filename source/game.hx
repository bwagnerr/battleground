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
import haxe.FastList;

class Game extends Sprite {

	private var window_width:Int;
	private var window_height:Int;
	private var map:Map;
	private var keyPressed:Bool = false;
	private var player:Character;
	private var npcs:FastList<Character>;

	public function new () {
		super ();
		npcs = new FastList<Character>();
		initialSetup();
		generateMap();
		prepareCharacter();
		generateNPCS();
		map.draw();
		addChild(map);
		attachEvents();

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
	
		for(key in npcs)
		{

			key.draw();

		}


		player.draw();

	}

	private function update(){

	}

	private function generateMap():Void{
		map = new Map(window_width, window_height);
		
	}

	public function addPlayer(new_player:Character){
		player = new_player;
		var new_position:Tile = map.mapGridRandom();
		player.move(new_position);
	}

	public function addNPC(npc:Character){
		var new_position:Tile = map.mapGridRandom();
		npc.move(new_position);
		npcs.add(npc);
	}


	private function prepareCharacter():Void{
		var player1:Character = new Character(null, 'human', false);
		addPlayer(player1);
	}

	private function generateNPCS():Void{
		for(i in 0...10){
			addNPC(new Character(null, 'skeleton'));
		}
	}

	public static function main () {
		Lib.current.addChild(new Game());
	}

		private function attachEvents(){
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN,monitorKeyboard);
	}

	private function monitorKeyboard(event:KeyboardEvent):Void{
		switch(event.keyCode){
			case 38: player.walkUp();
			case 40: player.walkDown();
			case 37: player.walkLeft();
			case 39: player.walkRight();
			case 87: player.walkUp();
			case 83: player.walkDown();
			case 65: player.walkLeft();
			case 68: player.walkRight();
		}
	}

}
