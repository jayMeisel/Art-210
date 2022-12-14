int count = 0;
Zombie s;
Ground[] g;
int nGround = 0;
Boulder b;

void setup()
{
  size(1200,800);
  //fullScreen();
  s = new Zombie(50,150,120,200);
  String[] files = {"zombie1.svg","zombie2.svg"};
  s.addAnimation(new Animation(files));
  String[] files1 = {"zombie1a.svg","zombie2a.svg"};
  s.addAnimation(new Animation(files1));
  String[] files2 = {"zombieup.svg"};
  s.addAnimation(new Animation(files2));
  String[] files3 = {"zombiefall1.svg","zombiefall2.svg"};
  s.addAnimation(new Animation(files3));
  s.currentAni=0;
  
  nGround = ceil(width/1000.0)+1;
  String[] files4 = {"ground1.svg"};
  String[] files5 = {"ground2.svg"};
  String[] files6 = {"ground3a.svg","ground3b.svg"};
  String[] files7 = {"ground4.svg"};
  String[] files8 = {"ground5.svg"};
  String[] files9 = {"ground6.svg"};
  g = new Ground [nGround];
  for(int i = 0; i< nGround; i = i + 1)
  {
    g[i] = new Ground(0,0,1000,300);
    g[i].location.x = (-width/2.0)+(i*1000);
    g[i].addAnimation(new Animation(files4));
    g[i].addAnimation(new Animation(files5));
    g[i].addAnimation(new Animation(files6));
    g[i].addAnimation(new Animation(files7));
    g[i].addAnimation(new Animation(files8));
    g[i].addAnimation(new Animation(files9));
  }
  
  String[] files10 = {"boulder1.svg"};
  String[] files11 = {"boulder2.svg"};
  String[] files12 = {"boulder3.svg"};
  String[] files13 = {"boulder4.svg"};
  String[] files14 = {"boulder5.svg"};
  b = new Boulder(0,0,100,100);
  b.addAnimation(new Animation(files10));
  b.addAnimation(new Animation(files11));
  b.addAnimation(new Animation(files12));
  b.addAnimation(new Animation(files13));
  b.addAnimation(new Animation(files14));
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  
   for(int i = 0; i< nGround; i = i + 1)
    {
      g[i].update();
      g[i].check();
      g[i].display();
    }
 
  s.update();
  s.check();
  s.display();
  
  b.update();
  b.check();
  b.display();
  
}

void keyPressed()
{
  s.jump();
}
boolean collision (Sprite s1, Sprite s2) 
{
   PVector d = s1.location.sub(s1.location);
   float dist = d.mag();
   float limit = min(s1.boxx,s1.boxy) + min(s2.boxx,s2.boxy);
   if(dist < limit) return (true);
  return(false);
}
