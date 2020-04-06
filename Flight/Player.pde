class Player {
  float px, py, pv_x, pv_y; //Player-x-coordinate, Player-y-coordinate, Player speed 
  boolean wPressed, sPressed, aPressed, dPressed; //booleans for the keyCodes
  PShape pm; //player model

  Player() {
    px = width/2;
    py = height/2;
    pv_x = 0;
    pv_y = 0;

    pm = loadShape("otter.svg"); //loading the player model
  }

  void drawPlayer() {
    shape(pm, px, py); //display the model
  }

  void movePlayer() {
    if (wPressed) {
      py -= 2;
    }
    if (sPressed) {
      py += 2;
    }
    if (aPressed) {
      px -= 2;
    }
    if (dPressed) {
      px += 2;
    }
  } //function for moving the player
}
