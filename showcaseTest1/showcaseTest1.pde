import processing.sound.*;
SoundFile file;
float x, y;
float xPos, yPos;
float xSpeed, ySpeed;
float red;
int design;
int i=0;

void setup() {
  size(800, 800);
  background(255);
  SoundFile sound = new SoundFile(this, "ONE DANCE INSTRUMENTAL.mp3");
  sound.play();
  xSpeed=3;
  ySpeed=4;
  red=255;
  design=0;
}

void draw() {
  if (design == 0) {
    line();
  } else if ( design == 1) {
    line2();
  } else if (design == 2) {
    line3();
  } else if (design == 3) {
    line4();
  } else {
    design=0;
  }
  bounce();
  stroke();
}

void line() {
  line(x, y, width/2, height/2);
  //line(x, y-10, width/2, height/2-10);
  //line(x, y+10, width/2, height/2+10);
  //line(x-10, y, width/2-10, height/2);
  //line(x+10, y, width/2+10, height/2);
}

void line2() {
  line(x, y-250, width/2, height/2-250);
  line(x, y+250, width/2, height/2+250);
  line(x-250, y, width/2-250, height/2);
  line(x+250, y, width/2+250, height/2);
}

void line3() {
  xPos=xPos+5;
  yPos=yPos-5;
  translate(width/2, height/2);
  pushMatrix();
  scale(0.5);
  rotate(radians(xPos));
  line(0, 0, 420, 420);

  translate(200, 0);
  rotate(radians(-xPos));
  ellipse(0, 0, 100, 100);
  popMatrix();

  translate(0, 0);
  pushMatrix();
  rotate(radians(yPos));
  ellipse(0, 0, 10, 10);

  translate(350, 0);
  rotate(radians(-yPos));
  ellipse(0, 0, 100, 100);
  popMatrix();
}

void line4() {
  xPos=xPos+5;
  yPos=yPos-5;
  translate(width/2, height/2);
  pushMatrix();
  scale(0.5);
  rotate(radians(xPos));
  line(0, 0, 350, 350);

  translate(200, 0);
  rotate(radians(-xPos));
  ellipse(0, 0, 100, 100);

  translate(0, 0);
  rotate(radians(yPos));
  ellipse(0, 0, 10, 10);

  translate(350, 0);
  rotate(radians(-yPos));
  ellipse(0, 0, 100, 100);
  popMatrix();
}

void bounce() {
  x = x+xSpeed;
  if (x>width || x<0) {
    xSpeed = xSpeed*-1;
  }
  y = y+ySpeed;
  if (y>height || y<0) {
    ySpeed = ySpeed*-1;
  }
}

void stroke() {
  strokeWeight(0.5);
  stroke(red, 0, random(255));
  noFill();
}

void keyPressed()
{
  if (key =='r') {
    red = red + 150;
  } else if (key == 'b') {
    red = red - 150;
  }
  if (key == ' ' ) {
    design++;
  }
}

void mousePressed() {
  if (i%2 == 0) {
    background(0);
  } else
    background(255);
  i++;
}
