void setup(){
  size(800,800);
}


final float g=10;//acceleration
final float ballSize=30;
final float timeStep=0.1;


float t=0;
float x=50;
float y=50;
float dx=3;//v0
float dy=0;//dy=g*t;//bu yao zai ci chu geng gai

void bump(){
  //y=height-ballSize;    //DELETE
  //dy=-dy;               //BEFORE
  dy=-(dy-g*timeStep);    //NOW
  /*
    1.After bump, dy still become(g*timeStep)bigger. that is where extra energy come from, so we should remove it
    2. do not reset y OR the fall distance become higher each time
  */
  //println(dy);

}
void draw(){
ellipse(x,y,ballSize,ballSize);
  x+=dx;
  y+=dy;
  dy+=g*timeStep;
  if(y>=height-ballSize){bump();}
  //println(t,dy);
  
  
}
