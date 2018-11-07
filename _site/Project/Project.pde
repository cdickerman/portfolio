
  public int state(){
    return state;
  }

  public void setup()
    {
      size(1000,800);
      x = width/2;
      y = height/2;
    //  minim = new Minim(this);
              //song = minim.loadFile("Blop-Mark_DiAngelo-79054334.mp3");


    }

  public void draw()
    {

      background (0);
        for (int i  = 1; i<=n; i++){
          pushMatrix();
          translate(width/2, height/2);
          rotate(2*PI*i/n);
          for (int j = 0; j < draws.size(); j++){
            draws.get(j).display(n);
            removeDeadBalls();
        }
          popMatrix();
        }
        if (state == 0){ //draws the text
          fill (208, 183, 255);
          textSize (80);
          PFont mono;
            // The font "andalemo.ttf" must be located in the
    // current sketch's "data" directory to load successfully
        //  mono = loadFont("Raleway-Regular.ttf");
        //  background(0);
        //  textFont(mono);

          textAlign(CENTER, BOTTOM);
          text("welcome!", width/2, height/2-200);

          textSize (40);
          textAlign(CENTER, BOTTOM);
          text("(Catherine Dickerman's project)", width/2, height/2-160);
          fill(255);
          textSize (50);
          textAlign(CENTER, BOTTOM);
          text("to begin the drawing: press 1", (width/2), (height/2 -60));
          textSize(30);
          textAlign(CENTER, BOTTOM);
          text("to draw: drag with mouse", (width/2), (height/2) -20);
          textAlign(CENTER, BOTTOM);
          text("to change kaleidoscope: use the up and down arrow keys", (width/2), (height/2)+40);
          textAlign(CENTER, BOTTOM);
          text("to change shape: use number keys 1-9", (width/2), (height/2)+80);
          textAlign(CENTER, BOTTOM);
          text("to save frame: press the s key", (width/2), (height/2)+140);
          //textAlign(CENTER, BOTTOM);
          //text("to begin the drawing: press 1", (width/2), (height/2)+80);
          textAlign(CENTER, BOTTOM);
          text("to return to this screen: press 0", (width/2), (height/2)+10);
          textAlign(CENTER, BOTTOM);
          textSize(20);
          fill(180);
          text("key: ", (width/2), (height/2)+200);
          text("1 = rectangles", (width/2), (height/2)+220);
          text("2 = transparent rectangles", (width/2), (height/2)+240);
          text("3 = triangles", (width/2), (height/2)+260);
          text("4 = sqaures", (width/2), (height/2)+280);
          text("5 = pentagons", (width/2), (height/2)+300);
          text("6 = hexagon", (width/2), (height/2)+320);
          text("7 = heptagons", (width/2), (height/2)+340);
          text("8 = octagons", (width/2), (height/2)+360);
          text("9 = nonoagons", (width/2), (height/2)+380);
        }

}
    public void keyPressed() {
      if (keyCode == UP){
      n ++;
     // song.play();
     // song.rewind();
    }
      if (keyCode == DOWN){
        n--;
       // song.play();
       // song.rewind();
      }
      if (key == '0'){
        state = 0;
       for (int i = draws.size()-1; i >= 0; i--){
             draws.remove(i);

           }
      }
      if (key == '1'){
        state = 1;
       for (int i = draws.size()-1; i >= 0; i--){
             draws.remove(i);

           }
      }
      if (key == '2'){
        state = 2;
         for (int i = draws.size()-1; i >= 0; i--){
           draws.remove(i);
          }
      }
      if (key == '3'){
        state = 3;
        for (int i = draws.size()-1; i >= 0; i--){
            draws.remove(i);
          }
      }
      if (key == '4'){
        state = 4;
        for (int i = draws.size()-1; i >= 0; i--){
            draws.remove(i);
          }
      }
      if (key == '5'){
        state = 5;
        for (int i = draws.size()-1; i >= 0; i--){
            draws.remove(i);
          }
    }
    if (key == '6'){
      state = 6;
      for (int i = draws.size()-1; i >= 0; i--){
          draws.remove(i);
        }
      }
    if (key == '7'){
      state = 7;
      for (int i = draws.size()-1; i >= 0; i--){
          draws.remove(i);
          }
      }
      if (key == '8'){
        state = 8;
        for (int i = draws.size()-1; i >= 0; i--){
            draws.remove(i);
          }
        }
      if (key == 's'){
        saveFrame();
      }
        /*
    if (key == 'b'){
      red = (int)random(255);
      green = (int)random(255);
      blue = 240;
    }
    if (key == 'g'){
      red = (int)random(255);
      green = 240;
      blue = (int)random(255);
    }
    if (key == 'r'){
      red = 240;
      green = (int)random(255);
      blue = (int)random(255);
    }
    if(key == 'c'){
      red = (int)random(255);
      green = (int)random(255);
      blue = (int)random(255);
    }*/
}
  public void mouseDragged()
    {

      if(state == 1){
        transparency=255;
        Ball ball = new Ball(this,  mouseX-width/2, mouseY-height/2, hue(t,transparency));
        draws.add(ball);
        t+=.005f;
        //transparency--;

      }

      else if(state == 2){

        Ball ball = new Ball(this,  mouseX-width/2, mouseY-height/2, hue(t, 255));
        draws.add(ball);
        t+=.005f;

      //  transparency--;



      }
      else{
        transparency=255;
        Polygon poly = new Polygon(this, mouseX-width/2, mouseY-height/2, state, hue(t,transparency));
        draws.add(poly);
        t+=.005f;
      }

    }

public void removeDeadBalls(){
  for (int i = draws.size()-1; i >= 0; i--){
    if (draws.get(i).isDead() == true){
      draws.remove(i);
    }
  }
}
private  int hue(float t, int transparency)
  {

      float x = 3*t - (int)(3*t);
      if (x < 1./3)
      {
          return color((1-x)*255, x*255, 0, transparency); // R->G
      }
      else if (x < 2./3)
      {
          return color(0, (1-x)*255, x*255, transparency); // G->B
      }
      else
      {
          return color(x*255, 0, (1-x)*255, transparency); // B->R
      }

}


//public void keyPressed(){
  //  for (Ball ball : balls)
    //ball.changeType();
//}

    private float x;
    private float y;
    private float vx;
    private float vy;
    private float r;
    private float w;
    private float h;
    private float t;
    private int tr;
    private int n = 6;
    private boolean strokeOn;
    private int state = 0;
    private int red;
    private int green;
    private int blue;
  //  private Minim minim;
   // private AudioPlayer song;
    private int transparency = 255;


    ArrayList<Drawable> draws = new ArrayList<Drawable>();
  //  ArrayList<Polygon> poly = new ArrayList<Polygon>();


      public static void main(String[] args)
      {
          main("Project");
      }
