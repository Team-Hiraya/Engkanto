package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Butterfly extends FlxSprite
{
    public function new(x:Float, y:Float) 
    {
        super(x,y);

        frames = FlxAtlasFrames.fromSparrow(
		"assets/images/Despair.png", "assets/images/Despair.xml"
        );

		// (name, name of sprite frame, frames per second, loop)
		animation.addByPrefix("butterfly", "Despair", 30, true);
        animation.play("butterfly");
        
    }
}