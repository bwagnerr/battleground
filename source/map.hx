package;

import nme.display.Sprite;
import nme.geom.Point;
import nme.Lib;

class Map extends Sprite{

	private var tilePositions:Array<Float>;
	private var mapGrid:Array<Array<Tile>>;
	private var gridColumns:Int;
	private var gridRows:Int;
	private var ground:Ground;
	private var gridSize:Int;
	

	public function new(stageWidth:Int, stageHeight:Int){
		super();



		gridSize = 64;
		gridRows = Math.floor(Lib.initWidth / gridSize);
		gridColumns = Math.floor(Lib.initHeight / gridSize);

		generateTerrainData();
		generateGrid();
	}

	public function draw(){
		graphics.clear();
		drawTerrain();
	}
	
	public function mapGridRandom():Tile{
		var tile:Tile = null;
		while(tile == null){
			var candidate:Tile = mapGrid[Std.random(gridRows)][Std.random(gridColumns)];
			if(candidate.isEmpty())
				tile = candidate; 
		}
		return tile;
	}

	public function drawTerrain(){
		graphics.drawTiles(ground,tilePositions);
	}

	private function generateTerrainData(){

		ground = new Ground(null);

		tilePositions = new Array<Float>();

		for(i in 0...gridRows){
			for(j in 0...gridColumns){
				var x:Float = i*ground.getTileSize();
				var y:Float = j*ground.getTileSize();
				tilePositions.push(x);
				tilePositions.push(y);
				tilePositions.push(Ground.grass);
			}
		}
		draw();
	}

	private function generateGrid(){

		mapGrid = new Array<Array<Tile>>();

		for(i in 0...gridRows){
			mapGrid[i]= new Array<Tile>();
			for(j in 0...gridColumns){
				var tile:Tile = new Tile(i*gridSize, j*gridSize);
				mapGrid[i][j] = tile;
				addChild(tile);
			}
		}

		for(i in 0...gridRows){
			for(j in 0...gridColumns){
				var top:Tile;
				var left:Tile;
				var bottom:Tile;
				var right:Tile;

				if(i == 0) left = null;
				else left = mapGrid[i-1][j];
				
				if(j == 0) top = null;
				else top = mapGrid[i][j-1];

				if(i < gridRows-1) right = mapGrid[i+1][j];
				else right = null;
				
				if(j < gridColumns) bottom = mapGrid[i][j+1];
				else bottom = null;
				

				mapGrid[i][j].setNeighbors(top, left, bottom, right);
			}
		}
	}



}