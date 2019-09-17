//  RANDOM/OLD FUNCTIONS I DIDN'T END UP USING

//int findMin(int[] input)
//{
//  int min = input[0];
//  for(int i: input)
//  {
//    if(i<= min)
//    {
//       min = i; 
//    }
//  }
//  return min;
//}

//int findMax(int[] input)
//{
//  int max = input[0];
//  for(int i: input)
//  {
//    if(i>= max)
//    {
//       max = i; 
//    }
//  }
//  return max;
//}

/*
    if (depth[i] >= minDepth && depth[i] <= minDepth + inc) {
 depthImg.pixels[i] = color(255);
 num = 1; //sets the colors
 } else if (depth[i] >= minDepth + inc && depth[i] <= minDepth + 2*inc) {
 depthImg.pixels[i] = color(205);
 num = 0;
 }
 else if (depth[i] >= minDepth + 2*inc && depth[i] <= minDepth + 3*inc) {
 depthImg.pixels[i] = color(155);
 num = 0;
 }
 else if (depth[i] >= minDepth + 3*inc && depth[i] <= minDepth + 4*inc) {
 depthImg.pixels[i] = color(105);
 num = 0;
 }
 else if (depth[i] >= minDepth + 4*inc && depth[i] <= minDepth + 5*inc) {
 depthImg.pixels[i] = color(55);
 num = 0;
 }
 
 *///was in the for loop in draw section, can be used for creating topographic maps
 
 
 
 
 //OLD ColorMap ClASS

/*class ColorMap
{
   //color[]colors = new int[4];
   //colors[0] = color(144,119,255);
   //colors[1] = color(255,250,119);
   //colors[2] = color(206,57,124);
   //colors[3] = color (189, 234, 237);
   int start;
   int stop;
  
   
  ColorMap(int start, int stop)
  {
    this.start = start;
    this.stop = stop;
  }
  
  
  color colorMap(float value) //start = min depth, stop = maxdept, n = number of colors to use 
  {
    value = constrain(value, start, stop-1);
    float t =map(value, start, stop, 0, colors.size()-1);

    int box = (int)t;
       
    return lerpColor(colors.get(box), colors.get(box+1), t-box);
  }
  
  void addColor(int c)
  {
     colors.add(c); 
  }
  
  void setColors(ArrayList<Integer> colors)
  {
    
  }
  
  ArrayList<Integer> colors;
}
*/