// 2017, terorie 2D Batching Template

static class Cursor extends Layer {
  public Cursor(int w, int h, PApplet p) {
    super(w, h, p);
    beginDraw();
    strokeWeight(2);
    stroke(0, 255, 0);
    fill(0, 255, 0, 127);
    rect(1, 1, w-2, w-2);
    endDraw();
  }
}