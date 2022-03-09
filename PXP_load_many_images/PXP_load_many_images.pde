// The world pixel by pixel 2022
// Daniel Rozin
// loads images from data folder that
// are named image0.jpg, image1.jpg...

int numOfImages = 10;                         // how many images
PImage imageArray[] = new PImage[numOfImages]; //array to hold the images

void setup() {
  size(1000, 800);
  for (int i = 0; i < numOfImages; i++) {
    imageArray[i]= loadImage("image" + i + ".jpg");  //load the images and place in array
    imageArray[i].resize(width, height);             // resize the images to the size of our window
  }
  frameRate(30);
}

void draw() {
  int imageWidth= mouseX;
  for (int i = 0; i < numOfImages; i++) {
    //image  (imageArray[i], i*imageWidth, 0, imageWidth, height);
    copy(imageArray[i], i*imageWidth, 0, imageWidth, height, i*imageWidth, 0, imageWidth, height);
  }
  // for sequential flipping try the following
  // tint(255, 15);
  //image(imageArray[ second() % numOfImages  ], 0, 0);
}
