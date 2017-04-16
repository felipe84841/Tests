//Sound chain
TriOsc s => dac;

for( 0 => int i; i<= 127; i++)
{
        Std.mtof(i) => float Hz; //MIDI to Hz
        <<< i , Hz >>>;
        Hz => s.freq;
        200::ms => now;
 }