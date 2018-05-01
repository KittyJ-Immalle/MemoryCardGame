class CardList {
  private PImage[] frontOfCards;
  int x = 350, y = 10;
  int cardHeight = 200, cardWidth = 120;
  int amount = 0;
  private int[] values;
  public ArrayList<Card> cards = new ArrayList<Card>();

  public CardList(int amount, int amountOnRow, int xSpaceBetweenCards, int ySpaceBetweenCards) {
    this.amount = amount;
    
    loadAllImages();
    frontOfCards = new PImage[]{card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20};
    
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
      //set color
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
  
  private void loadAllImages() {
    backOfCard = loadImage("./Images/BackOfCard.png");
    backOfCard.resize(cardWidth, cardHeight);
    card1 = loadImage("./Images/Card1.png");
    card1.resize(cardWidth, cardHeight);
    card2 = loadImage("./Images/Card2.png");
    card2.resize(cardWidth, cardHeight);
    card3 = loadImage("./Images/Card3.png");
    card3.resize(cardWidth, cardHeight);
    card4 = loadImage("./Images/Card4.png");
    card4.resize(cardWidth, cardHeight);
    card5 = loadImage("./Images/Card5.png");
    card5.resize(cardWidth, cardHeight);
    card6 = loadImage("./Images/Card6.png");
    card6.resize(cardWidth, cardHeight);
    card7 = loadImage("./Images/Card7.png");
    card7.resize(cardWidth, cardHeight);
    card8 = loadImage("./Images/Card8.png");
    card8.resize(cardWidth, cardHeight);
    card9 = loadImage("./Images/Card9.png");
    card9.resize(cardWidth, cardHeight);
    card10 = loadImage("./Images/Card10.png");
    card10.resize(cardWidth, cardHeight);
    card11 = loadImage("./Images/Card11.png");
    card11.resize(cardWidth, cardHeight);
    card12 = loadImage("./Images/Card12.png");
    card12.resize(cardWidth, cardHeight);
    card13 = loadImage("./Images/Card13.png");
    card13.resize(cardWidth, cardHeight);
    card14 = loadImage("./Images/Card14.png");
    card14.resize(cardWidth, cardHeight);
    card15 = loadImage("./Images/Card15.png");
    card15.resize(cardWidth, cardHeight);
    card16 = loadImage("./Images/Card16.png");
    card16.resize(cardWidth, cardHeight);
    card17 = loadImage("./Images/Card16.png");
    card17.resize(cardWidth, cardHeight);
    card18 = loadImage("./Images/Card16.png");
    card18.resize(cardWidth, cardHeight);
    card19 = loadImage("./Images/Card16.png");
    card19.resize(cardWidth, cardHeight);
    card20 = loadImage("./Images/Card16.png");
    card20.resize(cardWidth, cardHeight);
  }
}
