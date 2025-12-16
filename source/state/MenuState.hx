package state;

import flixel.FlxSprite;
import flixel.FlxState;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		// var background = new FlxSprite();
		// background.loadGraphic("assets/images/Background.png");
		// add(background);
		displayObject("assets/images/menuState/Background.png", 0, 0);
		displayObject("assets/images/menuState/Wood_Wall.png", 360, -20);
		displayObject("assets/images/menuState/NewGame_Btn.png", 460, -20);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	/**
	 * Displays the object
	 * @param location location of the image (String)
	 * @param x horizontal position
	 * @param y vertical position
	 */
	private function displayObject(location:String, x:Int, y:Int)
	{
		var object = new FlxSprite();
		object.loadGraphic(location);
		object.x = x;
		object.y = y;
		add(object);
	}
}