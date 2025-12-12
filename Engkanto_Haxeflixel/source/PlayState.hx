package;

import entity.Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import lime.media.FlashAudioContext;

/**
 * The PlayState class
 * - this is where the main gameplay code goes inside
 */
class PlayState extends FlxState
{
	var ground:FlxSprite;
	var player:Player;

	/*
		The create() method
		- runs once(Intialize game)
	 */
	override public function create()
	{
		super.create();
		// camera
		FlxG.camera.bgColor = FlxColor.BLUE;

		// create player
		player = new Player(100, 100);
		add(player);

		// ground platforms
		ground = new FlxSprite(0, FlxG.height - 40);
		ground.makeGraphic(FlxG.width, 40, FlxColor.GREEN);
		ground.immovable = true;
		add(ground);

		

	}

	/*
		The update(elapsed) method
		- runs every frame (Gameplay loop)
	 */
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, ground);

		FlxG.collide(player, platforms);

		FlxG.camera.follow(player);

		if (player.y > FlxG.height + 100)
		{
			player.reset(100, 100);
		}

		if (FlxG.keys.justPressed.R)
		{
			player.reset(100, 100);
		}
	}

	var platforms:FlxTypedGroup<FlxSprite>;

	private function createPlatforms():Void
	{
		platforms = new FlxTypedGroup<FlxSprite>();
		add(platforms);

		// Platforms
		createPlatform(200, 300, 100, 20);
		createPlatform(400, 250, 100, 20);
		createPlatform(600, 200, 100, 20);
		createPlatform(300, 150, 100, 20);
	}

	private function createPlatform(X:Float, Y:Float, Width:Float, Height:Float):Void
	{
		var platform = new FlxSprite(X, Y);
		platform.makeGraphic(Std.int(Width), Std.int(Height), FlxColor.BROWN);
		platform.immovable = true;
		platforms.add(platform);

	}
}
