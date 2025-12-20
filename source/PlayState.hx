package;

import entity.MobileControls;
import entity.Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var player:Player;
	var ground:FlxSprite;
	var controls:MobileControls;
    
	override public function create():Void
	{
		super.create();

		// Create mobile controls
		controls = new MobileControls();
		add(controls);

		// Create player with controls
		player = new Player(100, 100, controls);
		add(player);
        
		// Create ground
		ground = new FlxSprite(0, FlxG.height - 50);
		ground.makeGraphic(FlxG.width, 50, FlxColor.GREEN);
		ground.immovable = true;
		add(ground);
	}
    
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		// Simple collision
		FlxG.collide(player, ground);
        
		// Reset if player falls
		if (player.y > FlxG.height + 100)
			player.setPosition(100, 100);
        
		// Reset with R key
		if (FlxG.keys.justPressed.R)
			player.setPosition(100, 100);
	}
}