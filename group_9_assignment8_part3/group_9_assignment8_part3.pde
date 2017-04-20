String channel_1_source, channel_2_source, channel_3_source, channel_4_source, channel_5_source;
reader RSSreader;

void setup () {
  size (1000, 800);
  
  channel_1_source = "http://feeds.bbci.co.uk/news/rss.xml?edition=uk";
  channel_2_source = "http://feeds.bbci.co.uk/news/video_and_audio/technology/rss.xml?edition=uk";
  channel_3_source = "https://comicbookrealm.com/rss/previews";
  channel_4_source = "http://news.nationalgeographic.com/index.rss";
  channel_5_source = "https://www.dwell.com/@dwell/rss";
  String[] source_list = {channel_1_source, channel_2_source, channel_3_source, channel_4_source, channel_5_source};
  RSSreader = new reader (source_list);
  
}

void draw () {
  background (100);
  RSSreader.display ();
}


void mouseClicked () {
  if ((RSSreader.near_right)) {
    RSSreader.next_channel ();
  }
  if ((RSSreader.near_left)) {
    RSSreader.previous_channel ();
  }
  if (RSSreader.near_header) {
    link (RSSreader.channels[RSSreader.current_channel].link);
  }
  
  for (int i = 0; i < RSSreader.channels[RSSreader.current_channel].num_items; i++) {
    if ((RSSreader.channels[RSSreader.current_channel].items[i].i_box.in_box (mouseX, mouseY)) && (!RSSreader.near_left) && (!RSSreader.near_right) && (!RSSreader.near_header) && (!RSSreader.near_footer) && (!RSSreader.view_settings)) {
      link (RSSreader.channels[RSSreader.current_channel].items[i].link);
    }
  }
  if (RSSreader.near_settings) {
    RSSreader.view_settings = !RSSreader.view_settings;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (true){
    RSSreader.channels[RSSreader.current_channel].update_item_vert (-20 * int (e));
  }
}