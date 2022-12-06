import processing.sound.*;
SoundFile beep;
PFont f;
int gameState = 0; //0 startscreen, 1 gameplay, 2 beeing dead
float _speed = -8;
int _jumpCount = 0;


Zombie s;
Ground[] g;
int nGround = 0;
PImage bg;
Boulder[] b;
int nBoulder = 8;

Landscape[] l1;
int nl1 = 0; 
Landscape[] l2;
int nl2 = 0;
Landscape[] l3;
int nl3 = 0;
Landscape[] l4;
int nl4 = 0;
Landscape[] l5;
int nl5 = 0;
Landscape[] l6;
int nl6 = 0;
Landscape[] l7;
int nl7 = 0;
Landscape[] l8;
int nl8 = 0;


void setup()
{
  size(2000,850);
  //fullScreen();
  beep = new SoundFile(this,"beep.wav");
  //bg = loadImage("mtn1.svg");
  f = createFont("hvd.ttf",100);
  reset();
}

void draw()
{
  if(gameState == 0) startScreen();
  if(gameState == 1) gamePlay();
  if(gameState == 2) deadScreen(); 
}

void keyPressed()
{
  if(gameState == 0) 
  {
    reset();
    gameState = 1;
  }  
  if(gameState == 1) s.jump();
  if(gameState == 2) 
  {
    reset();
    gameState = 1;
  }
}

void reset()
{
  _speed = -8;
  s = new Zombie();
  s.boxx = 200;
  s.boxy = 320;
  s.location.x=(-width/2)+100;
  s.location.y=(height/2)-200;
  String[] files = {"walk1.svg","walk2.svg","walk3.svg","walk4.svg"};
  s.addAnimation(files,10);
  String[] files1 = {"zombie1a.svg","zombie2a.svg"}; //inverse
  s.addAnimation(files1,10);
  String[] files2 = {"up1.svg"};
  s.addAnimation(files2,10);
  String[] files3 = {"fall1.svg","fall2.svg"};
  s.addAnimation(files3,10);
  String[] files18 = {"up1.svg"};
  s.addAnimation(files18,10);
  s.currentAni=0;
  
  nGround = ceil(width/1000.0)+1; //number of ground element is acconted form screen size and ground element width
  g = new Ground[nGround];
  


  String[] files4 = {"road7.svg"};
  //String[] files5 = {"ground2.svg"};
  //String[] files6 = {"ground3a.svg","ground3b.svg"};
  //String[] files7 = {"ground4.svg"};
  //String[] files8 = {"ground5.svg"};
  //String[] files9 = {"ground6.svg"};
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i] = new Ground();
    g[i].boxx = 5000;
    g[i].boxy = 950;
    g[i].addAnimation(files4,10);
    //g[i].addAnimation(files5,10);
    //g[i].addAnimation(files6,10);
    //g[i].addAnimation(files7,10);
    //g[i].addAnimation(files8,10);
    //g[i].addAnimation(files9,10);
    g[i].location.x = -(width/2.0)+(g[i].boxx * i);
  }
  

  
  String[] files10 = {"bush1.svg"};
  String[] files11 = {"bush2.svg"};
  String[] files12 = {"log1.svg"};
  String[] files13 = {"trunk1.svg"};
  String[] files14 = {"trunk2.svg"};

  b = new Boulder[nBoulder];
 
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i] = new Boulder();
    b[i].boxx = 350;
    b[i].boxy = 325;
    b[i].addAnimation(files10,10);
    b[i].addAnimation(files11,10);
    b[i].addAnimation(files12,10);
    b[i].addAnimation(files13,10);
    b[i].addAnimation(files14,10);
    b[i].location.x = (width/2.0)+random(10,5000);
    b[i].adjustReg();
  }
  
  nl1 = ceil(width/5000.0)+1;
  l1 = new Landscape[nl1];
  String[] files15 = {"mtn1.svg"};
  for(int i = 0; i < nl1; i = i + 1)
  {
    l1[i] = new Landscape();
    l1[i].location.y = (-height/2);
    
    l1[i].location.x = (-width/2.0)+(i*5000.0);
    l1[i].addAnimation(files15,10);
    l1[i].randomPlacement=true;
    l1[i].slowdown = 1;
  }
  
  nl2 = ceil(width/5000.0)+1;
  l2 = new Landscape[nl2];
  String[] files16 = {"mtn2.svg"};
  for(int i = 0; i < nl2; i = i + 1)
  {
    l2[i] = new Landscape();
    l2[i].location.y = (-height/2);
    l2[i].location.x = (-width/2.0)+(i*5000.0);
    l2[i].location.y = (-height/2.0)+50;
    l2[i].velocity.x = -0.5;
    l2[i].addAnimation(files16,10);
    l2[i].slowdown = 1;
  }
  nl3 = ceil(width/5000.0)+1;
  l3 = new Landscape[nl3];
  String[] files17 = {"mtn3.svg"};
  for(int i = 0; i < nl3; i = i + 1)
  {
    l3[i] = new Landscape();
    l3[i].location.y = (-height/2);
    l3[i].location.x = (-width/2.0)+(i*5000.0);
    l3[i].location.y = (-height/2.0)-50;
    l3[i].velocity.x = -0.7;
    l3[i].addAnimation(files17,10);
    l3[i].slowdown = 1;
  }
  
  nl4 = ceil(width/5000.0)+1;
  l4 = new Landscape[nl4];
  String[] files23 = {"bg4.svg"};
  for(int i = 0; i < nl4; i = i + 1)
  {
    l4[i] = new Landscape();
    l4[i].location.y = (-height/2);
    l4[i].location.x = (-width/2.0)+(i*5000.0);
    l4[i].addAnimation(files23,10);
    l4[i].randomPlacement=true;
    l4[i].slowdown = 1;
  }
  
  nl5 = ceil(width/5000.0)+1;
  l5 = new Landscape[nl5];
  String[] files19 = {"bg5.svg"};
  for(int i = 0; i < nl5; i = i + 1)
  {
    l5[i] = new Landscape();
    l5[i].location.y = (-height/2);
    l5[i].location.x = (-width/2.0)+(i*5000.0);
    l5[i].addAnimation(files19,10);
    l5[i].randomPlacement=true;
    l5[i].slowdown = 1;
  }
  
  nl6 = ceil(width/5000.0)+1;
  l6 = new Landscape[nl6];
  String[] files20 = {"bg6.svg"};
  for(int i = 0; i < nl6; i = i + 1)
  {
    l6[i] = new Landscape();
    l6[i].location.y = (-height/2);
    l6[i].location.x = (-width/2.0)+(i*5000.0);
    l6[i].addAnimation(files20,10);
    l6[i].randomPlacement=true;
    l6[i].slowdown = 1;
  }
  
  nl7 = ceil(width/5000.0)+1;
  l7 = new Landscape[nl7];
  String[] files21 = {"road7.svg"};
  for(int i = 0; i < nl7; i = i + 1)
  {
    l7[i] = new Landscape();
    l7[i].location.y = (-height/2);
    l7[i].location.x = (-width/2.0)+(i*5000.0);
    l7[i].addAnimation(files21,10);
    l7[i].randomPlacement=true;
    l7[i].slowdown = 1;
  }
  
  nl8 = ceil(width/5000.0)+1;
  l8 = new Landscape[nl8];
  String[] files22 = {"bg8.svg"};
  for(int i = 0; i < nl8; i = i + 1)
  {
    l8[i] = new Landscape();
    l8[i].location.y = (-height/2);
    l8[i].location.x = (-width/2.0)+(i*5000.0);
    l8[i].addAnimation(files22,10);
    l8[i].randomPlacement=true;
    l8[i].slowdown = 1;
  }
}

