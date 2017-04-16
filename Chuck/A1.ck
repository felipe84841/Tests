TriOsc chord[3];
Gain master => dac;
for( 0 => int i; i< chord.cap(); i++)
{
    chord[i] => master;
    1.0/chord.cap() => chord[i].gain;
}

fun void playChord(int root, string quality, float length)
{
    // funtion will make major or minor chords
    
    // root
    Std.mtof(root) => chord[0].freq;
    
    // third
    if( quality == "major" )
    {
       Std.mtof(root+4) => chord[1].freq;
    }
    else if( quality == "minor" )
    {
       Std.mtof(root+4) => chord[1].freq;
    }
    else
    {
         <<< "Must specify 'major' or 'minor' " >>>;
    }
    
    // fifth
    Std.mtof(root+7) => chord[2].freq;
    
    length::ms => now;
}



// Main Program 
// infinite loop
while (true)
{
    playChord( Math.random2(60,72), "minor" , 250);
    playChord( Math.random2(60,72), "major" , 500);
    playChord( Math.random2(60,72), "minor" , 250);
}
