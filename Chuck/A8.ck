SinOsc vibrato => SawOsc violin => ADSR env => dac; // Atack, Decay, Sustain, Release
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;
//880 => violin.freq; // A to octaves above midlle C
660 => violin.freq;
6.0 => vibrato.freq; // 6Hz freq of vibrato
2 => violin.sync;  // Frequency modulation

3 => vibrato.gain;

1 => env.keyOn; // Turns envelope on

2.0::second => now;

1 => env.keyOff;

2.0::second => now;
