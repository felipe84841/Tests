Flute f => dac;

220 => f.freq;

while(true)
{
    Math.random2f(0.1,1.0) => f.noteOn;
    Math.random2f(0.1,1.0) => f.jetDelay;

    2.0::second => now;

    1 => f.noteOff;

    1.0::second => now;
}