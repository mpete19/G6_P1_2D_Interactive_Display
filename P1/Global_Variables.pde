// STRINGS
String Opening_Text = "What's\nfor\ndinner?";
String AR_Glasses_Text = "Click\nfor\nhelp";
String Scan_Fridge_Text = "SCAN FRIDGE";
String Scanning_Text = "SCANNING\n";
String Percentage_Symbol_Text = "%";
String Fridge_Scanned_Text = "FRIDGE\nSCANNED";
String Grocery_Facts_Text = "Grocery facts";
String Search_For_Recipes_Text = "Search for recipes";
String Nutrition_Text = "Apple - 72 kcal (138g)\nSausage - 189 kcal (64g)\nCarrots - 46 kcal (113g)\nPotatoes - 51 kcal (100g)\nMushroom  - 26 kcal (100g)";
String Shopping_Text = "Are you willing to go grocery shopping in order to get more recipes?";
String Yes_Text = "Yes, expand my options";
String No_Text = "No, find recipes from current inventory";
String Go_Back_Text = "BACK";

// TIME AND COUNTERS
float Video_Count;
float Video_End;
float Percentage_Increase = 0.8;
float Percentage_Count = 0;
float Percantage_Max = 100;

// PICTURES, VIDEOS AND FONT
import processing.video.*;
// Pictures
PImage Fridge1;
PImage Fridge2;
// Videos
Movie Video1;
Movie Video2;
Movie Video3;
// Fonts
PFont AR_Font;

// CLASSES
Button_Class[] Button = new Button_Class[8];

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
float Y_Top3_Left;
float H_Top3_Left;
float Y_Top3_Right;
float H_Top3_Right;
float Y_Top4_Left;
float H_Top4_Left;
float Y_Top5_Left;
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
int Color_White = 255; // White
int Color_Red = #E33247; // Red
int Color_Black = 0; // Black
// Transparecies
int[] Transparency = {0, 126, 200, 255};

// BOOLEANS
// Page events
boolean Page_0 = true;
boolean Page_1 = false;
boolean Page_2 = false;
boolean Page_2_Front = false;
boolean Page_2_1 = false;
boolean Page_2_2 = false;
boolean Page_2_3 = false;
// Video events and transitions
boolean Video1_Event = false;
boolean Video2_Event = false;
boolean Scan_Fridge = false;
boolean Video3_Event = false;
