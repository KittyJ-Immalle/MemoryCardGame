class CardList {
  private color[] colors = {color(255,0,0), color(0,255,0), color(0,0,255), color(100, 100, 100), color(255)};
  int x = 350, y = 10, cardHeight = 250, cardWidth = 170;
  int amount = 0;
  private int[] values;
  public Card[] cards;

  public CardList(int amount) {
    this.amount = amount;
  }
  
  private void GenerateValues() {
    values = new int[amount];
    for (int i = 0; i < amount/2; i++) {
      values[2*i] = i;
      values[2*i+1] = i;
    }
  }
  
  private void ShuffleValues() {
    for (int i=0; i<values.length; i++) {
    int r = int(random(values.length));
    int t = values[i];
    values[i] = values[r];
    values[r] = t;
  }
  }

  private void GenerateCards() {
    cards = new Card[amount];
    for (int i = 0; i < amount; i++) {
      if (i % 5 == 0 && i != 0) {
        x = 350;
        y += 270;
      }
      cards[i] = new Card(x, y, cardHeight, cardWidth, values[i]);
      //set color
      cards[i].col = colors[cards[i].value];
      x += 190;
    }
  }

  public void Show() {
    fill(0);
    GenerateValues();
    ShuffleValues();
    GenerateCards();
    for (int i = 0; i < amount; i++) {
      cards[i].drawCard();
    }
  }
  
  
}
