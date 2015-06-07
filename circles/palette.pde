
class Palette {
  color[] palette = new color[4];
  
  Palette() {
    palette[0] = color(105, 210, 231);
    palette[1] = color(224, 228, 204);
    palette[2] = color(243, 134, 48);
    palette[3] = color(167, 219, 216);
  }

  color selectColor() {
    return palette[int(random(palette.length))];
  }
}
