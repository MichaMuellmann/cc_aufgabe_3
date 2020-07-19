class Planet
{
  //Color Palette
  color baseColor;
  color secondaryColor;
  color waterColor;
  
  PGraphics planet;
  PGraphics mask;
  
  /*
  Different Planet Types:
  0 - Craters
  1 - With Full Lines e.g. Saturn
  2 - With partial lines
  3 - Craters and Full Lines
  */
  int planetType;
  
  Planet()
  {
   colorMode(HSB);
   
   createPlanet();
  }
  
  void createPlanet()
  { 
    //Generate Planet Colors
    baseColor = color(random(0,255),random(100,180),random(100,200));
   
    secondaryColor = color(hue(baseColor),saturation(baseColor),brightness(baseColor)-20);
    
    //Randomly choose a planet type
    planetType =  (int) random(0,4);
    
    //Create Planets Content
    planet = createGraphics(width,height);
    planet.beginDraw();
    planet.noStroke();
    planet.background(baseColor);
    switch(planetType)
    {
      case 0: createCraters();
      break;
      
      case 1: createFullLines();
      break;
      
      case 2: createShortLines();
      break;
      
      case 3: createFullLines(); createCraters();
      break;
    }
    planet.endDraw();
    
    //Create Circular Mask for Planet Shape
    mask = createGraphics(width,height);
    mask.beginDraw();
    mask.circle(width/2,height/2,width/random(1.3,1.6));
    mask.endDraw();
    
    //Apply Mask
    planet.mask(mask);
  }
  
  //Adding craters to the planets surface
  void createCraters()
  {
    planet.noStroke();
    int craterAmount = (int) random(10,50);
    for(int i = 0; i < craterAmount; i++)
    {
      planet.fill(secondaryColor);
      planet.circle(width/2+random(-width/3,width/3),height/2+random(-height/3,height/3),random(20,100));
    }
  }
  
  //Addings full lines to the planet
  void createFullLines()
  {
    int currentHeight = 0;
    int heightOffset = (int)random(-100,100);
    while(currentHeight < height)
    {
      float hColorHue = hue(secondaryColor);
      color hColor = color(random(hColorHue-5,hColorHue+5),saturation(secondaryColor),random(brightness(secondaryColor),brightness(secondaryColor)+50));
      planet.stroke(hColor);
      planet.strokeWeight(random(10,50));
      planet.line(0,currentHeight,width,currentHeight+heightOffset);
      
      currentHeight += random(20,100);
    }
  }
  
  //Adding short lines to the planet
  void createShortLines()
  {
    int currentHeight = 0;
    int heightOffset = (int)random(-50,50);
    while(currentHeight < height)
    {
      float hColorHue = hue(secondaryColor);
      color hColor = color(random(hColorHue-5,hColorHue+5),saturation(secondaryColor),random(brightness(secondaryColor),brightness(secondaryColor)+50));
      planet.stroke(hColor);
      planet.strokeCap(ROUND);
      planet.strokeWeight(random(30,80));
      planet.line(random(0,width/2-100),currentHeight,random(width/2+100,width),currentHeight+heightOffset);
      
      currentHeight += random(50,150);
    }
  }
  
  
  //Draw the created shape to the canvas
  void drawPlanet()
  {
    image(planet, 0, 0);
  }
}
