class Bullet extends GameObject {

  Bullet() {

    timer = 0;
    loc = myShip.loc.copy();
    vel = myShip.dir.copy();
    size = 5;
    lives = 1;
    limit = 45;
  }

  void act() {

    super.act();
    vel.setMag(10);
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) lives--;
    timer++;
    if (timer == limit) lives--;
  }

}

class DiscyBullet extends GameObject {
  
  PVector aim;

  DiscyBullet() {

    timer = 0;
    loc = myDisc.loc.copy();
    aim = new PVector(myShip.loc.x-myDisc.loc.x,myShip.loc.y-myDisc.loc.y);
    aim.setMag(20);
    vel = new PVector(aim.x,aim.y);
    size = 5;
    lives = 1;
    limit = 20;
  }

  void act() {

    super.act();
    vel.setMag(10);
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) lives--;
    timer++;
    if (timer == limit) lives--;
    
  }

}
