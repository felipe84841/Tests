// Sound Chain
SinOsc s => Pan2 p => dac;

// Hard pan
1.0 => p.pan;

// advance time
1::second => now;


// Test pan
1.0 => float panPosition;

while( panPosition > -1.0)
{
    panPosition => p.pan;
    <<< panPosition >>>;
    panPosition -.01 => panPosition;
    .01::second => now;
}