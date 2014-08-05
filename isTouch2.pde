int k, l;
boolean Lin;
boolean Rin;

void ifTouchEventIs2()
{
  k = 0;
  l = 0;
  int i, j;
  Lin = false;
  Rin = false;
  strokeWeight(25);
  stroke(skeletonColor);
  segment(whiteRightHandJointX, whiteRightHandJointY, angle1_, whiteHandLength);
  segment(whiteLeftHandJointX, whiteLeftHandJointY, angle2_, whiteHandLength);
  for (i=0;i<2;i++)
  {
    sqrtR[i] = sqrt(pow(xTouch[i]-(whiteRightHandEndX), 2) + pow(yTouch[i]-(whiteRightHandEndY), 2));
    if (sqrtR[i] < bufferArea)// check for right joint --- touchid[i] is the right joint
    {
      rightHandJoint1 = sqrt(pow(xTouch[i]-(whiteRightHandJointX), 2) + pow(yTouch[i]-(whiteRightHandJointY), 2));
      if ((rightHandJoint1<whiteHandLength+bufferArea)&&(rightHandJoint1>whiteHandLength-bufferArea))
      {
        Rin = true;
        k = i;//logData(0, 0, (int)xTouch[i], (int)yTouch[i]);
        jRx = i;
        whiteRightHandEndX = (int)xTouch[i];
        whiteRightHandEndY = (int)yTouch[i];
        dx1 = xTouch[i] - whiteRightHandJointX;
        dy1 = yTouch[i] - whiteRightHandJointY;
        angle1_ = atan2(dy1, dx1);
      }
    }
  }


  for (i=0;i<2;i++)
  {
    if (i != jRx)
    {
      leftHandJoint1 = sqrt(pow(xTouch[i]-(whiteLeftHandJointX), 2) + pow(yTouch[i]-(whiteLeftHandJointY), 2));
      if ((leftHandJoint1<whiteHandLength+bufferArea)&&(leftHandJoint1>whiteHandLength-bufferArea))
      { 
        Lin = true;
        l = i;//logData((int)xTouch[i], (int)yTouch[i], 0, 0);
        whiteLeftHandEndX = (int)xTouch[i];
        whiteLeftHandEndY = (int)yTouch[i];
        dx2 = xTouch[i] - whiteLeftHandJointX;
        dy2 = yTouch[i] - whiteLeftHandJointY;
        angle2_ = atan2(dy2, dx2);
      }
    }
  }

  if ((Lin == true)&&(Rin == true))
    logData((int)xTouch[l], (int)yTouch[l], (int)xTouch[k], (int)yTouch[k]);
}

