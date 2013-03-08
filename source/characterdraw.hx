package;

import nme.display.Tilesheet;
import nme.Assets;
import nme.display.BitmapData;
import nme.geom.Rectangle;


class CharacterDraw extends Tilesheet{

  private var spriteSize:Int = 64;

  public function new(image = 'male') {
    var imagePath:String = 'images/characters/body_'+image+'.png';
    var source:BitmapData = Assets.getBitmapData(imagePath);
    super(source);
    add_base_tiles();
  }

  public function position(x:Float, y:Float, facing:Position):Array<Float>{
    var index:Int = index_by_facing(facing);
    return [x,y,index];
  }

  public function characterSize():Int{
    return spriteSize;
  }

  private function add_base_tiles(){
    addTileRect(new Rectangle(0,0,spriteSize,spriteSize));
    addTileRect(new Rectangle(0,spriteSize,spriteSize,spriteSize));
    addTileRect(new Rectangle(0,spriteSize*2,spriteSize,spriteSize));
    addTileRect(new Rectangle(0,spriteSize*3,spriteSize,spriteSize));
    for(facing in 0...4)
      for(i in 0...8){
        addTileRect(new Rectangle(spriteSize*i,spriteSize*facing,spriteSize,spriteSize));
      }
  }

  private function x_center(x:Float):Float{
    return x-spriteSize/2.0;
  }

  private function y_center(y:Float):Float{
    return y-spriteSize/2.0;
  }

  public function index_by_facing(facing:Position):Int{
    var index:Int;
    switch(facing){
      case up: index = 0;
      case left: index = 1;
      case down: index = 2;
      case right: index = 3;
      case walking_up1: index = 4;
      case walking_up2: index = 5;
      case walking_up3: index = 6;
      case walking_up4: index = 7;
      case walking_up5: index = 8;
      case walking_up6: index = 9;
      case walking_up7: index = 10;
      case walking_up8: index = 11;
      case walking_left1: index = 12;
      case walking_left2: index = 13;
      case walking_left3: index = 14;
      case walking_left4: index = 15;
      case walking_left5: index = 16;
      case walking_left6: index = 17;
      case walking_left7: index = 18;
      case walking_left8: index = 19;
      case walking_down1: index = 20;
      case walking_down2: index = 21;
      case walking_down3: index = 22;
      case walking_down4: index = 23;
      case walking_down5: index = 24;
      case walking_down6: index = 25;
      case walking_down7: index = 26;
      case walking_down8: index = 27;
      case walking_right1: index = 28;
      case walking_right2: index = 29;
      case walking_right3: index = 30;
      case walking_right4: index = 31;
      case walking_right5: index = 32;
      case walking_right6: index = 33;
      case walking_right7: index = 34;
      case walking_right8: index = 35;
    }
    return index;
  }

}
