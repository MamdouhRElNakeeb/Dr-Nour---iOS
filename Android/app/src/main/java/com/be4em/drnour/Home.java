package com.be4em.drnour;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;

public class Home extends AppCompatActivity {

    ImageView nourIV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home_activity);

        nourIV = (ImageView) findViewById(R.id.nourIV);

    }
}
