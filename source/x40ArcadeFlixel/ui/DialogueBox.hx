package x40ArcadeFlixel.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class DialogueBox extends FlxSpriteGroup {
    public var textDisplay:FlxText;
    public var background:FlxSprite;
    
    public function new(x:Float, y:Float, width:Int = 300, height:Int = 100) {
        super(x, y);
        
        // Create background
        background = new FlxSprite(0, 0);
        background.makeGraphic(width, height, FlxColor.BLACK);
        background.alpha = 0.8;
        add(background);
        
        // Create text
        textDisplay = new FlxText(10, 10, width - 20, "");
        textDisplay.setFormat(null, 16, FlxColor.WHITE, LEFT);
        add(textDisplay);
    }
    
    public function showMessage(message:String, duration:Float = 3.0):Void {
        textDisplay.text = message;
        visible = true;
        
        FlxG.timeScale = 0.5; // Slow down game during dialogue
        
        // Hide after duration
        FlxG.camera.fade(FlxColor.BLACK, duration, false, function() {
            visible = false;
            FlxG.timeScale = 1.0;
        });
    }
}