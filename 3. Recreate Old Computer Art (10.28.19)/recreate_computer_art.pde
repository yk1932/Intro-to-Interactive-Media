void setup() {
  fullScreen();
  background(255);
  noFill();
  rectMode(CENTER);
}

//size of the balls are randomized for each launch using the random function
int big_ball = int(random(100, 500));
int color_value = int(random(0, 255));
int color_value2 = int(random(0, 255));
int color_value3 = int(random(0, 255));
int num_innerball = int(random(1, 40));


void draw() {

  //set color of background 
  background(color_value);
  
  //draw big circles 
  for (int y = 0; y< height; y +=big_ball) {
    for (int x = 0; x<width; x +=big_ball) {
      pushMatrix();
      translate(x, y);
      fill(color_value, color_value2, color_value3);
      ellipse(big_ball/2, big_ball/2, big_ball, big_ball);
      
      
      //draw inner circles
      for (int n = num_innerball; n > 0; n -= 1) {
        stroke(color_value);
        strokeWeight(color_value/20);
        ellipse(big_ball/2, big_ball/2, big_ball-big_ball/n, big_ball-big_ball/n);
        ;
      }

      popMatrix();
    }
  }
}
