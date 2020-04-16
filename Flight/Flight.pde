import de.bezier.data.sql.*;
import g4p_controls.*;

int highscore, score;

GButton btnMakeWindow;
GWindow window;

SQLite db;

Ground ground;

Player player;

Ring ring;

void setup() {
  //size(800, 600, P3D);
  fullScreen(P3D); 
  btnMakeWindow = new GButton(this, 10, 20, 140, 20, "PLAY GAME");            //just a test which I never got to test
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);

  db = new SQLite(this, "database/Highscore.sqlite"); //adding the database

  ground = new Ground(); //adding the ground

  player = new Player(); //adding player

  ring = new Ring();
}

void draw() {
  lights();
  setGradient(color(340, 100, 100), color(310, 100, 100));
  ground.makeGround(0.05); //drawing the ground
  text(frameRate, 20, 20);
  /*player.drawPlayer();
   player.movePlayer();
   float s = -frameCount;
   translate(width/2, height/2, s);
   shape(ring.ring, 0, 0);
   translate(-width/2, -height/2, -s);*/
}

void setGradient(color c1, color c2) {
  for (int i = 0; i <= 0 + height; i++) {
    float inter = map(i, 0, 0 + height, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(0, i, 0 + width, i);
  }
}

void keyPressed() {
  if (key == 'w') {
    player.wPressed = true;
  }
  if (key == 's') {
    player.sPressed = true;
  }
  if (key == 'a' && !player.dPressed) {
    player.img = player.imgL;
    player.aPressed = true;
  }
  if (key == 'd' && !player.aPressed) {
    player.img = player.imgR;
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
    player.img = player.imgN;
    player.aPressed = false;
  }
  if (key == 'd') {
    player.img = player.imgN;
    player.dPressed = false;
  }
}

void handleButtonEvents(GButton button, GEvent event) {
  if (button == btnMakeWindow && event == GEvent.CLICKED) {
    createWindows();
    btnMakeWindow.setEnabled(false);
  }// if
}

void createWindows() {
  println("Making Window");
  window = GWindow.getWindow(this, "Help", 500, 50, 477, 538, JAVA2D);
  window.addOnCloseHandler(this, "windowClosing"); 
  window.setActionOnClose(GWindow.CLOSE_WINDOW);
}// createWindow

public void windowClosing(GWindow w) {
  println("Window closing");
  btnMakeWindow.setEnabled(true);
}
