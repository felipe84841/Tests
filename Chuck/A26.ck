ModalBar modal => NRev reverb => dac.left;
ModalBar modal2 => NRev reverb2 => dac.right;

.1 => reverb.mix;
7 => modal.preset;
.9 => modal.strikePosition;
//
.1 => reverb2.mix;
7 => modal2.preset;
.9 => modal2.strikePosition;

spork ~ tune();
spork ~ one();
spork ~ two();

while(true) 1::second => now;

fun void one()
{
    while(true)
    {
        1 => modal.strike;
        300::ms => now;
        //
        .7 => modal.strike;
        300::ms => now;
        //
        repeat(6)
        {
            .5 => modal.strike;
            100::ms => now;   
        }
    }
}

fun void two()
{
    while(true)
    {
        1 => modal2.strike;
        300::ms => now;
                0.75 => modal2.strike;
        300::ms => now;
                .5 => modal2.strike;
        300::ms => now;
                .25 => modal2.strike;
        300::ms => now;
    }
}

fun void tune()
{
    while(true)
    {
        84 + Math.sin(now/second*Math.PI*.25)*2 
            => Std.mtof => modal.freq;
        5::ms => now;
        
    }
}