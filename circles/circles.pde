
Circle circleMaker;


void setup() {
  background(255);
  size(600, 400);
  
  circleMaker = new Circle(0, 0, 150);
}

void draw() {
  circleMaker.display();
}

void mouseClicked() {
  circleMaker.update(mouseX, mouseY);
}

class Circle {
  float r;      // radius
  float cr;     // current radius
  float x, y;   // coords
  
  Circle(float _x, float _y, float _r) {
    r = _r;
    x = _x;
    y = _y;
    cr = 0;
  }
  
  void update(float _x, float _y) {
    x = _x;
    y = _y;
    cr = 0;
  }
  
  void display() {
    noStroke();
    fill(0);
    cr += (r-cr)/20;
    ellipse(x, y, cr, cr);
  }
}
