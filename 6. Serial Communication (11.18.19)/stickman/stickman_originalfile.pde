// Code for a walking stickman
// by geotheory.co.uk (2013)
Stickman Stanley;
int grnd;

void setup() {
  size(200, 200);
  grnd = height-20;
  frameRate(30);
  smooth();
  Stanley = new Stickman(30);
}

void draw() {
  background (200);
  translate (width/2, grnd);
  line (-width, 0, width, 0);
  fill(0);
  
  Stanley.stickman();
}

class Stickman {
  int start = int(random(360));
  float t, tk, tf0, tf1, tw;
  float unit = 20;
  Knee[] knees = new Knee[2];
  Foot[] feet = new Foot[2];
  Elbow[] elbows = new Elbow[2];
  Hand[] hands = new Hand[2];

  Stickman(float UNIT) {
    for (int i=0; i<2; i++) {
      knees[i] = new Knee(i);
      feet[i] = new Foot(i);
      elbows[i] = new Elbow(i);
      hands[i] = new Hand(i);
    }
    unit = UNIT;
  }

  void stickman() {
    strokeWeight(2);
    t = (frameCount + start)%360;
    tk = sin (radians(t * 8));
    tf0 = sin (radians((t+12) * 8));
    tf1 = sin (radians((t-12) * 8));
    tw = sin (radians((t+82) * 16));
    pushMatrix();
    translate(0, tw*2);
    pushMatrix();
    translate (0, -unit * 4.5);
    ellipse (0, 0, unit, unit);
    translate (0, unit * 0.5);
    for (Elbow e:elbows) e.move();
    line (0, 0, 0, unit * 1.7);
    translate (0, unit * 1.7);
    for (Knee k:knees) k.move();
    popMatrix ();
    popMatrix ();
    strokeWeight(1);
  }

  class Knee {
    int id, dir;
    PVector p = new PVector();
    Knee(int i) {
      id = i;
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      float angle = dir * radians(30*tk);
      pushMatrix ();
      rotate(angle);
      line(0, 0, 0, unit*1.15);
      translate (0, unit*1.15);
      feet[id].move();
      popMatrix ();
    }
  }

  class Foot {
    float angle;
    int dir;
    PVector p = new PVector();
    Foot(int i) {
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      if (dir==-1) angle = radians(30*tf0 + 25);
      else angle = radians(30*tf1 + 25);
      pushMatrix();
      rotate(angle);
      line(0, 0, 0, unit*1.15);
      popMatrix();
    }
  }

  class Elbow {
    int id, dir;
    PVector p = new PVector();
    Elbow(int i) {
      id = i;
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      float angle = -dir * radians(30*tk);
      pushMatrix ();
      rotate(angle);
      line(0, 0, 0, unit*1.1);
      translate (0, unit*1.1);
      hands[id].move();
      popMatrix ();
    }
  }

  class Hand {
    float angle;
    int dir;
    PVector p = new PVector();
    Hand(int i) {
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      if (dir==-1) angle = -radians(30*tf0 + 25);
      else angle = -radians(30*tf1 + 25);
      pushMatrix();
      rotate(angle);
      line(0, 0, 0, unit*1.1);
      popMatrix();
    }
  }
}
