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
// Buttons X and W align left side
float X_Left;
float W_Left;
// Buttons X and W align right side
float X_Right;
float W_Right;
// Buttons Y and H to align heights and used to calculate sizes
float Y_Top1;
float H_Top1;
float Y_Top2;
float H_Top2;
float Y_Top2_2;
float H_Top2_2;
float Y_Top3;
float Y_Top4;
float Y_Top5;
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
// Button[5]
float B5_H;
// Button[6]
float B6_W;
float B6_W_Relocate;
// Button[7]
float B7_X;
float B7_X_Relocate;
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
float Scan_Move_Reverse;
float Scan_Size;
// Opening text
float Opening_Text_X;
float Opening_Text_Y;
float Opening_Text_S;
// AR Glasses text
float AR_Text_X;
float AR_Text_Y;
// Shared text
float Text1_Size;
float Text2_Size;
float Text3_Size;

// COLORS AND TRANSPARANCY
// Colors
int Color_Blue = #2C63D8; // Blue
int Color_White = 255; // White
int Color_Red = #E33247; // Red
int Color_Black = 0; // Black
int Color_Light_Gray = 200; // Light gray
int Color_Dark_Gray = 120; // Dark gray
// Transparecies
int[] Transparency = {0, 126, 200, 255};

// CLASSES
Button_Class[] Button = new Button_Class[8];

// BOOLEANS
// Page events
boolean Page_0 = false;
boolean Page_1 = false;
boolean Page_2 = true;
boolean Page_2_Front = true;
boolean Page_2_1 = false;
boolean Page_2_2 = false;
boolean Page_2_3 = false;
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
  AR_Font = createFont("Helvetica-65-Medium_22443.ttf", 24);

  // SIZES, COORDINATS AND MOVEMENT (some coordinates was found by using the COORDINATION_TOOL)
  // Images and videos
  Image_X = 0;
  Image_Y = 0;
  Image_W = width;
  Image_H = height;
  // Buttons X and W to align left side
  X_Left = width/12.0;
  W_Left = width/2.240664;
  // Buttons X and W to align right side
  X_Right = width/1.849315;
  W_Right = width/1.08;
  // Buttons Y and H to align heights and used to calculate sizes
  Y_Top1 = height/5.9259257;
  H_Top1 = height/3.902439;
  Y_Top2 = height/3.764706;
  H_Top2 = height/2.4489796;
  Y_Top2_2 = height/2.7988338;
  H_Top2_2 = height/2.4489796;
  Y_Top3 = height/2.394015;
  Y_Top4 = height/2.0960698;
  Y_Top5 = height/1.7843866;
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
  // Button[5]
  B5_H = height/2.9268293;
  // Button[6]
  B6_W = width/1.4285715;
  B6_W_Relocate = width/4.1860466;
  // Button[7]
  B7_X = width/1.3300493;
  B7_X_Relocate = width/3.624161;
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
  Scan_Move_Reverse = height;
  Scan_Size = (width + height) / 110;
  // Opening text
  Opening_Text_X = width/2.0074348;
  Opening_Text_Y = height/3.6090226;
  Opening_Text_S = (width + height) / 50;
  // AR Glasses text
  AR_Text_X = width/1.1513859;
  AR_Text_Y = height/3.0;
  // Shared text
  Text1_Size = (width + height) / 55;
  Text2_Size = (width + height) / 110;
  Text3_Size = (width + height) / 45;

  // CLASSES
  // ButtonClass array
  // The last part in the (), called Temp_H in the class template, can be used to measure a size
  Button[0] = new Button_Class(B0_X, B0_Y, B0_W-B0_X, B0_H-B0_Y); // AR glasses
  Button[1] = new Button_Class(B1_X, B1_Y, B1_W-B1_X, B1_H-B1_Y); // Scan fridge
  Button[2] = new Button_Class(X_Left, Y_Top2, W_Left-X_Left, H_Top2-Y_Top2); // Nutrition facts
  Button[3] = new Button_Class(X_Left, Y_Top1, W_Left-X_Left, H_Top1-Y_Top1); // Grocery facts
  Button[4] = new Button_Class(X_Right, Y_Top1, W_Right-X_Right, H_Top1-Y_Top1); // Search for recipes
  Button[5] = new Button_Class(X_Right, Y_Top2, W_Right-X_Right, B5_H-Y_Top2); // Are you willing to go grocery shopping?
  Button[6] = new Button_Class(X_Right, Y_Top2_2, B6_W-X_Right, H_Top2_2-Y_Top2_2); // Yes
  Button[7] = new Button_Class(B7_X, Y_Top2_2, W_Right-B7_X, H_Top2_2-Y_Top2_2); // No
}

