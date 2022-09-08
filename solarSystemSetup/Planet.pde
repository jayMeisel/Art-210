class Planet

{
  float dist = 100; //property
  float angle = 0.0; //property
  float speed = 1.0;
  float size = 50;
  color col = color(255,255,255);
  Planet[] planet = new Planet[20]; //moon creation
  int nPlanet = 0;

  Planet(float _dist) //method
  {
    this.dist =_dist; //this = current object
  }
  
  void makeMoons()
  {
    for(int i = 0; i < this.nPlanet; i = i + 1)
    {
      this.planet[i] = new Planet(random(100,500));
      this.planet[i].speed = random(-2,2);
      this.planet[i].col = color(random(255),100,100);
      this.planet[i].size = random(10,50);
      if(nGenerations > 0 )
      {
        this.planet[i].nPlanet = floor(random(5));
        this.planet[i].makeMoons();
        
      }
    }
    nGenerations = nGenerations - 1;
  }
  
  void show()
   {
     pushMatrix();
       rotate(radians(this.angle));
       translate(this.dist,0);
       noStroke();
       fill(this.col);
       circle(0,0,this.size);
     for(int i = 0; i < this.nPlanet; i = i + 1)
     {
       this.planet[i].show();
     }
    popMatrix();
   this.angle = this.angle + this.speed;
  }
}
