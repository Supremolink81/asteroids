class Spaceship extends GameObject {

  PVector dir;
  int lifeTimer,alpha;

  Spaceship() {
    
    loc = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    dir = new PVector(0.1,0);
    lives = 3;
    timer = 0;
    limit = 35;
    lifeTimer = 0;
    alpha = 255;
  }

 

  void act() {

    super.act();
    timer++;
    if (lifeTimer > 0) {
      alpha = 122;
      lifeTimer--;
    } else {
      alpha = 255;
    }
    if (a) dir.rotate(-radians(2));
    if (d) dir.rotate(radians(2));
    if (w) {
      vel.add(dir);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (s) vel.sub(dir);
    if (space && timer >= limit) {
        myObjects.add(new Bullet());
        shipShoot.rewind();
        shipShoot.play();
        timer = 0;
    }
    if (vel.mag() > 2) vel.setMag(2);
    if (loc.x < -25) loc.x = width+25;
    if (loc.x > width+25) loc.x = -25;
    if (loc.y < -25) loc.y = height+25;
    if (loc.y > height+25) loc.y = -25;
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof DiscyBullet || obj instanceof Asteroid) {
        if (dist(obj.loc.x,obj.loc.y,loc.x,loc.y) < 10 + obj.size/2) {
          if (lifeTimer <= 0) {
            lives--;
            lifeTimer = 60;
          }
          obj.lives = 0;
          loc.x = width/2;
          loc.y = height/2;
        }
      } i++;
    }
  } 

  void show() {

    pushMatrix();
    stroke(255,alpha);
    fill(0,alpha);
    translate(loc.x,loc.y);
    rotate(dir.heading());
    quad(0,0,-25,-25,25,0,-25,25);
    popMatrix();
    
  }

}

class Discy extends GameObject {
  
  PVector dir;
  float lifeTimer,lifeLimit;
  boolean hasLife;
  int pos;
  
  Discy() {
    loc = new PVector(0,0);
    vel = new PVector(random(1,3),random(1,3));
    dir = new PVector(0.1,0);
    size = 0;
    lives = 1;
    pos = 0;
    timer = 0;
    limit = 60;
    lifeTimer = 0;
    lifeLimit = 1800;
    hasLife = false;
  }
  
  void act() {
    if (lives > 0) {
    super.act();
    if (loc.x < -15 || loc.x > 815 || loc.y < -15 || loc.y > 815) {
      lives = 0;
    }
    timer++;
    if (timer == limit) {
      myObjects.add(new DiscyBullet());
      discShoot.play();
      discShoot.rewind();
      timer = 0;
    }
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet || obj instanceof Asteroid) {
        if (dist(obj.loc.x,obj.loc.y,loc.x,loc.y) < 5 + obj.size/2) {
          lives--;
          obj.lives = 0;
          loc.x = width/2;
          loc.y = height/2;
        }
      } i++;
    }
    } else if (lives == 0) {
        loc.x = -20;
        loc.y = -20;
        lifeTimer++;
        if (lifeTimer > lifeLimit) {
          pos = int(random(1,4));
          if (pos == 1) {
          loc.x = -10;
          loc.y = random(-10,810);
          vel.x = random(1,3);
          vel.y = random(1,3);
        } else if (pos == 2) {
          loc.x = -810;
          loc.y = random(-10,810);
          vel.x = random(1,3);
          vel.y = random(1,3);
        } else if (pos == 3) {
          loc.x = random(-10,810);
          loc.y = -10;
          vel.x = random(1,3);
          vel.y = random(1,3);
        } else if (pos == 4) {
          loc.x = random(-10,810);
          loc.y = 810;
          vel.x = random(1,3);
          vel.y = random(1,3);
        }
          lifeTimer = 0;
          lives = 1;
        }
    }
  }
  
  void show() {
    pushMatrix();
    fill(0);
    stroke(255);
    translate(loc.x,loc.y);
    circle(0,-5,10);
    ellipse(0,0,30,10);
    popMatrix();
  }
  
}
