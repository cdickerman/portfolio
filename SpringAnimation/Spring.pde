class Spring
{
    Ball one;
    Ball two;
    float k;
    float x0;

    Spring(Ball one, Ball two, float k)
    {
        this.one = one;
        this.two = two;
        this.k = k;

        x0 = dist(one.x(), one.y(), two.x(), two.y());
    }

    void update()
    {
        float x = dist(one.x(), one.y(), two.x(), two.y()) - x0;

        PVector force = one.position();
        force.sub(two.position());
        force.setMag(2*k*x);

        two.push(force);

        force.mult(-1);
        one.push(force);
    }

    void display()
    {
        if (one != null && two != null)
        {
            stroke(255);
            fill(255);
            strokeWeight(5);
            line(one.x(), one.y(), two.x(), two.y());
           // text(k, (one.x() + two.x())/2, (one.y() + two.y())/2);
        }
    }
}