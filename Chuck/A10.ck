SinOsc mod => SinOsc car  => ADSR env => dac; // Atack, Decay, Sustain, Release
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;


2 => car.sync;  // Frequency modulation
10000 => mod.gain;


while(true)
{
    Math.random2f(100.0,1000.0) => car.freq;
    Math.random2f(100.0,1000.0) => mod.freq; 
    1 => env.keyOn;
    1.0::second => now;    
    1 => env.keyOff;
    1.0::second => now;
}