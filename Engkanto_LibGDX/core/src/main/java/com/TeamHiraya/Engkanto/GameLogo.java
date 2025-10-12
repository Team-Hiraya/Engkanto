package com.TeamHiraya.Engkanto;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class GameLogo {
	
	private Texture texture;
	private float x,y,width,height;
	
	/**
	 * > GameLogo Class
	 * > By: TeamHiraya
	 * @param imagePath - ito yung path ng image
	 * @param x - position niya hoeizontal
	 * @param y - position niya vertical
	 * @param width - width ng image
	 * @param height - height ng image
	 * */
	public GameLogo(String imagePath, float x, float y, float width, float height) {
		texture = new Texture(imagePath);
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}// GameLogo constructor
	
	// draw the image on screen
	public void draw(SpriteBatch batch) {
		batch.draw(texture,x,y,width,height);
	}// draw method
	
	// position of the image
	public void setPosition(float x, float y) {
		this.x = x;
		this.y = y;
	}// setPosition method
	
	// TRASH CAN
	public void dispose() {
		texture.dispose();
	}// dispose method

}// GameLogo class
