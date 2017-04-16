//SinOsc s => dac; //DigitalAudioConverter
//SqrOsc  s => dac; // Onda Quadrada
//TriOsc s => dac; // Onda Triangular
SawOsc s => dac; // SawTooth Wave
0.6 => s.gain; //Volume
220 => s.freq;
1::second => now;

0.5 => s.gain; 
440 => s.freq;
2::second => now;

0.3 => s.gain; 
330 => s.freq;
3::second => now;