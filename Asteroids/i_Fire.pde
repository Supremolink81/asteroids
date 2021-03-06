class Fire extends GameObject {
  
  int alpha;
  float thrust;
  
  Fire() {
    loc = myShip.loc.copy();
    vel = myShip.vel.copy();
    vel.rotate(PI - random(-0.5,0.5));
    vel.setMag(2);
    size = random(1,4);
    lives = 1;
    alpha = 255;
    thrust = dist(loc.x,loc.y,myShip.loc.x,myShip.loc.y) * 3;
  }
  
  void act() {
    super.act();
  }
  
  void show() {
    pushMatrix();
    stroke(255,alpha);
    fill(255,thrust,0,alpha);
    translate(loc.x,loc.y);
    rect(0,0,size,size);
    popMatrix();
    alpha -= 25;
    if (alpha <= 0) lives = 0;
  }
  
}
