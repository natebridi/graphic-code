

int i = 1;
float r = 30;
PShape heart;

void setup() {
  size(400, 400);
  background(255);
  
  heart = createShape();
  heart.beginShape();
  heart.fill(255, 0, 0);
  heart.noStroke();
  heart.vertex(0, 12);
  heart.vertex(-12, -2);
  heart.vertex(-6, -12);
  heart.vertex(0, -7);
  heart.vertex(6, -12);
  heart.vertex(12, -2);
  heart.endShape(CLOSE);
}

void draw() {
  background(255);
  
  
  float y1 = log(i) * r/5;
  float y2 = log(i) * r/4;
  float y3 = log(i) * r/6; 
  //float d = constrain(4 - log(i), 0, 4);
  float d = constrain(map(4 - log(i), 0, 4, 0, 8), 0, 8);
  
  translate(200, 200);
  
    pushMatrix();
    scale(log(i) / 4);
    shape(heart);
    popMatrix();
  
  
  rotate(i * .01);
  
  strokeWeight(d * 4);
  stroke(255, 255, 0, 100 - r * 2);
  noFill();
  
    ellipse(0, 0, log(i) * r / 2, log(i) * r / 2);
  
  noStroke();
  fill(255, 0, 100);
  
    ellipse(0, y1, d, d);
    ellipse(0, -y1, d, d);
    ellipse(y1, 0, d, d);
    ellipse(-y1, 0, d, d);
    
    ellipse(y1 * cos(.25*PI), y1 * sin(.25*PI), d, d);
    ellipse(y1 * cos(.75*PI), y1 * sin(.75*PI), d, d);
    ellipse(y1 * cos(1.25*PI), y1 * sin(1.25*PI), d, d);
    ellipse(y1 * cos(1.75*PI), y1 * sin(1.75*PI), d, d);
    
 strokeWeight(d);
 stroke(0, 0, 255);
 noFill();

    pushMatrix();
      rotate(.125*PI);
      if (y2 < r / 4) {
        line(0, 0, y2, y2);
      } else {
        line(y2 - r / i, y2 - r / i, y2, y2);  
      }
    popMatrix();
    
    pushMatrix();
      rotate(.825*PI);
      if (y2 < r / 4) {
        line(0, 0, y2, y2);
      } else {
        line(y2 - r / i, y2 - r / i, y2, y2);  
      }
    popMatrix();
    
    pushMatrix();
      rotate(1.125*PI);
      if (y2 < r / 4) {
        line(0, 0, y2, y2);
      } else {
        line(y2 - r / i, y2 - r / i, y2, y2);  
      }
    popMatrix();
    
    pushMatrix();
      rotate(1.825*PI);
      if (y2 < r / 4) {
        line(0, 0, y2, y2);
      } else {
        line(y2 - r / i, y2 - r / i, y2, y2);  
      }
    popMatrix();
   
  
  i++;
}

void mouseClicked() {
  i = 1;
}
