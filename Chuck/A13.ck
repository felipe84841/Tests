Impulse imp => ResonZ filter => dac; 

1000 => filter.freq;
50 => filter.Q;

while(true)
{
    200.0 => imp.next;
    Math.random2f(500,2000) => filter.freq;
    //2.0::second => now;
    Math.random2f(0.1,0.4)::second => now;
}