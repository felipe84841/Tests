int a;

2 => a;

<<< a >>>;

// Middle C Freq ( in Hz)
261.63 => float myFloat;

time zzz; //point in time 
dur ssss; // lenth of time (duration)

SinOsc s => dac;
myFloat => s.freq;
//1::second => now;

2::second + 1::second => dur xxx;
2::xxx  => now;