package;

import flixel.FlxGame;
import flixel.FlxState;
import openfl.display.Sprite;
import state.MenuState; // Add this import

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, MenuState)); // Start with MenuState
	}
}