//generic Event
Event e;

// fun to spork
fun void foo( Event e)
{
    e => now;
    <<< "FOO!!!!" >>>;
}

spork ~ foo(e);

5::second => now;

//signal e
e.signal();

while(true) 1::second => now;