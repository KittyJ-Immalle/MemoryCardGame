class Card {
  private int x, y, cardHeight, cardWidth;
  private CardStatus status = CardStatus.VISIBLE;
  
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
    println("drawing");
    switch(status) {
      case VISIBLE:
        fill(0);
        stroke(0);
        rect(x, y, cardWidth, cardHeight);
        break;
      case HIDDEN:
        fill(210);
        stroke(210);
        rect(x, y, cardWidth, cardHeight);
        break;
      case FLIPPED:
        fill(col);
        stroke(0);
        rect(x, y, cardWidth, cardHeight);
        break;
    }
  }
  
  boolean mouseOverCard() {
    return(status != CardStatus.HIDDEN && mouseX >= x && mouseX < x+cardWidth && mouseY >= y && mouseY < y+cardHeight);
  }

}
