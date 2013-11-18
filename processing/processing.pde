 /**
 * Pilotage vidéo : Thermoscope
 * Jouer la séquence à l'endroit et à l'envers.
 * La séquence est une suite d'images
 */

import processing.serial.*;

int index;
int nbImg;
PImage[] img;  // Declare variable of type array of PImage
Serial myPort;  // Create object from Serial class

void setup() {
 size(640, 480);
 background(0); 
 noCursor(); 
 
 // Init du port série
 String portName = Serial.list()[0];
 myPort = new Serial(this, portName, 9600);
 
 // Liste des images
 File dir = new File(dataPath(""));
 String[] list = dir.list();
 nbImg = list.length;
 
 // Charger les images
 img = new PImage[nbImg];
 for (int i = 0; i < nbImg; i++) {
   img[i] = loadImage(list[i]);
  }
  index = 0;
}

void keyPressed() {
  if (key == 'a'  || key == 'q') {
    // avancer dans les images
    index ++;
  } else {
    //reculer dans les images
    index --;
  }
  // Borner
  if (index < 0 ) {
    index = 0;
  }
  if ( index >= nbImg ) {
    index--;
  }
}
void  readArduino() {
  int val = 0;
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }
  if (val == 1) {
    // avancer dans les images
    index ++;
  } else {
    //reculer dans les images
    index --;
  }
  // Borner
  if (index < 0 ) {
    index = 0;
  }
  if ( index >= nbImg ) {
    index--;
  }
}

void draw() { 
  // Keep looping !
  //readArduino();
  image(img[index], 0, 0);
}

