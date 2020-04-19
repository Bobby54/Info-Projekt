class Ring {
  float rx, ry, rz; // ring_x, ring_y, ring_z
  
  PShape ring;
  
  Ring() {
    ring = createRing(100, 200, 90);
    noFill();
    ring.setStroke(color(0, 0, 0));
    ring.setStrokeWeight(10);
  }

  PShape createRing(float innerRadius, float outerRadius, float steps) {
    PShape s = createShape();
    s.beginShape();
    for (float a=0; a<TAU; a+=TAU/steps) {
      s.vertex(outerRadius*cos(a), outerRadius*sin(a));
    }
    s.beginContour();
    for (float a=0; a<TAU; a+=TAU/steps) {
      s.vertex(innerRadius*cos(-a), innerRadius*sin(-a));
    }
    s.endContour();
    s.endShape(CLOSE);
    return s;
  }
}
