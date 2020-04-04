import de.bezier.data.sql.*;

int highscore, score;
SQLite db;

void setup(){
  size(800, 600, P3D);
  db = new SQLite(this, "Highscore.db");
  if(db.connect()){
    System.out.println("Klappt");
  } else {
    System.out.println("Klappt nicht");
  }
}

void draw(){
  background(0);
}
