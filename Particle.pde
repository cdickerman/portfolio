class Particle
{
  
  float r; 

  PVector velocity, position, acceleration;
  int c;
  
  Particle(float r, PVector position, PVector velocity, int c)
  {
    this.r = r;
    this.position = position;
    this.velocity = velocity;
    acceleration = new PVector(0,.1);
    this.c = c;
  }
  
  void display()
  {
    fill(c);
    ellipse(position.x, position.y, r, r);
    position.add(velocity);
   // velocity.add(acceleration);
   
   if(position.x < r || position.x>width-r)
      velocity.x *=-.51;
     
      
     
    if(position.y <r || position.y>height-r)
      velocity.y *=-.51;  
      
  }

void push(PVector force)
 {
   force.mult(-2);
   velocity.add(force);
 }
 
}

