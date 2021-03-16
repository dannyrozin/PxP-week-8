// The world pixel by pixel 2021
// Daniel Rozin
// reveal effect with two images using mask to get a round soft brush


PImage ourImage, ourImage2;
int maskArray[] = new int[1280* 720];         // our maskArray has to be exactely the size of our images
void setup() {
  size(1280, 720);
  ourImage= loadImage("http://cdn.playbuzz.com/cdn/f721db4c-bdcf-4cbf-83e0-57f9d352b1ed/4330b72d-02e1-4947-b241-9bb4bf06a539.jpg");
  ourImage.resize(width, height);

  ourImage2= loadImage("https://www.pbs.org/wgbh/nova/media/original_images/dog-tales-img.jpg");
  ourImage2.resize(width, height);

  image(ourImage, 0, 0);                          // the image of the cats is immidiately drawn to the screen and we will never access it again
 ourImage2.mask(maskArray);  
}

void draw() {}              // move on, nothing here



void mouseDragged() {                               // for a painting operation the mouseDragged is the best place to put your code
  int brushSize= 50;                                // this will be the size of our brush  
  int opacity = 20;                                // this will hold our opacity 0-255 
  for (int x = 0; x < width; x++){                 // visit all integers in our maskArray
    for (int y = 0; y < height; y++){
      float distanceToMouse = dist(x,y, mouseX, mouseY);      // calculate the distance from the mouse
      if (distanceToMouse< brushSize){                        // if we are are inside the brush circle
        maskArray[x+y*width]=opacity;                         // set this item in the maskArray to the opacity value
      }else{ 
        maskArray[x+y*width]=0;                                // if were outside brush circle, set it to 0;
      }
    }
  }
 ourImage2.mask(maskArray);                                 // assign maskArray asthe mask for ourImage2 (dogs)
 image (ourImage2,0,0);                                      // draw our image (of doogs) only the pixels with not 0 oin maskArray will be drawn

}
