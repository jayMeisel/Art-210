class Ground extends Sprite
{
  Ground(float xreg, float yreg, float bx, float by)
  {
    super(xreg,yreg,bx,by);
    this.location.y = (height/2)-240;
    this.velocity.x = -8;
    this.currentAni = 0;
  }
  
  void check()
  {
    if(this.location.x < -boxx-(width/2))
    {
      this.location.x = (boxx*(nGround-1))-(width/2);
      this.currentAni = floor(random(0,this.nAni));
    }
  }
}
