//Reverse MIDI
SndBuf mySound => dac;

me.dir() => string path;
"/audio/snare_01.wav" => string filename;
path + filename => filename;

filename => mySound.read;
mySound.samples() => int numSamples;

while(true)
{
    numSamples => mySound.pos; //Set playhead position
    -1.0 => mySound.rate; 
    1::second => now;
}
