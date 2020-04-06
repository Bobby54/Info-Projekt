class Ground {
  int cols, rows;
  int scl = 7; //the scale of the triangles

  int w = width*2;
  int h = floor(height*1.5); //necessary for the ground to fill the 

  float[][] groundZ; //2D array for the height of the ground

  float yoff, xoff; //necessary for perlin noise to look natural
  float flying = 0; 

  color deepWater = color(225, 100, 70); //color of deep water
  color water = color(225, 100, 100); //color of the water
  color grass = color(136, 85, 70); //color of the grass
  color stone = color(225, 0, 40); //color of the stone
  color snow = color(0, 0, 100); //color of the snow

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
        xoff += 0.025;
      }
      yoff += 0.025;
    }
    noStroke();
    translate(width/2, height/2); 
    rotateX(PI/3); //rotating along the x-axis so the plane is angled
    translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        fill(heightColor(groundZ[x][y]));
        vertex(x*scl, y*scl, groundZ[x][y]);
        vertex(x*scl, (y+1)*scl, groundZ[x][y+1]);
      }
      endShape();
    } //creating the plane
    translate(w/2, h/2);
    rotateX(-PI/3);
    translate(-width/2, -height/2);
  }

  color heightColor(float h) {
    if (h <= -60) {
      return deepWater;
    } else if (h <= -50) {
      return lerpColor(deepWater, water, 0.4);
    } else if (h <= -40) {
      return lerpColor(deepWater, water, 0.7);
    } else if (h <= -30) {
      return water;
    } else if (h <= -25) {
      return lerpColor(water, grass, 0.3);
    } else if (h <= -15) {
      return lerpColor(water, grass, 0.8);
    } else if (h <= 5) {
      return grass;
    } else if (h <= 14) {
      return lerpColor(grass, stone, 0.2);
    } else if (h <= 23) {
      return lerpColor(grass, stone, 0.3);
    } else if (h <= 30) {
      return lerpColor(grass, stone, 0.4);
    } else if (h <= 38) {
      return lerpColor(grass, stone, 0.75);
    } else if (h <= 50) {
      return stone;
    } else {
      return snow;
    }
  } //different colors based on the height of the ground

  color lerpColors(float amt, color... colors) {
    if (colors.length==1) { 
      return colors[0];
    }
    float cunit = 1.0/(colors.length-1);
    return lerpColor(colors[floor(amt / cunit)], colors[ceil(amt / cunit)], amt%cunit/cunit);
  }
}
