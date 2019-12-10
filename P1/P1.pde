// GLOBAL VARIABLES

// TIME
float Video1_Count;
float Video1_End;
float Video2_Count;
float Video2_End;

// PICTURES AND VIDEOS
import processing.video.*;
PImage Fridge1;
PImage Fridge2;
Movie Video1;
Movie Video2;

// SIZES AND COORDINATS
// Images and videos
float Image_X;
float Image_Y;
float Image_W;
float Image_H;
// Buttons
float B1_X;
float B1_Y;
float B1_W;
float B1_H;
float B2_X;
float B2_Y;
float B2_W;
float B2_H;
// Text
float Text1_S;

// COLORS
// Colors
int Color1 = 0; // Black
int B1_Color = 255; // White
int B2_Color = #1722D3; // Blue

// CLASSES
Button_Class[] Button = new Button_Class[2];

// BOOLEANS
// Page events
boolean Page_0 = true;
boolean Page_1 = false;
boolean Page_1_1 = false;
boolean Page_1_2 = false;
boolean Page_1_3 = false;
// Video events
boolean Video1_Event = false;
boolean Video2_Event = false;

void setup() {

  size(400, 700);

  // PICTURES AND VIDEOS
  Fridge1 = loadImage("PAGE_0.png");
  Fridge2 = loadImage("PAGE_1.png");
  Video1 = new Movie(this, "Vid1.mp4");
  Video2 = new Movie(this, "Vid2.mp4");

  // SIZES AND COORDINATS
  // Images and videos
  Image_X = 0;
  Image_Y = 0;
  Image_W = width;
  Image_H = height;
  // Button (coordinates found by using COORDINATION_TOOL)
  B1_X = width/1.320132;
  B1_Y = height/2.0833333;
  B1_W = width/1.1111112;
  B1_H = height/1.7114915;
  B2_X = width/3.508772;
  B2_Y = height/25.925;
  B2_W = width/1.3651878;
  B2_H = height/6.7961164;
  // Text
  Text1_S = (width + height) / 55;

  // CLASSES
  // ButtonClass
  Button[0] = new Button_Class(B1_X, B1_Y, B1_W-B1_X, B1_H-B1_Y, B1_Color);
  Button[1] = new Button_Class(B2_X, B2_Y, B2_W-B2_X, B2_H-B2_Y, B2_Color);
}

void draw() {

  // PAGES
  // PAGE_0 (closed fridge)
  if (Page_0) {

    // Fridge1 (image)
    image(Fridge1, Image_X, Image_Y, Image_W, Image_H);

    // Clickable AR glasses
    Button[0].Display_Glow();
    Button[0].Page_1();

    // PAGE_0 to PAGE_1 (video transition)
    // First part
  } else if (Video1_Event) {

    // Plays Video1 (video)
    Video1.play();
    image(Video1, Image_X, Image_Y, Image_W, Image_H);

    // Counts towards the end of Video1
    Video1_Count = int(Video1.time());
    Video1_End = int(Video1.duration());

    // Ends first part and move forward to second part of the video transition
    if (Video1_Count >= Video1_End) {

      Video1_Event = false;
      Video2_Event = true;
    }

    // Second part
  } else if (Video2_Event) {

    // Plays Video2 (video)
    Video2.play();
    image(Video2, Image_X, Image_Y, Image_W, Image_H);

    // Counts towards the end of Video2
    Video2_Count = int(Video2.time());
    Video2_End = int(Video2.duration());

    // Ends video transition and continues to PAGE_1
    if (Video2_Count >= Video2_End) {

      Video2_Event = false;
      Page_1 = true;
    }

    // PAGE_1 (open fridge)
  } else if (Page_1) { 

    // Fridge2 (image)
    image(Fridge2, Image_X, Image_Y, Image_W, Image_H);

    // Clickable "SCAN FRIDGE"-button
    Button[1].Display();
    Button[1].Textbox("SCAN FRIDGE", Color1, Text1_S);
  }
}
