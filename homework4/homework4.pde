

int itemPower = 0;
int armorAmount = 0;
int health = 100;
int experience = 0;

boolean attack;

float pX = 250;
float pY = 250;

float eX = random(0, 400);
float eY = random(0, 400);

float sX = random(0, 400);
float sY = random(0, 400);

float aX = random(0, 400);
float aY = random(0, 400);

float dX = random(0, 400);
float dY = random(0, 400);

boolean pickedUp = false;
boolean pickedUpHat = false;
boolean pickedUpShield = false;

boolean nextTo;
boolean above;

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

  for (int i = 0; i < width+10; i+=10) {
    for (int j = 50; j < height+10; j+=10) {
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

    itemPower = 10;
    sX = pX-10;
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
    dX = pX+10;
    dY = pY;
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
      pX +=10;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      pX -=10;
    }
  }
}