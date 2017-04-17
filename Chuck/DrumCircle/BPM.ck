public class BPM // bit per min
{
    dur myDuration[4];
    static dur quaterNote, eightNote, sixteenthNote , thirtythSecondNote;
    
    fun void tempo (float beat)
    {
        60.0/(beat) => float SPB; // second per bit
        SPB::second => quaterNote;
        quaterNote*0.5 => eightNote;
        eightNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtythSecondNote;
        
        [quaterNote,eightNote,sixteenthNote,thirtythSecondNote] 
            @=> myDuration;
        
    }
  
}