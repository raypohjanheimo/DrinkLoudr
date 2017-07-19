/*
This is a sound file player. 
 */


import processing.sound.*;

SoundFile soundfile;

float rate ;
int volume ;
float multiplier = 0.01;


void setup() {
  size(320, 240);
  background(255);

  //Load a soundfile
  soundfile = new SoundFile(this, "titan.mp3");

  // These methods return useful infos about the file
  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");

}      


void draw() {

  background(255);
  fill(0);

  text("Press 'p' to play", 10, 20);


  text("Press '+' to increase volume", 10, 50);
  text("Press '-' to decrease volume", 10, 70);

//  text("Beers", 250, 100);

//  text("Beer multiplier:"+multiplier, 400, 100);

  text(volume, 60, 140);

  text("Volume", 10, 140);

 // text(volume*multiplier, 295, 140);


  println(rate);

}



void keyPressed() {

  if (key == 'p') {
    soundfile.play();
    soundfile.amp(0.01);
  }

  // increase volume
  if (key == '+') {

    volume += 1;

    soundfile.amp(volume*multiplier);
  }
  // limit volume
  if (volume*multiplier > 1) {
    volume -= 1;
  }
  // decrease volume
  if (key == '-') {
    volume -= 1;

    soundfile.amp(volume*multiplier);
  }
  //limit lowest volume
  if (volume < 0) {
    volume = 0;
  }
}
//}