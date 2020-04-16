class Menu {
  GButton buttonm;
  float p0, p1, p2, p3;
  String textm;
  PApplet applet;

  Menu() {
    applet = new PApplet();
    buttonm = new GButton(applet, p0, p1, p2, p3, textm);
  }

  void drawMenu() {
  }
}
