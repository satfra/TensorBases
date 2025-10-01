(* Created with the Wolfram Language : www.wolfram.com *)
{(TBdeltaFund[Global`color, Global`A1, Global`A2]*
   TBdeltaFund[Global`color, Global`A3, Global`A4]*
   (TBdeltaDirac[Global`d1, Global`d2]*TBdeltaDirac[Global`d3, Global`d4]*
     TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
     TBdeltaFund[Global`flavor, Global`F3, Global`F4] - 
    2*Global`Nf*TBgamma5[Global`d1, Global`d2]*TBgamma5[Global`d3, Global`d4]*
     TBT[Global`flavor, Global`f, Global`F1, Global`F2]*
     TBT[Global`flavor, Global`f, Global`F3, Global`F4]))/(2*Global`Nf), 
 (TBdeltaFund[Global`color, Global`A1, Global`A2]*
   TBdeltaFund[Global`color, Global`A3, Global`A4]*
   (-(TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
      TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
      TBgamma5[Global`d1, Global`d2]*TBgamma5[Global`d3, Global`d4]) + 
    2*Global`Nf*TBdeltaDirac[Global`d1, Global`d2]*TBdeltaDirac[Global`d3, 
      Global`d4]*TBT[Global`flavor, Global`f, Global`F1, Global`F2]*
     TBT[Global`flavor, Global`f, Global`F3, Global`F4]))/(2*Global`Nf), 
 -1/32*(TBepsFund[Global`flavor, Global`F1, Global`F3]*
   TBepsFund[Global`flavor, Global`F2, Global`F4]*
   TBepsFund[Global`color, Global`a$127218, Global`A1, Global`A3]*
   TBepsFund[Global`color, Global`a$127218, Global`A2, Global`A4]*
   (8*TBdeltaDirac[Global`d1, Global`d2]*TBdeltaDirac[Global`d3, Global`d4] + 
    8*TBgamma[Global`vi1$127218, Global`d1, Global`d2]*
     TBgamma[Global`vi1$127218, Global`d3, Global`d4] + 
    (TBgamma[Global`vi2$127218, Global`dint2$127249, Global`d2]*
       TBgamma[Global`vi3$127218, Global`d1, Global`dint2$127249] - 
      TBgamma[Global`vi2$127218, Global`d1, Global`dint1$127249]*
       TBgamma[Global`vi3$127218, Global`dint1$127249, Global`d2])*
     (TBgamma[Global`vi2$127218, Global`dint2$127251, Global`d4]*
       TBgamma[Global`vi3$127218, Global`d3, Global`dint2$127251] - 
      TBgamma[Global`vi2$127218, Global`d3, Global`dint1$127251]*
       TBgamma[Global`vi3$127218, Global`dint1$127251, Global`d4]) + 
    8*(TBgamma5[Global`d1, Global`d2]*TBgamma5[Global`d3, Global`d4] + 
      TBgamma[Global`vi4$127218, Global`d1, Global`di1$127218]*
       TBgamma[Global`vi4$127218, Global`d3, Global`di2$127218]*
       TBgamma5[Global`di1$127218, Global`d2]*TBgamma5[Global`di2$127218, 
        Global`d4]))), (TBdeltaFund[Global`color, Global`A1, Global`A2]*
   TBdeltaFund[Global`color, Global`A3, Global`A4]*
   TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
   TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
   TBgamma[0, Global`d1, Global`d2]*TBgamma[0, Global`d3, Global`d4])/
  (2*Global`Nf), (TBdeltaFund[Global`color, Global`A1, Global`A2]*
   TBdeltaFund[Global`color, Global`A3, Global`A4]*
   TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
   TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
   (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d1, Global`d2]) + 
    TBgamma[Global`i, Global`d1, Global`d2])*
   (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d3, Global`d4]) + 
    TBgamma[Global`i, Global`d3, Global`d4]))/(2*Global`Nf), 
 (TBdeltaFund[Global`color, Global`A1, Global`A2]*
   TBdeltaFund[Global`color, Global`A3, Global`A4]*
   TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
   TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
   ((-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d1, Global`d2]) + 
      TBgamma[Global`i, Global`d1, Global`d2])*
     (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d3, Global`d4]) + 
      TBgamma[Global`i, Global`d3, Global`d4]) - 
    (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d1, Global`dc$127219]) + 
      TBgamma[Global`i, Global`d1, Global`dc$127219])*
     (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d3, 
         Global`dc$127220]) + TBgamma[Global`i, Global`d3, Global`dc$127220])*
     TBgamma5[Global`dc$127219, Global`d2]*TBgamma5[Global`dc$127220, 
      Global`d4]))/(2*Global`Nf), 
 (TBdeltaFund[Global`color, Global`A1, Global`A2]*
   TBdeltaFund[Global`color, Global`A3, Global`A4]*
   TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
   TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
   (TBgamma[0, Global`d1, Global`d2]*TBgamma[0, Global`d3, Global`d4] + 
    TBgamma[0, Global`d1, Global`dc$127221]*TBgamma[0, Global`d3, 
      Global`dc$127222]*TBgamma5[Global`dc$127221, Global`d2]*
     TBgamma5[Global`dc$127222, Global`d4]))/(2*Global`Nf), 
 (TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
   TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
   (TBgamma[0, Global`d1, Global`d2]*TBgamma[0, Global`d3, Global`d4] - 
    TBgamma[0, Global`d1, Global`dc$127223]*TBgamma[0, Global`d3, 
      Global`dc$127224]*TBgamma5[Global`dc$127223, Global`d2]*
     TBgamma5[Global`dc$127224, Global`d4])*TBT[Global`color, Global`a, 
    Global`A1, Global`A2]*TBT[Global`color, Global`a, Global`A3, Global`A4])/
  (2*Global`Nf), (TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
   TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
   ((-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d1, Global`d2]) + 
      TBgamma[Global`i, Global`d1, Global`d2])*
     (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d3, Global`d4]) + 
      TBgamma[Global`i, Global`d3, Global`d4]) + 
    (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d1, Global`dc$127225]) + 
      TBgamma[Global`i, Global`d1, Global`dc$127225])*
     (-(TBdeltaLorentz[Global`i, 0]*TBgamma[0, Global`d3, 
         Global`dc$127226]) + TBgamma[Global`i, Global`d3, Global`dc$127226])*
     TBgamma5[Global`dc$127225, Global`d2]*TBgamma5[Global`dc$127226, 
      Global`d4])*TBT[Global`color, Global`a, Global`A1, Global`A2]*
   TBT[Global`color, Global`a, Global`A3, Global`A4])/(2*Global`Nf), 
 ((TBdeltaDirac[Global`d1, Global`d2]*TBdeltaDirac[Global`d3, Global`d4] - 
    TBgamma5[Global`d1, Global`d2]*TBgamma5[Global`d3, Global`d4])*
   TBT[Global`color, Global`a, Global`A1, Global`A2]*
   TBT[Global`color, Global`a, Global`A3, Global`A4]*
   (TBdeltaFund[Global`flavor, Global`F1, Global`F2]*
     TBdeltaFund[Global`flavor, Global`F3, Global`F4] - 
    2*Global`Nf*TBT[Global`flavor, Global`f, Global`F1, Global`F2]*
     TBT[Global`flavor, Global`f, Global`F3, Global`F4]))/(2*Global`Nf)}
