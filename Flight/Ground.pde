class Ground {
  int cols, rows;
  int scl = 20;

  int w = width*2;
  int h = floor(height*1.5);

  float[][] groundZ;

  float yoff, xoff;
  float flying = 0;

  Ground() {
    cols = w/scl;
    rows = h/scl;
    groundZ = new float[cols][rows];
  }

  void makeGround() {
    flying -= 0.08;
    yoff = flying;
    for (int y = 0; y < rows; y++) {
      xoff = 0;
      for (int x = 0; x < cols; x++) {
        groundZ[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.1;
      }
      yoff += 0.1;
    }
    stroke(255);
    noFill();
    translate(width/2, height/2);
    rotateX(PI/3);
    translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, groundZ[x][y]);
        vertex(x*scl, (y+1)*scl, groundZ[x][y+1]);
      }
      endShape();
    }
    translate(w/2, h/2);
    translate(-width/2, -height/2);
  }
}
