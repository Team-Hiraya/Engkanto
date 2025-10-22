package com.TeamHiraya.Engkanto.Objects;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.math.Rectangle;

public class PlaceholderBackground {
	private Texture texture;
	private Rectangle ground;
	
	// Constructor
	public PlaceholderBackground() {
		texture = new Texture(Gdx.files.internal("Forest-Placeholder.png"));
		
		ground = new Rectangle(0, 0, Gdx.graphics.getWidth(), 50);
	}
	
	public void render(SpriteBatch batch) {
		batch.draw(texture, 0, 0, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
	}
	
	public Rectangle getGround() {
		return ground;
	}
	
	public void dispose() {
		texture.dispose();
	}

}
