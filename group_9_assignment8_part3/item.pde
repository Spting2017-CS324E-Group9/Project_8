class item {

  XML data;
  String title, description, link, media, pub_date;
  boolean has_title, has_description, has_link, has_media, has_pub_date;
  box i_box;
  int vert, i_height;
  PImage img;

  item (XML source, int vertical_place, int ih) {
    vert = vertical_place;
    i_height = ih;

    data = source;

    XML title_data = data.getChild ("title");
    if (title_data == null) {
      has_title = false;
    } else {
      has_title = true;
      title = title_data.getContent ();
    }

    XML description_data = data.getChild("description");
    if (description_data == null) {
      has_description = false;
    } 
    else {
      has_description = true;
      description = description_data.getContent ();
    }

    XML link_data = data.getChild("link"); 
      if (link_data == null) {
      has_link = false;
    } else {
      has_link = true; 
        link = link_data.getContent ();
    }
    
    XML pub_date_data = data.getChild ("pubDate");
    if (pub_date_data == null) {
      has_pub_date = false;
    }
    else {
      has_pub_date = true;
      pub_date = pub_date_data.getContent ();
    }

    XML media_data = data.getChild("media:thumbnail"); 
    if (media_data == null) {
      has_media = false;
    } 
    else {
      has_media = true; 
      media = media_data.getString ("url"); 
      img = loadImage (media); 
      img.resize ((img.width * this.i_height) / img.height, i_height);
    }

    i_box = new box (0, vert, width, i_height, 255, color (200, 200, 200), true);
  }

  void display () {
    this.i_box.display (); 
      if (has_media) {
      image (this.img, 0, vert);
    }
    if (this.has_title) {
      fill (0); 
      textAlign (LEFT); 
      textSize (15); 
      if (has_media) {
        text (this.title, this.img.width + 10, vert + 20);
      } else {
        text (this.title, 10, vert + 20);
      }
    }
    if (has_description) {
      if (this.i_box.in_box (mouseX, mouseY)) {
        fill (30); 
        textAlign (LEFT); 
        textSize (12); 
        if (has_media) {
        text (this.description, this.img.width + 10, vert + 40);
        } 
        else {
          fill (30); 
          textAlign (LEFT); 
          textSize (12);
          text (this.description, 10, vert + 40);
        }
      }
    }
    
    if (this.has_pub_date) {
      fill (0); 
      textAlign (RIGHT); 
      textSize (12); 
      text (this.pub_date, width - 10, vert + i_height - 10);
    }
  }
}