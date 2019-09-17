
ArrayList<Ball> balls;
ArrayList<Spring> springs;

float ballCount = 80;

Ball createBall(int i)
{
    int r = (int)random(5);
    

    PVector position = new PVector(width/2, i);
    
    PVector velocity = PVector.random2D();
    velocity.setMag(random(1, 3));
    
    int c = color(255);
    
    return new Ball(position, velocity, r, c, .95); 
}


void keyPressed()
{
  if (key == ' ')
  {
    for (int i = 0; i < 5; i++){ 
    pushEverything(width/2 + 10, (height)/2, -0.02); //height-620
    } 
  }
  
  if (key == 'a' || key == 'A'){
    
   for (Ball b: balls){
     b.bounce = false;
   }
    for (int i = 0; i<springs.size(); i+=2){
      springs.remove(i); 
    //balls.get(i).velocity.setMag(random(.5,1));
    }
    springs.remove(springs.size()-1);
   for (int i = 0; i<ballCount; i++)
   { 
     pushEverything((balls.get(i).position.x +5), balls.get(i).position.y, random(-0.15,-0.05));
   }
   
  }
  
  if (key == 'r')
  {
   initialize();
   } 
}

void addEverything()
{
  for (int i = 0; i < ballCount; i++)
  {
    int r = 1;
    PVector position = new PVector(width/2, (height)* i/ballCount);  //height-620
    PVector velocity = PVector.random2D();
    velocity.setMag(0);
    int c = color(255);
    
    Ball b = new Ball(position, velocity, r, c, 1);
    balls.add(b);
    
    
  }

  for (int i = 0; i < balls.size()-1; i++)
  {
    Spring spring = new Spring(balls.get(i), balls.get(i+1), .2);
    springs.add(spring);
  }
  
  balls.get(0).setVelocityMultiplier(0);
  balls.get((int)ballCount-1).setVelocityMultiplier(0);
}


void setup() 
{
  size(400,400); //fullScreen();
  noCursor(); 
  initialize();
}

void initialize()
{
  balls = new ArrayList<Ball>();
  springs = new ArrayList<Spring>();
  
  addEverything();
}
void draw()
{
background(0);

  for (Ball b : balls)
      b.display();

  for (Spring s : springs)
  {
      s.update();
      s.display();
  }
  
// pushEverything(mouseX, mouseY);
   
}

void pushEverything(float x, float y, float v)
{
 for (Ball b : balls)
   {
     if (dist(x, y, b.position.x, b.position.y) < 20) {
       PVector force = new PVector(x, y);
       force.sub(b.position);
       force.mult(v);
       b.push(force);
      
   } 
   }
}