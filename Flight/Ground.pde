class Ground {
  int cols, rows;
  int scl = 20; //the scale of the triangles

  int w = width*2;
  int h = floor(height*1.5); //necessary for the ground to fill the 

  float[][] groundZ; //2D array for the height of the ground

  float yoff, xoff;
  float flying = 0; //necessary for perlin noise to look natural

  Ground() {
    cols = w/scl;
    rows = h/scl;
    groundZ = new float[cols][rows]; //determining the size of the plane and the array
  }

  void makeGround(float speed) {
    flying -= speed; //incrementing flying for the effect of movement of the plane
    yoff = flying;
    for (int y = 0; y < rows; y++) {
      xoff = 0;
      for (int x = 0; x < cols; x++) {
        groundZ[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100); //mapping different random perlin noise values into the array
        xoff += 0.1;
      }
      yoff += 0.1;
    }
    noStroke();
    translate(width/2, height/2); 
    rotateX(PI/3); //rotating along the x-axis so the plane is angled
    translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        fill(floor(map(groundZ[x][y], -100, 100, 0, 255))); //different shades of gray based on the height
        vertex(x*scl, y*scl, groundZ[x][y]);
        vertex(x*scl, (y+1)*scl, groundZ[x][y+1]);
      }
      endShape();
    } //creating the plane
    translate(w/2, h/2);
    rotateX(-PI/3);
    translate(-width/2, -height/2);
  }
}
