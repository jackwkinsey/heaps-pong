import h2d.Object;
import h2d.Tile;
import h2d.Bitmap;

class Ball extends Object {
	var speed:Float;
	var spawnTimer:Float;
	var bmp:Bitmap;

	public function new(x:Float, y:Float, size:Int, ?moveRight:Bool = true, ?speed:Float = 1, ?parent:Object) {
		super(parent);
		this.x = x;
		this.y = y;
		this.speed = speed;
		spawnTimer = 3;
		CreateGraphic(0xFFFFFF, size, parent);

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
	}

	private function CreateGraphic(color:Int, width:Int, ?height:Int, ?parent:Object) {
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

		rotation = degrees * Math.PI / 180;

		if (!moveUp) {
			rotation = -rotation;
		}
	}
}
