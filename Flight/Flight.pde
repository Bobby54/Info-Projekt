import de.bezier.data.sql.*;

int highscore, score;
SQLite db;
Ground ground;
Player player;

void setup() {
  //size(800, 600, P3D);
  fullScreen(P3D); 
  db = new SQLite(this, "Highscore.db"); //adding the database
  ground = new Ground(); //adding the ground
  //player = new Player();
}

void draw() {
  background(0); //black background
  ground.makeGround(0.05); //drawing the ground
  //player.drawPlayer();
  //player.movePlayer();
}

void keyPressed() {
  if (key == 'w') {
    player.wPressed = true;
  }
  if (key == 's') {
    player.sPressed = true;
  }
  if (key == 'a') {
    player.aPressed = true;
  }
  if (key == 'd') {
    player.dPressed = true;
  }
}

void keyReleased() {
  if (key == 'w') {
   player.wPressed = false;
  }
  if (key == 's') {
    player.sPressed = false;
  }
  if (key == 'a') {
    player.aPressed = false;
  }
  if (key == 'd') {
    player.dPressed = false;
  }
}
