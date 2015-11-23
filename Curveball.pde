final int WIDTH = 500;
final float pxPerCm = 4;
final float cmPerMillis = 4.02;

float delta = 0;
float lastX = 0;
float lastY = 0;

void setup() {
  frameRate(2000);
  size(500, 200);
}

float centimerPerMillis(float _millis) {
  return _millis * cmPerMillis;
}

float heightAtDistance(float d) {
  return 0.00005 * pow(d-1000, 2) + 210;
}

float cmToPx(float cm) {
  return cm / pxPerCm;
}

void mouseClicked() {
  frameCount = 0;
}

void draw() {
  background(#2e8b57);
  delta = frameCount;
  
  
  float deltaCM = centimerPerMillis(delta);
  float x = cmToPx(deltaCM);
  float y = cmToPx(heightAtDistance(deltaCM)) + 50;
  
  if(x < WIDTH) {
    noStroke();
    fill(#f5f5f5);
    ellipse(x, y, 10, 10);
    lastX = x;
    lastY = y;
  } else {
    ellipse(lastX, lastY, 10, 10);
  }
}