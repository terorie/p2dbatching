// 2017, terorie 2D Batching Template

public static class Layer extends PGraphics2D {
  public Layer(PApplet p) {
    setParent(p);
    setPrimary(false);
    setPath(p.dataPath(""));
    setSize(p.width, p.height);
  }

  public Layer(int w, int h, PApplet p) {
    setParent(p);
    setPrimary(false);
    setPath(p.dataPath(""));
    setSize(w, h);
  }
}