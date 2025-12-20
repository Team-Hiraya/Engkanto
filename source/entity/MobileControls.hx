package entity;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class MobileControls extends FlxGroup
{
    public var leftPressed:Bool = false;
    public var rightPressed:Bool = false;
    public var jumpPressed:Bool = false;
    public var jumpJustPressed:Bool = false;
    
    // Button sprites
    private var leftBtn:FlxSprite;
    private var rightBtn:FlxSprite;
    private var jumpBtn:FlxSprite;
    
    public function new()
    {
        super();
        
        var size = 80;
        var padding = 20;
        var yPos = FlxG.height - size - padding;
        
        // Create visible buttons
        createButtons(size, padding, yPos);
    }
    
    private function createButtons(size:Int, padding:Int, yPos:Float):Void
    {
        // Left button
        leftBtn = new FlxSprite(padding, yPos);
        leftBtn.makeGraphic(size, size, 0xAAFFFFFF);
        leftBtn.scrollFactor.set(0, 0);
        leftBtn.allowCollisions = 0; // Don't collide
        add(leftBtn);
        
        // Right button
        rightBtn = new FlxSprite(padding + size + 10, yPos);
        rightBtn.makeGraphic(size, size, 0xAAFFFFFF);
        rightBtn.scrollFactor.set(0, 0);
        rightBtn.allowCollisions = 0;
        add(rightBtn);
        
        // Jump button
        jumpBtn = new FlxSprite(FlxG.width - size - padding, yPos);
        jumpBtn.makeGraphic(size, size, 0xAA00FF00);
        jumpBtn.scrollFactor.set(0, 0);
        jumpBtn.allowCollisions = 0;
        add(jumpBtn);
    }
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        
        // Reset states
        leftPressed = false;
        rightPressed = false;
        jumpPressed = false;
        jumpJustPressed = false;
        
        // Check all input
        checkAllInput();
        
        // Update button colors
        updateButtonColors();
    }
    
    private function checkAllInput():Void
    {
        // Check mouse input (works on desktop and mobile browsers)
        if (FlxG.mouse.pressed)
        {
            checkButtonAtPoint(FlxG.mouse.x, FlxG.mouse.y, FlxG.mouse.justPressed);
        }
        
        // Check for touches on mobile
        // In modern HaxeFlixel, use FlxG.touches
        #if (mobile || html5)
        // Simple touch check - works for most cases
        for (touch in FlxG.touches.list)
        {
            if (touch.pressed)
            {
                checkButtonAtPoint(touch.x, touch.y, touch.justPressed);
            }
        }
        #end
    }
    
    private function checkButtonAtPoint(x:Float, y:Float, justPressed:Bool):Void
    {
        // Check left button
        if (x >= leftBtn.x && x <= leftBtn.x + leftBtn.width &&
            y >= leftBtn.y && y <= leftBtn.y + leftBtn.height)
        {
            leftPressed = true;
        }
        // Check right button
        else if (x >= rightBtn.x && x <= rightBtn.x + rightBtn.width &&
                 y >= rightBtn.y && y <= rightBtn.y + rightBtn.height)
        {
            rightPressed = true;
        }
        // Check jump button
        else if (x >= jumpBtn.x && x <= jumpBtn.x + jumpBtn.width &&
                 y >= jumpBtn.y && y <= jumpBtn.y + jumpBtn.height)
        {
            jumpPressed = true;
            if (justPressed) {
                jumpJustPressed = true;
            }
        }
    }
    
    private function updateButtonColors():Void
    {
        leftBtn.color = leftPressed ? FlxColor.GRAY : FlxColor.WHITE;
        rightBtn.color = rightPressed ? FlxColor.GRAY : FlxColor.WHITE;
        jumpBtn.color = jumpPressed ? FlxColor.GRAY : FlxColor.WHITE;
    }
}