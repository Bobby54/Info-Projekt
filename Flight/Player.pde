class Player {
  float px, py, ps; // player_x, player_y, player speed

  boolean wPressed, sPressed, aPressed, dPressed; //booleans for the keyCodes

  int hs; //hitbox size

  PImage img, imgL, imgN, imgR;

  Player() {
    px = width/2;
    py = height/2;
    ps = 5;
    hs = 50;
    imgL = loadImage("graphics/planeL.png");
    imgN = loadImage("graphics/plane.png");
    imgR = loadImage("graphics/planeR.png");
    img = imgN;
  }

  void drawPlayer() {
    fill(360);
    image(img, px, py, hs*2, hs);
  }

  void movePlayer() {
    if (wPressed) {
      if (py > hs) {
        py -= ps;
      }
    }
    if (sPressed) {
      if (py < height - hs) {
        py += ps;
      }
    }
    if (aPressed) {
      if (px > hs) {
        px -= ps;
      }
    }
    if (dPressed) {
      if (px < width - hs) {
        px += ps;
      }
    }
  } //function for moving the player
}
