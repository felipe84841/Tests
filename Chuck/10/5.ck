class TheEvent extends Event
{
    int pitch;
    float velocity;
}

TheEvent e;

//sond chain
NRev reverb => dac;
.1 => reverb.mix;

// fun to spork
fun void foo( StkInstrument instr, TheEvent e, string msg)
{
    instr => reverb;
    while(true)
    {
        e => now;
        <<< "FOO!!!!", msg >>>;
        //play
        e.pitch => Std.mtof => instr.freq;
        e.velocity => instr.noteOn;
    }
}

spork ~ foo(new StifKarp, e, "Hi");
spork ~ foo(new Mandolin,e, "there");
spork ~ foo(new Rhodey,e, "ops");
spork ~ foo(new Wurley,e, "-");

5::second => now;


while(true)
{
    //Set
    Math.random2( 30, 90) => e.pitch;
    Math.random2f( .2, .9) => e.velocity;
    // broadcast
    e.broadcast();
    1::second => now;
}