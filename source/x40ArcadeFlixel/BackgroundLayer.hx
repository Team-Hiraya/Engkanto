package x40ArcadeFlixel;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BackgroundLayer extends FlxSprite
{
    public function new(x:Float, y:Float, propName:String)
    {
        super(x, y);

        frames = FlxAtlasFrames.fromSparrow("assets/images/Practice/Scene_Test.png", "assets/images/Practice/Scene_Test.xml");
        animation.frameName = propName;

    }
}