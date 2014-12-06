
  //-- Defining variables
  
  boolean moveU = true, moveD = true, moveL = true, moveR = true;
  boolean weapon = true;
  String weaponkind = "G17";
  String side = "left";
  int gunLength = 30;
  int playerspeed = 5;
  int playerX = 50, playerY = 50;
  int gunY = playerY;
  int gunX = playerX+gunLength;
  int lineX=playerX+15, lineY = playerY;
  int crateCornerULX;
  int crateCornerDRX;
  int crateCornerULY;
  int crateCornerDRY;
  int ammo;
  int ammomax;
  color playerColor = color(255,0,0);
  color crateColor = color(0,255,0);
  //--

// Setup
void setup() {
  size(900,900);
  
}

//-- Draw loop
void draw() {
  smooth();
  background(255,255,255);
  gunCrate("ak47",400,500);
  testDirection();
  playerCreate();
  playerGunCreate();
}


//-- MapBordersfix
void testDirection() {
  if (gunX >= width) {moveR=false;}else{moveR=true;}
  if (gunX <= 0) {moveL=false;}else{moveL=true;}
  if (gunY <= 0) {moveU=false;}else{moveU=true;}
  if (gunY >= height) {moveD=false;}else{moveD=true;}

}  


//-- Movement
void keyPressed() {
  smooth();
 
  
  if (keyCode == UP) {
    if (moveU == true) {playerY=playerY-playerspeed;}else{}
    lineX=playerX;
    lineY=playerY-15;
    gunY=playerY-gunLength;    
    gunX=playerX;

  }
  
  if (keyCode == LEFT) {
    if (moveL == true) {playerX=playerX-playerspeed;} 
    lineX=playerX-15;
    lineY=playerY;
    gunY=playerY;
    gunX=playerX-gunLength;

  }
  
  if (keyCode == RIGHT) {
    if (moveR == true){playerX=playerX+playerspeed;} 
    lineX=playerX+15;
    lineY=playerY;
    gunY=playerY;
    gunX=playerX+gunLength;
 
  }
  
  if (keyCode == DOWN) {
    if (moveD == true){playerY=playerY+playerspeed;} 
    lineX=playerX;
    lineY=playerY+15;
    gunY=playerY+gunLength;  
    gunX=playerX;
    
  }
}

//---------- Player and gun -------------

void playerCreate() {
  rectMode(CENTER);
  fill(playerColor);
  rect(playerX,playerY,30,30);
  
}



void playerGunCreate() {
  if (weaponkind == "ak47") {gunLength = 35;}
  else {gunLength = 30;}
  fill(0,200,0);
  line(lineX,lineY,gunX,gunY);
  fill(0,200,0);
}

// --------------------------------------


//---------- Gun Crate ------------------




void gunCrateSprite(int gsX, int gsY){
  fill(crateColor);
  rectMode(CENTER);
  rect(gsX,gsY,16,16);
  crateCornerULX = gsX-8;
  crateCornerULY = gsY-8;
  crateCornerDRX = gsX+8;
  crateCornerDRY = gsY+8;
if(playerX > crateCornerULX && playerX < crateCornerDRX && playerY > crateCornerULY && playerY < crateCornerDRY){
    print("YUPYUPYUPYUP");
    weaponkind = "ak47";
  }
  
  
}

void gunCrate(String cratekind, int gsX, int gsY) {
  if (cratekind == "ak47"){gunCrateSprite(gsX,gsY);}
}

//--------------------------------
