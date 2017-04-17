// MIDI MSG
// 1NNNCCCC 0NNNNNNN 0NNNNNNN
 // messageType  pitch     value
 // msg.Data1     msg.Data2 msg.Data3
 // NoteOff: 128.143
  // NoteOn: 144
 Gain master => dac;
 Rhodey p => master;
 SndBuf snare => master;
 
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
 
 // Sound FIle
 me.dir(-1)+ "/audio/snare_01.wav" => snare.read;
 snare.samples() => snare.pos;
 
 int buttonVelocity;
 Event buttonPress;
 int knob[8];
 
 //
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
 
 fun void playDrum()
 {
     while(true)
     {
         buttonPress => now;
         buttonVelocity/127.0 => snare.gain;
         0 => snare.pos;
     }
 }
 
 fun void rateChange()
 {
     while(true)
     {
         20::ms => now;
         (knob[0]/127.0) + .5 => snare.rate;
     }
 }
 
 spork ~ rateChange();
 spork ~ playPiano();
 spork ~ playDrum();
 
 while(true)
 {
     min => now;
     while(min.recv(msg))
     {
         <<< msg.data1, msg.data2, msg.data3 >>>;
         
         // msg Piano
         if(msg.data1 == 144)
         {
             if(msg.data2 == 44)
             {
                 msg.data3 => buttonVelocity;
                 buttonPress.broadcast();
             }
             else
             {
                 msg.data2 => pianoNote;
                 msg.data3 => pianoVelocity;
                 pianoPress.broadcast();
             }
         }
         else if(msg.data1 == 128)
         {
             0 => pianoVelocity;
             pianoPress.broadcast();
         }
         else if(msg.data1 == 176)
         {
              msg.data3 => knob[msg.data2-1];
         }
           
     }
 }