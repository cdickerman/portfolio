//stage tests, 
 
 int nparticles = 10222;
 ArrayList<Particle> particles = new ArrayList<Particle>();
 
Particle createParticle()
{
  int r = (int)random(2, 3.2);
  PVector position = new PVector(random(r, width-r), random(r, height-r));
  PVector velocity = PVector.random2D();
  velocity.setMag(1);
  int c = color(random(50, 255), random(50, 255), random(50, 255));
  noStroke();
  
  Particle p = new Particle(r, position, velocity, c, position.x, position.y);
  return p;
}

  void setup() {
    for (int i = 0; i < nparticles; i++)
    {
      Particle p = createParticle();
      particles.add(p);
    }
    
    size (800,800);
    background(0);
    //noCursor();
}

void draw() 
{

 background(2); //take this out for cool line drawing effect (might also need to remove bounces off walls)
 for (Particle p : particles)
    {
      p.display();
      p.velocity.mult(.995);
    }
 fill(100);
 ellipse(mouseX, mouseY, 10, 10);
 
    
 for (Particle p: particles)
  {
   /* PVector force = new PVector(mouseX, mouseY);
    PVector pforce = new PVector(pmouseX, pmouseY);
    force.sub(pforce);
    force.setMag((pmouseX-mouseX)+(pmouseY-mouseY));
    float distance = dist(p.position.x, p.position.y, mouseX, mouseY);
    force.mult(-1/distance); 
    */
    
    PVector push = new PVector(mouseX-p.position.x, mouseY-p.position.y);
    PVector pull = new PVector(p.startXPos - p.position.x, p.startYPos - p.position.y);
    float pushMag = push.mag();
    push.mult(.3/(sq(pushMag)));
    push.mult(sqrt(sq(mouseX-pmouseX)+sq(mouseY-pmouseY)));
    
    p.push(push);
    p.pull(pull);
    
    //p.velocity.mult(p.time);
    
    //find vector from mouse to p, scale into unit vector , scale by the distance between mouse and pmouse
   // float distance = dist(p.position.x, p.position.y, mouseX, mouseY)<70);
    
  }
}

void mousePressed() {
 for (Particle p: particles){
   p.position.x = random(0,width);
   p.position.y = random(0,height);
   p.velocity = PVector.random2D();
   p.velocity.setMag(1);

  }
}