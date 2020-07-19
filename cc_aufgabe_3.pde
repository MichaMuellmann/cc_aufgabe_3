
//Different Classe for the Planets Name, the Planet itself and the Stars in the Background
Name planetName;
Planet planetShape;
Stars bgStars;

void settings()
{
  size(900,1200);
}

void setup()
{
  background(0);
  //Initializitation of the Classes and first Draw
  planetName = new Name();
  planetShape = new Planet();
  bgStars = new Stars();
  drawAll();
}

void draw()
{
  //Not used
}

//Calls the Draw-Methods in all Objects
void drawAll()
{
  bgStars.drawStars();
  planetName.drawName();
  planetShape.drawPlanet();
}

void keyPressed()
{
  //Generate a New Planet
  if(key == 'r')
  {
    clear();
    planetName.generateName();
    planetShape.createPlanet();
    drawAll();
  }
  
  //Save the planet as a PNG
  if(key == 's')
  {
    saveFrame("posters/planet-####.png");
    println("Poster Saved!");
  }
}
