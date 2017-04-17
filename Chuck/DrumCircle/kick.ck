// kick.ck
SndBuf kick => dac;

me.dir(-1) + "/audio/kick_04.wav" => kick.read;

BPM tempo;
//tempo.tempo(200);

while(true)
{
    tempo.quaterNote => dur quarter;
    
    for( 0 => int beat; beat < 4; beat++ )
    {
          0 => kick.pos;
          quarter => now;
    }
}