class Difficulty {
  public int x1, y1, x2, y2;
  
  public Difficulty(String difficulty) {
    switch (difficulty) {
      case "easy":
        x1 = 250;
        y1 = 250;
        x2 = 400;
        y2 = 500;
      break;
      case "medium":
        x1 = 700;
        y1 = 250;
        x2 = 400;
        y2 = 500;
      break;
      case "hard":
        x1 = 1150;
        y1 = 250;
        x2 = 400;
        y2 = 500;
      break;
    }
  }
  
  boolean mouseOverPanel() {
    return(mouseX > x1 && mouseX < x1 + x2 && mouseY > y1 && mouseY < y1 + y2);
  }
}
