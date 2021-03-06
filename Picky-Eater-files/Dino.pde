import ddf.minim.*;
Minim minim;
AudioPlayer yell;
AudioPlayer song;

PImage broc;
PImage carrot;
PImage cellery;
PImage strawberry;
PImage orange;
PImage duck;
PImage baezRun;
PImage background;
Baez baez;  
Baez baezHead;
float g = 1;
float up;
float ground = 300;
boolean jump;
boolean begin=true;
int obstacleTimer = 0;
int minimumTimeBetweenObstacles = 60;
int randomAddition = 0;
float speed = 10;
float runCount=-5;
float score;
float currentScore;
float record=0;
boolean dead = false;
ArrayList<Veggie> obstacles = new ArrayList<Veggie>();


void setup() {
  size(1000, 500);
  baez = new Baez();
  baezHead = new Baez();
  baez.location = new PVector(200, ground);
  baez.velocity = new PVector(0,0);
  baez.direction = 1;
  baezHead.image = loadImage("lightX.PNG");
  baez.image = loadImage("baez.PNG");
  duck = loadImage("baezSquat.PNG");
  baezRun=loadImage("baezRun.PNG");
  minim = new Minim(this);
  yell = minim.loadFile("yell.mp3");
  song = minim.loadFile("song.mp3");
  background = loadImage("background.jpg");
  broc = loadImage("broc2.png");
  carrot = loadImage("carrot.png");
  orange = loadImage("orange.png");
  cellery = loadImage("cellery.png");
  strawberry = loadImage("strawberry.png");
  baez.jumpSpeed = 17;
  song.loop();
}
  
void draw() {
  fill(55, 55, 55);
  image(background, width/2,height/2);
  stroke(90);
  strokeWeight(3);
  line(0, ground+39, 999, ground+39);

    if(dead == true){
    yell.play();
    textSize(27);
    fill(200);
    text("Creme Cheese Points earned: "+currentScore,20, 100);
    text("Press Space to avoid more fruits and veggies", 20, 150);
    resetObstacles();
    }else{
    updateObstacles();
    updateBaez();
    currentScore = score;
  }
    if(score>record){record=score;}
  scoreboard();
 }


void updateObstacles(){
  obstacleTimer++;
  speed+=0.002;
  if(obstacleTimer>minimumTimeBetweenObstacles + randomAddition){
    addObstacle();
  }
  
  moveObstacles();
  showObstacles();
}

void moveObstacles(){
  for (int i = 0; i< obstacles.size(); i++) {
    obstacles.get(i).move(speed);
    if (obstacles.get(i).x < 0) { 
      obstacles.remove(i);
      i--;
    }
  }
}
void addObstacle(){
  int tempInt;
   tempInt = floor(random(5));
   Veggie temp = new Veggie(tempInt);
   obstacles.add(temp);
   tempInt+=3;
  randomAddition = floor(random(50));
  obstacleTimer=0;
  }
  
  void showObstacles(){
   for(int i = 0;i<obstacles.size();i++){
    obstacles.get(i).show(); 
   }
  }
  
  
  void resetObstacles(){
   speed=10;
   for (int i = 0; i< obstacles.size(); i++) {
      obstacles.remove(i);
    }
    score=0;
  }

  void scoreboard(){
    
    if(millis()%2==0&&dead==false){
     score++; 
    }
    fill(200);
    textSize(18);
  text("Score: "+score + " CCP",10,450);
  text("Record: "+record +" CCP",10,480);
  
  }



 
void keyPressed(){
if(key==' '){
  begin=false;
  up = -1;
    jump=true;
  if(dead){dead=false;}

}
}
void keyReleased(){
 if (key == ' ')
  {
    up = 0;
    jump=false;
  } 
}
