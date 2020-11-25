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

class Spaceship extends GameObject {
 
  PVector dir,pew;
 
  Spaceship() {
    loc = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    dir = new PVector(0.1,0);
    lives = 3;
    pew = new PVector(30,0);
    timer = 0;
    limit = 35;
  }
 
  void act() {
    super.act();
    timer++;
    if (a) dir.rotate(-radians(2));
    if (d) dir.rotate(radians(2));
    if (w) vel.add(dir);
    if (s) vel.sub(dir);
    if (space && timer >= limit) {
        myObjects.add(new Bullet());
        timer = 0;
    }
    if (vel.x > 0.3) vel.x = 0.3;
    if (loc.x < -25) loc.x = width+25;
    if (loc.x > width+25) loc.x = -25;
    if (loc.y < -25) loc.y = height+25;
    if (loc.y > height+25) loc.y = -25;
  }
 
  void show() {
    pushMatrix();
    stroke(255);
    fill(0);
    translate(loc.x,loc.y);
    rotate(dir.heading());
    quad(0,0,-25,-25,25,0,-25,25);
    popMatrix();
  }
 
}
class Asteroid extends GameObject {
 
  Asteroid() {
    loc = new PVector(random(width),random(height));
    vel = new PVector(random(0.1,0.3),random(0.1,0.3));
    vel.rotate(radians(random(TWO_PI)));
    size = random(10,50);
    lives = 1;
  }
  
  Asteroid(float s,PVector loc) {
    lives = 1;
    this.loc = loc;
    vel = new PVector(0,1);
    vel.rotate(radians(random(TWO_PI)));
    this.size = s;
  }
 
  void act() {
    super.act();
    if (loc.x < -(size/2)) loc.x = width+size/2;
    if (loc.x > width+size/2) loc.x = -(size/2);
    if (loc.y < -(size/2)) loc.y = height+size/2;
    if (loc.y > height+size/2) loc.y = -(size/2);
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(obj.loc.x,obj.loc.y,loc.x,loc.y) <= obj.size/2 + size/2) {
          obj.lives = 0;
          lives = 0;
          if (size >= 25) {
            myObjects.add(new Asteroid(size/2,new PVector(loc.x,loc.y)));
            myObjects.add(new Asteroid(size/2,new PVector(loc.x,loc.y)));
          }
        }
      }
      i++;
    }
  }
 
}
class Bullet extends GameObject {
 
  Bullet() {
    timer = 60;
    loc = new PVector(myShip.loc.x,myShip.loc.y);
    vel = new PVector(myShip.dir.x,myShip.dir.y);
    size = 5;
    lives = 1;
  }
 
  void act() {
    super.act();
    vel.setMag(10);
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) lives = 0;
    timer--;
    if (timer == 0) lives = 0;
  }
 
}
