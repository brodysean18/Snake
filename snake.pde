int previous_direction = 0;

class SnakeNode {
  private int x;
  private int y;
  private SnakeNode next;
  
  SnakeNode(int x, int y, SnakeNode next) {
    this.x = x;
    this.y = y;
    this.next = next;
  }
  
  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public SnakeNode getNext() {
    return this.next;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public void setNext(SnakeNode next) {
    this.next = next;
  }
}

class Snake {
  private SnakeNode top;
  private SnakeNode snake_head;
  
  public Snake(int x, int y) {
    //create new snake
    this.top = new SnakeNode(x, y, null);
    this.snake_head = this.top;
    
    //add one body part
    AddBody();
    AddBody();
    MoveSnake(2);
    MoveSnake(2);
  }
  
  private void AddBody() {
    //create new snake body part on top of last body part
    SnakeNode body = new SnakeNode(this.top.getX(), this.top.getY(), this.top);
    
    //add body part to snake structure
    this.top = body;
  }
  
  public void MoveSnake(int direction) {
    //get tail of snake
    SnakeNode curr = this.top;
    
    //loop through until head
    while(curr.next != null) {      
      curr.setX(curr.getNext().getX());
      curr.setY(curr.getNext().getY());
      curr = curr.getNext();
    }
    
    if(direction == 0) {
      direction = previous_direction;
    }
    
    //move snake head based on direction
    switch(direction) {
      case 1: //UP
        curr.setY(curr.getY() - 1);
        if(curr.getY() < 0) curr.setY((SIZE_X / TILE_SIZE) - 1);
        break;
      case 2: //DOWN
        curr.setX(curr.getX() + 1);
        if(curr.getX() > (SIZE_X / TILE_SIZE) - 1) curr.setX(0);
        break;
      case 3: //LEFT
        curr.setY(curr.getY() + 1);
        if(curr.getY() > (SIZE_X / TILE_SIZE) - 1) curr.setY(0);
        break;
      case 4: //RIGHT
        curr.setX(curr.getX() - 1);
        if(curr.getX() < 0) curr.setX((SIZE_X / TILE_SIZE) - 1);
        break;
      case 0:
        //dont move
        break;
      default:
        print(direction + ": ");
        println("INVALID DIRECTION");
    }
  }
  
  public void CheckCollision() {
    SnakeNode curr = this.top;
    
    while(curr.next != null) {
      if(curr.getX() == this.snake_head.getX()
      && curr.getY() == this.snake_head.getY()) {
        println("GAME OVER");
        gameInit();
      }
      curr = curr.getNext();
    }
    
    if(this.snake_head.getX() == apple_x
    && this.snake_head.getY() == apple_y) {
      apple_x = rand.nextInt(SIZE_X / TILE_SIZE);
      apple_y = rand.nextInt(SIZE_X / TILE_SIZE);
      AddBody();
    }
  }
  
  public void DrawSnake() {
    //set color to black
    fill(#4055FF);
    
    //get tail of snake
    SnakeNode curr = this.top;
    
    //loop through until head
    while(curr != null) {      
      rect(curr.getX()*TILE_SIZE, curr.getY()*TILE_SIZE, TILE_SIZE, TILE_SIZE);
      curr = curr.getNext();
    }
  }
}
