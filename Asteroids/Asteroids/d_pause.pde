void pause() {
  
  theme.play();
  intro.pause();
  intro.rewind();
  lose.pause();
  lose.rewind();
  victory.pause();
  victory.rewind();
  
  
  background(255,255,0);
  
  button("Rect",200,100,width/2,height/2,"Return",true,255,s5,0,60);
  
  if (rectButton(200,100,width/2,height/2)) {
    s5 = #FF0000;
  } else {
    s5 = 0;
  }
}
