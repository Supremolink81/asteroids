void pause() {
  background(255,255,0);
  
  button("Rect",200,100,width/2,height/2,"Return",true,255,s5,0);
  
  if (rectButton(200,100,width/2,height/2)) {
    s5 = #FF0000;
  } else {
    s5 = 0;
  }
}
