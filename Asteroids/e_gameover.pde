void gameover() {
  background(255,0,0);
  
  button("Rect",200,100,width/2,height/2,"Finish",true,255,s6,0);
  
  if (rectButton(200,100,width/2,height/2)) {
    s6 = #FF0000;
  } else {
    s6 = 0;
  }
}
