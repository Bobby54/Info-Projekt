class Player {
  float px, py, ps; // player-x, player-y, player speed
  boolean wPressed, sPressed, aPressed, dPressed; //booleans for the keyCodes
  int hs; //hitbox size

  Player() {
    px = width/2;
    py = height/2;
    ps = 5;
    hs = 50;
  }

  void drawPlayer() {
    fill(360);
    rect(px, py, hs*2, hs*2);
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
