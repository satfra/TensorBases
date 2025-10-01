(* Created with the Wolfram Language : www.wolfram.com *)
{(TBdeltaDirac[Global`d3, Global`d4]*TBdeltaLorentz[Global`mu, Global`nu] - 
   TBgamma[Global`mu, Global`dint$225795, Global`d4]*
    TBgamma[Global`nu, Global`d3, Global`dint$225795] + 
   TBgamma[Global`mu, Global`d3, Global`dint$225795]*
    TBgamma[Global`nu, Global`dint$225795, Global`d4])*
  TBT[Global`color, Global`a1, Global`A3, Global`Aint]*
  TBT[Global`color, Global`a2, Global`Aint, Global`A4], 
 I*TBT[Global`color, Global`a1, Global`A3, Global`Aint]*
  TBT[Global`color, Global`a2, Global`Aint, Global`A4]*
  (-((TBgamma[Global`nu, Global`dint$225796, Global`d4]*
       (TBgamma[Global`mu, Global`dint$225797, Global`dint$225796]*
         TBgamma[Global`rho, Global`d3, Global`dint$225797] - 
        TBgamma[Global`mu, Global`d3, Global`dint$225797]*
         TBgamma[Global`rho, Global`dint$225797, Global`dint$225796]) + 
      TBgamma[Global`nu, Global`d3, Global`dint$225796]*
       (TBgamma[Global`mu, Global`dint$225798, Global`d4]*
         TBgamma[Global`rho, Global`dint$225796, Global`dint$225798] - 
        TBgamma[Global`mu, Global`dint$225796, Global`dint$225798]*
         TBgamma[Global`rho, Global`dint$225798, Global`d4]))*
     TBvec[Global`p3, Global`rho]) + 
   (TBgamma[Global`mu, Global`dint$225802, Global`d4]*
      (-(TBgamma[Global`nu, Global`dint$225803, Global`dint$225802]*
         TBgamma[Global`rho, Global`d3, Global`dint$225803]) + 
       TBgamma[Global`nu, Global`d3, Global`dint$225803]*
        TBgamma[Global`rho, Global`dint$225803, Global`dint$225802]) + 
     TBgamma[Global`mu, Global`d3, Global`dint$225802]*
      (-(TBgamma[Global`nu, Global`dint$225804, Global`d4]*
         TBgamma[Global`rho, Global`dint$225802, Global`dint$225804]) + 
       TBgamma[Global`nu, Global`dint$225802, Global`dint$225804]*
        TBgamma[Global`rho, Global`dint$225804, Global`d4]))*
    TBvec[Global`p4, Global`rho] + 
   ((TBgamma[Global`mu, Global`dint$225801, Global`d4]*
        TBgamma[Global`nu, Global`dint$225799, Global`dint$225801] - 
       TBgamma[Global`mu, Global`dint$225799, Global`dint$225801]*
        TBgamma[Global`nu, Global`dint$225801, Global`d4])*
      TBgamma[Global`rho, Global`d3, Global`dint$225799] + 
     (TBgamma[Global`mu, Global`dint$225800, Global`dint$225799]*
        TBgamma[Global`nu, Global`d3, Global`dint$225800] - 
       TBgamma[Global`mu, Global`d3, Global`dint$225800]*
        TBgamma[Global`nu, Global`dint$225800, Global`dint$225799])*
      TBgamma[Global`rho, Global`dint$225799, Global`d4])*
    (TBvec[Global`p1, Global`rho] + TBvec[Global`p4, Global`rho]))}
