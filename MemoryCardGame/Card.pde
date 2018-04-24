class Card {
  private int x, y, cardHeight, cardWidth;
  private boolean hidden = false;
  public boolean faceUp = false;
  public color col;
  public int value;

  public Card(int x, int y, int cardHeight, int cardWidth, int value) {
    this.x = x;
    this.y = y;
    this.cardHeight = cardHeight;
    this.cardWidth = cardWidth;
    this.value = value;
  }

  public void drawCard() {
    fill(0);
    stroke(0);
    rect(x, y, cardWidth, cardHeight);
  }
  
  public void flipAround() {
     fill(col);
     stroke(0);
     rect(x, y, cardWidth, cardHeight);
     faceUp = true;
  }
  
  public void removeCard() {
    fill(210);
    stroke(210);
    rect(x, y, cardWidth, cardHeight);
    hidden = true;
  }
  
  boolean mouseOverCard() {
    return(!hidden && mouseX >= x && mouseX < x+cardWidth && mouseY >= y && mouseY < y+cardHeight);
  }

}