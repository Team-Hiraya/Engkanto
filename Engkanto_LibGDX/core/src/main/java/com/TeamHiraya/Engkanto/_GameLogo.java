package com.TeamHiraya.Engkanto;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class _GameLogo {
	
	private Texture texture;
	private float x,y,width,height;
	
	/**Constructor
	 * 
	 * @param imagePath - ito yung path ng image
	 * @param x - position niya horizontal
	 * @param y - position niya vertical
	 * @param width - width ng image
	 * @param height - height ng image
	 */
	public _GameLogo(String imagePath, float x, float y, float width, float height)
	{
		texture = new Texture(imagePath);
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
	public void draw(SpriteBatch batch) 
	{
		batch.draw(texture, x, y, width, height);
	}
	
	public void dispose()
	{
		texture.dispose();
	}
	
	public void setPosition(float x, float y) 
	{
		this.x = x;
		this.y = y;
	}

}
