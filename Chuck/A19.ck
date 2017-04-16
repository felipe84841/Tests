Clarinet c => dac;

220 => c.freq;

while(true)
{
//1 => c.noteOn;
    Math.random2f(0.1,1.0) => c.noteOn;

    2.0::second => now;

    1 => c.noteOff;

    1.0::second => now;
}