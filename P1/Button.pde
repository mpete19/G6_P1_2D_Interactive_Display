class Button_Class {
  // CLASS VARIALBES

  // SIZES AND COORDINATS
  // Template  
  float X;
  float Y;
  float W;
  float H;

  // Rect specific
  int Corners = 20; // Used to make curved edges

  // COLORS
  int Color1 = #427BF2; // Blue
  int Color2 = 0; //Black

  // TRANSPARENCIES
  float Transparency = 155;
  float Low_Transparency = 155;
  float High_Transparency = 255;
  float Change_Transparency = 7;

  // TEMPLATE
  Button_Class(float Temp_X, float Temp_Y, float Temp_W, float Temp_H) {
    X = Temp_X;
    Y = Temp_Y;
    W = Temp_W;
    H = Temp_H;
  }

  // DISPLAY FUNCTIONS
  // Display with no special effect
  void Display(int Temp_Transparancy) {    

    // Draws the button
    rectMode(CORNER);
    noStroke();
    fill(Color1, Temp_Transparancy);
    rect(X, Y, W, H, Corners);
  }

  // Display with a glowing effect
  void Display_Glow() {

    // Draws the button
    rectMode(CORNER);
    noStroke();
    fill(Color1, Transparency);
    rect(X, Y, W, H, Corners);

    // Makes the button glow
    Transparency = Transparency + Change_Transparency;
    if (Transparency >= High_Transparency || Transparency <= Low_Transparency) {
      Change_Transparency = Change_Transparency * -1;
    }
  }

  // RELOCATE FUCTION
  void Relocate(float Temp_X, float Temp_Y, float Temp_W, float Temp_H) {

    // Changes coordinates of the template
    X = Temp_X;
    Y = Temp_Y;
    W = Temp_W;
    H = Temp_H;
  }

  // TEXT FUNCTION
  void Text(String Text, float Size, int Transparency) {

    // Draws the text
    textFont(AR_Font);
    textAlign(CENTER, CENTER);
    fill(Color2, Transparency);
    textSize(Size);
    text(Text, X, Y, W, H);
  }


  // CLICKABLE PAGE TO PAGE FUCTIONS

  // AR Glasses
  void Page_1() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_0 = false;
      Video1_Event = true;
    }
  }

  // Page_2 (flow chart on open fridge)
  void Page_2() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1 = false;
      Scan_Fridge = true;
    }
  }

  void Back_To_Page_2_Front() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_2_Front = true;
      Page_2_1 = false;
      Page_2_2 = false;
      Page_2_3 = false;

      // Reset button locations
      Button[4].Relocate(X_Right, Y_Top1, W_Right-X_Right, H_Top1-Y_Top1);
      Button[5].Relocate(X_Right, Y_Top2, W_Right-X_Right, B5_H-Y_Top2);
      Button[6].Relocate(X_Right, Y_Top3_Right, B6_W-X_Right, H_Top3_Right-Y_Top3_Right);
      Button[7].Relocate(B7_X, Y_Top3_Right, W_Right-B7_X, H_Top3_Right-Y_Top3_Right);
    }
  }

  void Page_2_1() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_2_Front = false;
      Page_2_1 = true;
    }
  } 

  void Page_2_2() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_2_Front = false;
      Page_2_2 = true;
    }
  }

  void Page_2_3() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_2_1 = false;
      Page_2_3 = true;
    }
  }

  void Yes() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_2 = false;
      Page_2_2 = false;
      Page_2_3 = false;
      Video3_Event = true;
    }
  }
}
