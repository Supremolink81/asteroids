void menu() {
  background(c);
  
  intro.play();
  theme.pause();
  theme.rewind();
  lose.pause();
  lose.rewind();
  victory.pause();
  victory.rewind();
  
  counter+=1;
  if (counter > 30) c = 255;
  if (counter > 60) {
    counter = 0;
  } else if (counter < 30) {
    c = 100;
  }
  
  textSet(100,0,width/2,height/6,"Asteriods");
  button("Rect",200,100,width/2,height/2,"Start",true,255,s1,0,60);
  button("Rect",200,100,width/2,height/1.5,"Quit",true,255,s2,0,60);
  
  if (rectButton(200,100,width/2,height/2)) {
    s1 = #FF0000;
  } else {
    s1 = 0;
  }
  if (rectButton(200,100,width/2,height/1.5)) {
    s2 = #FF0000;
  } else {
    s2 = 0;
  }
}
