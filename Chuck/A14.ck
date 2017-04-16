// 1foot == 0.01 ms
// and goes back
// room is 3x4x5
adc => Gain inGain;

Delay d[3];

inGain => d[0];
inGain => d[1];
inGain => d[2];

0.06::second => d[0].max => d[0].delay;
0.08::second => d[1].max => d[1].delay;
0.10::second => d[2].max => d[2].delay;

d[0] => d[0] => dac;
d[1] => d[1] => dac;
d[2] => d[2] => dac;

0.6 => d[0].gain => d[1].gain => d[2].gain;

while(true)
{
    1.0::second => now;
}

