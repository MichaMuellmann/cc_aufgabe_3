class Stars
{
  int amount;
  Stars()
  {
    amount = (int) random(100,500);
  }
  
  void drawStars()
  {
    for(int i = 0; i < amount; i++)
    {
      fill(random(200,255));
      circle(random(0,width),random(0,height),random(1,5));
    }
  }
}
