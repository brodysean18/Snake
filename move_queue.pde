class MoveNode {
  public int direction;
  public MoveNode next;
  
  MoveNode(int direction) {
    this.direction = direction;
    this.next = null;
  }
}

class MoveQueue {
  MoveNode front;
  
  MoveQueue() {
    this.front = null;
  }
  
  public void enqueue(int direction) {
    if(this.front == null) {
      this.front = new MoveNode(direction);
      previous_direction = direction;
      return;
    }
    
    MoveNode curr = this.front;
    
    while(curr.next != null) {
      curr = curr.next;
    }
    
    curr.next = new MoveNode(direction);
    
    previous_direction = direction;
  }
  
  public int dequeue() {
    int n = 0;
    if(this.front != null) {
      n = this.front.direction;
      this.front = this.front.next;
    }
    return n;
}
  
  public int peek() {
    if(this.front == null) return 0;
    
    MoveNode n = this.front;
    
    while(n.next != null) {
      n = n.next;
    }
    
    return n.direction;
  }
  
  public void print_queue() {
    MoveNode curr = this.front;
    
    while(curr != null) {
      print(curr.direction + " ");
      curr = curr.next;
    }
    
    println();
  }
}
