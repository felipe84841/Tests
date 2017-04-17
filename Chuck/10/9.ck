OscOut oout;

oout.dest("localhost", 6449);
oout.start("/playNote");

oout.add(60); // Midi note
oout.add(.5);  //gain

oout.send();