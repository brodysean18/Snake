//series of tiles (10x10)
//snake consists of head and body
//head is controlled and moves between tiles, body follows
//one tile is the "apple", when the head touches this tile, the snake grows by 1
//if the snake's head touches its body, the game ends

//treat tiles as 2d array
//snake is a stack of array values
//when the snake moves, each array value is updated
//head is updated with new value depending on which direction the snake is moving
//body is updated with value of next stack (body) values

//board starts at 0, 0 and goes to 9, 9

//size = 300x300px
//tile_size = 30x30px

import java.util.Random;  //for apple placement

final int SIZE_X = 1000;
final int SIZE_Y = 1000;
final int TILE_SIZE = 100;
final int r_framerate = 15;

Snake s;
Random rand = new Random();
int apple_x;
int apple_y;
MoveQueue moves;

boolean game;
int i_framerate;

void setup() {
  size(1000,1000);
  rectMode(CORNER);
  gameInit();
}

void draw() {
  if(i_framerate == r_framerate) {
    drawBackground();
    s.CheckCollision();
    if(game) {
      s.MoveSnake(moves.dequeue());
      drawApple();
      s.DrawSnake();
    }
    i_framerate = 0;
  }
  else i_framerate++;
}

void keyPressed() {
  if(!game) game = true;
  
  println(keyCode);
  
  switch(keyCode) {
    case 37:
      if(previous_direction != 2 && previous_direction != 4) moves.enqueue(4);
      break;
    case 38:
      if(previous_direction != 3 && previous_direction != 1) moves.enqueue(1);
      break;
    case 39:
      if(previous_direction != 4 && previous_direction != 2) moves.enqueue(2);
      break;
    case 40:
      if(previous_direction != 1 && previous_direction != 3) moves.enqueue(3);
      break;
  }
}
