package chapterOne;

import entity.Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.tools.Platform;

class ActOne extends FlxState{
    var player:Player;
    var ground:FlxSprite;
    var platform_Group:FlxTypedGroup<FlxSprite>; 

    override public function create():Void   
    {
        super.create();

        player = new Player(100, 100); 
        add(player);

        // showText("Act One Test");
        // ground platforms
		ground = new FlxSprite(0, FlxG.height - 40);
		ground.makeGraphic(FlxG.width, 40, FlxColor.GREEN);
		ground.immovable = true;
		add(ground);

		// Initialize platforms
		createPlatforms();
        
        
    }

    override public function update(elapsed:Float):Void 
    {
        super.update(elapsed);
		FlxG.collide(player, ground);

		FlxG.collide(player, platform_Group);

		if (player.y > FlxG.height + 100)
		{
			player.reset(100, 100);
		}

		if (FlxG.keys.justPressed.R)
		{
			player.reset(100, 100);
		}
        
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

    
    private function createPlatforms():Void {
        platform_Group = new FlxTypedGroup<FlxSprite>();
        add(platform_Group);
        platforms(200,500,100,20);
    }

    /**
     * This function is used to make placeholder platforms
     * @param X This is the horizontal position
     * @param Y This is the vertical position
     * @param width This is the width
     * @param height This is the height
     */
    private function platforms(X:Float, Y:Float, width:Float, height:Float):Void {
        var p = new FlxSprite(X, Y);
        p.makeGraphic(Std.int(width), Std.int(height), FlxColor.GRAY);
        p.immovable = true;
        platform_Group.add(p);
    }
    
}