// GLOBAL VARIABLES

// TIME AND COUNTERS
float Video1_Count;
float Video1_End;
float Video2_Count;
float Video2_End;
float Percentage_Increase = 0.8;
float Percentage_Count = 0;

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

// SIZES, COORDINATS AND MOVEMENT
// Images and videos
float Image_X;
float Image_Y;
float Image_W;
float Image_H;
// Button[0]
float B0_X;
float B0_Y;
float B0_W;
float B0_H;
// Button[1]
float B1_X;
float B1_Y;
float B1_W;
float B1_H;
// Button[2]
float B2_X;
float B2_Y;
float B2_W;
float B2_H;
// Button[3]
float B3_X;
float B3_Y;
float B3_W;
float B3_H;
// Button[4]
float B4_X;
float B4_Y;
float B4_W;
float B4_H;
// Arrow to AR glasses
float AR_Arrow_X;
float AR_Arrow_Y;
float AR_Arrow_X2;
float AR_Arrow_Y2;
float AR_Arrow_X3;
float AR_Arrow_Y3;
float AR_Line_X;
float AR_Line_Y;
float AR_Line_X2;
float AR_Line_Y2;
float Arrow_Size;
// Scan line
float Scan_X;
float Scan_Y;
float Scan_X2;
float Scan_Y2;
float Scan_Move_Y;
float Scan_Size;
// Opening text
float Opening_Text_S;
// AR Glasses text
float AR_Text_X;
float AR_Text_Y;
// Other text
float Text1_Size;

// COLORS AND TRANSPARANCY
// Colors
int Color1 = #2C63D8; // Blue
int Color2 = 255; // White
int Color3 = #E33247; // Red
int Color4 = 0; // Black
int Color5 = 200; // Light grey
int Color6 = 120; // Dark grey
// Transparecies
int[] Transparency = {0, 126, 200, 255};

// CLASSES
Button_Class[] Button = new Button_Class[5];

// BOOLEANS
// Page events
boolean Page_0 = true;
boolean Page_1 = false;
boolean Page_2 = false;
// Video events and transitions
boolean Video1_Event = false;
boolean Video2_Event = false;
boolean Scan_Fridge = false;

void setup() {

  size(540, 960);

  // PICTURES, VIDEOS AND FONTS
  // Pictures
  Fridge1 = loadImage("Vid1_Trim_Moment.jpg");
  Fridge2 = loadImage("Vid2_Trim_Moment.jpg");
  // Videos
  Video1 = new Movie(this, "Vid1_Trim.mp4");
  Video2 = new Movie(this, "Vid2_Trim.mp4");
  // Fonts
  AR_Font = loadFont("BerlinSansFB-Bold-48.vlw");

  // SIZES, COORDINATS AND MOVEMENT (some coordinates was found by using the COORDINATION_TOOL)
  // Images and videos
  Image_X = 0;
  Image_Y = 0;
  Image_W = width;
  Image_H = height;
  // Button[0]
  B0_X = width/1.320132;
  B0_Y = height/2.0833333;
  B0_W = width/1.1111112;
  B0_H = height/1.7114915;
  // Button[1]
  B1_X = width/3.508772;
  B1_Y = height/25.925;
  B1_W = width/1.3651878;
  B1_H = height/6.7961164;
  // Button[2]
  B2_X = width/7.826087;
  B2_Y = height/4.729064;
  B2_W = width/1.1713666;
  B2_H = height/3.4532373;
  // Button[3]
  B3_X = width/12.0;
  B3_Y = height/6;
  B3_W = width/2.240664;
  B3_H = height/3.9834025;
  // Button[4]
  B4_X = width/1.849315;
  B4_Y = height/5.9259257;
  B4_W = width/1.08;
  B4_H = height/3.9834025;
  // Arrow to AR glasses
  AR_Arrow_X = width/1.2189616;
  AR_Arrow_Y = height/2.1192052;
  AR_Arrow_X2 = width/1.2471131;
  AR_Arrow_Y2 = height/2.2429907;
  AR_Arrow_X3 = width/1.1612903;
  AR_Arrow_Y3 = height/2.2068965;
  AR_Line_X = width/1.2026726;
  AR_Line_Y = height/2.2222223;
  AR_Line_X2 = width/1.1663067;
  AR_Line_Y2 = height/2.4935064;
  Arrow_Size = (width + height) / 220;
  // Scan line
  Scan_X = 0;
  Scan_Y = 0;
  Scan_X2 = width;
  Scan_Y2 = 0;
  Scan_Move_Y = height/65;
  Scan_Size = (width + height) / 110;
  // Opening text
  Opening_Text_S = (width + height) / 50;
  // AR Glasses text
  AR_Text_X = width/1.1612903;
  AR_Text_Y = height/2.8486648;
  // Other text
  Text1_Size = (width + height) / 55;

  // CLASSES
  // ButtonClass
  Button[0] = new Button_Class(B0_X, B0_Y, B0_W-B0_X, B0_H-B0_Y); // AR glasses
  Button[1] = new Button_Class(B1_X, B1_Y, B1_W-B1_X, B1_H-B1_Y); // Scan fridge
  Button[2] = new Button_Class(B2_X, B2_Y, B2_W-B2_X, B2_H-B2_Y); // Opening text
  Button[3] = new Button_Class(B3_X, B3_Y, B3_W-B3_X, B3_H-B3_Y); // Grocery facts
  Button[4] = new Button_Class(B4_X, B4_Y, B4_W-B4_X, B4_H-B4_Y); // Search for recipes
}

