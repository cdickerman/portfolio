
//add gravitional forces away from the mouse

 int nparticles = 9222;
 ArrayList<Particle> particles = new ArrayList<Particle>();
 
Particle createParticle()
{
  int r = (int)random(3,5);
  PVector position = new PVector(random(r, width-r), random(r, height-r));
  PVector velocity = PVector.random2D();
  velocity.setMag(1);
  int c = color(random(255), random(255), random(255));
  noStroke();
  
  Particle p = new Particle(r, position, velocity,c);
  return p;
}

  void setup() {
    for (int i = 0; i < nparticles; i++)
    {
      Particle p = createParticle();
      particles.add(p);
    }
    
    size(800,800);
    background(0);
}

void draw() 
{
 background(0); //take this out for cool line drawing effect (might also need to remove bounces off walls)
 for (Particle p : particles)
    {
      p.display();
    }
    
 for (Particle p: particles)
  {
    PVector force = new PVector(mouseX, mouseY);//figure out how to make them go away from the mouse
    force.sub(p.position);
    force.mult(.008); 
    if(p.position.x - mouseX < 75 && p.position.x - mouseX > -75 && p.position.y - mouseY <75 && p.position.y - mouseY > -75)
        p.push(force);
 
    }
  }

void mousePressed() {
 for (Particle p: particles){
   p.position.x = random(0,width);
   p.position.y = random(0,height);
   p.velocity.x = 0;
   p.velocity.y = 0;

  }
}