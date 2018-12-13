class Particle
{
  
  float r;
  PVector velocity, position, acceleration;
  int c;
  float startXPos;
  float startYPos;
  
  Particle(float r, PVector position, PVector velocity, int c, float startXPos, float startYPos)
  {
    this.r = r;
    this.position = position;
    this.velocity = velocity;
    acceleration = new PVector(0,.1);
    this.c = c;
    this.startXPos = startXPos;
    this.startYPos = startYPos;
  }
  
  void display()
  {
    fill(c);
    rect(position.x, position.y, r, r);
    position.add(velocity);
   // velocity.add(acceleration);
   
   //change bounce limits to get margins
   if(position.x < r + 250 || position.x>width-r-250)
      velocity.x *=-1;
     
      
     
    if(position.y <r || position.y>height-r-620)
      velocity.y *=-1;  
      
    }

    void push(PVector force)
    {
       force.mult(-2);
       velocity.add(force);
    }
 
    void pull(PVector force)
    {
      if (force.mag()> .03)
         force.setMag(.03);
       velocity.add(force);
    }
}
