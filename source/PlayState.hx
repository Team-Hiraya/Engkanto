package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var bg = new FlxSprite();
		bg.frames = FlxAtlasFrames.fromSparrow("assets/images/Practice/Scene_Test.png", "assets/images/Practice/Scene_Test.xml");
		bg.animation.frameName = "Ground0000";
		add(bg);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
