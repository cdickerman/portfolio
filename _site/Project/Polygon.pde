import processing.core.*;

public class Polygon implements Drawable
{
    public Polygon(PApplet papplet, float x, float y, float sides, int c)
    {
        this.papplet = papplet;
        this.x = x; //papplet.mouseX;
        this.y = y; //papplet.mouseY;
        this.sides = sides;
        this.c = c;

        intangle = (2*Math.PI)/ sides;
        vx = papplet.random(-5, 5);
        vy = papplet.random(-5, 5);
        r = papplet.random(15, 30);
        red = (int)papplet.random(255);
        green = (int)papplet.random(255);
        blue = (int)papplet.random(255);

    }


    public void display(int n)
    {
        papplet.pushMatrix();
        papplet.translate((float)x, (float)y);
        papplet.rotate(angle);
        papplet.fill(c);
      //  papplet.stroke(red, green, blue);

        papplet.stroke(red, green, blue);
        papplet.beginShape();
        for (float a = 0; a < (2*Math.PI); a += intangle) {
             sx = x + Math.cos(a) * r;
             sy = y + Math.sin(a) * r;
            papplet.vertex((float)sx, (float)sy);
          }
        papplet.endShape();


  /*      papplet.rectMode(papplet.CENTER);
      //  papplet.shape(rect, 10, 10);
        papplet.rect(0, 0, 2*r, r);
        */


        if (papplet.frameCount % n == 0)
        {
          green --;
          red --;
          blue --;
          if(r>=0.4f) {
          r -= 0.2f;
          }
        }

          if (red <= 0){
            red = 0;
          }
          if (blue <= 0){
            blue = 0;
          }
          if (green <= 0){
            green = 0;
          }
        papplet.popMatrix();
        angle += .1/n;
    }


    public boolean isDead()
    {
      if (red <= 0 && green <= 0 && blue <= 0){
        return true;
      }
      else{
        return false;
      }
    }

    public void changeType(){
       type ++;
    }


    private PApplet papplet;
    private double x;
    private double y;
    private int c;
    private double sides;
    private float vx;
    private float vy;
    private double sx;
    private double sy;
    private float r;
//    private float c;
    private int red;
    private int transparency;
    private int blue;
    private int green;
    private float angle;
    private double intangle;
    private int type;
    private PShape rect;
    private boolean strokeOn;
}
