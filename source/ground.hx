package;

import nme.display.Tilesheet;
import nme.Assets;
import nme.display.BitmapData;
import nme.geom.Rectangle;

class Ground extends Tilesheet{

	private var tileSize:Int;
	public static var grass:Int = 0;

	public function new(source) {
		if(source == null) source = Assets.getBitmapData('images/background.jpg');
		super(source);
		tileSize = source.height;
		addTileRect(new Rectangle(0,0,tileSize,tileSize));
	}

	public function getTileSize():Int{
		return tileSize;
	}

}
