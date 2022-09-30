ArrayList<Ring> W = new ArrayList();

int diameter = 16;
float t = 0.0;
float dt = .1;
float amplitude = 100.0;
float frequency = 0.3;

void setup() {
  size(900, 900);
  for (int x=0;x<20;x++) {
    for (int y=0;y<20;y++) {
      int index = x +y*10;
      Ring R = new Ring(x*30, y*30, index, 20);
      W.add(R);
    }
  }
}

void draw() {
  background(-1);
   for (int i =0; i < width/diameter+10; i ++){
  ellipse(i*diameter,amplitude*sin(frequency*(t+i))+height/8,diameter,diameter);
  stroke(#0384fc);
  strokeWeight(3);
  }
  t += dt;

  translate(750,250);
  rotate(PI/2);
  for (int i=0;i<W.size();i++)
  {
    Ring r = (Ring) W.get(i);
    r.display();
    r.update();
  }
}


class Ring {
  int h, k, rad;
  float i, v;
  Ring(int h, int k, int i, int rad) {
    this.h = h;
    this.k = k;
    this.rad = rad;
    v = random(0.5, 2);
    this.i = i;
  }

  void display() {
    float x = h+rad*sin(radians(i));
    float y = k+rad*cos(radians(i));

    rect(x, y, 20, 20);
    fill(#fc0303);
  
  }


  void update() {
    i=i+2;
    if (i>360)i=0;
  }
}
