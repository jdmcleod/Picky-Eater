class Baez{
PImage image;
PVector location;
PVector velocity;
float jumpSpeed;
float direction;
}

void updateBaez()
{
    if(baez.location.y<ground){baez.velocity.y += g;}  
    else{baez.velocity.y = 0;}
    if (baez.location.y >= ground && up != 0)
    {baez.velocity.y = -baez.jumpSpeed; }
    
    for (int i = 0; i< obstacles.size(); i++) {
        if (obstacles.get(i).collided(baez.location.x-20, baez.location.y-50, 50, 100)) {
          dead = true;
        }
      }
      
    PVector nextPosition = new PVector(baez.location.x, baez.location.y);
    nextPosition.add(baez.velocity);
    baez.location.y = nextPosition.y;
    
    pushMatrix();
    translate(baez.location.x, baez.location.y-60);
    scale(.1);
    imageMode(CENTER);
    if(jump==false){
      if(runCount<0){
      image(baez.image, 0, 0);
      scale(1.2);
    rotate(19.5);
    image(baezHead.image, -300, -350);
      }else{
        image(baezRun, 0,0);
       scale(1.2);
    rotate(19.5);
    image(baezHead.image, -300, -350); 
      }
      
    }else{
      image(duck,0,0);
      scale(1.2);
    rotate(19.5);
    image(baezHead.image, -150, -200);
    }
    
    popMatrix();
    runCount++;
    if(runCount>5){
      runCount = -5;
    }
  }
