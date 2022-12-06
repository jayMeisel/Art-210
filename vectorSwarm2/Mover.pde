class Mover
{
  PVector pos = new PVector(0,0);
  PVector speed = new PVector(0,0);
  PVector acc = new PVector (0,0);
  PVector acc1 = new PVector (0,0);
  
  float top_acc = random(.1,.5);
  float top_speed = random(1,5);
  boolean live = true;
  
  float dist = 0; //distance from the mouse
  
  Mover()        //constructor
  {
    this.pos.x = random(width);
    this.pos.y = random(height);
  }
  
  void show()
  {
    if(this.live)
    {
       noStroke();
       colorMode(HSB,width+height,100,100);
       fill(color(this.dist,100,(1-(dist/600))*100));
       circle(this.pos.x,this.pos.y,10); 
       colorMode(RGB,255,255,255);
    }
  }
  
  void update()
  {
    if(this.live)
    {
      PVector mouse = new PVector(mouseX, mouseY);
      this.acc = PVector.sub(mouse,this.pos);  //subtracting 2 vectors
      this.dist = this.acc.mag();
    
      this.acc.normalize();
      this.acc.mult(top_acc);
    
      this.acc1 = PVector.random2D();
      if(dist < 600)
      {
        PVector acc_actual = this.acc1.lerp(this.acc,1-dist/600);    //lerp = smooth change
        acc_actual.mult(-1);              //Pray to Preditor
        this.speed = this.speed.add(acc_actual);
      }
      else
      {
        this.speed= this.speed.add(this.acc1);
      }
      this.pos = this.pos.add(speed);
    }
  }
  
  void lifeCheck(float mx, float my)   //m = mouse
  {
    if(this.live)
    {
      if (this.dist < 30) 
      {
        this.live = false;
        counter = counter - 1;
      }
    }
  }
  
  void check()
  {
    this.speed.limit(this.top_speed);
    
    if(this.pos.x > width) this.pos.x = 0;
    if(this.pos.x < 0) this.pos.x = width;
    if(this.pos.y > height) this.pos.y = 0;
    if(this.pos.y < 0) this.pos.y = height;
    
  }
}
