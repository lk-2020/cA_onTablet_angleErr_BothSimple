import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

int dWidth=1280;
int dHeight=720;
int numRcordings=0;

int[] iterations;
int rec = 0;

color skeletonColor = 50;
boolean first;

boolean inHere = false;

void setup() {
  first = true;
  //size(displayWidth, displayHeight);
  size(1280, 720);
  //size(2560,1600);
  orientation(LANDSCAPE);
  background(0);
  fill(0, 0, 244);
  stroke(255);
  rectMode(CENTER);

  // Initialize Multitouch x y arrays
  xTouch = new float [10];
  yTouch = new float [10]; // Don't use more than ten fingers
  sqrtL = new float[4]; 
  sqrtR = new float[4];

  dataLoggerInit();
}

//-----------------------------------------------------------------------------------------

void draw() {
  iter=0;// variable to store the actions
  background(255);
  firstTrue();


  //drawBlueCirclesOnTouch();
  if (TouchEvents != 0)
    first = false;
  if (TouchEvents == 1)
    ifTouchEventIs1();
  if (TouchEvents == 2)
    ifTouchEventIs2();
  if (TouchEvents == 4)
    saveLoggedData();
}

void firstTrue() //white left body
{
  rectMode(CENTER);
  fill(skeletonColor);
  noStroke();
  rect(whiteSkeletonX, whiteSkeletonY, 240, 240, 15);

  if ((first == true))
  {   
    angle1_ = 0;
    angle2_ = radians(180);
    strokeWeight(25);
    stroke(skeletonColor);
    segment(whiteRightHandJointX, whiteRightHandJointY, angle1_, whiteHandLength); //white right hand skeleton
    segment(whiteLeftHandJointX, whiteRightHandJointY, angle2_, whiteHandLength); //white left hand skeleton
  }
}

void segment(float x, float y, float a, int handLength) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, handLength, 0);
  popMatrix();
}

void reInitializeTouchPoints()
{
  xTouch[0] = 0.0;
  yTouch[0] = 0.0;
}

