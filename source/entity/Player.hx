package entity;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	public var runSpeed:Int = 180;
	public var jumpForce:Float = -320;
	public var mobileControls:MobileControls;
    
	// Jump tracking
	private var isJumping:Bool = false;
	private var wasOnFloor:Bool = false;
    
	public function new(x:Float = 100, y:Float = 100, ?controls:MobileControls = null)
	{
		super(x, y);
		this.mobileControls = controls;
        
		// Simple placeholder (green square)
		makeGraphic(32, 48, 0xFF00FF00);
        
        // Physics
		drag.x = runSpeed * 8;
		acceleration.y = 800;
		maxVelocity.set(runSpeed, 800);
        
		// Collision box
		setSize(24, 40);
		offset.set(4, 4);
    }

	override public function update(elapsed:Float):Void
	{
        super.update(elapsed);
		handleMovement(elapsed);
		checkFloorStatus();
	}

	private function handleMovement(elapsed:Float):Void
	{
		// Get input from mobile controls first
		var left = false;
		var right = false;
		var jumpJust = false;
        
		if (mobileControls != null)
		{
			left = mobileControls.leftPressed;
			right = mobileControls.rightPressed;
			jumpJust = mobileControls.jumpJustPressed;
		}
        
		// Add keyboard input
		left = left || FlxG.keys.anyPressed([LEFT, A]);
		right = right || FlxG.keys.anyPressed([RIGHT, D]);
		jumpJust = jumpJust || FlxG.keys.anyJustPressed([SPACE, Z, UP, W]);
        
		// Move left/right
		if (left && !right)
			velocity.x = -runSpeed;
		else if (right && !left)
			velocity.x = runSpeed;
		else
			velocity.x = 0;
        
		// Handle jumping (only if on floor)
		if (jumpJust && isTouching(FLOOR))
		{
			velocity.y = jumpForce;
			isJumping = true;
		}
        
		// Variable jump height - release jump to fall faster
		var jumpHeld:Bool = FlxG.keys.anyPressed([SPACE, Z, UP, W]);
		if (mobileControls != null && mobileControls.jumpPressed)
		{
			jumpHeld = true;
        }
		if (!jumpHeld && velocity.y < 0 && isJumping)
		{
			velocity.y *= 0.6; // Reduce upward velocity
		}
		// Face direction
		if (velocity.x > 0)
			flipX = false;
		else if (velocity.x < 0)
			flipX = true;
    }

	private function checkFloorStatus():Void
	{
		// Check if we just landed
		var isOnFloor = isTouching(FLOOR);
        
		if (isOnFloor && !wasOnFloor)
		{
			// Just landed
			isJumping = false;
        }
		else if (!isOnFloor && wasOnFloor)
		{
			// Just left the ground
			isJumping = true;
		}
        
		wasOnFloor = isOnFloor;
    }

	// Simple jump check (you can call this from your state)
	public function canJump():Bool
	{
		return isTouching(FLOOR);
	}
}