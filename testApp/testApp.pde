WButton[] options = new WButton[5];

String[] actions;

//Widget dimensions
float wWidth, wHeight;
float optX, optY, swipeX;

//Widget colours
color notSelected, optionSelected, swipeSelected;

void setup() {

  //Widget window
  wWidth = displayWidth*0.75;
  wHeight = displayHeight*0.3;
  size(int(wWidth), int(wHeight));
  background(255, 255, 255);

  //Button dimensions
  swipeX = 100;
  optX = (width-swipeX)/(options.length-1);
  optY = height;

  //Set the colours of the widget buttons.
  notSelected = color(255, 255, 255, 128);
  optionSelected = color(255, 0, 0, 128);
  swipeSelected = color(0, 255, 0, 128);

  //Initialise the widget buttons.
  for (int i= 0; i < options.length; i++) {
    if (i < options.length-1) {
      options[i] = new WButton(i*optX, 0, optX, optY);
      options[i].setInactiveColour(notSelected);
      options[i].setActiveColour(optionSelected);
    }
    else {
      options[i] = new WButton(i*optX, 0, swipeX, optY);
      options[i].setInactiveColour(notSelected);
      options[i].setActiveColour(swipeSelected);
    }
  }
  //Button names
  options[0].setName("Internet Explorer");
  options[1].setName("Windows Media Player");
  options[2].setName("Microsoft Word");
  options[3].setName("JAWS");
  options[4].setName("Swipe");
}

//We should migrate this code to a method called when the device detects input.
void mouseClicked() {
  for (int i = 0; i < options.length; i++) {
    if (options[i].isMouseOver()) {
      options[i].select();
    }
  }
}

void draw() {
  background(255, 255, 255);

  //Show the current configuration

  //Draw the buttons
  for (int i = 0; i < options.length; i++) {
    options[i].drawWidget();
    if(millis() > options[i].millisActive + options[i].activeDelta){
      options[i].deselect();
    }
  }
}

