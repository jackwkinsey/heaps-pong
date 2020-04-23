import hxd.res.DefaultFont;
import h2d.Font;
import h2d.Text;
import hxd.App;

class Main extends App {
	var tf:Text;

	override function init() {
		var font:Font = DefaultFont.get();
		tf = new Text(font);
		tf.text = 'Hello, World!';
		tf.textAlign = Center;
		tf.x = s2d.width / 2;
		tf.y = 50;

		s2d.addChild(tf);
	}

	static function main() {
		new Main();
	}
}
