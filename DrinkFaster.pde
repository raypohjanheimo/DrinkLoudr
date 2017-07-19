/*
DrinkFaster, increase tempo for every beer that is drunk.
*/


import processing.sound.*;

SoundFile soundfile;

float rate ;

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
  soundfile.rate(0.25);
}      


void draw() {

  background(255);
  fill(0);

  text("Press A to increase tempo", 50, 50);
  text("Press Z to decrease tempo", 50, 70);

  text("Speed", 50, 100);

  text(rate, 100, 100);

  println(rate);

  // Map mouseY from 0.2 to 1.0 for amplitude  
  soundfile.amp(map(mouseY, 0, width, 0.2, 1.0)); 

}



void keyPressed() {
  
  // increase tempo
  if (key == 'a') {

    rate += 1;

    soundfile.rate(rate*0.01);
  }
  // limit tempo
    if (rate > 300) {
    rate = 300;
  }
  // decrease tempo
  if (key == 'z') {
    rate -= 1;

    soundfile.rate(rate*0.01);
  }
  //limit lowest tempo
      if (rate < 0) {
    rate = 0;
  }
}
//}