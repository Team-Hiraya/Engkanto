package com.TeamHiraya.Engkanto;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;

/** {@link com.badlogic.gdx.ApplicationListener} implementation shared by all platforms. */
public class Main extends ApplicationAdapter {
	// class variables
    private SpriteBatch batch;
    private Texture image;
    private GameLogo logo;
    private Player player;
    
    // This is temporary for the ground
    private ShapeRenderer shapeRenderer;
    private float groundHeight = 50f;
    
    
    @Override
    public void create() {
    	shapeRenderer = new ShapeRenderer();
        batch = new SpriteBatch();
        // Create an object of _GameLogo
        logo = new GameLogo("Engkanto_Logo.png", 350, 450, 600, 250);
        
        // Player position
        player = new Player(100, groundHeight, 40, 60, 200);
    }

    @Override
    public void render() {
    	float deltaTime = Gdx.graphics.getDeltaTime();
    	// This is the background color
        Gdx.gl.glClearColor(0, 0, 0, 1);
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
        
        // update player position
        player.update(deltaTime);
        
        // draw ground + player
        shapeRenderer.begin(ShapeRenderer.ShapeType.Filled);
        
        // Draw ground
        shapeRenderer.setColor(0,1,0,1);
        shapeRenderer.rect(0,0,Gdx.graphics.getWidth(), groundHeight);
        
        // Draw player
        player.draw(shapeRenderer);
        shapeRenderer.end();
        
        // This draws the logo
        batch.begin();
        logo.draw(batch);
        batch.end();
    }

    @Override
    // This method is just a trash can
    public void dispose() {
        batch.dispose();
        image.dispose();
        player.dispose();
    }
}