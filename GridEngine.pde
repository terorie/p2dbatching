// 2017, terorie 2D Batching Template

class GridEngine extends Layer {
  public GridEngine(PApplet p) {
    super(p);
    
    beginDraw();
    drawGrid();
    endDraw();
  }
  
  void update() {
    beginDraw();
    drawGrid();
    drawBlocks();
    drawShapes();
    endDraw();
  }
  
  void drawGrid() {
    background(0xCC);
    stroke(0);
    strokeWeight(1);
    for(int x = 0; x < w; ++x)
      line(x*bs, 0, x*bs, height);
    for(int y = 0; y < h; ++y)
      line(0, y*bs, width, y*bs);
  }
  
  void drawBlocks() {
    noStroke();
    fill(0, 0, 255);
    for(int y = 0; y < h; y++)
      for(int x = 0; x < w; x++)
        if(grid[x][y])
          rect(x*bs, y*bs, bs-1, bs-1);
  }
  
  void drawLine(long coord1, long coord2) {
    int x1 = (int)coord1 % w;
    int y1 = (int)coord1 / w;
    int x2 = (int)coord2 % w;
    int y2 = (int)coord2 / w;
    line(x1*bs, y1*bs, x2*bs, y2*bs);
  }
  
  void drawShapes() {
    strokeWeight(2);
    stroke(255, 0, 0);
    for(long[] shape : batchSet) {
      // Verification
      if(shape.length == 0)
        throw new IllegalArgumentException("Empty shape");
      if(shape.length < 4)
        throw new IllegalArgumentException("A shape needs at least 4 points.");
      
      // Draw each connection except of the last one
      for(int i = 1; i < shape.length; i++)
        drawLine(shape[i-1], shape[i]);
      // Draw last connection
      drawLine(shape[shape.length-1], shape[0]);
    }
  }
}