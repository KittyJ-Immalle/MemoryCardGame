import java.util.Timer;
import java.util.TimerTask;

private final Timer timer = new Timer();
private boolean hasFinished = true;
private int timerCounter;
public GameState gameState = GameState.START;
private Button easyButton = new Button("Easy", 250, 250, 400, 500);
private Button mediumButton = new Button("Medium", 700, 250, 400, 500);
private Button hardButton = new Button("Hard", 1150, 250, 400, 500);
private Button restartButton = new Button("Restart", 900, 550, 300, 100);
private int easyMaxCards = 16;
private int mediumMaxCards = 20;
private int hardMaxCards = 36;
private int easyTime = 60;
private int mediumTime = 60;
private int hardTime = 150;
public GameDifficulty difficulty;
private String currentDifficulty;
private CardList cardList;
public int cardsSelected;
private int attemptCounter;
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
  } else {
    drawGameScreen();
  }
  
  //check for win
  if (gameState != GameState.START && gameState != GameState.GAME_OVER && cardList.cards.size() == 0) {
    gameState = GameState.WIN;
    timer.cancel();
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
    if (easyButton.mouseOver() || mediumButton.mouseOver() || hardButton.mouseOver()) {
      handleStartState();
    }
  } else if (restartButton.mouseOver() && gameState == GameState.GAME_OVER || gameState == GameState.WIN){
    restartGame();
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
  if (easyButton.mouseOver()) {
    handleEasy();
  }
  if (mediumButton.mouseOver()) {
    handleMedium();
  }
  if (hardButton.mouseOver()) {
    handleHard();
  }
  gameState = GameState.NO_CARDS_SELECTED;
}

private void handleOneCardState() {
  cardList.flipCurrentCard();
  cardsSelected = 1;
}

private void handleTwoCardState() {
  attemptCounter++;
  cardList.flipCurrentCard();
  cardsSelected = 2;
  updateGameState();
}

private void handleEasy() {
  difficulty = GameDifficulty.EASY;
  currentDifficulty = "Easy";
  cardList = new CardList(easyMaxCards, 8, 150, 270);
  startTimer(easyTime);
}

private void handleMedium() {
  difficulty = GameDifficulty.MEDIUM;
  currentDifficulty = "Medium";
  cardList = new CardList(mediumMaxCards, 8, 150, 270);
  startTimer(mediumTime);
}

private void handleHard() {
  difficulty = GameDifficulty.HARD;
  currentDifficulty = "Hard";
  cardList = new CardList(hardMaxCards, 9, 150, 250);
  startTimer(hardTime);
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
    }
  }
  , (long) (sec*1e3));
}

private void restartGame() {
  gameState = GameState.START;
}

private void drawStartScreen() {
  background(205);
  fill(0);
  textSize(50);
  text("Memory Card Game", width/2 - textWidth("Memory Card Game")/2, 60);
  textSize(30);
  text("Select your difficulty", width/2 - textWidth("Select your difficulty")/2, 150);
  easyButton.draw();
  mediumButton.draw();
  hardButton.draw();
  textSize(25);
  text("Cards: " + easyMaxCards, 390, 570);
  text("Time: " + easyTime, 390, 600);
  text("Cards: " + mediumMaxCards, 850, 570);
  text("Time: " + mediumTime, 850, 600);
  text("Cards: " + hardMaxCards, 1290, 570);
  text("Time: " + hardTime, 1290, 600);
}

private void drawGameScreen() {
  background(205);
  textSize(28);
  fill(0);
  text("Memory Card Game", 10, 40);
  strokeWeight(3);
  line(0,60,300,60);
  line(300,0,300,height);
  text("Difficulty: " + currentDifficulty, 10, 100);
  text("Cards selected: " + cardsSelected, 10, 200);
  text("Cards left: " + cardList.cards.size(), 10, 300);
  text("Attempts: " + attemptCounter, 10, 400);
  text("Time left: " + timerCounter, 10, 500);
  cardList.drawAllCards();
}

private void drawWinningScreen() {
  textSize(100);
  text("Congratulations!", 650, 300);
  textSize(50);
  text("You won! :D", 900, 400);
  restartButton.draw();
}

private void drawGameOverScreen() {
  fill(205);
  stroke(205);
  rect(305, 0, 10000, height);
  fill(0);
  stroke(0);
  textSize(100);
  text("Game Over :(", 730, 300);
  textSize(30);
  text("Number of attempts: " + attemptCounter, 850, 450);
  text("Cards left: " + cardList.cards.size(), 900, 500);
  restartButton.draw();
}



  