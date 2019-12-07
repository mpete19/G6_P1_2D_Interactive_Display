// setup af programmet
Button Button1;
Button Button2;
PImage img;
import processing.video.*;


void setup() {
  size(400, 700);
  background (0);
  img = loadImage("koleskab.jpg");
  background(img);

  Button1 = new Button(150, 225, 50, 150);
  
  
}
void draw() {
  rectMode(CENTER);
  Button1.mousehover();
  Button1.display();
  Button1.clickable();
  
    
}
