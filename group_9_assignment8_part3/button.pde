class button {
  
  PShape on, off;
  boolean is_on;
  int x, y;
  button (int x_coord, int y_coord) {
    is_on = false;
    x = x_coord;
    y = y_coord;
    
    on = createShape (GROUP);
    PShape on_out_circ = createShape (ELLIPSE, x, y, 20, 20);
    on_out_circ.setFill (0);
    PShape on_mid_circ = createShape (ELLIPSE, x, y, 15, 15);
    on_mid_circ.setFill (color (200, 200, 200));
    PShape on_in_circ = createShape (ELLIPSE, x, y, 5, 5);
    on_in_circ.setFill (0);
    on.addChild (on_out_circ);
    on.addChild (on_mid_circ);
    on.addChild (on_in_circ);
    
    off = createShape (GROUP);
    PShape off_out_circ = createShape (ELLIPSE, x, y, 20, 20);
    off_out_circ.setFill (0);
    PShape off_mid_circ = createShape (ELLIPSE, x, y, 15, 15);
    off_mid_circ.setFill (200);
    PShape off_in_circ = createShape (ELLIPSE, x, y, 5, 5);
    off_in_circ.setFill (0);
    off.addChild (off_out_circ);
    off.addChild (off_mid_circ);
    off.addChild (off_in_circ);
  }
  
  void display () {
    if (is_on) {
      shape (on);
    }
    else {
      shape (off);
    }
  
  }

}