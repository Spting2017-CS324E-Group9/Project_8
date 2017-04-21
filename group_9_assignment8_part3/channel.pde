class channel {

  // univerals
  XML data;
  String title, link, copyright, build_date;
  XML[] item_data;
  item[] items;
  int item_height, num_items;
  box header_box, footer_box;
  boolean light_background, show_title; 
  
  // image variables
  boolean has_image, has_link, has_copyright, has_build_date;
  PImage img;
  color channel_color;
  int img_height, img_corner;
  
  channel (String source) {
    data = loadXML (source);
    
    XML title_data = data.getChild ("channel/title");
    title = title_data.getContent ();
    
    XML link_data = data.getChild ("channel/link");
    if (link_data == null) {
      has_link = false;
    }
    else {
      has_link = true;
      link = link_data.getContent ();
    }
    
    XML copyright_data = data.getChild ("channel/copyright");
    if (copyright_data == null) {
      has_copyright = false;
    }
    else {
      has_copyright = true;
      copyright = copyright_data.getContent ();
    }
    
    XML build_date_data = data.getChild ("channel/lastBuildDate");
    if (build_date_data == null) {
      has_build_date = false;
    }
    else {
      has_build_date = true;
      build_date = build_date_data.getContent ();
    }
    
    XML image_data = data.getChild ("channel/image/url");
    if (image_data == null) {
      has_image = false;
      channel_color = color (32, 58, 108);
      img_height = 60;
    }
    else {
      has_image = true;
      img = loadImage (image_data.getContent ());
      img_height = (100 * img.height) / img.width;
      img.resize (100, img_height);
      channel_color = img.get (1, 1);
      img_corner = (width / 2) - (img.width / 2);
    }
    
    item_height = 110;
    item_data = data.getChildren ("channel/item");
    num_items = item_data.length;
    items = new item[num_items];
    for (int i = 0; i < item_data.length; i++) {
      item current_item = new item (item_data[i], i * item_height + img_height, item_height);
      items[i] = current_item;
    }
    
    header_box = new box (0, 0, width, img_height, 0, 255, false);
    footer_box = new box (0, 770, width, 30, 0, 255, false);
    
    if ((red (channel_color) < 128) && (green (channel_color) < 128) && (blue (channel_color) < 128)) {
      light_background = false;
    }
    else {
      light_background = true;
    }
    
    show_title = true;
  }
  
  void display () {
    background (100);
    
    // items
    for (int i = 0; i < num_items; i++) {
      items[i].display ();
    }
    
    // header
    fill (channel_color);
    noStroke ();
    rect (0, 0, width, this.img_height);
    if ((this.has_image) && (this.show_title)) {
      image (img, this.img_corner, 0);
    }
    else {
      fill (150);
      textAlign (CENTER);
      textSize (20);
      text (this.title, width / 2, 40);
    }
    // footer
    fill (channel_color);
    rect (0, 770, width, 30);
    if (this.has_copyright) {
      textAlign (LEFT);
      textSize (10);
      if (!light_background) {
        fill (150);
      }
      else {
        fill (0);
      }
      text (copyright, 55, 785);
    }
    
    if (this.has_build_date) {
      textAlign (RIGHT);
      textSize (10);
      if (!light_background) {
        fill (150);
      }
      else {
        fill (0);
      }
      text (build_date, width - 20, 785);
    }
    
  }
  
  void update_item_vert (int change) {
    for (int i = 0; i < this.num_items; i++) {
      items[i].vert += change;
      items[i].i_box.top += change;
    }
  }


}