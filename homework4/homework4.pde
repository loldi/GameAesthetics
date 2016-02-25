<<<<<<< HEAD
=======
//arrow keys to move
//pick up the sword to kill the enemy
//press 'a' next to the enemy to kill it!



>>>>>>> 290f0daa5479182a544f5de7937e2168836a5374
int itemPower = 0;
int armorAmount = 0;
int health = 100;
int experience = 0;

boolean attack;

float pX = 250;
float pY = 250;

float eX = random(0, 300);
float eY = random(0, 300);

float sX = random(0, 300);
float sY = random(0, 300);

float aX = random(0, 300);
float aY = random(0, 300);

float dX = random(0, 300);
float dY = random(0, 300);

boolean pickedUp = false;
boolean pickedUpHat = false;
boolean pickedUpShield = false;

boolean nextTo;
boolean above;

boolean movingLeft;
boolean movingRight;

void setup() {

  size(500, 500);
  frameRate(60);

  eX = (round(eX/10) * 10);
  eY = (round(eY/10) * 10);

  sX = round(sX/10) * 10;
  sY = round(sY/10) * 10;

  aX = round(aX/10) * 10;
  aY = round(aY/10) * 10;

  dX = round(dX/10) * 10;
  dY = round(dY/10) * 10;

  println("enemy pos: " + eX + " " + eY);
  println("helmet pos: " + aX + " " + aY);
  println("shield pos: " + dX + " " + dY);
  println("sword pos: " + sX + " " + sY);
}



void draw() {
  background(0);
  
   println("player pos: " + pX + " " + pY);

  int power = 5 + itemPower;
  int defense = 5 + armorAmount;

  fill(255);
  textSize(12);
  text("Health: ", 10, 20);
  text(health, 55, 20);

  text("Power: ", 100, 20);
  text(power, 140, 20);

  text("Defense: ", 170, 20);
  text(defense, 225, 20);

  text("EXP: ", 245, 20);
  text(experience, 275, 20);


  textSize(12);

  if (sX == eX - 10 || sX == eX + 10) {
    nextTo = true;
  } else {
    nextTo = false;
  }

  if (sY == eY - 10 || sY == eY + 10) {
    above = true;
  } else {
    above = false;
  }

  if (nextTo || above) {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        eX = (round(random(0,400)/10) * 10);
        eY = (round(random(0,400)/10) * 10);
        experience +=10;
      }
    }
  }


  if (pX < 0) {
    pX = 0;
  }
  if (pX > width-10) {
    pX = width-10;
  }

  if (pY < 10) {
    pY = 10;
  }
  if (pY > height) {
    pY = height;
  }

  for (int i = 10; i < width-10; i+=10) {
    for (int j = 50; j < height-10; j+=10) {
      if (i == pX && j == pY) {
        fill(0, 255, 255);
        text("@", i, j);
      } else if (eX == i && eY == j) {
        fill(255, 0, 0);
        text("E", i, j);
      } else if (sX == i && sY == j) {
        fill(255, 0, 255);
        text("\\", i, j);
      } else if (aX == i && aY == j) {
        fill(255, 255, 0);
        text("^", i, j);
      } else if (dX == i && dY == j) {
        fill(255, 255, 0);
        text("o", i, j);
      } else {
        fill(0, 255, 0);
        text("-", i, j);
      }
    }
  }

  if (pX == sX && pY == sY) {
    pickedUp = true;
  }
  if (pickedUp) {
        if(movingLeft){
    sX = pX-10;
   
    }
    if(movingRight){
        fill(255,0,255);
        text("/", pX+10, pY);
        
        fill(0,255,0);
        sX = pX + 10;
        
    }

    itemPower = 10;
   
    sY = pY;
  }

  if (pX == aX && pY == aY) {
    pickedUpHat = true;
  }
  if (pickedUpHat) {

    armorAmount = 10;
    aX = pX;
    aY = pY-10;
  }

  if (pX == dX && pY == dY) {
    pickedUpShield = true;
  }
  if (pickedUpShield) {
     dY = pY;
    if(movingLeft){
    dX = pX+10;
   
    }
    if(movingRight){
       dX = pX-10;
    }
    if (pickedUpHat) {
      armorAmount = 30;
    } else {
      armorAmount = 20;
    }
  }
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      pY -=10;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      pY +=10;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      movingRight = true;
      movingLeft = false;
      pX +=10;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      movingRight = false;
      movingLeft = true;
      pX -=10;
    }
  }
}
