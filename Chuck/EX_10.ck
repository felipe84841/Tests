// Array declaration
//int A[7];

//54 => A[0];
//56 => A[1];
//62 => A[2];
//54 => A[3];
//48 => A[4];
//50 => A[5];
//52 => A[6];
//52 => A[6];
SinOsc s => dac;

// ANother declaration
[ 54,56, 62, 54, 48, 50, 52] @=> int A[];
[ .5,.2, .4, .6, .5, .3, .4] @=> float notes[];

for( 0 => int i; i < A.cap(); i++)
{
    <<< i, A[i] >>>;
    Std.mtof(A[i]) => s.freq;
    //.5::second => now;
    notes[i]::second => now;
}