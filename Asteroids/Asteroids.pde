import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer intro,theme,shipShoot,discShoot,lose,victory;

int mode;
float cx;
float cy;
boolean w,a,s,d,space;
color s1,s2,s3,s4,s5,s6;
Spaceship myShip;
Discy myDisc;
ArrayList<GameObject> myObjects;
String gameResult;
boolean ast;
float counter;
color c,r,g;

final int MENU = 0;
final int GAME = 1;
final int OPTIONS = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

void setup() {
  
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(800,800);
  background(255);
  
  cx = 400;
  cy = 400;
  mode = 0;
  myShip = new Spaceship();
  myDisc = new Discy();
  myObjects = new ArrayList<GameObject>();
  gameResult = "";
  ast = false;
  c = 100;
  r = 0;
  g = 0;
  counter = 0;
  
  minim = new Minim(this);
  intro = minim.loadFile("Menu 1 Super Smash Bros Brawl Music Extended.mp3");
  theme = minim.loadFile("Tony Igy - Astronomia (Official Video).mp3");
  shipShoot = minim.loadFile("PEW Sound effect Gaming.mp3");
  discShoot = minim.loadFile("Headshot - Sound Effect [Perfect Cut].mp3");
  lose = minim.loadFile("Sonic For Hire Gamer intro.mp3");
  victory = minim.loadFile("Scatman John - Ba Bo Bey.mp3");
  
  int j = 0;
  while (j < 10) {
    myObjects.add(new Asteroid());
    j++;
  }
  
  //For functionality testing
  /*int j = 0;
  while (j < 1) {
    myObjects.add(new Asteroid());
    j++;
  }*/
  
  s1 = 0;
  s2 = 0;
  s3 = 0;
  s4 = 0;
  s5 = 0;
  s6 = 0;
  
  intro.pause();
  intro.rewind();
  theme.pause();
  theme.rewind();
  lose.pause();
  lose.rewind();
  victory.pause();
  victory.rewind();
  
}

void draw() {
  
  if (mode == MENU) menu();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameover();
  else println("Mode Error!");
  
  if (cx >= width+50) {
    cx = -25;
    cy = height/2;
  }
  
  println(myObjects.size());
  
}

void mouseClicked() {
  if (mode == MENU) {
    if (rectButton(200,100,width/2,height/2)) mode = GAME;
    if (rectButton(200,100,width/2,height/1.5)) exit();
  }
  else if (mode == GAME) {
    mode = PAUSE;
  }
  else if (mode == PAUSE) {
    if (rectButton(200,100,width/2,height/2)) mode = GAME;
  }
  else if (mode == GAMEOVER) {
    if (rectButton(200,100,width/2,height/2)) {
      lose.pause();
      lose.rewind();
      victory.pause();
      victory.rewind();
      setup();
    }
  }
}

void tank() {
  pushMatrix();
  translate(cx,cy);
  fill(#21980F);
  rect(0,0,120,200);
  rect(0,-100,20,100);
  circle(0,0,100);
  popMatrix();
}

boolean rectButton(float w,float h,float x,float y) {
  if (mouseX > x-(w/2) && mouseX < x+(w/2) && mouseY > y-(h/2) && mouseY < y+(h/2)) {
    return true;
  } return false;
}

boolean circButton(float d,float x,float y) {
  if (dist(mouseX, mouseY, x, y) < d/2) {
    return true;
  } return false;
}

void textSet(float size,color c,float x,float y,String label) {
  fill(c);
  textSize(size);
  text(label, x, y);
}

void button(String type,float w,float h,float x,float y,String label,boolean stroke,color bc,color s,color tc,float ts) {
  if (type == "Circle") {
    fill(bc);
    if (stroke) {
      stroke(s);
    } else {
      noStroke();
    }
    ellipse(x, y, w, h);
    textSet(ts, tc, x, y, label);
  } else if (type == "Rect") {
    fill(bc);
    if (stroke) {
      stroke(s);
    } else {
      noStroke();
    }
    rect(x, y, w, h);
    textSet(ts, tc, x, y, label);
  }
}
