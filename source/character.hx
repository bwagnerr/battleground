package;

import nme.Lib;

class Character{
	private var currentX:Float;
	private var currentY:Float;
	private var limitX:Float;
	private var limitY:Float;
	private var character:CharacterDraw;
	private var race:String;

	public function new(x = 0,y = 0, race = 'human'){
		currentX = x;
		currentY = y;
		limitX = Lib.initWidth;
		limitY = Lib.initHeight;

		character = new CharacterDraw(race);
	}

	public function draw():CharacterDraw{
		return character;
	}

	public function walkDown(){
		if(currentY + character.characterSize()*2 < limitY){
			currentY += character.characterSize();
		}
		character.changeFacing(Position.down);
	}

	public function walkUp(){
		if(currentY - character.characterSize() >= 0){
			currentY -= character.characterSize();
		}
		character.changeFacing(Position.up);
	}

	public function walkLeft(){
		if(currentX - character.characterSize() >= 0){
			currentX -= character.characterSize();
		}
		character.changeFacing(Position.left);
	}

	public function walkRight(){
		if(currentX + character.characterSize() < limitX){
			currentX += character.characterSize();
		}
		character.changeFacing(Position.right);
	}

	public function currentPosition(){
		return character.position(currentX,currentY);
	}


}