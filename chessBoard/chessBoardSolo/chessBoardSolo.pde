void setup()
{
  size (800,800);
}

void draw()
{
  for(int y = 0; y < height; y = y + (height/8))
  {
    for(int x = 0; x < width; x = x + (width/8))
    {
      if((x+y) % 200 > 0) 
      {
        fill(255);
      }
      else 
      {
        fill(0);
      }
      rect (x,y,100,100);
    }
  }
}
