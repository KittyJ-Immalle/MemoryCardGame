import java.util.Timer;
import java.util.TimerTask;

private final Timer timer = new Timer();
private boolean hasFinished = true;
private int timerCounter;
public GameState gameState = GameState.START;
private Button easy = new Button("easy", 250, 250, 400, 500);
private Button medium = new Button("medium", 700, 250, 400, 500);
private Button hard = new Button("hard", 1150, 250, 400, 500);
public GameDifficulty difficulty;
private CardList cardList;
public int cardsSelected;
private int card1Index, card2Index;
static public PImage backOfCard;

final int delay = 30; // aantal frames 
int delayCounter = 0;

void setup() {
  size(1800,1000);
  frameRate(60);
  
}

void draw() {
  //draw playing screens
  if (gameState == GameState.START) {
    drawStartScreen();
  } else if (gameState != GameState.GAME_OVER) {
    drawGameScreen();
    
  }
  
  //check for win
  if (gameState != GameState.START && gameState != GameState.GAME_OVER && cardList.cards.size() == 0) {
    gameState = GameState.WIN;
    timerCounter = 0;
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
     //draw ending screens
     case WIN:
       drawWinningScreen();
     break;
     case GAME_OVER:
       drawGameOverScreen();
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
  startTimer(60);
}

private void handleMedium() {
  difficulty = GameDifficulty.MEDIUM;
  cardList = new CardList(20, 8, 150, 270);
  startTimer(60);
}

private void handleHard() {
  difficulty = GameDifficulty.HARD;
  cardList = new CardList(36, 9, 150, 250);
  startTimer(120);
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
  
private void startTimer(final float waitTime) {
  if (hasFinished) {
    timerCounter = (int)waitTime;
    createScheduleTimer(waitTime); 
    }
}
  
private void createScheduleTimer(final float sec) {
  hasFinished = false;
  
  timer.schedule(new TimerTask() {
    public void run() {
      if (timerCounter != 0) {
        timerCounter--;
      }
    }
  }, 0, 1000);
 
  timer.schedule(new TimerTask() {
    public void run() {
      gameState = GameState.GAME_OVER;
      hasFinished = true;
      cardList.cards.clear();
    }
  }
  , (long) (sec*1e3));
}

private void drawStartScreen() {
  background(205);
  fill(0);
  textSize(50);
  text("Memory Card Game", width/2 - textWidth("Memory Card Game")/2, 60);
  textSize(30);
  text("Select your difficulty", width/2 - textWidth("Select your difficulty")/2, 150);
  easy.draw();
  medium.draw();
  hard.draw();
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
  text("Time left: " + timerCounter, 10, 400);
  cardList.drawAllCards();
}

private void drawWinningScreen() {
  textSize(100);
  text("Congratulations!", 650, 300);
  textSize(50);
  text("You won! :D", 900, 400);
}

private void drawGameOverScreen() {
  background(205);
  textSize(100);
  text("Game Over :(", 650, 300);
  textSize(50);
  text("Restart the game to try again", 600, 400);
}



  