package com.TeamHiraya.Engkanto.Entities;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
//import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class Player {
	// Class Variables
	private float x, y;
	private float width, height;
	private float speed;
	// Raya Jumping
	private float yVelocity = 0;
	private float gravity = -800;
	private float jumpVelocity = 500;
	boolean onGround = true;
	
	private Texture texture;
//	private ShapeRenderer shapeRenderer;
	// temporary variable
//	private float groundHeight;
	
	/**
	 * ======= RAYA =======
	 * @param texturePath the starting x (horizontal) position ng player
	 * @param startX the starting x (horizontal) position ng player
	 * @param startY the starting y (vertical) position ng player
	 * - This is temporary since wla pang asset yung player
	 * @param width yung width ng placeholder
	 * @param height yung height ng placeholder
	 * @param speed gaano kabilis gumalaw yung player (in pixels per second)
	 * */
	public Player(String texturePath, float startX, float startY, float width, float height, float speed) {
		// The parameters of Player
		texture = new Texture(texturePath);
		this.x = startX;
		this.y = startY;
		this.width = width;
		this.height = height;
		this.speed = speed;
	} // player constructor
	
	// This is basically the game state of the player
	// ex. player moves, enemies chase, bullets fly, etc
	public void update(float deltaTime) {
		handleInput(deltaTime);
		keepInsideScreen();
		
		// Apply gravity pulls the player down (-800)
		yVelocity += gravity * deltaTime;
		
		// update the position when jumped
		y += yVelocity * deltaTime;
		
		// Check if Raya hit the ground
		if (y <= 0) {
			y = 0;
			yVelocity = 0;
			onGround = true;
		}
	} // update method
	
	// Raya placeholder Sprite
	public void draw(SpriteBatch batch) {
		batch.draw(texture, x, y, width, height);
	} // draw method
//	
//	// The player doesn't have sprite yet so we will draw a rectangle for now
//	public void draw(ShapeRenderer shapeRenderer) {
//		shapeRenderer.setColor(0,0,1,1);
//		shapeRenderer.rect(x,y,width,height);
//	} // draw method
//	
	// The player controls
	private void handleInput(float deltaTime) {
		// ======= LEFT =======
		if (Gdx.input.isKeyPressed(Input.Keys.LEFT) || Gdx.input.isKeyPressed(Input.Keys.A)) {
			x -= speed * deltaTime;
		}
		// ======= RIGHT =======
		if (Gdx.input.isKeyPressed(Input.Keys.RIGHT) || Gdx.input.isKeyPressed(Input.Keys.D)) {
			x += speed * deltaTime;
		}
		// ======= JUMP =======
		if (onGround && Gdx.input.isKeyPressed(Input.Keys.SPACE)) {
			yVelocity = jumpVelocity;
			onGround = false;
		}
	} // handleInput method
	
	// Prevents the player out of the screen
	// TODO: Player keeps going to the right the left works fine
	private void keepInsideScreen() {
		float screenWidth = Gdx.graphics.getWidth();
		if (x < 0) x = 0;
		if (x > screenWidth - width) x = screenWidth - width;
	} // keepInsideScreen method
	
//	// The Collision of the player to ground
//	private void keepAboveGround() {
//		if (y < groundHeight) {
//			y = groundHeight;
//		}
//	} // keepAboveGround method
	
	// TRASH CAN 
	public void dispose() {
	} // dispose method
} // class Player
