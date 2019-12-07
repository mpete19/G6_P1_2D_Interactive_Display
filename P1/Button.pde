class Button {
  float temp_y;
  float temp_x;
  float temp_height;
  float temp_width;

  float y;
  float x;
  float h;
  float w;

  boolean mouseHover;
  boolean buttonClicked;
  boolean nextpage;


  Button(float temp_x, float temp_y, float temp_width, float temp_height) {
    y=temp_y;
    x=temp_x;
    h=temp_height;
    w=temp_width;
  }

  void display() {
    rectMode(CORNER);
    rect(x, y, w, h);
  }

  void mousehover() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      mouseHover =true;
      rect(10,10,10,10);
    }
    else { 
      mouseHover =false;
      background(img);
    }
  }
  
  void clickable() {
    if(mousePressed){
      if(mouseHover){
        print("clicked");
        nextpage =true;
       
      }
    }
  }
}
