import Player.Position;
import Player.Brain;
import h2d.Tile;
import hxd.Key;
import h2d.Bitmap;
import h2d.Object;

class Paddle extends Object {
	var width:Int = 10;
	var height:Int = 80;
	var speed:Float = 6;
	var bmp:Bitmap;
	var direction:Int = 0;
	var playerPosition:Position;
	var brain:Brain;
	var ball:Object;

	public function new(playerPosition:Position, brain:Brain, ?parent:Object) {
		super(parent);

		this.playerPosition = playerPosition;
		this.brain = brain;
		x = playerPosition == Position.ONE ? parent.getScene().width - 120 : 120;
		y = parent.getScene().height / 2;
		rotation = Math.PI / 2;

		// @warn This will necessitate that the ball is instantiated BEFORE the paddle. Consider another approach.
		ball = parent.getScene().getObjectByName('BALL');

		var color:Int = playerPosition == Position.ONE ? 0x00BFFF : 0xFF1493;
		CreateGraphic(color, width, height);
	}

	public function update(dt:Float) {
		direction = GetDirection();

		move(0, direction * speed);
		bmp.y = y;

		CheckWallCollisions();
	}

	private function GetDirection() {
		var direction = 0;

		if (brain == Brain.CPU && ball != null) {
			var deltaX = Math.abs(ball.x - x);
			if ((ball.y < y + height / 2 - 15 && ball.y > y - height / 2 + 15) || deltaX > (parent.getScene().width / 2 - 120)) {
				direction = 0;
			} else if (ball.y > y) {
				direction = 1;
			} else if (ball.y < y) {
				direction = -1;
			}
		} else {
			switch playerPosition {
				case Position.TWO:
					if (Key.isDown(Key.W)) {
						direction = -1;
					}
					if (Key.isDown(Key.S)) {
						direction = 1;
					}
				default:
					if (Key.isDown(Key.UP)) {
						direction = -1;
					}
					if (Key.isDown(Key.DOWN)) {
						direction = 1;
					}
			}
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
