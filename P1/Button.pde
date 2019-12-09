class Button_Class {
  // CLASS VARIALBES

  // SIZES AND COORDINATS
  float X;
  float Y;
  float W;
  float H;

  // COLORS AND TRANSPARENCIES
  int Color_1 = 255;
  int Transparency = 126;

  // TEMPLATE
  Button_Class(float Temp_X, float Temp_Y, float Temp_W, float Temp_H) {
    X=Temp_X;
    Y=Temp_Y;
    W=Temp_W;
    H=Temp_H;
  }

  // DISPLAY FUNCTION
  void Display() {
    rectMode(CORNER);
    fill(Color_1, Transparency);
    rect(X, Y, W, H, 20);
  }

  // CLICKABLE FUNCTION
  void Page_1() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_0 = false;
      Video = true;
      print("clicked");
      skiftTid = millis();
    }
  }
  void Page_1_1() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1 = false;
      Page_1_1 = true;
      print("clicked");
    }
  }
  void Page_1_2() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1_1 = false;
      Page_1_2 = true;
      print("clicked");
    }
  } 
  void Page_1_3() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Page_1_2 = false;
      Page_1_3 = true;
      print("clicked");
    }
  }
}
