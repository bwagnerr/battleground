package;

import nme.Lib;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.TimerEvent;
import haxe.Timer;

class Character extends Sprite{
	private var tile:Tile;
	private var character:CharacterDraw;
	private var race:String;
	private var isNPC:Bool;

	public function new(tile:Tile, race = 'human', npc = true){
		super();
		this.race = race;

		isNPC = npc;
		if(isNPC) prepareNPC();
			
		character = new CharacterDraw(race);
	}

	public function move(new_tile:Tile){
		if(new_tile != null && new_tile.isEmpty()){
			tile = new_tile;
			tile.addChild(this);
		}
	}

	public function draw(){
		graphics.clear();
		character.drawTiles(graphics, character.position(tile.bound_x(), tile.bound_y()));
	}

	public function walkDown(){
		move(tile.bottomTile());
		character.changeFacing(Position.down);
	}

	public function walkUp(){
		move(tile.topTile());
		character.changeFacing(Position.up);
	}

	public function walkLeft(){
		move(tile.leftTile());
		character.changeFacing(Position.left);
	}

	public function walkRight(){
		move(tile.rightTile());
		character.changeFacing(Position.right);
	}

	public function characterSprite(){
		return character;
	}

	public function moveRandomly():Void{
		var random:Int = Std.random(4);
		switch(random){
			case 0: walkUp();
			case 1: walkLeft();
			case 2: walkDown();
			case 3: walkRight();
		}
	}

	private function prepareNPC(){
		trace('preparing NPC of race '+race);
		var timer:Timer = new Timer(1000);
		timer.run = moveRandomly;
	}

}