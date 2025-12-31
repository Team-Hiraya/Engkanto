package;

import flixel.FlxGame;
import flixel.FlxState;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, PlayState)); // Start with MenuState
	}
}