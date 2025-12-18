package chapterOne;

import entity.Player;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class ActOne extends FlxState{
    var player:Player;

    override public function create():Void   
    {
        super.create();

        var player = new Player(); 
        add(player);

        showText("Act One Test");

        
        
    }

    override public function update(elapsed:Float):Void 
    {
        super.update(elapsed);
        
    }

    /**
     * This is just a test function to show the text
     * @param message This is a String to what TEXT to display
     */
    private function showText(message:String) {
        var text = new FlxText();
        text.text = message;
        text.color = FlxColor.CYAN;
        text.size = 32;
        text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
        text.screenCenter();
        add(text);
    }
    
}