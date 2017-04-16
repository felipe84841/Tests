// piano.ck
Rhodey piano[4];
piano[0] => dac.left;
piano[1] => dac;
piano[2] => dac;
piano[3] => dac.right;

// Chord 2D array

[[53,57,60,64],[51,55,60,63]] @=> int chordz [][];

//loop
while(true)
{
    //fist chord
    for(0 => int i; i< 4; i++)
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.5,1.0) => piano[i].noteOn;
    }
    1.0::second => now;
    //second chord
    for(0 => int i; i< 4; i++)
    {
        Std.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.5,1.0) => piano[i].noteOn;
    }
    1.4::second => now;
}
