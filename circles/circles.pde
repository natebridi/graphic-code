Circle circleMaker[];
Poisson poisson;
int count;

void setup() {
  
  size(800, 600, "processing.core.PGraphicsRetina2D");
  hint(ENABLE_RETINA_PIXELS);
  smooth();

  background(255);
  
  circleMaker = new Circle[100];
  poisson = new Poisson(width, height);
  count = 0;
}

void draw() {
  poisson.display();
  /*for (int i = 0; i < count; i++) {
    circleMaker[i].display();
  }*/
}

void mouseClicked() {
  background(250);
  poisson = new Poisson(width, height);
  poisson.display();
}

/*void mouseClicked() {
  float closest;
  
  if (count == 0) {
    circleMaker[count] = new Circle(mouseX, mouseY, 150);
  } else {
    // loop through and find closest
    closest = distance(circleMaker[0].x, mouseX, circleMaker[0].y, mouseY) - circleMaker[0].r;
    for (int i = 1; i < count; i++) {
      float d = distance(circleMaker[i].x, mouseX, circleMaker[i].y, mouseY) - circleMaker[i].r;
      if (d < closest) {
        closest = d;
      }
    }
    circleMaker[count] = new Circle(mouseX, mouseY, closest);
  }
  count++;
}
*/

class Circle {
  float r;      // radius
  float cr;     // current radius
  float x, y;   // coords
  Palette palette;
  color c;
  
  Circle(float _x, float _y, float _r) {
    r = _r;
    x = _x;
    y = _y;
    palette = new Palette();
    c = palette.selectColor();
    cr = 0;
  }
  
  void display() {
    noStroke();
    fill(c);
    if (r-cr > 0.1) {
      cr += (r-cr)/5;
      ellipse(x, y, cr*2, cr*2);
    }
  }
}

float distance(float x1, float x2, float y1, float y2) {
  return sqrt(pow(x2-x1, 2)+pow(y2-y1, 2));
}
