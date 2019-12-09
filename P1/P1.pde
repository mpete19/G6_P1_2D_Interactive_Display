// GLOBAL VARIABLES
int skiftTid;
int videoTid = 5000;

// PICTURES AND VIDEOS
import processing.video.*;
PImage Fridge;
Movie TEST;

// CLASSES
Button_Class[] Button = new Button_Class[4];

// SIZES AND COORDINATS
// Fridge (image)
float Image_X;
float Image_Y;
float Image_W;
float Image_H;

// BOOLEANS
Boolean Page_0 = true;
Boolean Video = false;
boolean Page_1 = false;
boolean Page_1_1 = false;
boolean Page_1_2 = false;
Boolean Page_1_3 = false;

void setup() {
  size(400, 700);

  // PICTURES AND VIDEOS
  Fridge = loadImage("koleskab.jpg");
  TEST = new Movie(this, "Test.mp4");


  // CLASSES
  // Fridge handle button
  Button[0] = new Button_Class(width/2.631579, height/3.0837004, width/1.9138756-width/2.631579, height/1.9390582-height/3.0837004);
  Button[1] = new Button_Class(100, 100, 300, 150);
  Button[2] = new Button_Class(100, 250, 300, 150);
  Button[3] = new Button_Class(100, 400, 300, 150);



  // SIZES AND COORDINATS
  // Fridge (image)
  Image_X = 0;
  Image_Y = 0;
  Image_W = width;
  Image_H = height;
}

void draw() {

  // PAGE 0 (closed fridge)
  if (Page_0) {

    // Fridge (image)
    image(Fridge, Image_X, Image_Y, Image_W, Image_H);

    // Clickable fridge handle
    Button[0].Display();
    Button[0].Page_1();

    // PAGE 1
  } else if (Video) {


    // TEST (video)
    TEST.play(); 
    image(TEST, Image_X, Image_Y, Image_W, Image_H);
    // Calculate how much time has passed
    int tidBrugt = millis() - skiftTid;
    // Has five seconds passed?
    if (tidBrugt > videoTid) {
      println("5 seconds have passed!");
      Video = false;
      Page_1 = true;
    }
  } else if (Page_1) {
    image(Fridge, Image_X, Image_Y, Image_W, Image_H);

    Button[1].Display();
    Button[1].Page_1_1();
    Button[2].Display();
    Button[2].Page_1_2();
    Button[3].Display();
    Button[3].Page_1_3();
  }
}
