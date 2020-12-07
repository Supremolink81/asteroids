void game() {
  
  theme.play();
  intro.pause();
  intro.rewind();
  lose.pause();
  lose.rewind();
  victory.pause();
  victory.rewind();
  
  background(0);
  textSet(50,255,width/1.15,height/1.1,"Lives: " + myShip.lives);
  
  myShip.act();
  myShip.show();
  myDisc.act();
  myDisc.show();
  
  int i = 0;
  int j = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    if (obj.lives > 0) {
      if (obj instanceof Asteroid) {
        ast = true;
      }  
      obj.act();
      obj.show();
      i++;
    } else if (obj.lives <= 0) {
      myObjects.remove(i);
    } 
  }
  
  if (ast == false) {
      mode = GAMEOVER;
      gameResult = "win!";
      myObjects.clear();
    }
  
  if (myShip.lives <= 0) {
    mode = GAMEOVER;
    gameResult = "lose!";
    myObjects.clear();
  }
  
  ast = false;
  
}
