void gameover() {
  background(255,0,0);
  
  textSet(200,0,width/2,height/6,"You "+gameResult);
  
  button("Rect",200,100,width/2,height/2,"Restart",true,255,s6,0);
  
  if (rectButton(200,100,width/2,height/2)) {
    s6 = #FF0000;
  } else {
    s6 = 0;
  }
}
