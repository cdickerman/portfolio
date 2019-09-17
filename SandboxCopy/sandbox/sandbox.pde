import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;
KinectTracker tracker;

PImage depthImg;
float deg;
int num;
ArrayList<Integer>depthValues;  
boolean mountain = true;
float minDepth = 740;
float maxDepth = 800; 

//first colors are natural mountainy, second colors are colorful
color c1 = color(236, 234, 252);
color c2 = color(165, 141, 104);
color c3 = color(58, 104, 50);
color c4 = color(81, 90, 255);
color c5 = color(40, 19, 132);

color c6 =  color(255, 173, 177);
color c7 = color(242, 72, 140);
color c8 =  color(255, 224, 25);
color c9 = color(81, 90, 255);
color c10 = color(40, 19, 132);

color[]colorsMountain = {c1,c2,c3,c4, c5};
color[]colorsRainbow = {c6,c7,c8,c9,c10};

  color colorMap(float value, float start, float stop, int n) //start = min depth, stop = maxdept, n = number of colors to use 
  { 
    value = constrain(value, start, stop-1);
    float t =map(value, start, stop, 0, colorsMountain.length-1);
    
    int box = (int)t;
    
    if (mountain == true)
      return lerpColor(colorsMountain[box], colorsMountain[box+1], t-box); 
    else
      return lerpColor(colorsRainbow[box], colorsRainbow[box+1], t-box);
  } 

void setup()
{
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  kinect.initDepth();
  kinect.initVideo();

  depthImg = new PImage(kinect.width, kinect.height);

  deg = kinect.getTilt();

  depthValues = new ArrayList<Integer>();
}

void draw()
{    
  kinect.setTilt(deg);

  int[] depth = kinect.getRawDepth();
 
  for (int i=0; i < depth.length; i++) {
    depthImg.pixels[i] = colorMap(depth[i], minDepth, maxDepth, 2);
    }
    
  depthImg.updatePixels();
  image(depthImg, 0, 0, width, height);

  text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
  
  textAlign(CENTER, CENTER);
  pushMatrix();
  translate(width/2, height-100); // This is the center of the text i want to flip
  rotate(PI);
  text("Use the ASWD keys to edit colors. To go back to the original colors, press R. To toggle between mountain and rainbow theme, press space.", 0, 0);
  popMatrix(); //this sequence makes text upside down.  
}

void keyPressed()
{
  if (key == 'a') 
    minDepth -= 10;
  else if (key == 'd' && maxDepth-minDepth>10) 
    minDepth += 10;
  else if (key == 'w')  
    maxDepth += 10;
  else if (key == 's' && maxDepth-minDepth>10)  
    maxDepth -= 10;
   
  else if (key == 'r') {
    minDepth =740;
    if (mountain == true)
      maxDepth= 800;
    else
      maxDepth = 790;
    }
  
  else if (key == ' ')
    mountain = !mountain;
}
