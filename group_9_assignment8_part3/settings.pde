class settings {

  box display_box;
  boolean light_background;
  boolean[] show_imgs;
  
  settings () {
    //show_imgs = {true, false, false, false};
    light_background = false;
    display_box = new box (0, 300, 400, 470, 255, 0, true);
  
  }
  
  void display (color dc) {
    this.display_box.fc = dc;
    this.display_box.display ();
    textAlign (LEFT);
    textSize (15);
    if (light_background) {
      fill (0);
    }
    else {
      fill (150);
    }
    text ("Settings", 5, 320);
    
    
  }

}