int row = 10;
int column = 10;
int n = 30;
int rancolTarget ;
int ranrowTarget ;

World[][] world;
Snake snake = new Snake() ;
InputProcessor input ;
Target target ;

void setup() {
  size(1000,1000); 
  
  world = new World[column][row];
    for(int i = 0; i < column ; i++){
      for(int j = 0; j < row; j++){
        world[i][j] = new World(i*100, j*100, 100, 100 );
   }
  }
  rancolTarget = round(random(column));
  ranrowTarget = round(random(row));
  target = new Target(rancolTarget , ranrowTarget) ;
  
}

void draw() {
  input = new InputProcessor('w', 'a', 'd') ;
  for(int i = 0; i < column ; i++){
   for(int j = 0; j < row; j++){
      world[i][j].drawWorld();
   }
  }
  snake .drawSnake() ;
  input.check_input() ;
  if(target.show == true){
    target.show() ;
  }
  target.hide() ;
}

class World{
  float row;
  float col;
  float w;
  float h;
  World(float row, float col, float w, float h){
    this.row = row;
    this.col = col;
    this.w = w;
    this.h = h;
  }
  
  void drawWorld(){
    stroke(0);
    fill(225);
    rect(this.row ,this.col , this.w, this.h); 
  }
  
}

class Snake {
  
  float row = 0;
  float col = 0;
  int size = 100 ;
  char  side ;
  char[]  sidecollect={'w','a','s','d'};
  int path ;
  
  Snake() {
    this.row = row;
    this.col = col;
    this.side = 'w' ;
  }
  
  void drawSnake() {
    fill(255) ;
    ellipseMode(CORNER);
    ellipse(this.col*100, this.row*100, size, size);
  }
  
  void move_forward(){
    if(this.side == 'w'){
      snake.row-=1;
    if(snake.row == -1){
      snake.row+=1;
    }}
    if(this.side == 's'){
      snake.row+=1;
    if(snake.row == 10){
      snake.row-=1;
    }}
    if(this.side == 'a'){
      snake.col-=1;
    if(snake.col == -1){
      snake.col+=1;
    }}
    if(this.side == 'd'){
      snake.col+=1;
    if(snake.col == 10){
      snake.col-=1;
    }}
    }
    void turn_left() {

    for (int x = 0; x < sidecollect.length; x +=1) {
      if (sidecollect[x] == this.side) {
        if (x == 3) this.side = sidecollect[0];
        else  this.side = sidecollect[x+1];
        break;
      }
    }
    }
    void turn_right() {

    for (int x = 0; x < sidecollect.length; x +=1) {
      if (sidecollect[x] == this.side) {
        if (x == 0) this.side = sidecollect[3];
        else  this.side = sidecollect[x-1];
        
        break;
      }
      }
    }
    void checkPath() {
       
    }
    float getRowSnake() {
    return this.row ;
  }
  
  float getColSnake() {
    return this.col ;
  }
}

class Target{
  float row;
  float col;
  int size ;
  boolean show ;
  Target(float row, float col){
    this.row = row;
    this.col = col;
    size = 50 ;
    show = true ;
  }
  
  void show(){
    fill(255,20,147);
    ellipseMode(CORNER);
    ellipse(this.col*100+size/2, this.row*100+size/2, size, size);
    
    
  }
  void hide(){
    if (snake.getRowSnake() == this.row && snake.getColSnake() == this.col ){
      show = false ; 
    }
  }
}

class InputProcessor
{
  char move_forward,turn_left,turn_right;
  InputProcessor(char move_forward,char turn_left,char turn_right)
  {
    this.move_forward=move_forward;
    this.turn_left=turn_left;
    this.turn_right=turn_right;
  }
  void check_input()
  {
  if(keyPressed)
    {
    delay(150);
    if(key==this.move_forward)
      {
      snake.move_forward();
      }
    else if(key==this.turn_left)
      {
      snake.turn_left();
      }
    else if(key==this.turn_right)
      {
      snake.turn_right();
      }
    }
  }
}
