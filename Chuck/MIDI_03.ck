SndBuf snare => dac;

me.dir() => string path;
string snare_samples[3];

//Load array
path + "/audio/snare_01.wav"  => snare_samples[0];
path + "/audio/snare_02.wav"  => snare_samples[1];
path + "/audio/snare_03.wav"  => snare_samples[2];

while(true)
{
    Math.random2(0, snare_samples.cap() -1) => int which;
    snare_samples[which] => snare.read;
    250::ms => now;
}