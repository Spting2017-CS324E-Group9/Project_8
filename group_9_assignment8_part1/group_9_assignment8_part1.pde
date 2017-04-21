Table table;

int highest_price = 0;
float highest_depth = 0;

int ideal_price;
float ideal_depth;
float ideal_carat;
int ideal_count;
int premium_price;
float premium_depth;
float premium_carat;
int premium_count;
int good_price;
float good_depth;
float good_carat;
int good_count;
int verygood_price;
float verygood_depth;
float verygood_carat;
int verygood_count;
int fair_price;
float fair_depth;
float fair_carat;
int fair_count;

boolean instruction_view = true;
boolean start_view = false;
boolean price_view = false;
boolean depth_view = false;
boolean carat_view = false;

void setup(){
  size(1200,700);
  
  table = loadTable("diamonds.csv","header");
  
  
  for (TableRow row : table.rows()){
    
    float Carat = row.getFloat("carat");
    String Cut = row.getString("cut");
    float Depth = row.getFloat("depth");
    int Price = row.getInt("price");
    
    //if(Price>highest_price){
    //  highest_price = Price;
    //}
    //if(Depth>highest_depth){
    //  highest_depth = Depth;
    //}
    
    if (Cut.startsWith("Ideal")){
      ideal_price += Price;
      ideal_depth += Depth;
      ideal_carat += Carat;
      ideal_count += 1;
    }
    if (Cut.startsWith("Premium")){
      premium_price += Price;
      premium_depth += Depth;
      premium_carat += Carat;
      premium_count += 1;
    }
    if (Cut.startsWith("Good")){
      good_price += Price;
      good_depth += Depth;
      good_carat += Carat;
      good_count += 1;
    }
    if (Cut.startsWith("Very Good")){
      verygood_price += Price;
      verygood_depth += Depth;
      verygood_carat += Carat;
      verygood_count += 1;
    }
    if (Cut.startsWith("Fair")){
      fair_price += Price;
      fair_depth += Depth;
      fair_carat += Carat;
      fair_count += 1;
    }
  }
}

