// GLOBAL VARIABLES

// PICTURES AND VIDEOS
import processing.video.*;
PImage Fridge;
Movie TEST;

// CLASSES
Button_Class[] Button = new Button_Class[2];

// SIZES AND COORDINATS
// Fridge (image)
float Image_X;
float Image_Y;
float Image_W;
float Image_H;

// BOOLEANS
boolean Fridge_Handle_Clicked = false;

void setup() {
  size(400, 700);

  // PICTURES AND VIDEOS
  Fridge = loadImage("koleskab.jpg");
  TEST = new Movie(this, "Test.mp4");
  TEST.play();

  // CLASSES
  // Fridge handle button
  Button[0] = new Button_Class(width/2.631579, height/3.0837004, width/1.9138756-width/2.631579, height/1.9390582-height/3.0837004);
  //Button[1] = new Button_Class(,,,);

  // SIZES AND COORDINATS
  // Fridge (image)
  Image_X = 0;
  Image_Y = 0;
  Image_W = width;
  Image_H = height;
}

void draw() {

  // PAGE 0 (closed fridge)
  if (!Fridge_Handle_Clicked) {

    // Fridge (image)
    image(Fridge, Image_X, Image_Y, Image_W, Image_H);

    // Clickable fridge handle
    Button[0].Display();
    Button[0].Clickable_Fridge_Handle();

    // PAGE 1
  } else if (Fridge_Handle_Clicked) {

    // TEST (video)
    image(TEST, Image_X, Image_Y, Image_W, Image_H);
  }
}
