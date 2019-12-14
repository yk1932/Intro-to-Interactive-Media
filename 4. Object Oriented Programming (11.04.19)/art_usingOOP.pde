//class canvas
class Drawing { 
  int big_ball, color_value, color_value2, color_value3, num_innerball;
  //variables used in canvas
  //int big_ball = int(random(100, 500));
  //int color_value = int(random(0, 255));
  //int color_value2 = int(random(0, 255));
  //int color_value3 = int(random(0, 255));
  //int num_innerball = int(random(1, 40));
  Drawing(int b, int c1, int c2, int c3, int n) {
    big_ball = b;
    color_value = c1;
    color_value2 = c2;
    color_value3 = c3;
    num_innerball = n;
  }


  void drawCircles() {
    //draw big circles 
    for (int y = 0; y< height; y +=big_ball) {
      for (int x = 0; x<width; x +=big_ball) {
        pushMatrix();
        translate(x, y);
        fill(color_value, color_value2, color_value3);
        ellipse(big_ball/2, big_ball/2, big_ball, big_ball);



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
}

Drawing drawing1= new Drawing(150, 200, 100, 100, 20);

void setup() {
  fullScreen();
  background(255);
  noFill();
  rectMode(CENTER);
  drawing1.drawCircles();
}
