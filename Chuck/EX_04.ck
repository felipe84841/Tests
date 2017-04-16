SinOsc s => dac;
SqrOsc t => dac;

0.5 => s.gain;
0 => t.gain;

for( 0=> int i; i < 500; i++)
{
    i => s.freq;
    0.001::second => now;
}

0 => s.gain;
0.2 => t.gain;

for( 0=> int i; i < 500; i++)
{
    i => t.freq;
    0.001::second => now;
}

0.5 => s.gain;
0.2 => t.gain;

for( 0=> int i; i < 500; i++)
{
    i => t.freq;
    i *2 => s.freq; // An octave above
    0.001::second => now;
}
