class WButton {
  float x, y, bWidth, bHeight;
  int millisActive = millis(), activeDelta = 500;
  boolean selected = false;
  color inactive, active;
  String name;

  WButton(float xPos, float yPos, float xSize, float ySize) {
    x = xPos;
    y = yPos;
    bWidth = xSize;
    bHeight = ySize;
    PFont font = loadFont("Aharoni-Bold-48.vlw");
  }

  void drawWidget() {
    if (selected) {
      stroke(0, 0, 0);
      fill(active);
    }
    else {
      stroke(0, 0, 0);
      fill(inactive);
    }
    rect(x, y, bWidth, bHeight);
    fill(0,0,0,255);
    textAlign(CENTER,CENTER);
    text(name,x+(bWidth/2),y+(bHeight/2));
  }

  void setName(String n) {
    name = n;
  }

  void setInactiveColour(color rgba) {
    inactive = rgba;
  }

  void setInactiveColour(float r, float g, float b, float a) {
    inactive = color(r, g, b, a);
  }

  void setActiveColour(color rgba) {
    active = rgba;
  }

  void setActiveColour(float r, float g, float b, float a) {
    active = color(r, g, b, a);
  }
  
  void setActiveDelta(int d){
    activeDelta = d;
  }
  
  //This method should be deprecated if we get input from the device.
  boolean isMouseOver() {
    if (mouseX > x && mouseX < x+bWidth && mouseY > y && mouseY < y+bHeight) {
      return true;
    }
    else {
      return false;
    }
  }

  void select() {
    selected = true;
    millisActive = millis();
  }

  void deselect() {
    selected = false;
  }
}

