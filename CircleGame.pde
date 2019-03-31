int score = 100;
int playerX = 100;
int playerY = 200;
int r = 40;
float g = -12.0;

int dx = -6;

boolean jump = false;

int enemyX = 600;
int enemyY = (int)random(2) * -100 + 200;

void init() {
  enemyX = 600;
  enemyY = -100*(int)random(2) + 200;
  score = 0;
}

void setup() {
  size(500, 300);
  init();
}

void draw() {
  background(255);
  println(score);
  line(0, 220, 600, 220);
  if(jump) {
    playerY += g;
    g += 0.7;
    if(playerY > 200) {
      playerY = 200;
      jump = false;
      g = -12.0;
    }
  }
  
  if(dist(playerX, playerY, enemyX, enemyY) < r) fill(255, 255, 0);
  else fill(255);
  ellipse(playerX, playerY, r, r);
  
  fill(255, 0, 0);
  ellipse(enemyX, enemyY, r, r);
  
  enemyX += dx;
  
  if(enemyX <= -50) {
    enemyY = (int)random(2) * -100 + 200;
    enemyX = 650;
  }
}

void mousePressed() {
  if(jump == false) {
    jump = true;
  }
}
