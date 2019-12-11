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
  // Template
  int Color;
  // Other
  int Color1 = 0; //Black

  // TRANSPARENCIES
  float Transparency = 150;
  float Low_Transparency = 150;
  float High_Transparency = 220;
  float Change_Transparency = 4;

  // TEMPLATE
  Button_Class(float Temp_X, float Temp_Y, float Temp_W, float Temp_H, int Temp_Color) {
    X = Temp_X;
    Y = Temp_Y;
    W = Temp_W;
    H = Temp_H;
    Color = Temp_Color;
  }

  // DISPLAY FUNCTIONS
  // Display with no special effect
  void Display(float Outline, int Transparancy) {    

    // Draws the button
    rectMode(CORNER);
    // Sets desired 'Outline' and colors it black
    strokeWeight(Outline);
    stroke(Color1);
    // If no 'Outline' is defined (set to 0). No outline will be drawn
    if (Outline == 0) {
      noStroke();
    }
    fill(Color, Transparancy);
    rect(X, Y, W, H, Corners);
  }

  // Display with a glowing effect
  void Display_Glow(float Outline) {

    // Draws the button
    rectMode(CORNER);
    // Sets desired 'Outline' and colors it black
    strokeWeight(Outline);
    stroke(Color1);
    // If no 'Outline' is defined (set to 0). No outline will be drawn
    if (Outline == 0) {
      noStroke();
    }
    fill(Color, Transparency);
    rect(X, Y, W, H, Corners);

    // Makes the button glow
    Transparency = Transparency + Change_Transparency;
    if (Transparency >= High_Transparency || Transparency <= Low_Transparency) {
      Change_Transparency = Change_Transparency * -1;
    }
  }

  // TEXT FUNCTION
  void Text(String Text, float Size, int Color) {

    // Draws the text
    textFont(AR_Font);
    textAlign(CENTER, CENTER);
    fill(Color);
    textSize(Size);
    text(Text, X, Y, W, H);
  }


  // CLICKABLE PAGE TO PAGE FUCTIONS
  // For Button[0]
  void Page_1() {

    // Starts Vidoe1
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_0 = false;
      Video1_Event = true;
    }
  }

  // For Button[1]
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
