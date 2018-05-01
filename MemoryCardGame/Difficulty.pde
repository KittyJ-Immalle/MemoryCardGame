class Difficulty {
  public int x1, y1, x2, y2;
  
  public void easyPanel() {
    x1 = 100;
    y1 = 250;
    x2 = 400;
    y2 = 500;
    
    //draw panel
    stroke(0);
    fill(205);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(50);
    text("Easy", 245, 450);
  }
  
  public void mediumPanel() {
    x1 = width/2-200;
    y1 = 250;
    x2 = 400;
    y2 = 500;
    
    //draw panel
    stroke(0);
    fill(205);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(50);
    text("Medium", width/2 - 100, 450);
  }
  
  public void hardPanel() {
    x1 = 1000;
    y1 = 250;
    x2 = 400;
    y2 = 500;
    
    //draw panel
    stroke(0);
    fill(205);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(50);
    text("Hard", 1140, 450);
  }
  
  boolean mouseOverPanel() {
    return(mouseX >= x1 && mouseX < y1 && mouseY >= x2 && mouseY < y2);
  }
}