void draw(){
  if(instruction_view){
    background(#CFFCF1);
    fill(0);
    textAlign(CENTER);
    textSize(25);
    text("This is an interactive bar graph that displays data on diamonds.\nYou will be able to toggle through the different options for the y-axis.\nThe graph will then show the average values of price, depth, and carat based on \nwhether the cut of the diamond is Fair, Good, Very Good, Ideal, or Premium.",600,200);
    textAlign(CENTER);
    text("Press 'S' to Start\nPress 'Q' to quit",600,600);
    
    
  }
  else if(start_view){
    textAlign(CORNER);
    background(#CFFCF1);
    stroke(0);
    strokeWeight(4);
    line(100,100,100,600);
    line(100,600,800,600);
    fill(250,0,0);
    textSize(27);
    text("Press 'P' for price view. \nPress 'D' for depth view. \nPress 'C' for carat view.\nPress 'I' to return to \nthe instructions.\nPress 'Q' to quit.",850,100);
    fill(0);
    textSize(17);
    text("Diamond\n    Cut",804,590);
    
    text("Fair",150,620);
    text("Good",250,620);  
    text("Very Good",350,620);
    text("Ideal",500,620);
    text("Premium",620,620);
    
    // Price View ---------
    
    if(price_view){
      
      
      float graph_height = 280.0;
      float average_price_ideal = ideal_price/ideal_count;
      float average_price_premium = premium_price/premium_count;
      float average_price_fair = fair_price/fair_count;
      float average_price_good = good_price/good_count;
      float average_price_verygood = verygood_price/verygood_count;
      
      float average_ALL = (average_price_ideal+average_price_premium+average_price_fair+average_price_good+average_price_verygood)/5;
  
      float ideal_percentage = (average_price_ideal/average_ALL)*graph_height;
      float premium_percentage = (average_price_premium/average_ALL)*graph_height;    
      float fair_percentage = (average_price_fair/average_ALL)*graph_height;
      float good_percentage = (average_price_good/average_ALL)*graph_height;  
      float verygood_percentage = (average_price_verygood/average_ALL)*graph_height;
      
      fill(0);
      text("Price",84,95);
      
      
      rectMode(CORNERS);
      fill(250,0,0);
      rect(140,600,185,600-fair_percentage);
      fill(0);
      text((int)average_price_fair,138,600-fair_percentage-10);
      
      fill(250,250,0);
      rect(250,600,295,600-good_percentage);
      fill(0);
      text((int)average_price_good,248,600-good_percentage-10);
  
      
      fill(250,0,250);
      rect(370,600,415,600-verygood_percentage);
      fill(0);
      text((int)average_price_verygood,368,600-verygood_percentage-10);
      
      fill(0,250,250);
      rect(495,600,540,600-ideal_percentage);
      fill(0);
      text((int)average_price_ideal,493,600-ideal_percentage-10);
      
      fill(0,250,0);
      rect(635,600,680,600-premium_percentage);
      fill(0);
      text((int)average_price_premium,633,600-premium_percentage-10);
      
    }
    
    // Depth View ---------
    
    if(depth_view){
     
      float graph_height = 280.0;
      float average_depth_ideal = ideal_depth/ideal_count;
      float average_depth_premium = premium_depth/premium_count;
      float average_depth_fair = fair_depth/fair_count;
      float average_depth_good = good_depth/good_count;
      float average_depth_verygood = verygood_depth/verygood_count;
      
      float average_ALL = (average_depth_ideal+average_depth_premium+average_depth_fair+average_depth_good+average_depth_verygood)/5;
  
      float ideal_percentage = (average_depth_ideal/average_ALL)*graph_height;
      float premium_percentage = (average_depth_premium/average_ALL)*graph_height;    
      float fair_percentage = (average_depth_fair/average_ALL)*graph_height;
      float good_percentage = (average_depth_good/average_ALL)*graph_height;  
      float verygood_percentage = (average_depth_verygood/average_ALL)*graph_height;
  
      fill(0);
      text("Depth",84,95);
      
      
      rectMode(CORNERS);
      fill(250,0,0);
      rect(140,600,185,600-fair_percentage);
      fill(0);
      text(average_depth_fair,138,600-fair_percentage-10);
      
      fill(250,250,0);
      rect(250,600,295,600-good_percentage);
      fill(0);
      text(average_depth_good,248,600-good_percentage-10);
  
      
      fill(250,0,250);
      rect(370,600,415,600-verygood_percentage);
      fill(0);
      text(average_depth_verygood,368,600-verygood_percentage-10);
      
      fill(0,250,250);
      rect(495,600,540,600-ideal_percentage);
      fill(0);
      text(average_depth_ideal,493,600-ideal_percentage-10);
      
      fill(0,250,0);
      rect(635,600,680,600-premium_percentage);
      fill(0);
      text(average_depth_premium,633,600-premium_percentage-10);    
    }
  
     // Carat View ---------
    
    if(carat_view){
     
      float graph_height = 280.0;
      float average_carat_ideal = ideal_carat/ideal_count;
      float average_carat_premium = premium_carat/premium_count;
      float average_carat_fair = fair_carat/fair_count;
      float average_carat_good = good_carat/good_count;
      float average_carat_verygood = verygood_carat/verygood_count;
      
      float average_ALL = (average_carat_ideal+average_carat_premium+average_carat_fair+average_carat_good+average_carat_verygood)/5;
  
      float ideal_percentage = (average_carat_ideal/average_ALL)*graph_height;
      float premium_percentage = (average_carat_premium/average_ALL)*graph_height;    
      float fair_percentage = (average_carat_fair/average_ALL)*graph_height;
      float good_percentage = (average_carat_good/average_ALL)*graph_height;  
      float verygood_percentage = (average_carat_verygood/average_ALL)*graph_height;
  
      fill(0);
      text("Carat",84,95);
  
      
      rectMode(CORNERS);
      fill(250,0,0);
      rect(140,600,185,600-fair_percentage);
      fill(0);
      text(average_carat_fair,138,600-fair_percentage-10);
      
      fill(250,250,0);
      rect(250,600,295,600-good_percentage);
      fill(0);
      text(average_carat_good,248,600-good_percentage-10);
  
      
      fill(250,0,250);
      rect(370,600,415,600-verygood_percentage);
      fill(0);
      text(average_carat_verygood,368,600-verygood_percentage-10);
      
      fill(0,250,250);
      rect(495,600,540,600-ideal_percentage);
      fill(0);
      text(average_carat_ideal,493,600-ideal_percentage-10);
      
      fill(0,250,0);
      rect(635,600,680,600-premium_percentage);
      fill(0);
      text(average_carat_premium,633,600-premium_percentage-10);    
    }
  }
    
}

void keyPressed(){
  
  if (key=='s' && instruction_view){
    instruction_view = false;
    start_view = true;
  }
  
  if (key=='p' && start_view){
    carat_view = false;
    depth_view = false;
    price_view = true;
  }
  
  if (key=='d' && start_view){
    carat_view = false;
    price_view = false;
    depth_view = true;
  }
  
  if (key=='c' && start_view){
    carat_view = true;
    price_view = false;
    depth_view = false;
    
  }
  
  if (key=='i' && start_view){
    carat_view = false;
    price_view = false;
    depth_view = false;
    start_view = false;
    instruction_view = true;
  }
  
  if (key=='q'){
    exit();
  }
  
}