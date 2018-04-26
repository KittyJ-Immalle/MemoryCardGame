public GameStatus gameStatus = GameStatus.NO_CARDS_SELECTED;
private CardList cardList;
private int cardsSelected;

final int delay = 30; // aantal frames 
int delayCounter = 0;

void setup() {
  size(1300,550);
  frameRate(60);
  cardList = new CardList(10);
}

void draw() {
  
  switch(gameStatus) {
     case NO_CARDS_SELECTED:
       cardsSelected = 0;
       break;
     case DELAY:
      delayCounter++; //<>//
      if(delayCounter >= delay) {
        delayCounter = 0;
        
        // KAARTEN VERWIJDEREN
        cardList.removeCardsIfEqual();
        
        gameStatus = GameStatus.NO_CARDS_SELECTED;
      }
     break;
  }
  
  background(205);
  textSize(28);
  fill(0);
  text("Memory Card Game", 10, 40);
  strokeWeight(3);
  line(0,60,300,60);
  line(300,0,300,height);
  text("Cards selected: " + cardsSelected, 10, 150);
  text("Cards left: " + cardList.cards.size(), 10, 300);
  
  cardList.drawAllCards();
}

void mousePressed() {
  for (int i = 0; i < cardList.cards.size(); i++) {
    if (cardList.cards.get(i).mouseOverCard() && cardList.cards.get(i).status != CardStatus.FLIPPED) {
        switch(gameStatus) {
      case NO_CARDS_SELECTED:
        cardList.flipCurrentCard();
        gameStatus = GameStatus.ONE_CARD_SELECTED;
        cardsSelected = 1;
      break;
      case ONE_CARD_SELECTED:
        cardList.flipCurrentCard();
        gameStatus = GameStatus.TWO_CARDS_SELECTED;
        cardsSelected = 2;
        // geen break hier
      case TWO_CARDS_SELECTED:
        gameStatus = GameStatus.DELAY;
       break;
      }
    }
  }
  
}