// Gorillas 
// By: Ben Thomasson and Johnny Stinson
// File: Gorillas.pde
// This program is a clone of the old QBasic game Gorillas made in Processing

// Global Variables 
PImage gorilla;

//Main Method
// Precondition: None
// Postcondition: Screen is sized and city is drawn
void setup() 
{
  gorilla = loadImage("gorilla.png");
  size(800, 600); //Hardcoded Resolution of Screen
  drawCity(); //Draw the City buildings
  image(gorilla, 400 , 10);
}

//drawCity buildings method
// Precondition: A screen Height and Width is needed before Drawing City
// Postcondition: The city is drawn and popualted with random buildings, Random size and color 
void drawCity() 
{
  int scrWidth = width; //Screen Width
  int scrHeight = height; //Screen Height
  int[] buildColors =  //Array of Colors to make buildings
  {  
    #808080,  //Grey
    #FF0000, //Red
    #87CEEB, //Blue
    #FFFF00 //Yellow
  };  
  
  //Set the Sky color as background
  int skyBlue=#0402AC;
  background(skyBlue);
  
  int buildMaxHeight = round(scrHeight*0.5); //Maximum building height - Base off screen height
  int buildMinHeight = round(scrHeight*0.8); //Minimum building height - Base off screen height
  int buildSpace = 1; //Space between buildings
  int buildMaxWidth = 80; //Maximum building width in pixels
  int buildMinWidth = 50; //Minimum building width in pixels
  boolean roomForBuilding = true; //Set up boolean as true before loop
  int cityOverallWidth = 0; //Variable to hold Running Width of buildings in city
  int thisBuildStartX = 2; //Starting X position for buildings, Increases with each building
  int cntBuildings = 0; //Running Count of Buildings

  //Loop that draws buildings until There is no more room for buildings
  while (roomForBuilding) 
  {
    cntBuildings++;
    println("Building #" + cntBuildings + " start x=" + thisBuildStartX); //Log to console each building StartX 
    int thisBuildColor = buildColors[round(random(0, 3))];
    fill(thisBuildColor);
    noStroke(); //Do not put a black border on rectangles

    int thisBuildStartY = round(random(buildMaxHeight, buildMinHeight));
    int thisBuildWidth = round(random(buildMinWidth, buildMaxWidth));
    int thisBuildHeight = scrHeight-thisBuildStartY;
    rect(thisBuildStartX, thisBuildStartY, thisBuildWidth, thisBuildHeight);
    
    cityOverallWidth = cityOverallWidth + thisBuildWidth + buildSpace; //Add building width and space between buildings to running city overall width
    
    //If there is not enough space for a new building set roomForBulding to false and stop
    if (cityOverallWidth + buildMaxWidth >= scrWidth) {
      println("EXPECTED ERROR: Out of room for more buildings");
      println("I was able to generate " + cntBuildings + " buildings in your wonderful city :)");
      roomForBuilding = false;
    }
    thisBuildStartX = thisBuildStartX + thisBuildWidth + buildSpace; //Increase startX for next building
  }

}