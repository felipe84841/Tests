// MIDI MSG
// 1NNNCCCC 0NNNNNNN 0NNNNNNN
 // messageType  pitch     value
 // msg.Data1     msg.Data2 msg.Data3
 // NoteOff: 128.143
  // NoteOn: 144
 Rhodey p => dac;
 
 // Midi Setup
 MidiIn min;
 MidiMsg msg;
 
 1 => int port;
 
 //open port
 if ( !(min.open(port)) )
 {
     <<< "MIDI  port not open", port >>>;
     me.exit();
 }
 
 int pianoNote, pianoVelocity;
 Event pianoPress;
 
 fun void playPiano()
 {
     while(true)
     {
         pianoPress => now;
         Std.mtof(pianoNote) => p.freq;
         pianoVelocity/127.0 => p.noteOn;
     }
 }
 
 spork ~ playPiano();
 
 
 while(true)
 {
     min => now;
     while(min.recv(msg))
     {
         <<< msg.data1, msg.data2, msg.data3 >>>;
         
         // msg
         if(msg.data1 == 144)
         {
             msg.data2 => pianoNote;
             msg.data3 => pianoVelocity;
             pianoPress.broadcast();
         }
         else if(msg.data1 == 128)
         {
             0 => pianoVelocity;
             pianoPress.broadcast();
         }
     }
 }