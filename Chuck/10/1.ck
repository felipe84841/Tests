Hid hid; // human interface  device (mouse/keyboard)

// Message
HidMsg msg;

0 => int device;

if( hid.openKeyboard(device) == false) me.exit();

<<< "Keyboard", hid.name(), "ready" >>>;

// BeeTree organ
BeeThree organ => JCRev reverb => dac;
.05 => reverb.mix;

while(true)
{
    // wait to event
    hid => now;
    
    // get message
    while( hid.recv(msg))
    {
        if( msg.isButtonDown())
        {
            <<< "Button down:" , msg.ascii >>>;
            msg.ascii => Std.mtof => float freq => organ.freq;
            
            if( freq > 20000) continue; // skip
            1 => organ.noteOn;
            80::ms => now;
        }
        else
        {
            1 => organ.noteOff;
        }
    }
}