package;

import nme.geom.Rectangle;
import nme.display.Sprite;

class Tile extends Sprite{
	private var area:Rectangle;
	private var top:Tile;
	private var left:Tile;
	private var bottom:Tile;
	private var right:Tile;

	public function new(x, y){
		super();
		var size:Int = 64;
		area = new Rectangle(x,y,size,size);
	}

	public function setNeighbors(topTile, leftTile, bottomTile, rightTile){
		top = topTile;
		left = leftTile;
		bottom = bottomTile;
		right = rightTile;
	}

	public function boundaries(){
		return area;
	}

	public function bound_x():Float{
		return area.x;
	}

	public function bound_y():Float{
		return area.y;
	}

	public function topTile(){
		return top;
	}

	public function leftTile(){
		return left;
	}
	
	public function bottomTile(){
		return bottom;
	}
	
	public function rightTile(){
		return right;
	}

	public function isEmpty():Bool{
		return (numChildren == 0);
	}
}