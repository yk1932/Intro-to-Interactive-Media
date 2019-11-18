//Stickman original code credits to: geotheory https://gist.github.com/geotheory/5373003 
import processing.serial.*;

Serial myPort; //Create Object from Serial Class
String pot_case; //Data received from the Serial Port

Stickman Yeji; //Create object Yeji of class Stickman
int ground; //the y-coordinate value of ground
int speed; //the speed will be altered based on the potentiometer
int personHeight = 50; //height of stickman
int personThickness = 10; //thickness of stickman 
int time_till_class = 2000; //time left till class
int distance_to_class = 50000; //distance to class
int distance_left; 
int time_left;

void setup() {
  String portName = Serial.list()[1]; //change the 0 to 1 or 2 to match your port
  speed = 50;
  myPort = new Serial(this, portName, 9600);
  size(1000, 500); //size of canvas
  ground = height-40; //ground is 20 pixels above 
  frameRate(speed); //the framerate to control speed
  smooth(); //makes edges smooth (smoother animated effect)
  Yeji = new Stickman(personHeight); //create stickman names Yeji
}

void draw() {

  //read distance from the arduino
  if (myPort.available() > 0)
  {//if data available,
    pot_case = myPort.readStringUntil('\n'); //reading it and store it in val
    pot_case=trim(pot_case);
    if (pot_case != null) {  
      if (pot_case.equals("A")) {
        speed = 40;
        println("AAAAAAAA"); 
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("B")) {
        speed = 45;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("C")) {
        speed = 50;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("D")) {
        speed = 55;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("E")) {
        speed = 60;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("F")) {
        speed = 65;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("G")) {
        speed = 70;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("H")) {
        speed = 75;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("I")) {
        speed = 80;
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("J")) {
        speed = 85;  
        frameRate(speed); //the framerate to control speed
      } else if (pot_case.equals("K")) {
        speed = 90;  
        frameRate(speed); //the framerate to control speed
      } else {
      }
    }


    println("pot case:" +pot_case+"end");
    println(speed);
    println(frameRate);
  }


  background (157, 200, 230); //color of background
  fill(0);                         // STEP 4 Specify font color 
  text("Distance to Class: "+ distance_left,10,20);   // STEP 5 Display Text
  text((time_left/100)+" seconds left till 9am class",10,40);
  translate (width/2, ground); //Set (0,0) of the screen to the the middle x-coordinate and ground y-coordinate
  strokeWeight(1); //the thickness of the line of the ground
  line (-width, 0, width, 0); //ground
  fill(157, 200, 230); //fill head

  Yeji.stickman(); //Initiate stickman
} 

//create stickman

class Stickman {
  float t, tk, tf0, tf1, tw; //

  Knee[] knees = new Knee[2]; //Create a list of knees of size 2
  Foot[] feet = new Foot[2]; //Create a list of Feets of size 2
  Elbow[] elbows = new Elbow[2]; //Create a list of Elbows of size 2
  Hand[] hands = new Hand[2]; //Create a list of Hands of size 2


  Stickman(int personThickness) {
    for (int i=0; i<2; i++) {
      knees[i] = new Knee(i); //Create two knees and put them in the knees list
      feet[i] = new Foot(i); //Create two feet and put them in the feet list
      elbows[i] = new Elbow(i); //Create two elbows and put them in the elbows list
      hands[i] = new Hand(i); //Create two hands and put them in the hands list
    }
  }

  void stickman() {
    strokeWeight(personThickness); //the thickness of stickman


    int time_passed = 0;
    time_passed = time_passed + frameCount; //frameCount is the time that has been passed in milliseconds

    time_left = time_till_class - time_passed;

    int distance_moved = speed * time_passed; //distance moved    
    distance_left = distance_to_class - distance_moved; //distance left to class
    //println(distance_left);



    //println(time_left);
    //int time_left = 1000 - frameCount
    //println(frameCount);
    tk = sin (radians(time_passed * 8)); //angle of knee and elbow 
    tf0 = sin (radians((time_passed+12) * 8)); //angle of first foot and hand
    tf1 = sin (radians((time_passed-12) * 8)); //angle of second foot and hand
    tw = sin (radians((time_passed+82) * 16)); //angle height movement of person



    pushMatrix(); 
    translate(0, tw*2); //movement of person (jumpy motion)
    pushMatrix();

    translate (0, -personHeight * 4.5); //translate position of stickman
    ellipse (0, 0, personHeight, personHeight); //head

    translate (0, personHeight * 0.5);

    for (Elbow e : elbows) e.move(); //making elbows
    line (0, 0, 0, personHeight * 1.7);
    translate (0, personHeight * 1.7);

    for (Knee k : knees) k.move(); //making knees
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
      line(0, 0, 0, personHeight*1.15);
      translate (0, personHeight*1.15);
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
      line(0, 0, 0, personHeight*1.15);
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
      line(0, 0, 0, personHeight*1.1);
      translate (0, personHeight*1.1);
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
      line(0, 0, 0, personHeight*1.1);
      popMatrix();
    }
  }
}
