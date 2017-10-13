// 2017, terorie 2D Batching Template

import java.lang.IllegalArgumentException;
import processing.core.PApplet;

static final int bs = 16;
int w, h;
boolean[][] grid;

// Set of coordinates (encoded in y*w+x)
final ArrayList<long[]> batchSet = new ArrayList<long[]>();

//// BATCHING ALGORITHM \\\\
void batch() {
  // Beispiel code
    // BatchSet erwartet eine Liste von Punkten/coords,
    // die wie bei MalenNachZahlen.exe nach einander
    // verbunden werden
  batchSet.add(new long[] {
    coord(2, 2),
    coord(2, 6),
    coord(6, 6),
    coord(6, 2)
  });
}

////// RENDERING CODE \\\\\\

Cursor cursor;
GridEngine gridEngine;

void setup() {
  size(640, 480, P2D);
  w = width/bs;
  h = height/bs;
  grid = new boolean[w][h];
  cursor = new Cursor(bs-1, bs-1, this);
  gridEngine = new GridEngine(this);
}

void drawCursor() {
  int x = mouseX / bs;
  int y = mouseY / bs;
  // If mouse is not on any block
  if(x < 0 || x > w || y < 0 || y > h) return;
  // Draw cursor on block
  cursor.loadPixels();
  set(x*bs, y*bs, cursor);
}

void drawGrid() {
  gridEngine.loadPixels();
  set(0, 0, gridEngine);
}

boolean handleMouse() {
  if(!mousePressed) return false;
  int x = mouseX / bs;
  int y = mouseY / bs;
  // If mouse is not on any block
  if(x < 0 || x > w || y < 0 || y > h) return false;
  
  // Write changes to grid
  // (Set block to 1 if left button,
  //  set block to 0 if right button)
  grid[x][y] = mouseButton != RIGHT;
  
  return true;
}

long coord(int x, int y) {
  return y*w+x;
}

void draw() {
  // Falls die Maus das Grid verändert hat
  if(handleMouse()) {
    batchSet.clear();
    batch();
    gridEngine.update();
  }
  
  drawGrid();
  drawCursor();
}

void keyPressed() {
  switch(key) {
    case 'C': case 'c':
      for(int y = 0; y < h; y++)
        for(int x = 0; x < w; x++)
          grid[x][y] = false;
      gridEngine.update();
      break;
  }
}