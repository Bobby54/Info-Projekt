import de.bezier.data.sql.*;

int highscore, score;
SQLite db;
Ground ground;

void setup() {
  //size(800, 600, P3D);
  fullScreen(P3D); 
  db = new SQLite(this, "Highscore.db"); //adding the database
  ground = new Ground(); //adding the ground
}

void draw() {
  background(0); //black background
  ground.makeGround(); //drawing the ground
}
