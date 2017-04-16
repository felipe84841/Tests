SinOsc foo => dac;
.5 => foo.gain;

[ 0 ] @=> int hi[];


while(true)
{
    Std.mtof( 45 + Std.rand2(0,0) * 12 +
              hi[Std.rand2(0,hi.cap()-1)] ) => foo.freq;
   
    200::ms => now;
}