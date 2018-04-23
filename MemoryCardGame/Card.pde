class Card {
  private int x, y, cardHeight, cardWidth;
  private boolean hidden = false;
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
    rect(x, y, cardWidth, cardHeight);
  }
  
  public void flipAround() {
    if (mouseOverCard()) {
      fill(col);
      rect(x, y, cardWidth, cardHeight);
    }
  }
  
  boolean mouseOverCard() {
    return(!hidden && mouseX >= x && mouseX < x+cardWidth && mouseY >= y && mouseY < y+cardHeight);
  }

}
