import de.bezier.data.sql.*;
import g4p_controls.*;

GButton btnMakeWindow;
GWindow window;
GEvent event;
GButton button;

SQLite db;

Ground ground;
Player player;
Ring ring;

Game game;



boolean enable = true;
boolean all = true;
boolean status = false; //false as longs as player is in menu, true if player clicked play button

void setup() {
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  btnMakeWindow = new GButton(this, width/2, height/2, 90, 40, "PLAY GAME");
  btnMakeWindow.setEnabled(enable);
  ground = new Ground();
  player = new Player();
  ring = new Ring();
  game = new Game();

  db = new SQLite(this, "database/Highscore.sqlite"); //adding the database
}

void draw() {
  if (status == true) {
    btnMakeWindow.setEnabled(false);
    btnMakeWindow.setVisible(false);
    ground.makeGround(0.05);
    //player.drawPlayer();

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
    status = true;
  }
}


//void createWindows() {
//  println("Making Window");
//  window = GWindow.getWindow(this, "Help", 500, 50, 477, 538, JAVA2D);
//  window.addOnCloseHandler(this, "windowClosing"); 
//  window.setActionOnClose(GWindow.CLOSE_WINDOW);
//}// createWindow

//public void windowClosing(GWindow w) {
//  println("Window closing");
//  btnMakeWindow.setEnabled(true);
//}
