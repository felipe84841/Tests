//String Model
Noise imp => ADSR env => Delay d => dac;
d=> d;
0.005::second => d.delay;
0.99 => d.gain;
(0.005::second, 0.001::second, 0.0, 0.001::second) => env.set;

1 => env.keyOn;


2.0::second => now;