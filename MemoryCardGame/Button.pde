class Button {
  private String text;
  private int x1, y1, x2, y2;
  
  public Button(String text, int x1, int y1, int x2, int y2) {
    this.text = text;
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  
  void draw() {
    stroke(0);
    fill(205);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(50);
    text(text, x1 + ((x1 + x2) - x1)/2 - (textWidth(text)/2), y1 + ((y1+y2) - y1)/2);
  }
  
  boolean mouseOver() {
    return(mouseX > x1 && mouseX < x1 + x2 && mouseY > y1 && mouseY < y1 + y2);
  }
}