CardList c;
void setup() {
  size(1300,550);
  textSize(28);
  fill(0);
  text("Memory Card Game", 10, 40);
  strokeWeight(3);
  line(0,60,300,60);
  line(300,0,300,height);
  c = new CardList(10);
  
  c.Show();
  
}

void draw() {

}

void mousePressed() {
  for (int i = 0; i < c.cards.size(); i++) {
    if (c.cards.get(i).mouseOverCard() == true) {
      c.cards.get(i).flipAround();
      c.checkCardsFacingUp();
    }
  }
}