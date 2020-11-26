class Bullet extends GameObject {
  
  boolean isGood;

  Bullet(boolean isGood) {

    timer = 0;
    this.isGood = isGood;
    if (isGood) {
      loc = myShip.loc.copy();
      vel = myShip.dir.copy();
    } else if (!isGood) {
      loc = myDisc.loc.copy();
      vel = myDisc.vel.copy();
    }
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
