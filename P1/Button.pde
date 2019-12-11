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
  int Color1 = #2C63D8; // Blue
  int Color2 = 0; //Black

  // TRANSPARENCIES
  float Transparency = 180;
  float Low_Transparency = 180;
  float High_Transparency = 220;
  float Change_Transparency = 4;

  // TEMPLATE
  Button_Class(float Temp_X, float Temp_Y, float Temp_W, float Temp_H) {
    X = Temp_X;
    Y = Temp_Y;
    W = Temp_W;
    H = Temp_H;
  }

  // DISPLAY FUNCTIONS
  // Display with no special effect
  void Display(float Temp_Outline, int Temp_Transparancy_Outline, int Temp_Transparancy) {    

    // Draws the button
    rectMode(CORNER);
    // Sets desired 'Outline' and colors it black
    strokeWeight(Temp_Outline);
    stroke(Color2, Temp_Transparancy_Outline);
    // If no 'Outline' is defined (set to 0). No outline will be drawn
    if (Temp_Outline == 0) {
      noStroke();
    }
    fill(Color1, Temp_Transparancy);
    rect(X, Y, W, H, Corners);
  }

  // Display with a glowing effect
  void Display_Glow(float Temp_Outline) {

    // Draws the button
    rectMode(CORNER);
    // Sets desired 'Outline' and colors it black
    strokeWeight(Temp_Outline);
    stroke(Color2, Transparency);
    // If no 'Outline' is defined (set to 0). No outline will be drawn
    if (Temp_Outline == 0) {
      noStroke();
    }
    fill(Color1, Transparency);
    rect(X, Y, W, H, Corners);

    // Makes the button glow
    Transparency = Transparency + Change_Transparency;
    if (Transparency >= High_Transparency || Transparency <= Low_Transparency) {
      Change_Transparency = Change_Transparency * -1;
    }
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
  // For Button[0]
  void Page_1() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_0 = false;
      Video1_Event = true;
    }
  }

  // For Button[1]
  void Page_2() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1 = false;
      Scan_Fridge = true;
    }
  }
}
