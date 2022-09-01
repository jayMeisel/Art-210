float _angle = 0;

void setup()
{
  size(1200,1200);
}

void draw()
{
  clearScreen();
  translate(width/2, height/2);
  scale(.5);
  
  aCircle(0,0,200,255,255,255);
 
  pushMatrix();
  
  rotate(radians(_angle));
  translate(500,0);
  aCircle(0,0,75,0,100,255);
  rotate(radians(5*_angle));
  translate(150,0);
  aCircle(0,0,50,100,255,0);
  rotate(radians(3.5/_angle));
  translate(75,0);
  aCircle(0,0,25,255,0,100);
  
  popMatrix();
  pushMatrix();
  
  rotate(radians(-_angle));
  translate(200,0);
  aCircle(0,0,50,255,255,0); 
  rotate(radians(5*_angle));
  translate(50,0);
  aCircle(0,0,25,255,0,100);
  
  popMatrix();

  rotate(radians(3*-_angle));
  translate(850,0);
  aCircle(0,0,50,255,100,0);   
  rotate(radians(249.222*_angle));
  translate(75,0);
  aCircle(0,0,10,0,0,0);

  
  _angle = _angle + 1;
}

void aCircle (float x, float y,float d, int red, int green, int blue)
{
  noStroke();
  fill(color(red,green,blue));
  circle(x,y,d);
}

 void clearScreen()
 {
  noStroke();
  fill(color(0,0,0,2));
  rect(0,0,width,height);
 }
