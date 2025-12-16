package state;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouse;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	public var _NewGameButton:FlxButton;

	override public function create():Void
	{
		super.create();
		// var background = new FlxSprite();
		// background.loadGraphic("assets/images/Background.png");
		// add(background);
		mainMenu();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	public function mainMenu()
	{
		// Background
		displayObject("assets/images/menuState/Background.png", 0, 0);
		// The wooden wall in the right
		displayObject("assets/images/menuState/Wood_Wall.png", 360, -20);
		newGameBtn();
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
	/**
	 * New Game Button
	 */
	private function newGameBtn()
	{
		_NewGameButton = new FlxButton(440, -20, onClicked);
		_NewGameButton.loadGraphic("assets/images/menuState/NewGame_Btn.png", false);
		add(_NewGameButton);
	}

	/**
	 * This function is called in newGameBtn()
	 */
	private function onClicked()
	{
		FlxG.switchState(CreditState.new);
	}
}