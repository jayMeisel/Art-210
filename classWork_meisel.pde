
//Declaring global varibales
int _screenX = 0;
int _screenY = 0; 
int _angle = 0;

void setup()
{
 //println(_screenX);
  size (800,600);
  _screenX = 800; 
  _screenY = 600;
  //println(_screenX);
 frameRate(60);
}

void draw()
{
  noStroke();
  fill(color(0,0,0,10));
  rect(0,0,_screenX,_screenY);
  drawCircle(_angle);
  _angle = _angle + 1;
  if(_angle > 360) _angle = 0;
  println(_angle);
}
  
void drawCircle(int hue_start)
{
  colorMode(HSB, 360, 100, 100);
  float hue = random(hue_start,hue_start+120);
  float sat = random(100,100);
  float bright = random(60,100);
  color randomColor = color(hue,sat,bright);
  fill(randomColor);
  circle(mouseX,mouseY,100);
}
