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
  y=height-ballSize;
  dy=-dy;
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
