import h2d.Object;
import h2d.Tile;
import h2d.Bitmap;

class Ball extends Object {
	var speed:Float;
	var spawnTimer:Float;
	var bmp:Bitmap;

	public function new(x:Float, y:Float, size:Int, ?moveRight:Bool = true, ?speed:Float = 1, ?parent:Object) {
		super(parent);
		name = 'BALL';
		this.x = x;
		this.y = y;
		this.speed = speed;
		spawnTimer = 3;
		CreateGraphic(0xFFFFFF, size);

		var moveUp:Bool = Math.floor(Math.random() * 2) > 0;
		ChooseDirection(moveRight, moveUp);
	}

	public function update(dt:Float) {
		if (spawnTimer > 0) {
			spawnTimer -= dt;
			return;
		}

		move(speed, -speed);
		bmp.x = x;
		bmp.y = y;

		CheckWallCollisions();
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

	private function ChooseDirection(moveRight:Bool, moveUp:Bool) {
		var degrees:Float = 0;
		var randomNumber = Math.floor(Math.random() * 45);

		if (moveRight) {
			degrees = randomNumber;
		} else {
			degrees = randomNumber + 135;
		}

		if (!moveUp) {
			degrees = -degrees;
		}

		rotation = degrees * Math.PI / 180;
	}

	private function CheckWallCollisions() {
		var absRotation = Math.abs(rotation);

		if (x > parent.getScene().width && absRotation >= 0 && absRotation <= Math.PI / 4) {
			if (rotation > 0) {
				rotation -= Math.PI;
			} else {
				rotation += Math.PI;
			}

			rotation = -rotation;
		}

		if (x < 0 && absRotation >= 3 * Math.PI / 4 && absRotation <= Math.PI) {
			if (rotation > 0) {
				rotation -= Math.PI;
			} else {
				rotation += Math.PI;
			}

			rotation = -rotation;
		}

		if (y < 0 && rotation > 0) {
			rotation = -rotation;
		}

		if (y > parent.getScene().height && rotation < 0) {
			rotation = -rotation;
		}
	}
}
