int nMover = 100;
Mover[] m = new Mover [nMover];

void setup()
{
  size(1600,600);
  for (int i=0; i < nMover; i++)
  {
     m[i] = new Mover();
     m[i].mass = random(0.5,3);
  }
}

void draw()
{
  background(255);
  PVector gravity = new PVector(0,0.3);
  PVector wind = new PVector(0.02,0); //.135
  for (int i=0; i < nMover; i++)
  {
    m[i].applyForce(gravity);
    m[i].applyForce(wind);
    m[i].update();
    m[i].checkEdges();
    m[i].display();
  }
}
