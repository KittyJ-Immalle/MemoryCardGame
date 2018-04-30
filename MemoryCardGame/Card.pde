class Card {
  private int x, y, cardHeight, cardWidth;
  private CardStatus status = CardStatus.VISIBLE;
  public PImage front;
  public int value;

  public Card(int x, int y, int cardHeight, int cardWidth, int value) {
    this.x = x;
    this.y = y;
    this.cardHeight = cardHeight;
    this.cardWidth = cardWidth;
    this.value = value;
  }

  public void drawCard() {
    switch(status) {
      case VISIBLE:
        image(backOfCard, x, y);
        break;
      case FLIPPED:
        image(front, x, y);
        break;
    }
  }
  
  boolean mouseOverCard() {
    return(mouseX >= x && mouseX < x+cardWidth && mouseY >= y && mouseY < y+cardHeight);
  }

}
