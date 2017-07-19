/*
DrinkLouder is a volume control turned party game.
Increase the volume by one for every beer that is drunk.
Set the top limit for beers/volume (current = 33).
*/


import processing.sound.*;

SoundFile soundfile;

float rate ;
int volume ;
float multiplier = 0.03; //sets the volume multiplier


void setup() {
  size(640, 360);
  background(255);

  //Load a soundfile
  soundfile = new SoundFile(this, "titan.mp3");

  // These methods return useful infos about the file
  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");

  // Play the file in a loop
  soundfile.play();
  soundfile.amp(0);
}      


void draw() {

  background(255);
  fill(0);

  text("Press '+' to increase volume by one for every beer drunk", 250, 50);
  text("Leave the room to decrease volume", 250, 70);

  text("Beers", 250, 100);

  text("Beer multiplier:"+multiplier, 400, 100);

  text(volume, 300, 100);

  text("Volume", 250, 140);

  text(volume*multiplier, 295, 140);

  println(rate);

}



void keyPressed() {


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