void gameover() {
  
  intro.pause();
  intro.rewind();
  theme.pause();
  theme.rewind();
  
  if (gameResult == "win!") {
    r = 0;
    g = 255;
    victory.play();
    lose.pause();
    lose.rewind();
  } else if (gameResult == "lose!") {
    r = 255;
    g = 0;
    lose.play();
    victory.pause();
    victory.rewind();
  }
  
  background(r,g,0);
  
  textSet(150,0,width/2,height/6,"You "+gameResult);
  
  button("Rect",200,100,width/2,height/2,"Restart",true,255,s6,0,40);
  
  if (rectButton(200,100,width/2,height/2)) {
    s6 = #FF0000;
  } else {
    s6 = 0;
  }
}
