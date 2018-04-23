class Card {
  private int x, y, cardHeight, cardWidth;
  private color[] colors = {color(255,0,0), color(0,255,0), color(0,0,255), color(100, 100, 100), color(255)};
  private boolean hidden = false;
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
      fill(colors[floor(value/2)]);
    rect(x, y, cardWidth, cardHeight);
    }
  }
  
  boolean mouseOverCard() {
    return(!hidden && mouseX >= x && mouseX < x+cardWidth && mouseY >= y && mouseY < y+cardHeight);
  }

}