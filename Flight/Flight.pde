import de.bezier.data.sql.*;

int highscore, score;
SQLite db;
Ground ground;

void setup() {
  size(800, 600, P3D);
  db = new SQLite(this, "Highscore.db");
  ground = new Ground();
}

void draw() {
  background(0);
  ground.makeGround();
}
