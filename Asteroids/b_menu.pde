void menu() {
  background(0,255,0);
  
  textSet(100,0,width/2,height/6,"Asteriods");
  button("Rect",200,100,width/2,height/2,"Start",true,255,s1,0);
  button("Rect",200,100,width/2,height/1.5,"Quit",true,255,s2,0);
  
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
