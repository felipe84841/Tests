// Raga Jam
Sitar sitar => Gain sitatGain => Gain master => dac;
sitatGain =>  Gain sitarFeedback => Delay delay => sitatGain;
//drums
Shakers shaker => master;
//drone
VoicForm singerDrones[4];
NRev droneRev => master;
for( 0 => int i; i < singerDrones.cap(); i++)
{
    singerDrones[i] => droneRev;
    (.5/singerDrones.cap()) => singerDrones[i].gain;
}

// global
[62,63, 65,67,69,70,72,74] @=> int raga[];
[26,38,45,50] @=> int drone[];
// timming parameter
.2 => float beattime;

beattime::second => delay.max;
beattime::second => delay.delay;
0.75 => sitarFeedback.gain;

.5 => droneRev.mix;
for( 0 => int i; i < singerDrones.cap(); i++)
{
    .02 => singerDrones[i].vibratoGain;
    "lll" => singerDrones[i].phoneme;
    Std.mtof(drone[i]) => singerDrones[i].freq;
}

5::second => now;//solo

//Main program
while(true)
{
    Math.random2(1,3) => int factor;
    
// loop 
    for( 0 => int i; i < raga.cap(); i++)
    {
        // Sitar Control
        Std.mtof(raga[Math.random2(0,raga.cap()-1)]) => sitar.freq;
        sitar.noteOn(Math.randomf());
        // Drum control
        Math.random2(1,2) => shaker.preset;
        Math.random2f(60.0,128.0) => shaker.objects;
        Math.random2f(.8,1.0) => shaker.decay;
        shaker.noteOn(Math.random2f(0.0, 4.0));
        
        // time control
        beattime::second*factor => now;
    }
}
