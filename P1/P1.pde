// GLOBAL VARIABLES

// TIME
float Video1_Count;
float Video1_End;
float Video2_Count;
float Video2_End;

// PICTURES, VIDEOS AND FONT
import processing.video.*;
// Pictures
PImage Fridge1;
PImage Fridge2;
// Videos
Movie Video1;
Movie Video2;
// Fonts
PFont AR_Font;

// SIZES AND COORDINATS
// Images and videos
float Image_X;
float Image_Y;
float Image_W;
float Image_H;
// Buttons
float Outline;
// Button[0]
float B1_X;
float B1_Y;
float B1_W;
float B1_H;
// Button[1]
float B2_X;
float B2_Y;
float B2_W;
float B2_H;
// Button[2]
float B3_X;
float B3_Y;
float B3_W;
float B3_H;
// Opening text
float Opening_Text_S;
// Other text
float Text1_S;

// COLORS AND TRANSPARANCY
// Colors
int Color1 = #ED1616; // Red
int Color2 = 255; // White
int Color3 = #EA66FC; // Pink
int Color4 = 0; // Black
int Color5 = 200; // Light grey
// Transparecies
int Transparency1 = 0;
int Transparency2 = 200;
int Transparency3 = 255;

// CLASSES
Button_Class[] Button = new Button_Class[3];

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

  size(540, 960);

  // PICTURES, VIDEOS AND FONTS
  // Pictures
  Fridge1 = loadImage("PAGE_0.png");
  Fridge2 = loadImage("PAGE_1.png");
  // Videos
  Video1 = new Movie(this, "Vid1.1.mp4");
  Video2 = new Movie(this, "Vid2.mp4");
  // Fonts
  AR_Font = loadFont("BerlinSansFB-Bold-48.vlw");

  // SIZES AND COORDINATS (some coordinates was found by using the COORDINATION_TOOL)
  // Images and videos
  Image_X = 0;
  Image_Y = 0;
  Image_W = width;
  Image_H = height;
  // Buttons
  Outline = (width + height) / 220;
  // Button[0]
  B1_X = width/1.320132;
  B1_Y = height/2.0833333;
  B1_W = width/1.1111112;
  B1_H = height/1.7114915;
  // Button[1]
  B2_X = width/3.508772;
  B2_Y = height/25.925;
  B2_W = width/1.3651878;
  B2_H = height/6.7961164;
  // Button[2]
  B3_X = width/7.826087;
  B3_Y = height/4.729064;
  B3_W = width/1.1713666;
  B3_H = height/3.4532373;
  // Opening text
  Opening_Text_S = (width + height) / 35;
  // Other text
  Text1_S = (width + height) / 55;

  // CLASSES
  // ButtonClass
  Button[0] = new Button_Class(B1_X, B1_Y, B1_W-B1_X, B1_H-B1_Y, Color2);
  Button[1] = new Button_Class(B2_X, B2_Y, B2_W-B2_X, B2_H-B2_Y, Color1);
  Button[2] = new Button_Class(B3_X, B3_Y, B3_W-B3_X, B3_H-B3_Y, Color4);
}

void draw() {

  // PAGES
  // PAGE_0 (closed fridge)
  if (Page_0) {

    // Fridge1 (image)
    image(Fridge1, Image_X, Image_Y, Image_W, Image_H);

    // Clickable AR glasses
    Button[0].Display_Glow(Transparency1);
    Button[0].Page_1();
    Button[0].Text("Click for help", Text1_S, Color1);

    // Opening text
    Button[2].Display(Outline, Transparency2);
    Button[2].Text("What’s for dinner?", Opening_Text_S, Color1);

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
  }

  // PAGE_1 (open fridge)
  if (Page_1) { 

    // Fridge2 (image)
    image(Fridge2, Image_X, Image_Y, Image_W, Image_H);

    // Clickable "SCAN FRIDGE"-button
    Button[1].Display(Outline, Transparency2);
    Button[1].Text("SCAN FRIDGE", Text1_S, Color4);
  }
}
