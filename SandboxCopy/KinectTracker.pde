class KinectTracker
{
  int maxThreshold = 1030; //this is where you can adjust threshold to get average points
  int minThreshold = 900;
  
  PVector loc;
  PVector lerpedLoc;
  int[] depth;
  PImage display;
  
  KinectTracker()
  {
    kinect.initDepth();
    kinect.enableMirror(false);
    display = createImage(kinect.width, kinect.height, RGB);
    loc = new PVector(0,0);
    lerpedLoc = new PVector(0,0);
  }
  
  void track()
  {
     depth = kinect.getRawDepth();
     
     if (depth == null)
       return;
      
     float sumX = 0;
     float sumY = 0;
     float count = 0;
     
     for (int x = 0; x < kinect.width; x++) {
        for (int y = 0; y < kinect.height; y++){
           int offset = x + y*kinect.width; //might need y*kinect.width is what they have in the example
           int rawDepth = depth[offset];
           
           if (rawDepth < maxThreshold && rawDepth > minThreshold) {
             sumX += x;
             sumY += y;
             count++;
           }
        }
     }
     
      if (count != 0) {
        loc = new PVector(sumX/count, sumY/count);
      }
      
      lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
      lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }
  
  PVector getLerpedPos() {
     return lerpedLoc; 
  }
  
  PVector getPos() {
     return loc; 
  }
  void display() {
    PImage img = kinect.getDepthImage();

    if (depth == null || img == null) return;

    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < maxThreshold) {
          // A red color instead
          display.pixels[pix] = color(150, 50, 50);
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display, 0, 0);
  }
  
  int getMaxThreshold() {
    return maxThreshold;
  }
  
  void setMaxThreshold(int t) {
    maxThreshold =  t;
  }
}