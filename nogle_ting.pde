import at.mukprojects.mukcast.client.*;
import at.mukprojects.mukcast.concurrent.*;
import at.mukprojects.mukcast.message.*;
import at.mukprojects.mukcast.server.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;

void setup() {
  size(500, 500);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
  box2d.setGravity(0, 0);
  visInf(40);
}

void draw() {
  background(255);
  println("x = " + mouseX);
  println("y = " + mouseY);
  box2d.step();
  
  for (Box b: boxes) {
    b.display();
  }
  
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  
  /*if (mousePressed) {
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }*/
  
  keyPressed();
}

void keyPressed() {
  if (key == 'w') {
    for (Box b: boxes) {
     b.attract(250, 0);
    }
  }
  if (key == 'a') {
    for (Box b: boxes) {
     b.attract(0, 250);
    }
  }
  if (key == 's') {
    for (Box b: boxes) {
     b.attract(250, 500);
    }
  }
  if (key == 'd') {
    for (Box b: boxes) {
     b.attract(500,250);
    }
  }
}

void visInf(int antal) {
  pushMatrix();
  int pos = (width-(antal * 12))/2;
  for (int i = 0; i < antal; i++) {
    Box p = new Box(pos + 12 * i,10);
    boxes.add(p);
  }
  popMatrix();
}