void draw() {

  // Page_0 (closed fridge)
  if (Page_0) {

    // Fridge1 (image)
    image(Fridge1, Image_X, Image_Y, Image_W, Image_H);

    // Text setup
    textAlign(CENTER, CENTER);
    textFont(AR_Font);
    fill(Color_Black);

    // Opening text
    textSize(Opening_Text_S);
    text("What’s\nfor\ndinner?", Opening_Text_X, Opening_Text_Y);

    // Clickable AR glasses with text above
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
    stroke(Color_Red, Transparency[3]);
    strokeWeight(Scan_Size);
    line(Scan_X, Scan_Y, Scan_X2, Scan_Y2);
    Scan_Y = Scan_Y + Scan_Move_Y; 
    Scan_Y2 = Scan_Y2 + Scan_Move_Y;

    // Reverses animation
    if (Scan_Y >= Scan_Move_Reverse && Scan_Y2 >= Scan_Move_Reverse) {
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
    {
      // Fridge2 (image)
      background(Color_White);
      tint(Color_White, Transparency[1]); 
      image(Fridge2, Image_X, Image_Y, Image_W, Image_H);

      // "FRIDGE SCANNED" sign
      Button[1].Display(Transparency[1]);
      Button[1].Text("FRIDGE\nSCANNED", Text1_Size, Transparency[1]);

      if (Page_2_Front) {

        // Clickable "Grocery facts"-button
        Button[3].Display_Glow();
        Button[3].Text("Grocery facts", Text1_Size, Transparency[3]);
        Button[3].Page_2_1();

        // Clickable "Search for recipes"-button
        Button[4].Display_Glow();
        Button[4].Text("Search for recipes", Text1_Size, Transparency[3]);
        Button[4].Page_2_2();
      }

      // Page_2_1 if "Grocery facts"-button is clicked (Nutrition facts)
      if (Page_2_1) {

        // "Grocery facts" sign
        Button[3].Display(Transparency[1]);
        Button[3].Text("Grocery facts", Text1_Size, Transparency[1]);

        // "Nutrtition facts" sign (Not transparent)
        Button[2].Display(Transparency[3]);
        Button[2].Text("Apple - 72 kcal (138g)\nSausage - 189 kcal (64g)\nCarrots - 46 kcal (113g)\nPotatoes - 51 kcal (100g)\nMushroom  - 26 kcal (100g)", Text2_Size, Transparency[3]);

        // Clickable "Search for recipes"-button
        Button[4].Relocate(X_Left, Y_Top3, W_Left-X_Left, H_Top2_2-Y_Top2_2);
        Button[4].Display_Glow();
        Button[4].Text("Search for recipes", Text2_Size, Transparency[3]);
        Button[4].Page_2_3();
      }

      // Page_2_2 if "Search for recipes"-button is clicked (Are you willing to go grocery shopping?)
      if (Page_2_2) {

        // "Search for recipes" sign
        Button[4].Display(Transparency[1]);
        Button[4].Text("Search for recipes", Text1_Size, Transparency[1]);

        // "Are you willing to go grocery shopping?" sign (Not transparent)
        Button[5].Display(Transparency[3]);
        Button[5].Text("Are you willing to go grocery shopping?", Text2_Size, Transparency[3]);

        // Clickable "Yes"-button
        Button[6].Display_Glow();
        Button[6].Text("Yes", Text3_Size, Transparency[3]);

        // Clickable "No"-button
        Button[7].Display_Glow();
        Button[7].Text("No", Text3_Size, Transparency[3]);
      }

      // Page_2_3 after Page_2_1
      if (Page_2_3) {

        // "Grocery facts" sign
        Button[3].Display(Transparency[1]);
        Button[3].Text("Grocery facts", Text1_Size, Transparency[1]);

        // "Nutrtition facts" sign
        Button[2].Display(Transparency[1]);
        Button[2].Text("Apple - 72 kcal (138g)\nSausage - 189 kcal (64g)\nCarrots - 46 kcal (113g)\nPotatoes - 51 kcal (100g)\nMushroom  - 26 kcal (100g)", Text2_Size, Transparency[1]);

        // "Search for recipes" sign
        Button[4].Relocate(X_Left, Y_Top3, W_Left-X_Left, H_Top2_2-Y_Top2_2);
        Button[4].Display(Transparency[1]);
        Button[4].Text("Search for recipes", Text2_Size, Transparency[1]);

        // "Are you willing to go grocery shopping?" sign (Not transparent)
        Button[5].Relocate(X_Left, Y_Top4, W_Left-X_Left, B5_H-Y_Top2);
        Button[5].Display(Transparency[3]);
        Button[5].Text("Are you willing to go grocery shopping?", Text2_Size, Transparency[3]);

        // Clickable "Yes"-button
        Button[6].Relocate(X_Left, Y_Top5, B6_W_Relocate-X_Left, H_Top2_2-Y_Top2_2);
        Button[6].Display_Glow();
        Button[6].Text("Yes", Text3_Size, Transparency[3]);

        // Clickable "No"-button
        Button[7].Relocate(B7_X_Relocate, Y_Top5, W_Left-B7_X_Relocate, H_Top2_2-Y_Top2_2);
        Button[7].Display_Glow();
        Button[7].Text("No", Text3_Size, Transparency[3]);
      }
    }
  }
}
