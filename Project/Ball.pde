import processing.core.*;

public class Ball implements Drawable
{
    public Ball(Project papplet, float x, float y, int c)
    {
        this.papplet = papplet;
        this.x = x; //papplet.mouseX;
        this.y = y;//papplet.mouseY
        this.c =c;

        transparency = 255;
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
        papplet.translate(x, y);
        papplet.rotate(angle);
        papplet.fill(c, transparency);
        if (papplet.state()==2){
          transparency--;
        }
      //  papplet.stroke(red, green, blue);



        papplet.rectMode(papplet.CENTER);
      //  papplet.shape(rect, 10, 10);
        papplet.rect(0, 0, 2*r, r);


        if (papplet.frameCount % n == 0)
        {


          if (r>=0.4f){
            r-=0.2f;
            //transparency--;
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
      if (r<=.4f){
        return true;
      }

      else{
        return false;
      }
    }






    private Project papplet;
    private float x;
    private float y;
    private float vx;
    private float vy;
    private float r;
    private int c;
    private int transparency;
    private int red;
    private int blue;
    private int green;
    private float angle;
    private int type;
    private float t;

    private PShape rect;
    private boolean strokeOn;
}