void startScreen()
{
  gamePlay();
  s.location.x = 10000; 
  noStroke();
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(f);
  textSize(100);
  text("Good Luck",0,-30);
  textSize(30);
  text("Press ANY key to start and jump",0,30);
}

void deadScreen()
{
  s.isDead = true;
  s.acceleration.y=-0.01;
  _speed = _speed*0.99;
  gamePlay();
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(f);
  textSize(100);
  text("R.I.P.",0,0);
  textSize(30);
  text("Press ANY key to resurrection",0,60);
  /*noStroke();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("RIP. Press ANY key to resurrection",width/2,height/2);*/
}

void gamePlay()
{
  noStroke();
  fill(color(247,179,178));
  rect(0,0,width,height);
//  image(bg,0,0);
  translate(width/2,height/2);
  for(int i = 0; i < nl1; i = i + 1)
  {
    l1[i].update();
    l1[i].check();
    l1[i].display();
  }
  
    for(int i = 0; i < nl2; i = i + 1)
  {
    l2[i].update();
    l2[i].check();
    l2[i].display();
  }
  
  for(int i = 0; i < nl3; i = i + 1)
  {
    l3[i].update();
    l3[i].check();
    l3[i].display();
  }
    
  for(int i = 0; i < nl4; i = i + 1)
  {
    l4[i].update();
    l4[i].check();
    l4[i].display();
  }
    
  for(int i = 0; i < nl5; i = i + 1)
  {
    l5[i].update();
    l5[i].check();
    l5[i].display();
  }
      
  for(int i = 0; i < nl6; i = i + 1)
  {
    l6[i].update();
    l6[i].check();
    l6[i].display();
  }
      
  for(int i = 0; i < nl7; i = i + 1)
  {
    l7[i].update();
    l7[i].check();
    l7[i].display();
  }
      
  for(int i = 0; i < nl8; i = i + 1)
  {
    l8[i].update();
    l8[i].check();
    l8[i].display();
  }
  
  
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i].update();
    g[i].check();
    g[i].display();
  }
  
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i].update();
    b[i].check();
    b[i].display();
  }
  
  s.update();
  s.check();
  s.display();

  hud();
}

void hud()
{
  if(_jumpCount > 0)
  {
    textAlign(CENTER,CENTER);
    fill(255,100,100);
    textSize(30);
    text(_jumpCount,0,(-height/2)+30);
  }
}
