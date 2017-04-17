// cow.ck
SndBuf cow => dac;
me.dir(-1) + "/audio/cowbell_01.wav" => cow.read;

BPM tempo;
//tempo.tempo(200);

while(true)
{
    tempo.eightNote => dur eight;
    
    for( 0 => int beat; beat < 8; beat++ )
    {
        if( beat == 7)
        {
            0 => cow.pos;
        }
        eight => now;
    }
    
}