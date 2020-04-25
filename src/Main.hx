import hxd.App;

class Main extends App {
	var ball:Ball;
	var playerOnePaddle:Paddle;
	var playerTwoPaddle:Paddle;

	override function init() {
		var moveRight:Bool = Math.floor(Math.random() * 2) > 0;
		ball = new Ball(s2d.width / 2, s2d.height / 2, 10, moveRight, 4, s2d);
		playerOnePaddle = new Paddle(Player.Position.ONE, Player.Brain.HUMAN, s2d);
		playerTwoPaddle = new Paddle(Player.Position.TWO, Player.Brain.CPU, s2d);
	}

	override function update(dt:Float) {
		ball.update(dt);
		playerOnePaddle.update(dt);
		playerTwoPaddle.update(dt);
	}

	static function main() {
		new Main();
	}
}
