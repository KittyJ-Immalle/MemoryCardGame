CardList c;
void setup() {
  size(1300,550);
  strokeWeight(3);
  line(300,0,300,height);
  c = new CardList(10);
  
  c.Show();
  
}

void draw() {

}

void mousePressed() {
  for (int i = 0; i < c.cards.length; i++) {
    if (c.cards[i].mouseOverCard() == true) {
      c.cards[i].flipAround();
    }
  }
}
