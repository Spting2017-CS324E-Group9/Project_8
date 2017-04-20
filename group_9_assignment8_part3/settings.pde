class settings {

  box display_box;
  button show_both_button, show_none_button, show_title_button, show_thumbnail_button;
  boolean light_background, show_thumbnail, show_title_img;
  
  settings () {
    show_title_img = true;
    show_thumbnail = true;
    light_background = false;
    display_box = new box (0, 300, 400, 470, 255, 0, true);
    
    show_both_button = new button (50, 330);
    show_none_button = new button (100, 330); 
    show_title_button = new button (150, 330);
    show_thumbnail_button = new button (200, 330);
  
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
    text ("Display: ", 5, 330);
    show_both_button.display ();
    show_none_button.display ();
    show_title_button.display ();
    show_thumbnail_button.display ();
    
    
  }

}