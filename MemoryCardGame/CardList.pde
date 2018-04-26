class CardList {
  private color[] colors = {color(255,0,0), color(0,255,0), color(0,0,255), color(100, 100, 100), color(255)};
  int x = 350, y = 10, cardHeight = 250, cardWidth = 170;
  int amount = 0;
  int[] cardIndex;
  private int[] values;
  public ArrayList<Card> cards = new ArrayList<Card>();

  public CardList(int amount) {
    this.amount = amount;
    generateValues();
    shuffleValues();
    generateCards();
  }
  
  private void generateValues() {
    values = new int[amount];
    for (int i = 0; i < amount/2; i++) {
      values[2*i] = i;
      values[2*i+1] = i;
    }
  }
  
  private void shuffleValues() {
    for (int i=0; i<values.length; i++) {
    int r = int(random(values.length));
    int t = values[i];
    values[i] = values[r];
    values[r] = t;
  }
  }

  private void generateCards() {
    for (int i = 0; i < amount; i++) {
      if (i % 5 == 0 && i != 0) {
        x = 350;
        y += 270;
      }
      cards.add(new Card(x, y, cardHeight, cardWidth, values[i]));
      //set color
      cards.get(i).col = colors[cards.get(i).value];
      x += 190;
    }
  }
  
  public void removeCardsIfEqual() {
    int amountFacingUp = 0;
    cardIndex = new int[2];
    int cardIndexCounter = 0;
    for (int i = 0; i < cards.size(); i++) {
      if (cards.get(i).status == CardStatus.FLIPPED) {
        cardIndex[cardIndexCounter] = i;
        cardIndexCounter++;
        amountFacingUp++;
      }
      if (cardIndexCounter >= 2) {
        cardIndexCounter = 0;
      }
    }
    if (amountFacingUp == 2) {
      compareCards(cardIndex);
      amountFacingUp = 0;
    }
  }
  
  public void compareCards(int[] cardIndex) {
    if (cards.get(cardIndex[0]).value == cards.get(cardIndex[1]).value) {
      cards.remove(cardIndex[0]);
      cards.remove(cardIndex[1] - 1);
    } else {
      cards.get(cardIndex[0]).status = CardStatus.VISIBLE;
      cards.get(cardIndex[1]).status = CardStatus.VISIBLE;
    }
  }
  
  public void drawAllCards() {
    for (int i = 0; i < cards.size(); i++) {
      cards.get(i).drawCard();
    }
  }
  
  public void flipCurrentCard() {
    for(int i = 0; i < cards.size(); i++) {
      if (cards.get(i).mouseOverCard()) {
        cards.get(i).status = CardStatus.FLIPPED;
      }
    }
  }
}