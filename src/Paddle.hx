import hxd.Key;
import h2d.Tile;
import h2d.Bitmap;
import h2d.Object;

class Paddle extends Object {
	var width:Int = 10;
	var height:Int = 80;
	var speed:Float = 6;
	var bmp:Bitmap;
	var direction:Int = 0;

	public function new(?parent:Object) {
		super(parent);

		x = parent.getScene().width - 120;
		y = parent.getScene().height / 2;
		rotation = Math.PI / 2;

		CreateGraphic(0x00BFFF, width, height);
	}

	public function update(dt:Float) {
		direction = GetDirection();

		move(0, direction * speed);
		bmp.y = y;

		CheckWallCollisions();
	}

	private function GetDirection() {
		var direction = 0;

		if (Key.isDown(Key.UP)) {
			direction = -1;
		}
		if (Key.isDown(Key.DOWN)) {
			direction = 1;
		}
		return direction;
	}

	private function CheckWallCollisions() {
		if (y - height / 2 < 0) {
			y = 0 + height / 2;
		}

		if (y + height / 2 > parent.getScene().height) {
			y = parent.getScene().height - height / 2;
		}
	}

	private function CreateGraphic(color:Int, width:Int, ?height:Int) {
		if (height == null) {
			height = width;
		}

		var tile = Tile.fromColor(color, width, height);
		bmp = new Bitmap(tile, parent);
		bmp.x = x;
		bmp.y = y;
		bmp.tile.dx = -width / 2;
		bmp.tile.dy = -height / 2;
	}
}
