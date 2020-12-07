class Particle extends GameObject {
  
  int alpha;
  
  Particle(PVector loc,PVector vel) {
    this.loc = loc;
    this.vel = vel;
    vel.rotate(random(-PI,PI));
    vel.setMag(2);
    size = random(1,4);
    lives = 1;
    alpha = 255;
  }
  
  void act() {
    super.act();
  }
  
  void show() {
    pushMatrix();
    stroke(255,alpha);
    fill(255,alpha);
    translate(loc.x,loc.y);
    rect(0,0,size,size);
    popMatrix();
    alpha -= 5;
    if (alpha <= 0) lives = 0;
  }
  
}
