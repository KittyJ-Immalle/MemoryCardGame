class CardList {
  private PImage[] frontOfCards;
  int x = 350, y = 10;
  int cardHeight = 200, cardWidth = 120;
  int amount = 0;
  int[] cardIndex;
  private int[] values;
  public ArrayList<Card> cards = new ArrayList<Card>();

  public CardList(int amount) {
    this.amount = amount;
    
    loadAllImages();
    frontOfCards = new PImage[]{card1, card2, card3, card4, card5, card6, card7, card8, card9, card10};
    
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
      if (i % 7 == 0 && i != 0) {
        x = 350;
        y += 270;
      }
      cards.add(new Card(x, y, cardHeight, cardWidth, values[i]));
      //set color
      cards.get(i).front = frontOfCards[cards.get(i).value]; //<>//
      x += 150;
    }
  }
  
  public void removeCardsIfEqual() {
    cardIndex = new int[2];
    int cardIndexCounter = 0;
    for (int i = 0; i < cards.size(); i++) {
      if (cards.get(i).status == CardStatus.FLIPPED) {
        cardIndex[cardIndexCounter] = i;
        cardIndexCounter++;
      }
      if (cardIndexCounter >= 2) {
        cardIndexCounter = 0;
      }
    }
    if (cardsSelected == 2) { //<>//
      compareCards(cardIndex);
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
  }
}
