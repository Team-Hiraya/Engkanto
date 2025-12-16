package;

import flixel.FlxGame;
import lime.tools.Platform;
import openfl.display.Sprite;
import state.MenuState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(640, 360, MenuState));
	}
}
