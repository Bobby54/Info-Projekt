import de.bezier.data.sql.*;

int highscore, score;
SQLite db;


void setup(){
  size(800, 600, P3D);
  db = new SQLite(this, "Highscore");
}

void draw(){
  background(0);
  
}
