class Card {
  private int x, y, cardHeight, cardWidth;

  public Card(int x, int y, int cardHeight, int cardWidth) {
    this.x = x;
    this.y = y;
    this.cardHeight = cardHeight;
    this.cardWidth = cardWidth;
  }

  public void drawCard() {
    rect(x, y, cardWidth, cardHeight);
  }
  
  public void flipAround() {
    
  }

}
