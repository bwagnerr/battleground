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
	private var character:Character;
	private var keyPressed:Bool = false;

	public function new () {
		super ();
		initialSetup();
		prepareCharacter();
	}

	private function initialSetup():Void{
		window_width = Lib.initWidth;
		window_height = Lib.initHeight;
		drawBackground();
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN,monitorKeyboard);
	}

	private function drawBackground():Void{
		var background:Background = new Background(null, window_width, window_height);
		graphics.drawTiles(background, background.getTilePositions(), true, Tilesheet.TILE_ALPHA);
	}

	private function prepareCharacter():Void{
		character = new Character('human');
		graphics.drawTiles(character.draw(), character.spawn());
		graphics.drawTiles(character.draw(), [0,0,9]);

	}

	private function monitorKeyboard(event:KeyboardEvent):Void{
		keyPressed = false;
		if(keyPressed)
			return;
		switch(event.keyCode){
			case 38: drawWalk(Position.up);
			case 40: drawWalk(Position.down);
			case 37: drawWalk(Position.left);
			case 39: drawWalk(Position.right);
		}
	}

	private function drawWalk(position:Position):Void{
		keyPressed = true;
		var finalPosition:Array<Float> = character.walk(position);
		var draw:CharacterDraw = character.draw();
		graphics.clear();
		drawBackground();
		if(position == Position.left){
			graphics.drawTiles(draw, [finalPosition[0]+64, finalPosition[1], draw.index_by_facing(Position.walking_left1)]);
			while(Std.random(10000000) % 10000000 != 0) {};
			trace('got past here');
			array.push
			graphics.drawTiles(draw, [finalPosition[0]+56, finalPosition[1], draw.index_by_facing(Position.walking_left2)]);
			graphics.drawTiles(draw, [finalPosition[0]+48, finalPosition[1], draw.index_by_facing(Position.walking_left3)]);
			graphics.drawTiles(draw, [finalPosition[0]+40, finalPosition[1], draw.index_by_facing(Position.walking_left4)]);
			graphics.drawTiles(draw, [finalPosition[0]+32, finalPosition[1], draw.index_by_facing(Position.walking_left5)]);
			graphics.drawTiles(draw, [finalPosition[0]+24, finalPosition[1], draw.index_by_facing(Position.walking_left6)]);
			graphics.drawTiles(draw, [finalPosition[0]+16, finalPosition[1], draw.index_by_facing(Position.walking_left7)]);
			graphics.drawTiles(draw, [finalPosition[0]+8, finalPosition[1], draw.index_by_facing(Position.walking_left8)]);
		}else if(position == Position.right){
			graphics.drawTiles(draw, [finalPosition[0]-56, finalPosition[1], draw.index_by_facing(Position.walking_right1)]);
			graphics.drawTiles(draw, [finalPosition[0]-48, finalPosition[1], draw.index_by_facing(Position.walking_right2)]);
			graphics.drawTiles(draw, [finalPosition[0]-40, finalPosition[1], draw.index_by_facing(Position.walking_right3)]);
			graphics.drawTiles(draw, [finalPosition[0]-32, finalPosition[1], draw.index_by_facing(Position.walking_right4)]);
			graphics.drawTiles(draw, [finalPosition[0]-24, finalPosition[1], draw.index_by_facing(Position.walking_right5)]);
			graphics.drawTiles(draw, [finalPosition[0]-16, finalPosition[1], draw.index_by_facing(Position.walking_right6)]);
			graphics.drawTiles(draw, [finalPosition[0]-8, finalPosition[1], draw.index_by_facing(Position.walking_right7)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1], draw.index_by_facing(Position.walking_right8)]);
		}else if(position == Position.up){
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 56, draw.index_by_facing(Position.walking_up1)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 48, draw.index_by_facing(Position.walking_up2)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 40, draw.index_by_facing(Position.walking_up3)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 32, draw.index_by_facing(Position.walking_up4)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 24, draw.index_by_facing(Position.walking_up5)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 16, draw.index_by_facing(Position.walking_up6)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] + 8,  draw.index_by_facing(Position.walking_up7)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1],      draw.index_by_facing(Position.walking_up8)]);
		}else if(position == Position.down){
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 56, draw.index_by_facing(Position.walking_down1)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 48, draw.index_by_facing(Position.walking_down2)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 40, draw.index_by_facing(Position.walking_down3)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 32, draw.index_by_facing(Position.walking_down4)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 24, draw.index_by_facing(Position.walking_down5)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 16, draw.index_by_facing(Position.walking_down6)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1] - 8, draw.index_by_facing(Position.walking_down7)]);
			graphics.drawTiles(draw, [finalPosition[0], finalPosition[1],  draw.index_by_facing(Position.walking_down8)]);
		}
		graphics.clear();
		drawBackground();
		graphics.drawTiles(character.draw(), finalPosition);
		keyPressed = false;
	}

	public static function main () {
		Lib.current.addChild(new Game());
	}

}
