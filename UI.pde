void drawBackground() {
  background(0);
  
  //stroke(255);
  //for(int i = 1; i < 10; ++i) {
  //  line(i*TILE_SIZE, 0, i*TILE_SIZE, SIZE_X);
  //}
  //for(int i = 1; i < 10; ++i) {
  //  line(0, i*TILE_SIZE, SIZE_Y, i*TILE_SIZE);
  //}
}

void drawApple() {
  fill(255);
  rect(apple_x*TILE_SIZE, apple_y*TILE_SIZE, TILE_SIZE, TILE_SIZE);
}

void gameInit() {
  s = new Snake(0, 0);
  apple_x = rand.nextInt(SIZE_X / TILE_SIZE);
  apple_y = rand.nextInt(SIZE_X / TILE_SIZE);
  moves = new MoveQueue();
  game = false;
  i_framerate = 0;
}
