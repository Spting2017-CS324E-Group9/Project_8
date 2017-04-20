class box {
  
  int h, w, top, right_side, opac;
  color fc;
  boolean str;
  box (int rc, int t, int box_width, int box_height, int opacity, color fill_color, boolean has_stroke) {
    w = box_width;
    h = box_height;
    top = t;
    right_side = rc;
    opac = opacity;
    fc = fill_color;
    str = has_stroke;
  }
  
  void display () {
    fill (fc);
    
    if (str) {
      stroke (0);
      strokeWeight (1);
    }
    else {
      print (str);
      noStroke ();
    }
    tint (fc, opac);
    rect (right_side, top, w, h);
    noTint ();
  }
  
  boolean in_box (int x, int y) {
    if ((x > right_side) && (x < right_side + w) && (y > top) && (y < top + h)) {
      return true;
    }
    else {
      return false;
    }
  
  }
  

}