import hxd.res.DefaultFont;
import h2d.Font;
import h2d.Text;
import hxd.App;
import Ball;

class Main extends App {
	var tf:Text;
	var ball:Ball;

	override function init() {
		var font:Font = DefaultFont.get();
		tf = new Text(font);
		tf.text = 'Hello, World!';
		tf.textAlign = Center;
		tf.x = s2d.width / 2;
		tf.y = 50;

		s2d.addChild(tf);

		// @todo left and right direction should be based on which player last scored; only pick random direction when score is 0-0.
		var moveRight:Bool = Math.floor(Math.random() * 2) > 0;
		this.ball = new Ball(s2d.width / 2, s2d.height / 2, 10, moveRight, 4, s2d);
	}

	override function update(dt:Float) {
		ball.update(dt);
	}

	static function main() {
		new Main();
	}
}
