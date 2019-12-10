class Button_Class {
  // CLASS VARIALBES

  // SIZES AND COORDINATS
  float X;
  float Y;
  float W;
  float H;
  int Corners = 20;

  // COLORS
  int Color;

  // TRANSPARENCIES
  float Transparency = 150;
  float Low_Transparency = 126;
  float High_Transparency = 210;
  float Change_Transparency = 1;

  // TEMPLATE
  Button_Class(float Temp_X, float Temp_Y, float Temp_W, float Temp_H, int Temp_Color) {
    X = Temp_X;
    Y = Temp_Y;
    W = Temp_W;
    H = Temp_H;
    Color = Temp_Color;
  }

  // DISPLAY FUNCTIONS
  void Display() {    

    // Draws the button
    rectMode(CORNER);
    noStroke();
    fill(Color);
    rect(X, Y, W, H, Corners);
  }

  void Display_Glow() {

    // Draws the button
    rectMode(CORNER);
    noStroke();
    fill(Color, Transparency);
    rect(X, Y, W, H, Corners);

    // Makes the button glow
    Transparency = Transparency + Change_Transparency;
    if (Transparency >= High_Transparency || Transparency <= Low_Transparency) {
      Change_Transparency = Change_Transparency * -1;
    }
  }

  // TEXTBOX FUNCTION
  void Textbox(String Text, int Color, float Size) {

    // Draws the text
    textAlign(CENTER, CENTER);
    fill(Color);
    textSize(Size);
    text(Text, X, Y, W, H);
  }


  // CLICKABLE PAGE TO PAGE FUCTIONS
  void Page_1() {

    // Starts Vidoe1
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_0 = false;
      Video1_Event = true;
    }
  }

  void Page_1_1() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1 = false;
      Page_1_1 = true;
    }
  }

  void Page_1_2() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1_1 = false;
      Page_1_2 = true;
    }
  }

  void Page_1_3() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1_2 = false;
      Page_1_3 = true;
    }
  }
}
