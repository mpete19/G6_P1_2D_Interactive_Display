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
String Dal_Text = "Dal (1 serving, 104 kcal)\nCreate a grocery list";
String Egg_Pie_Text = "Egg pie (1 serving, 406 kcal)\nCreate a grocery list";
String Risotto_Text = "Risotto (1 serving, 222 kcal)\nCreate a grocery list";
String Pasta_Text = "Pasta bolognese (1 serving, 364 kcal)\nStart cooking!";
String Noodle_Text = "Fried noodles (1 serving, 286 kcal)\nStart cooking!";
String Soup_Text = "Tomato soup (1 serving, 204 kcal)\nStart cooking!";
String Link_Text = "Here is an example of how AR can assist you when preparing a meal";
String Link_Text2 = "Exit and open youtube";
String Link = "https://www.youtube.com/watch?v=N2Rq0p7j5Xw";

// TIME AND COUNTERS
float Video_Count;
float Video_End;
float Percentage_Increase = 0.8;
float Percentage_Count = 0;
float Percantage_Max = 100;

// PICTURES, VIDEOS, FONTS AND SOUNDS
import processing.video.*;
import processing.sound.*;
// Pictures
PImage Fridge1;
PImage Fridge2;
PImage Door_No_List;
PImage Door_List;
// Videos
Movie Video1;
Movie Video2;
Movie Video3;
// Fonts
PFont AR_Font;
// Sound
SoundFile Sound1;
SoundFile Sound2;
SoundFile Sound3;
SoundFile Sound4;
SoundFile Sound5;
SoundFile Sound6;
SoundFile Sound7;
SoundFile Sound8;

// CLASSES
Button_Class[] Button = new Button_Class[13];

// SIZES, COORDINATS AND MOVEMENT
// Images and videos
float Image_X;
float Image_Y;
float Image_W;
float Image_H;
// Buttons X and W to align
float X_Left;
float W_Left;
float X_Right;
float W_Right;
float X_Link;
float W_Link;
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
float Y_Top4_Right;
float H_Top4_Right;
float Y_Top5_Left;
float Y_Top5_Right;
float Y_Top6_Left;
float H_Top6_Left;
float Y_Top6_Right;
float Y_Top7_Left;
float Y_Top8_Left;
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
// Buttons[11]
float B11_Y;
float B11_H;
// Button[12]
float B12_Y;
float B12_H;
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
boolean Page_2_1_2 = false;
boolean Page_2_1_Yes = false;
boolean Page_2_1_No = false;
boolean Page_2_2_1 = false;
boolean Page_2_2_Yes = false;
boolean Page_2_2_No = false;
boolean Page_3 = false;
// Video events and transitions
boolean Video1_Event = false;
boolean Video2_Event = false;
boolean Scan_Fridge = false;
boolean Video3_Event = false;
// Yes or no
boolean Yes = false;
boolean No = false;
// Sound
boolean Sound_1 = true;
boolean Sound_2 = false;
boolean Sound_3 = false;
boolean Sound_4 = false;
boolean Sound_5 = false;
boolean Sound_6 = false;
boolean Sound_7 = false;
boolean Sound_8 = false;
