class DiffEasy {
  public int x1 = 100, y1 = 250, x2 = 400, y2 = 500;
  
  public void drawPanel() {
    stroke(0);
    fill(205);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(50);
    text("Easy", 245, 450);
  }
  
  boolean mouseOverCard() {
    return(mouseX >= x1 && mouseX < y1 && mouseY >= x2 && mouseY < y2);
  }
}