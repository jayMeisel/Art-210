int nMover = 1000;
Mover [] m = new Mover[nMover];
int counter = nMover;

void setup()
{
  size (800,600,P3D);
  //fullScreen();
  for(int  i = 0; i < m.length; i = i + 1)
  {
    m[i] = new Mover();
  }
}

void draw()
{
  fill(color(0,0,0,10));
  rect(0,0,width,height);
  for(int  i = 0; i < m.length; i = i + 1)
  {
    m[i].update();
    m[i].check();
    m[i].show();
  }
   fill(color(255,0,100,30));
   circle(mouseX,mouseY,30);
   hud();
}

void hud2()
{
  PGraphics hud = createGraphics(width,height);
  hud.beginDraw();
  hud.translate(width/2,10);
  hud.fill(255);
  hud.textAlign(CENTER);
  hud.text(counter,0,30);
  hud.translate(-nMover/2,0);
  hud.noStroke();
  hud.fill(color(255,0,100));
  hud.rect(0,0,counter,10);    //bar color
  hud.stroke(255);
  hud.noFill();
  hud.rect(0,0,nMover,10);
  hud.endDraw();
  image(hud,0,0);
}

void hud()
{
  translate(width/2,10);
  fill(255);
  textAlign(CENTER);
  text(counter,0,30);
  translate(-nMover/2,0);
  noStroke();
  fill(color(255,0,100));
  rect(0,0,counter,10);    //bar color
  stroke(255);
  noFill();
  rect(0,0,nMover,10);
}


void mouseClicked()
{
  for(int i= 0; i < m.length; i = i + 1)
  {
     m[i].lifeCheck(mouseX, mouseY);
  }
}
