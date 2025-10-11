package com.TeamHiraya.Engkanto;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

/** {@link com.badlogic.gdx.ApplicationListener} implementation shared by all platforms. */
public class Main extends ApplicationAdapter {
    private SpriteBatch batch;
    private Texture image;
    private _GameLogo logo;

    @Override
    public void create() {
        batch = new SpriteBatch();
        // Create an object of _GameLogo
        logo = new _GameLogo("Engkanto_Logo.png", 350, 450, 600, 250);
    }

    @Override
    public void render() {
    	// This is the background color
        Gdx.gl.glClearColor(0, 0, 0, 1);
        
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
    }
}
