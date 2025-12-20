package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		// Title
		var title = new FlxText(0, 50, FlxG.width, "ENGKANTO");
		title.setFormat(null, 32, FlxColor.CYAN, CENTER, SHADOW, FlxColor.BLUE);
		title.screenCenter(X);
		add(title);

		// Instructions for desktop
		var instructions = new FlxText(0, 120, FlxG.width, "Press ENTER to Start");
		instructions.setFormat(null, 24, FlxColor.WHITE, CENTER);
		instructions.screenCenter(X);
		add(instructions);

		// Mobile touch instruction
		var mobileText = new FlxText(0, 160, FlxG.width, "Or click/tap anywhere to start");
		mobileText.setFormat(null, 20, FlxColor.YELLOW, CENTER);
		mobileText.screenCenter(X);
		add(mobileText);

		// Controls info
		var controls = new FlxText(0, 220, FlxG.width, "Controls:\n" + "Desktop: Arrow Keys + Space\n" + "Mobile: Use on-screen buttons");
		controls.setFormat(null, 18, FlxColor.LIME, CENTER);
		controls.screenCenter(X);
		add(controls);

		// Credits
		var credits = new FlxText(0, FlxG.height - 40, FlxG.width, "Press ESC to Quit");
		credits.setFormat(null, 16, FlxColor.GRAY, CENTER);
		credits.screenCenter(X);
		add(credits);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		// Start game with Enter
		if (FlxG.keys.justPressed.ENTER)
		{
			startGame();
		}
        
		// Check for any click/tap anywhere
		if (FlxG.mouse.justPressed)
		{
			startGame();
		}
        
		// Quit with Escape
		if (FlxG.keys.justPressed.ESCAPE)
		{
			// Use Sys.exit() instead of FlxG.exit()
			#if sys
			Sys.exit(0);
			#elseif js
			// For HTML5, you can't really "exit"
			// Just show a message or redirect
			js.Browser.window.alert("Game closed");
			#end
		}
	}

	private function startGame():Void
	{
		FlxG.switchState(TestState.new);
	}
}