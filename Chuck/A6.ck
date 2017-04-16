SqrOsc clar => ADSR env => dac; // Atack, Decay, Sustain, Release
(0.5::second, 0.1::second, 0.1, 2.0::second) => env.set;

1 => env.keyOn; // Turns envelope on

2.0::second => now;

1 => env.keyOff;

2.0::second => now;
