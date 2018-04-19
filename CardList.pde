class CardList {
  int x = 350, y = 10, cardHeight = 250, cardWidth = 170;
  int amount = 0;
  Card[] cards;

  public CardList(int amount) {
    this.amount = amount;
  }

  private void GenerateCards() {
    cards = new Card[amount];
    for (int i = 0; i < amount; i++) {
      if (i % 5 == 0 && i != 0) {
        x = 350;
        y += 270;
      }
      cards[i] = new Card(x, y, cardHeight, cardWidth);
      x += 190;
    }
  }

  public void Show() {
    fill(0);
    GenerateCards();
    for (int i = 0; i < amount; i++) {
      cards[i].drawCard();
    }
  }
}
