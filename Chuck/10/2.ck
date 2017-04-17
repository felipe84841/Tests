Hid hid; // human interface  device (mouse/keyboard)

// Message
HidMsg msg;

0 => int device;

if( hid.openMouse(device) == false) me.exit();

<<< "Mouse", hid.name(), "ready" >>>;

// sound chain
SndBuf buffy => dac;

me.dir(-1) + "/audio/snare_01.wav" => buffy.read;
buffy.samples() => buffy.pos;

while(true)
{
    // wait to event
    hid => now;
    
    // get message
    while( hid.recv(msg))
    {
        if(msg.isButtonDown())
        {
            <<< "Button down" >>>;
            0 => buffy.pos;
        }
        else if( msg.isMouseMotion())
        {
            if(msg.deltaX != 0)
            {
                msg.deltaX / 20.0 => buffy.rate;
            }
        }
    }
}