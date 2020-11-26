void keyPressed() {

  if (key == 'w' || key == 'W') w = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'd' || key == 'D') d = true;
  if (key == ' ') space = true;

 

}

void keyReleased() {

  if (key == 'w' || key == 'W') w = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'd' || key == 'D') d = false;
  if (key == ' ') space = false;

}

class GameObject {

  PVector loc;
  PVector vel;
  float size;
  byte lives;
  int timer,limit;
  color c;

  GameObject() {

  }

 

  void act() {
    
    loc.add(vel);
    
  }

 

  void show() {
    
    pushMatrix();
    stroke(255);
    fill(0);
    translate(loc.x,loc.y);
    rect(0,0,size,size);
    popMatrix();
    
  }

}
