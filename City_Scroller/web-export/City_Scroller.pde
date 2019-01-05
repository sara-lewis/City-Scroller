/////////CODE GOES HERE////////////
// Defining layers 
scroller farScroller;
scroller middleScroller;
scroller closeScroller;
// Setting layer variables to classes 
void setup(){
  size(800,600);
  farScroller = new Scroller(0.5,450,800,50,50,150,500,50);
  middleScroller = new Scroller(1.5,340,800,35,35,100,560,100);
  closeScroller = new Scroller(2.5,200,800,20,20,50,600,200);
}
// Calling functions for each layer 
void draw(){
  background(17,9,89);
  farScroller.showBuildings();
  farScroller.moveBuildings();
  middleScroller.showBuildings();
  middleScroller.moveBuildings();
  closeScroller.showBuildings();
  closeScroller.moveBuildings();
}

class Building{
  int Height;
  int Width;
  int xPos;
  int yPos;
  int red;
  int green;
  int blue; 
  
  Building(int h, int w, int x, int y, int r, int g, int b){
    Height = h; 
    Width = w;
    xPos = x;
    yPos = y;
    red = r;
    green = g;
    blue = b;
  }
  
  void drawBuilding(){
    noStroke();
    fill(red,green,blue);
    rect(xPos,yPos,Width,Height);
  }
  void buildingMovement(int speed){
    xPos -= speed;
  }
}

class Scroller{
  int speed;
  int Height;
  int Width;
  int baseLevel;
  int red;
  int green;
  int blue;
  int scrollerEndX;
  int WidthLevel;
  int listBuildings = new Array();
  
  Scroller(int s, int h, int w, int r, int g, int b, int bL, int wL){
    speed = s;
    Height = h; 
    Width = w;
    baseLevel = bL;
    red = r;
    green = g;
    blue = b;
    WidthLevel = wL;
    int totalWidth = 0;
    
    while (totalWidth <= Width){
      int h = random(Height/3,Height);
      int w = random(WidthLevel/2,WidthLevel);
      int xP = totalWidth;
      int yP = baseLevel - h;
      int r = red;
      int g = green; 
      int b = blue; 
      listBuildings.push(new Building(h,w,xP,yP,r,g,b));
      totalWidth += w;
    }
    scrollerEndX = totalWidth; 
  }
  
  //Functions: 
  void showBuildings(){
    for(int i = 0; i < listBuildings.length; i++){
      listBuildings[i].drawBuilding();
    }
  }
  
  void moveBuildings(){
    for(int i = 0; i < listBuildings.length; i++){
      listBuildings[i].buildingMovement(speed);
    }
    scrollerEndX -= speed; 
    if(scrollerEndX < Width){
      addBuilding(scrollerEndX);
    }
  }
  
  void addBuilding(int location){
    int h = random(Height/3,Height);
    int w = random(WidthLevel/2, WidthLevel);
    int xP = location; 
    int yP = baseLevel - h;
    listBuildings.push(new Building(h,w,xP,yP,red,green,blue));
    scrollerEndX += w; 
  }
}
    

