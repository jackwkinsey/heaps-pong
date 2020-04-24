import h2d.Scene;
import h2d.Tile;
import h2d.Bitmap;

class Ball {
	var s2d:Scene;
	var x:Float;
	var y:Float;
	var speed:Float;
	var spawnTimer:Float;
	var bmp:Bitmap;

	public function new(x:Float, y:Float, size:Int, ?speed:Float = 1, s2d:Scene) {
		this.x = x;
		this.y = y;
		this.speed = speed;
		this.s2d = s2d;
		this.CreateGraphic(0xFFFFFF, size);
		this.spawnTimer = 3;
	}

	public function update(dt:Float) {
		if (spawnTimer > 0) {
			spawnTimer -= dt;
			return;
		}
	}

	private function CreateGraphic(color:Int, width:Int, ?height:Int) {
		if (height == null) {
			height = width;
		}

		var tile = Tile.fromColor(color, width, height);
		bmp = new Bitmap(tile, this.s2d);
		bmp.x = this.x;
		bmp.y = this.y;
		bmp.tile.dx = -width / 2;
		bmp.tile.dy = -height / 2;
	}
}
