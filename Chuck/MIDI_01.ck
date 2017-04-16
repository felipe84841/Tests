SndBuf mySound => dac;

me.dir() => string path;

"/audio/snare_01.wav" => string filename;

path + filename => filename;

filename => mySound.read;

.5 => mySound.gain; //Valume
0 => mySound.pos; //Set playhead position
1.2 => mySound.rate; // velocity

1::second => now;
