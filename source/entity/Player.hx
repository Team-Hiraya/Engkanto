package entity;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

class Player extends FlxSprite {
    // Movement Properties
    public var moveSpeed:Float = 150;
    public var jumpPower:Float = 250;
    public var gravity:Float = 1000;

    // Tracker
    public var canJump:Bool = true;
    public var isOnGround:Bool = false;
    
    // Constructor - runs when creating a new Player
    public function new(X:Float = 0, Y:Float = 0) {
        super(X, Y);

        // Raya Placeholder
		loadGraphic("assets/images/placeholder_Raya_Fixed.png", false, 120, 180);

        // Physics
        acceleration.y = gravity;
        drag.x = moveSpeed * 10;

        // Collision
        setSize(120,180);
        offset.set(2,1);

        // Max Velocity
        maxVelocity.set(moveSpeed * 1.5, 800);
    }

    // Update runs every frame
    override public function update(elapsed:Float) {
        super.update(elapsed);

        acceleration.x = 0;
        
        movement();

        jump();

        isOnGround = isTouching(FLOOR);

    }

	/**
	 * MOVEMENT METHOD /
	 * Movement of the player
	 */
    private function movement():Void {
        var left = FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A;
        var right = FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D;

        // Move Left
        if (left && !right) {
            acceleration.x = -moveSpeed * 10;
        }
        // Move Right
        else if (right && !left) {
            acceleration.x = moveSpeed * 10;
        }
        else {
            velocity.x *= 0.9;
        }
    }

	/**
	 * JUMP METHOD /
	 * Jumping Ability of the player
	 */
    private function jump() {
        var jumpPressed = FlxG.keys.pressed.UP || FlxG.keys.pressed.W || FlxG.keys.pressed.SPACE;

        canJump = isOnGround;

        if (jumpPressed && canJump) {
            velocity.y = -jumpPower;
        }
        if (velocity.y < -150 && !FlxG.keys.pressed.UP && !FlxG.keys.pressed.W && !FlxG.keys.pressed.SPACE) {
            velocity.y = -150;
        }
    }

	/**
	 * RESET METHOD /
	 * Resets the player overall /
	 * param : (X:Float, Y:Float) / Sets the player reset position
	 */
    override public function reset(X:Float, Y:Float):Void {
        setPosition(X,Y);
        velocity.set(0,0);
        canJump = true;
        isOnGround = false;
    }

}