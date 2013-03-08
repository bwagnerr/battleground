package;

import nme.display.Tilesheet;
import nme.Assets;
import nme.display.BitmapData;
import nme.geom.Rectangle;

class Background extends Tilesheet{

	private var backgroundSize:Int;
	private var backgroundRows:Int;
	private var backgroundColumns:Int;
	private var tilePositions:Array<Float>;

	public function new(source, window_width, window_height) {
		if(source == null) source = Assets.getBitmapData('images/background.jpg');
		super(source);
		backgroundSize = source.height;
		backgroundRows = Math.ceil(window_width / backgroundSize);
		backgroundColumns = Math.ceil(window_height / backgroundSize);
		addTileRect(new Rectangle(0,0,backgroundSize,backgroundSize));
		tilePositions = [];
		for(i in 0...backgroundRows){
			for(j in 0...backgroundColumns){
				var x:Float = i*backgroundSize;
				var y:Float = j*backgroundSize;
				tilePositions.push(x);
				tilePositions.push(y);
				tilePositions.push(0);
				tilePositions.push(0.2);
			}
		}
	}

	public function getTilePositions(){
		return tilePositions;
	}

}
