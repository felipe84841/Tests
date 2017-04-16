Impulse imp => Delay d => dac;
d=> d;
0.005::second => d.delay;
0.99 => d.gain;

1.0 => imp.next;
2.0::second => now;

//while(true)
//{
    //0.1::second => now;
//    Math.random2f(0.01,0.1)::second => now;
//    1.0 => imp.next;
//}