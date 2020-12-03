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
      } else if (obj instanceof Spaceship) {
        float distance = dist(obj.loc.x,obj.loc.y,loc.x,loc.y);
        if (distance <= obj.size/2 + size/2) {
          distance = obj.size/2 + size/2;
        } 
      } else i++;
    }
  }
}
