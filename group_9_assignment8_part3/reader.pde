class reader {

  String[] channel_sources;
  channel[] channels;
  int num_channels, current_channel;
  PImage arrow, settings_img;
  boolean near_left, near_right, near_header, view_settings, near_settings, near_footer;
  box right_arrow_box, left_arrow_box, header_box, footer_box, settings_button_box;
  settings reader_settings;
  
  reader (String[] chan){
    channel_sources = chan;
    num_channels = channel_sources.length;
    channels = new channel[num_channels];
    for (int i = 0; i < num_channels; i++) {
      channels[i] = new channel (channel_sources[i]);
    }
    current_channel = 0;
    
    arrow = loadImage ("arrow.png");
    arrow.resize (60, (60 * arrow.height) / arrow.width);
    near_left = false;
    near_right = false;
    near_header = false;
    
    right_arrow_box = new box (width - 90, 370, 90, 100, 0, 255, false);
    left_arrow_box = new box (0, 370, 90, 100, 0, 255, false);
    near_header = false;
    near_footer = false;
    
    settings_img = loadImage ("settings.png");
    settings_img.resize (30, (30 * arrow.height) / arrow.width);
    settings_button_box = new box (5, 775, 30, 30, 0, 255, false);
    reader_settings = new settings ();
    view_settings = false;
    near_settings = false;
  }
  
  void display () {
    channels[current_channel].display ();
    
    tint (red (channels[current_channel].channel_color), green (channels[current_channel].channel_color), blue (channels[current_channel].channel_color), 200);
    image (settings_img, 5, 775);
    noTint ();
    
    if (this.right_arrow_box.in_box (mouseX, mouseY)) {
      near_right = true;
      tint (255, 255, 255, 100);
      image (arrow, width - 60, 400);
      noTint ();
    }
    else {
      near_right = false;
    }
    if (this.left_arrow_box.in_box (mouseX, mouseY)) {
      near_left = true;
      tint (255, 255, 255, 100);
      pushMatrix ();
      scale (-1, 1);
      image (arrow, -60, 400);
      popMatrix ();
      noTint ();
    }
    if (view_settings) {
      reader_settings.light_background = channels[current_channel].light_background;
      reader_settings.display (channels[current_channel].channel_color);
    }
    if (right_arrow_box.in_box (mouseX, mouseY)) {
      near_right = true;
    }
    else {
      near_right = false;
    }
    if (left_arrow_box.in_box (mouseX, mouseY)) {
      near_left = true;
    }
    else {
      near_left = false;
    }
    if (channels[current_channel].header_box.in_box (mouseX, mouseY)) {
      near_header = true;
    }
    else {
      near_header = false;
    }
    
    if (channels[current_channel].footer_box.in_box (mouseX, mouseY)) {
      near_footer = true;
    }
    else {
      near_footer = false;
    }
    if (settings_button_box.in_box (mouseX, mouseY)) {
      near_settings = true;
    }
    else {
      near_settings = false;
    }
    channels[current_channel].show_title = reader_settings.show_title_img;
    for (int i = 0; i < channels[current_channel].num_items; i++) {
      channels[current_channel].items[i].show_media = reader_settings.show_thumbnail;
    }
  }
  
  void next_channel () {
    this.current_channel = (this.current_channel + 1) % this.num_channels;
  }
  
  void previous_channel () {
    this.current_channel = (this.current_channel + this.num_channels - 1) % this.num_channels;
  }

}