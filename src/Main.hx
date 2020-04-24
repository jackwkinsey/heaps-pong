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

		this.ball = new Ball(s2d.width / 2, s2d.height / 2, 10, s2d);
	}

	override function update(dt:Float) {
		ball.update(dt);
	}

	static function main() {
		new Main();
	}
}
