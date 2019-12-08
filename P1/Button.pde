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
  void Clickable_Fridge_Handle() {
    if (mousePressed && mouseX >= X && mouseX <= X+W && mouseY >= Y && mouseY <= Y+H) {
      Fridge_Handle_Clicked = true;
      print("clicked");
    }
  }
}
