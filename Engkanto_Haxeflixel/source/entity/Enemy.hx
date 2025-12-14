package entity;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Enemy extends FlxSprite {
    public var moveSpeed:Float = 150;
    public var gravity:Float = 1000;

    public function new(X:Float = 0, Y:Float = 0) {
        super(X,Y);

        // Placeholder graphics
        makeGraphic(120, 180, FlxColor.RED);

        // Physics
        acceleration.y = gravity;
        drag.x = moveSpeed * 10;

        // Collision
        setSize(120,180);
        offset.set(2,1);

        // Max Velocity
        maxVelocity.set(moveSpeed * 1.5, 800);
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

    }

}