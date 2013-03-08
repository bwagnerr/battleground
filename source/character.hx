package;

import nme.Lib;

class Character{
	private var currentX:Float;
	private var currentY:Float;
	private var originX:Float;
	private var originY:Float;
	private var limitX:Float;
	private var limitY:Float;
	private var currentFacing:Position;
	private var character:CharacterDraw;
	private var race:String;

	public function new(x = 0,y = 0, race = 'human'){
		currentX = x;
		currentY = y;
		originX = x;
		originY = y;
		limitX = Lib.initWidth;
		limitY = Lib.initHeight;

		character = new CharacterDraw(race);
	}

	public function draw():CharacterDraw{
		return character;
	}

	public function getOriginX():Float{
		return originX;
	}

	public function getOriginY():Float{
		return originY;
	}


	private function move_down(){
		if(currentY + character.characterSize()*2 < limitY){
			originY = currentY;
			currentY += character.characterSize();
		}
		return Position.down;
	}

	private function move_up(){
		if(currentY - character.characterSize() >= 0){
			originY = currentY;
			currentY -= character.characterSize();
		}
		return Position.up;
	}

	private function move_left(){
		if(currentX - character.characterSize() >= 0){
			originX = currentX;
			currentX -= character.characterSize();
		}
		return Position.left;
	}

	private function move_right(){
		if(currentX + character.characterSize() < limitX){
			originX = currentX;
			currentX += character.characterSize();
		}
		return Position.right;
	}

	public function spawn(){
		return character.position(currentX,currentY,Position.down);
	}

	public function walk(position:Position):Array<Float>{
		var characterPosition:Position;
		switch(position){
			case up: characterPosition = move_up();
			case down: characterPosition = move_down();
			case left: characterPosition = move_left();
			case right: characterPosition = move_right();
			default: characterPosition = Position.up;
		}
		currentFacing = characterPosition;
		return character.position(currentX,currentY,characterPosition);
	}
}