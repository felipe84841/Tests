 MidiOut mout;
 MidiMsg msg;
 
  1 => int port;
 
 //open port
 if ( !(mout.open(port)) )
 {
     <<< "MIDI  port not open", port >>>;
     me.exit();
 }
 
 fun void send( int note, int velocity)
 {
     144 => msg.data1;
     note => msg.data2;
     velocity => msg.data3;
     mout.send(msg);
 }