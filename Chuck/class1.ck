class TestData
{
    1 => int myInt;
    0.0 => float myFloat;
    
    fun float sum()
    {
        return (myInt + myFloat);
    }
}

class T2 extends TestData
{
       fun float sum()
    {
        return 2.0;
    } 
}

TestData d;

<<< d.myInt, d.myFloat, d.sum() >>>;

1::second => now;

3 => d.myInt;
0.14 => d.myFloat;

<<< d.myInt, d.myFloat, d.sum() >>>;