class Ball 

{
    PVector position;
    PVector velocity;
    PVector acceleration; // = new PVector(0, .1);

    int r;
    int c;
    float velocityMultiplier;
    
    boolean bounce = true;

    Ball(PVector positionIn, PVector velocityIn, int rIn, int cIn, float velocityMultiplierIn)
    {
        position = positionIn;
        velocity = velocityIn;
        
        r = rIn;
        c = cIn;
        velocityMultiplier = velocityMultiplierIn;
    }
    
    void display()
    {
        fill(c);
        stroke(c);
        ellipse(position.x, position.y, r*2, r*2);
        
        velocity.mult(velocityMultiplier);
        position.add(velocity);
        if (acceleration != null) velocity.add(acceleration);
        
        if (bounce)
        {
            if (position.x < r || position.x > width-r) 
                velocity.mult(-1);

            if (position.y < r || position.y > height-r)
                velocity.mult(-1);
        }
    }
        
    float x() {return position.x;}
    float y() {return position.y;}
    PVector position() {return position.copy();}

    void setVelocityMultiplier(float velocityMultiplier) {this.velocityMultiplier = velocityMultiplier;}
    void noBounce() {bounce = false;}

    void push(PVector force)
    {
        velocity.add(force);
    }
    
   
}