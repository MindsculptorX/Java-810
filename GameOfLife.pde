final int UnitSize=2;
final int WIDTH=800;
final int HEIGHT=800;

int now[][]= new int[WIDTH/UnitSize][HEIGHT/UnitSize];
int next[][]= new int[WIDTH/UnitSize][HEIGHT/UnitSize];
int n=WIDTH/UnitSize;
int m=HEIGHT/UnitSize;

int rate=20;//(rate/100 is black)
int changeRange=30;//(click influnce 3*3)

void setup(){
  size(800,800); 
  //set random start table  
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(random(100)<=rate)
        now[i][j]=1;
      else
        now[i][j]=0;
    }
  }
  //frameRate(1);
} 


void drawtable(){
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(now[i][j]==1){
        fill(0);
        rect(i*UnitSize,j*UnitSize,UnitSize,UnitSize);
      }
    }
   }
}

int countRound(int i,int j){
int ans = now[i-1][j-1]+now[i-1][j+1]+now[i+1][j+1]+now[i+1][j-1];
ans+= now[i][j-1]+now[i][j+1]+now[i+1][j]+now[i-1][j];
return ans;
}
void draw(){
  background(255,255,255);
  
  drawtable();
  
   for(int i=1;i<n-1;i++){
    for(int j=1;j<m-1;j++){
      if(now[i][j]==1){//cun huo qing kuang xia
        if((countRound(i,j)<2)||countRound(i,j)>3)
          next[i][j]=0;
        if((countRound(i,j)==2)||countRound(i,j)==3)
          next[i][j]=now[i][j]; 
      }
      else{
        if(countRound(i,j)==3)
          next[i][j]=1;       
      }
    }
   }
   for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      now[i][j]=next[i][j];
    }
   }
}



void mousePress(){
int x= mouseX/UnitSize;
int y= mouseY/UnitSize;

for(int i=x-changeRange;i<x+changeRange;i++)
  for(int j=y-changeRange;j<y+changeRange;j++){
    println(i,",",j);
    now[i][j]=1-now[i][j];
  }
}
