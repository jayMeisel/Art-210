float _angle = 0;
int nPlanet = 0;
int maxPlanets = 100;

float [] distance = new float [maxPlanets];
float [] size = new float [maxPlanets];
float [] speed = new float[maxPlanets];
color [] col = new color[maxPlanets];

void setup()
{
  size(1200,1000,P3D);
  for(int i = 0; i < maxPlanets; i = i + 1);  
  {
    createPlanet(i,random(100,400));
    createMoon(i,random(100,400));
    nPlanets = nPlanets + 1;
  }
}


void draw()
{
  clearScreen();
  translate(width/2, height/2);
  scale(.5);
  
  aCircle(0,0,200,255,255,255);
 
  for(int i = 0; 1 < nPlanets; i = i + 1)
  {
    aPlanet(size[i],distnace[i],speed[i],col[i]);
  }

  _angle = _angle + 1;
}

void createPlanet(int i, float dist)
{
  distance[i]
  
  
  
  
  
}

void aPlanet (float size, float distance, float speed, color col)
{
  pushMatrix();
  rotate(radians(_angle*speed));
  translate(distance,0);
  aCircel(0,0,size,col);
  pushMatrix();
    rotate(radians(_angle*speed));
    translate(distance,0);
    aCircel(0,0,size,col);
  popMatrix();
popMatrix();











void aCircle (float x, float y,float d, color col)
{
  noStroke();
  fill(col);
  circle(x,y,d);
}

 void clearScreen()
 {
  noStroke();
  fill(color(0,0,0,2));
  rect(0,0,width,height);
 }
