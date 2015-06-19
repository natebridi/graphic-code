class Poisson {
  int radius;
  int active;
  int k;
  int w;
  int h;
  int cx;
  int cy;
  int r;
  int R;
  int id;
  int inner2;
  int A;
  float cellsize;
  int gridWidth;
  int gridHeight;
  float[][] grid;
  float[][] queue;
  float[][] allpoints;
  int n;
  int count;
  float dm;
  color c;
  
  Poisson(int _w, int _h, int _cx, int _cy, int _R) {
    radius = 3;
    k = 50;
    w = _w;
    h = _h;
    R = _R;
    cx = _cx;
    cy = _cy;
    r = radius * 2;
    inner2 = r * r;
    A = 4 * r * r - inner2;
    cellsize = r * .707; // sqrt(0.5);
    gridWidth = ceil(w / cellsize);
    gridHeight = ceil(h / cellsize);
    grid = new float[gridWidth * gridHeight][2];
    queue = new float[10000][2];
    n = 0;
    count = 0;
    dm = 1;    // distance multiplier
    c = color(0, 0, 0);
    addPoint(new float[] {cx, cy}, color(0,0,0));
  }
  
  void display(color c) {
    
    if (n > -1) {
      int start = millis();
      
      do {
        int i = floor(random(n));
        float[] p = queue[i];
        
        boolean validPoint = false;
        for (int j = 0; j < k && !validPoint; j++) {
          float[] q = this.generateAround(p);
          if (this.inCanvas(q) && !this.near(q)) {
            this.addPoint(q, c);
            validPoint = true;
          }
        }
        if (!validPoint) {
          n--;
          if (n >= 0) queue[i] = queue[n];
        }
        
      } while(n > 0 && millis() - start < 17);
      
    } else {
      fill(255,0,0);
      ellipse(cx, cy, r/2, r/2);
    }
  }
  
  void addPoint(float[] p, color c) {
    queue[n] = p;
    grid[gridWidth * (int(p[1] / cellsize)) + (int(p[0] / cellsize))] = p;
    n++;
    count++;
    
    //noFill();
    //stroke(100);
    noStroke();
    fill(c);
    ellipse(p[0], p[1], r/2, r/2);
  }
  
  float[] generateAround(float[] p) {
    float p1 = random(2) * 3.1415;
    float p2 = sqrt(random(A) + inner2); 
    return new float[] {p[0] + p2 * cos(p1), p[1] + p2 * sin(p1)};
  }
  
  boolean inCanvas(float[] p) {
    float d2 = sqrt(pow(p[0]-cx, 2)+pow(p[1]-cy, 2));
    
    return p[0] > 0 && p[1] > 0 && p[0] < w && p[1] < h && d2 < R;
  }
  
  boolean near(float[] p) {
    int n = 2;
    int x = int(p[0] / cellsize);
    int y = int(p[1] / cellsize);
    int x0 = Math.max(x - n, 0);
    int y0 = Math.max(y - n, 0);
    int x1 = Math.min(x + n + 1, gridWidth);
    int y1 = Math.min(y + n + 1, gridHeight);
    for (int _y = y0; _y < y1; _y++) {
      int o = _y * gridWidth;
      for (int _x = x0; _x < x1; _x++) {
        float d2 = pow(p[0]-grid[o + _x][0], 2)+pow(p[1]-grid[o + _x][1], 2);
        if (grid[o + _x] != null && d2 < inner2 * dm) return true;
      }
    }
    return false;
  }
}
