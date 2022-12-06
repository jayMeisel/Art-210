float angle = 0;

void setup()
{
  size (800,800);
}

void draw()
{
  translate(width/2, height/2);//moves (0,0) to center of screen
  fill(255);
  circle(0,0,height/10);  circle(0,0,height/1.1);//centered circle (0,0)
  fill(0);
  circle(0,0,height/32); //center black circle
  
  pushMatrix();
  rotate(radians(angle));
  rect(-height/64,0,height/32,-height/2.3);  //minute hand
  popMatrix();

  pushMatrix();
  rotate(radians(angle/12));
  rect(-height/64,0,height/32,-height/2.3);  //hour hand
  popMatrix();
  
  angle = angle + 1;
  
}
