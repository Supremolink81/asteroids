void pause() {
  
  theme.play();
  intro.pause();
  intro.rewind();
  lose.pause();
  lose.rewind();
  victory.pause();
  victory.rewind();
  
  
  background(255,255,0);
  
  textSet(150,0,width/2,height/7,"Paused");
  button("Rect",200,100,width/2,height/2,"Return",true,255,s5,0,60);
  
  fill(0);
  stroke(255);
  rect(width/2-16,height/3,20,80);
  rect(width/2+16,height/3,20,80);
  
  if (rectButton(200,100,width/2,height/2)) {
    s5 = #FF0000;
  } else {
    s5 = 0;
  }
}
