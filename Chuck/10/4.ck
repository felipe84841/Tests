//generic Event
Event e;

// fun to spork
fun void foo( Event e, string msg)
{
    while(true)
    {
        e => now;
        <<< "FOO!!!!", msg >>>;
    }
}

spork ~ foo(e, "Hi");
spork ~ foo(e, "there");

5::second => now;


while(true)
{
    e.broadcast();
    1::second => now;
}