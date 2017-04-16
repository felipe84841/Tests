Noise n => Pan2 p => dac;

while( true )
{
    Math.sin(now/1::second*2*pi) => p.pan; 
    10::ms => now;
}