public GameState gameState = GameState.START;
private Difficulty easy = new Difficulty("easy");
private Difficulty medium = new Difficulty("medium");
private Difficulty hard = new Difficulty("hard");
public GameDifficulty difficulty;
private CardList cardList;
public int cardsSelected;
private int card1Index, card2Index;
static public PImage backOfCard;
static public PImage card1, card2 ,card3 ,card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20;

final int delay = 30; // aantal frames 
int delayCounter = 0;

void setup() {
  size(1800,1000);
  frameRate(60);
  
}

void draw() {
  if (gameState == GameState.START) {
    drawStartScreen();
  } else {
    drawGameScreen();
  }
  
  switch(gameState) {
     case NO_CARDS_SELECTED:
       cardsSelected = 0;
     break;
     case DELAY:
      delayCounter++;
      if(delayCounter >= delay) {
        delayCounter = 0;
        
        // KAARTEN VERWIJDEREN
        removeCardsIfEqual(cardList);
        gameState = GameState.NO_CARDS_SELECTED;
      }
     break;
  }
}

void mousePressed() {
  if (gameState == GameState.START) {
    if (easy.mouseOverPanel() || medium.mouseOverPanel() || hard.mouseOverPanel()) {
      handleStartState();
    }
  } else {
    for (int i = 0; i < cardList.cards.size(); i++) {
      if (cardList.cards.get(i).mouseOverCard() && cardList.cards.get(i).status != CardStatus.FLIPPED) {
        updateGameState();
        switch(gameState) {
          case ONE_CARD_SELECTED:
            handleOneCardState();
          break;
          case TWO_CARDS_SELECTED:
            handleTwoCardState();
          break;
        }
      }
    }
  }
}

private void updateGameState() {
  switch(gameState) {
    case NO_CARDS_SELECTED:
      gameState = GameState.ONE_CARD_SELECTED;
    break;
    case ONE_CARD_SELECTED:
      gameState = GameState.TWO_CARDS_SELECTED;
    break;
    case TWO_CARDS_SELECTED:
      gameState = GameState.DELAY;
    break;
  }
}

private void handleStartState() {
  if (easy.mouseOverPanel()) {
    handleEasy();
  }
  if (medium.mouseOverPanel()) {
    handleMedium();
  }
  if (hard.mouseOverPanel()) {
    handleHard();
  }
  gameState = GameState.NO_CARDS_SELECTED;
}

private void handleOneCardState() {
  cardList.flipCurrentCard();
  cardsSelected = 1;
}

private void handleTwoCardState() {
  cardList.flipCurrentCard();
  cardsSelected = 2;
  updateGameState();
}

private void handleEasy() {
  difficulty = GameDifficulty.EASY;
  cardList = new CardList(16, 8, 150, 270);
}

private void handleMedium() {
  difficulty = GameDifficulty.MEDIUM;
  cardList = new CardList(20, 8, 150, 270);
}

private void handleHard() {
  difficulty = GameDifficulty.HARD;
  cardList = new CardList(36, 9, 150, 250);
}

private void removeCardsIfEqual(CardList list) {
    int cardIndexCounter = 0;
    for (int i = 0; i < list.cards.size(); i++) {
      if (list.cards.get(i).status == CardStatus.FLIPPED) {
        if (cardIndexCounter == 0) { card1Index = i; } else { card2Index = i; }
        cardIndexCounter++;
      }
      if (cardIndexCounter >= 2) {
        cardIndexCounter = 0;
      }
    }
    if (cardsSelected == 2) {
      compareCards(list);
    }
  }
  
private void compareCards(CardList list) {
    if (list.cards.get(card1Index).value == list.cards.get(card2Index).value) {
      list.cards.remove(card1Index);
      list.cards.remove(card2Index - 1);
    } else {
      list.cards.get(card1Index).status = CardStatus.VISIBLE;
      list.cards.get(card2Index).status = CardStatus.VISIBLE;
    }
  }

private void drawStartScreen() {
  background(205);
  fill(0);
  textSize(50);
  text("Memory Card Game", width/2 - textWidth("Memory Card Game")/2, 60);
  textSize(30);
  text("Select your difficulty", width/2 - textWidth("Select your difficulty")/2, 150);
  easyPanel();
  mediumPanel();
  hardPanel();
}

private void drawGameScreen() {
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

private void easyPanel() {
  stroke(0);
  fill(205);
  rect(250, 250, 400, 500);
  fill(0);
  textSize(50);
  text("Easy", 395, 450);
}
  
private void mediumPanel() {
  stroke(0);
  fill(205);
  rect(700, 250, 400, 500);
  fill(0);
  textSize(50);
  text("Medium", width/2 - 100, 450);
}
  
private void hardPanel() {
  stroke(0);
  fill(205);
  rect(1150, 250, 400, 500);
  fill(0);
  textSize(50);
  text("Hard", 1290, 450);
}
