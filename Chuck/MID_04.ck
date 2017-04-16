// Sound MIDI
SndBuf2 mySound => dac; // stereo 

me.dir() + "/audio/stereo_fx_01.wav"  => string filename;

filename => mySound.read;

while(true)
{
    Math.random2f(.6,1.0) => mySound.gain; //Set volume
    Math.random2f(.2,1.8) => mySound.rate; //Set velocity
    0 => mySound.pos;
    5::second => now;
}