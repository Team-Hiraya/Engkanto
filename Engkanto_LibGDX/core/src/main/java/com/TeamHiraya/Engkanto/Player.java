package com.TeamHiraya.Engkanto;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;

public class Player {
	// Class Variables
	private float x, y;
	private float width, height;
	private float speed;
	private ShapeRenderer shapeRenderer;
	// temporary variable
//	private float groundHeight;
	
	/**
	 * == Player Constructor ==
	 * @param startX the starting x (horizontal) position ng player
	 * @param startY the starting y (vertical) position ng player
	 * - This is temporary since wla pang asset yung player
	 * @param width yung width ng placeholder
	 * @param height yung height ng placeholder
	 * @param speed gaano kabilis gumalaw yung player (in pixels per second)
	 * */
	public Player(float startX,float startY, float width, float height, float speed) {
		// The parameters of Player
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
	} // update method
	
	// The player doesn't have sprite yet so we will draw a rectangle for now
	public void draw(ShapeRenderer shapeRenderer) {
		shapeRenderer.setColor(0,0,1,1);
		shapeRenderer.rect(x,y,width,height);
	} // draw method
	
	// The player controls
	private void handleInput(float deltaTime) {
		if (Gdx.input.isKeyPressed(Input.Keys.LEFT) || Gdx.input.isKeyPressed(Input.Keys.A)) {
			x -= speed * deltaTime;
		}
		if (Gdx.input.isKeyPressed(Input.Keys.RIGHT) || Gdx.input.isKeyPressed(Input.Keys.D)) {
			x += speed * deltaTime;
		}
	} // handleInput method
	
	// Prevents the player out of the screen
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