void draw() {

  // Page_0 (closed fridge)
  if (Page_0) {

    // Fridge1 (image)
    image(Fridge1, Image_X, Image_Y, Image_W, Image_H);

    // Opening sign
    Button[2].Text("What’s for dinner?", Opening_Text_S, Transparency[3]);

    // Clickable AR glasses with text above
    textAlign(CENTER, CENTER);
    textFont(AR_Font);
    textSize(Text1_Size);
    text("Click\nfor\nhelp", AR_Text_X, AR_Text_Y);
    Button[0].Page_1();

    // Arrow leading form AR glass text to AR glasses
    strokeWeight(Arrow_Size);
    line(AR_Line_X, AR_Line_Y, AR_Line_X2, AR_Line_Y2);
    triangle(AR_Arrow_X, AR_Arrow_Y, AR_Arrow_X2, AR_Arrow_Y2, AR_Arrow_X3, AR_Arrow_Y3);

    // Page_0 to Page_1 (video transition)
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

    // Ends video transition and continues to Page_1
    if (Video2_Count >= Video2_End) {

      Video2_Event = false;
      Page_1 = true;
    }
  }

  // Page_1 (open fridge)
  if (Page_1) { 

    // Fridge2 (image)
    image(Fridge2, Image_X, Image_Y, Image_W, Image_H);

    // Clickable "SCAN FRIDGE"-button
    Button[1].Display_Glow();
    Button[1].Text("SCAN FRIDGE", Text1_Size, Transparency[3]);
    Button[1].Page_2();

    // Page_1 to Page_2 (animation transition)
  } else if (Scan_Fridge) {

    // Fridge2 (image)
    image(Fridge2, Image_X, Image_Y, Image_W, Image_H);

    // "SCANNING" sign
    Button[1].Display(Transparency[1]);
    Button[1].Text("SCANNING\n"+int(Percentage_Count)+"%", Text1_Size, Transparency[1]);

    // Starts a counter that illustrates a percentage counter of the scanning process
    Percentage_Count = Percentage_Count + Percentage_Increase;

    // Stops the perentage counter and sets it to '100' if it increases to or above 100
    if (Percentage_Count >= 100) {
      Percentage_Count = 100;
    }

    // Scan animation
    stroke(Color3, Transparency[3]);
    strokeWeight(Scan_Size);
    line(Scan_X, Scan_Y, Scan_X2, Scan_Y2);
    Scan_Y = Scan_Y + Scan_Move_Y; 
    Scan_Y2 = Scan_Y2 + Scan_Move_Y;

    // Reverses animation
    if (Scan_Y >= height && Scan_Y2 >= height) {
      Scan_Move_Y = Scan_Move_Y * -1;
    } 

    // Ends animation transition and continues to Page_2
    if (Scan_Y < 0 && Scan_Y2 < 0) {
      Scan_Fridge = false;
      Page_2 = true;
    }
  } 

  // Page_2 (flow chart on open fridge)
  if (Page_2) {
    // Fridge2 (image)
    image(Fridge2, Image_X, Image_Y, Image_W, Image_H);

    // "FRIDGE SCANNED" sign
    Button[1].Display(Transparency[1]);
    Button[1].Text("FRIDGE\nSCANNED", Text1_Size, Transparency[1]);

    // Clickable "Grocery facts"-button
    Button[3].Display_Glow();
    Button[3].Text("Grocery facts", Text1_Size, Transparency[3]);

    // Clickable "Search for recipes"-button
    Button[4].Display_Glow();
    Button[4].Text("Search for recipes", Text1_Size, Transparency[3]);
  }
}
