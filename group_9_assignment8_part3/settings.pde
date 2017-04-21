class settings {

  box display_box, show_both_box, show_none_box, show_title_box, show_thumbnail_box;
  button show_both_button, show_none_button, show_title_button, show_thumbnail_button;
  boolean light_background, show_thumbnail, show_title_img;
  
  settings () {
    show_title_img = true;
    show_thumbnail = true;
    light_background = false;
    display_box = new box (0, 300, 400, 470, 255, 0, true);
    
    show_both_button = new button (100, 350);
    show_none_button = new button (160, 350); 
    show_title_button = new button (220, 350);
    show_thumbnail_button = new button (280, 350);
    
    show_both_box = new box (90, 340, 20, 20, 0, 255, false);
    show_none_box = new box (150, 340, 20, 20, 0, 255, false);
    show_title_box = new box (210, 340, 20, 20, 0, 255, false);
    show_thumbnail_box = new box (270, 340, 20, 20, 0, 255, false);
  
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
    text ("Display: ", 5, 350);
    show_both_button.display ();
    show_none_button.display ();
    show_title_button.display ();
    show_thumbnail_button.display ();
  }
  
  void update_settings () {
    if (show_both_box.in_box (mouseX, mouseY)) {
      show_title_img = true;
      show_thumbnail = true;
    }
    else if (show_none_box.in_box (mouseX, mouseY)) {
      show_title_img = false;
      show_thumbnail = false;
    }
    else if (show_title_box.in_box (mouseX, mouseY)) {
      show_title_img = true;
      show_thumbnail = false;
    }
    else if (show_thumbnail_box.in_box (mouseX, mouseY)) {
      show_title_img = false;
      show_thumbnail = true;
    }
  }

}