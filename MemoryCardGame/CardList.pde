class CardList {
  private PImage[] frontOfCards;
  private int x = 350, y = 10;
  private int cardHeight = 200, cardWidth = 120;
  private int amount = 0;
  private int cardCounter;
  private int maxCards = 20;
  private int[] values;
  public ArrayList<Card> cards = new ArrayList<Card>();

  public CardList(int amount, int amountOnRow, int xSpaceBetweenCards, int ySpaceBetweenCards) {
    this.amount = amount;
    
    loadAllCards();
    
    generateValues();
    shuffleValues();
    generateCards(amountOnRow, xSpaceBetweenCards, ySpaceBetweenCards);
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

  private void generateCards(int amountOnRow, int xSpaceBetweenCards, int ySpaceBetweenCards) {
    for (int i = 0; i < amount; i++) {
      if (i % amountOnRow == 0 && i != 0) {
        x = 350;
        y += ySpaceBetweenCards;
      }
      cards.add(new Card(x, y, cardHeight, cardWidth, values[i]));
      
      cards.get(i).front = frontOfCards[cards.get(i).value];
      x += xSpaceBetweenCards;
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
  
  private void loadAllCards() {
    frontOfCards = new PImage[maxCards];
    PImage card;

    for (int i = 0; i < maxCards; i++) {
      cardCounter++;
      card = loadImage("./Images/Card" + cardCounter + ".png");
      card.resize(cardWidth, cardHeight);
      frontOfCards[i] = card;
    }
    
    backOfCard = loadImage("./Images/BackOfCard.png");
    backOfCard.resize(cardWidth, cardHeight);
  }
}