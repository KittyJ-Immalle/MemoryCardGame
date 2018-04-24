public GameStatus gameStatus = GameStatus.ONE_CARD_SELECTED;
private CardList cardList;
private int cardsSelected;

void setup() {
  size(1300,550);
  cardList = new CardList(10);
}

void draw() {
  background(205);
  textSize(28);
  fill(0);
  text("Memory Card Game", 10, 40);
  strokeWeight(3);
  line(0,60,300,60);
  line(300,0,300,height);
  text("Cards selected: " + cardsSelected, 10, 150);
  
  cardList.drawAllCards();
}

void mousePressed() {
  cardList.updateCardValues();
  switch(gameStatus) {
    case ONE_CARD_SELECTED:
      gameStatus = GameStatus.TWO_CARDS_SELECTED;
      cardsSelected = 1;
    break;
    case TWO_CARDS_SELECTED:
      gameStatus = GameStatus.ONE_CARD_SELECTED;
      cardsSelected = 2;
      cardList.checkCardsFacingUp();
      cardsSelected = 0;
     break;
  }
}
