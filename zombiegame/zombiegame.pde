class Shooter{
  float shtX = 500;
  float shtY = 700;
  
  public Shooter(){
  }
  void drawSht(){
    fill(255);
    ellipse(shtX, shtY, 100, 100);
  }
  void move(){
    if(keyPressed){
      if(key == 'w'){
        this.shtY-=5;
      }
      if(key == 's'){
        this.shtY+=5;
      }
      if(key == 'd'){
        this.shtX+=5;
      }
      if(key == 'a'){
        this.shtX-=5;
      }
    }
    drawSht();
  }
  float getShooterX() {
    return shtX ;  
  }
  float getShooterY() {
    return shtY ;  
  }
}

class Bullet{
  float PosX = player1.getShooterX() , PosY = player1.getShooterY(), speed ;
  public Bullet(){
  }
  void fire(){
    if(keyPressed){
      if(key == 'g') {
         rect(PosX-10 , PosY , PosX+10 , PosY + 100 );
      
    }
  }
  }
  float getBulletX(){
    return PosX ; 
  }
  float getBulletY() {
    return PosY ;
}
}

class Zombie{
 
  Float posX, posY , size ;
  int speed , life = 0;
  public Zombie(){
    this.size = 50.0 ;
    posX = random(-500,500) ;
    posY = random(-800,0) ;
    speed = 1 ;
  }

  void spawn() {
    fill(0,100,0) ;
    ellipse(posX,posY,this.size,this.size) ;
  }

  void walk(Shooter p){
    if(posX > p.getShooterX()){
      posX -= speed ;
    }
    if(posX < p.getShooterX()){
      posX += speed ;
    }
    if(posY < p.getShooterY()){
      posY += speed ;
    }
    if(posY > p.getShooterY()){
      posY -= speed ;
    }
  }
  void update() {
    if (bullet.getBulletX() == posX && bullet.getBulletY() == posY){ 
      if(life < 3 ){
        size = size*1.2 ;
        life += 1 ;
      }
      if (life == 3){
         //show = false ;
        
      }
    }
  }

}

Shooter player1;
Zombie[] zombies ;
Bullet bullet ;

void setup(){
 size(1000,800);
 player1 = new Shooter();
 zombies = new Zombie[10] ;
 bullet = new Bullet() ;
  for(int i = 0 ; i < 10   ; i++ )
  {
    zombies[i] = new Zombie();
   }
 
 
}
void draw()
{
  background(200);
  player1.move();
  bullet.fire() ;
  for(int i = 0 ; i < 10   ; i++ )
  {
    zombies[i].spawn();
    zombies[i].walk(player1) ;
   }
}
