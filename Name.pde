class Name
{
  String pName;
  
  int pPartsLength;
  String[] pParts;
  
  String[] vowelList;
  
  PFont lightFont;
  
  Name()
  { 
    //List of vowels and vowel combinations that can be used in the name
    vowelList = new String[7];
    vowelList[0] = "a";
    vowelList[1] = "e";
    vowelList[2] = "i";
    vowelList[3] = "o";
    vowelList[4] = "u";
    vowelList[5] = "ae";
    vowelList[6] = "ou";
    
    generateName();
    
    lightFont = createFont("Rajdhani-Light.ttf",32);
    textFont(lightFont);
  }
  
  //Generation of the name
  void generateName()
  {
    pName = "";
    
    //Name without a number at the end
    if(randomBool())
    {
      for(int i = 0; i < random(2,5); i++)
      {
        pName += randomNonVowel();
        pName += vowelList[(int)random(0,6)];
      }
    }
    //Name with a number at the end
    else
    {
      for(int i = 0; i < random(2,4); i++)
      {
        pName += randomNonVowel();
        pName += vowelList[(int)random(0,6)];
      }
      pName += "-";
      pName += (int) random(10,999);
    }
    //Making the name Uppercase after generation
    pName = pName.toUpperCase();
  }
  
  //Gets a random alphabetic character that is not a vowel
  char randomNonVowel()
  {
    int hRandom = (int) random(98, 122);
    if(hRandom == 101 || hRandom == 105 || hRandom == 111 || hRandom == 117)
    {
      hRandom++;
    }
    return (char) hRandom;
  }
  
  //Returns a random bool with a 40% Chance for "true"
  boolean randomBool()
  {
    float hRandom = random(0,100);
    if(hRandom < 40) return true;
    else return false;
  }
  
  //Draws the Name to the Canvas
  void drawName()
  {
    textSize(80);
    textAlign(CENTER);
    fill(255);
    text(pName,width/2,height/7);
  }
}
