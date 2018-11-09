class Veggie{
  PImage image;
  float x;
  float w;
  float h;
  int type;
  float start;
//  void brocUpdate(){
//  broc.x=broc.x-7;
//  //if(broc.x<0){broc.x=999;}
  
//  pushMatrix();
//  translate(broc.x, 375-12);
//  scale(.25);
//  imageMode(CENTER);
//  image(broc.image, 0, 0);
//  popMatrix();
//}

Veggie(int t){
 x=width;
 type = t;
 switch(type){
  case 0:
    w = 60;
    h=140;
    break;
   case 1: 
     w=30;
     h=120;
     break;
   case 2: 
     w=10;
     h=130;
     break;
   case 3: 
     w=100;
     h=100;
     break;
    case 4: 
     w=80;
     h=100;
     break;
 }
}

  void show(){
    pushMatrix();
    translate(x, 375);
    rectMode(CENTER);
   switch(type){
     case 0:
     scale(.3);
      image(broc, x - broc.width/2, height - 375-broc.height+50);
      break;
    case 1:
    scale(.2);
      image(orange, x - orange.width/2, height - 375 - orange.height+100);
      break;
    case 2:
    scale(.15);
      image(carrot, x - carrot.width/2, height - 375 - carrot.height+150);
      break;
    case 3:
    scale(.25);
      image(cellery, x - cellery.width/2, height - 375 - cellery.height+150);
      break;
    case 4:
    scale(.23);
      image(strawberry, x - strawberry.width/2, height - 375 - strawberry.height+20);
      break;
   }
   popMatrix();
}

void move(float speed){
 x-=speed; 
}

boolean collided(float playerX, float playerY, float playerWidth, float playerHeight) {

    float playerLeft = playerX - playerWidth/2;
    float playerRight = playerX + playerWidth/2;
    float thisLeft = x+w/2;
    float thisRight = x + w/2;
   //rect(x, ground, w, h);                                                      //hit boxes
    //rect(playerX, playerY, playerWidth, playerHeight);
    
    if ((playerLeft<= thisRight && playerRight >= thisLeft ) || (thisLeft <= playerRight && thisRight >= playerLeft)) {
      float playerDown = playerY+playerHeight/2-20;
     // line(playerX, playerDown,playerX+200,playerDown);
      float thisUp = ground-h;
      if (playerDown >= thisUp) {
        return true;
      }
    }
    return false;
  }
}
  
  
