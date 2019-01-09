float    x =            60;
float    y =            0;
float    lastY =        0;
float    lastX =        60;
float    xspeed =       0;
float    yspeed =       0;
float    pause =        1;
float    reset =        0;
float    strokeC =      0;
float    sliderY =      100;
float    sliderNumber = 0;
boolean  rainbow =      false;

float    xspeedChange = 4;
float    yspeedChange = 3;


void setup() {
  size(640, 360);
  surface.setResizable(true);
  background(0);
  xspeed = xspeedChange;
  yspeed = yspeedChange;
}

void draw() {
  if (mousePressed && mouseX < 60 && mouseY < sliderY+height-60 && mouseY > sliderY-height*20 && mouseY < height-58 && mouseY > 9) {
    sliderY = mouseY;
  }
  noStroke();
  fill(0);
  rect(0, 0, 60, height, 294);
  sliderNumber = sliderY/100;


  // Trail



  if (pause == 0 && rainbow == true) {
    colorMode(HSB);
    stroke(strokeC, 255, 255);
    strokeC = strokeC + 2*sliderNumber;
  }

  if (strokeC > 255) {
    strokeC = 0;
  }

  if (pause == 0 && rainbow == false) {
    colorMode(RGB);
    stroke(255);
    strokeWeight(5);
  }

  colorMode(RGB);
  strokeWeight(5);
  line(lastX, lastY, x, y);


  // Turn around for X
  if (x > width) {
    xspeed = xspeed * -1;
  }
  if (x < 60) {
    xspeed = xspeed * -1;
  }
  // Turn around for Y
  if (y > height-50) {
    yspeed = yspeed * -1;
  }
  if (y < 0) {
    yspeed = yspeed * -1;
  }

  //Bug fix for x
  if (x > width+50) {
  }
  if (x < 10) {
  }
  //Bug fix for y
  if (y > height) {
  }
  if (y < -50) {
  }

  // The red pause button pressed
  if (mouseX > width/3 && mouseX < (width/3)*2 && mouseY > height-50 && mousePressed) {
    pause = 1;
  }
  // The green play button pressed
  if (mouseX < width/3 && mouseY > height-50 && mousePressed) {
    pause = 0;
  }
  // Somewhere is clicked
  if (mouseY < height-50 && mouseX > 60 && mousePressed) {
    background(0);
    fill(255);
    ellipse(mouseX, mouseY, 4, 4);
    x = mouseX;
    y = mouseY;
    lastX = mouseX;
    lastY = mouseY;
    xspeed = xspeedChange;
    yspeed = yspeedChange;
    pause = 1;
  }

  if (reset == 1) {
    reset = 0;
    pause = 1;
    xspeed = xspeedChange;
    yspeed = yspeedChange;
    background(0);
    x = 60;
    y = 0;
    sliderY = 100;
  }

  // The blue restart button pressed
  if (mouseX > width/3*2 && mouseY > height-50 & mousePressed) {
    reset = 1;
  }
  // Draws the buttons
  stroke(0, 0, 0);
  // The blue restart button
  fill(0, 0, 255);
  rect(width/3*2, height-48, width, height);
  fill(0, 0, 255);
  strokeWeight(6);
  stroke(0, 0, 0);
  ellipse(width/3*2.5, height-24, 33, 33);
  // The red pause button
  strokeWeight(5);
  stroke(0, 0, 0);
  fill(255, 0, 0);
  rect(width/3, height-48, width/3, height);
  fill(0);
  rect(width/3*1.5-10, height-37, 10, 25);
  rect(width/3*1.5+10, height-37, 10, 25);
  // The green play button
  fill(0, 255, 0);
  rect(0, height-48, width/3, height);
  fill(0);
  triangle(width/3*0.5-10, height-35, width/3*0.5-10, height-15, width/3*0.5+10, height-25);
  // The Slider
  noStroke();
  fill(150);
  rect(0, sliderY-10, 60, 20);
  strokeWeight(5);
  stroke(255);
  line(60, height-48, 60, 0);

  if (rainbow == true) {
    colorMode(HSB);
    stroke(strokeC, 255, 255);
    colorMode(RGB);
  } else if (rainbow == false) {
    stroke(255);
  }

  // Movement
  if (pause == 0) {  
    lastX =  x;
    lastY =  y;

    x = x + xspeed * sliderNumber;
    y = y + yspeed * sliderNumber;
  }
}

void keyPressed() {
  if (keyPressed && key == ' ') {
    rainbow = !rainbow;
  }
}
