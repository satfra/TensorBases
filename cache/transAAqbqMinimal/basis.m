(* Created with the Wolfram Language : www.wolfram.com *)
{TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
  (TBdeltaDirac[Global`d3, Global`d4]*TBdeltaLorentz[Global`mu, Global`nu] - 
   TBgamma[Global`mu, Global`dint$222525, Global`d4]*
    TBgamma[Global`nu, Global`d3, Global`dint$222525] + 
   TBgamma[Global`mu, Global`d3, Global`dint$222525]*
    TBgamma[Global`nu, Global`dint$222525, Global`d4])*
  TBT[Global`color, Global`a1, Global`A3, Global`Aint]*
  TBT[Global`color, Global`a2, Global`Aint, Global`A4], 
 I*TBdeltaFund[Global`flavor, Global`F3, Global`F4]*
  TBT[Global`color, Global`a1, Global`A3, Global`Aint]*
  TBT[Global`color, Global`a2, Global`Aint, Global`A4]*
  (-((TBgamma[Global`nu, Global`dint$222526, Global`d4]*
       (TBgamma[Global`mu, Global`dint$222527, Global`dint$222526]*
         TBgamma[Global`rho, Global`d3, Global`dint$222527] - 
        TBgamma[Global`mu, Global`d3, Global`dint$222527]*
         TBgamma[Global`rho, Global`dint$222527, Global`dint$222526]) + 
      TBgamma[Global`nu, Global`d3, Global`dint$222526]*
       (TBgamma[Global`mu, Global`dint$222528, Global`d4]*
         TBgamma[Global`rho, Global`dint$222526, Global`dint$222528] - 
        TBgamma[Global`mu, Global`dint$222526, Global`dint$222528]*
         TBgamma[Global`rho, Global`dint$222528, Global`d4]))*
     TBvec[Global`p3, Global`rho]) + 
   (TBgamma[Global`mu, Global`dint$222532, Global`d4]*
      (-(TBgamma[Global`nu, Global`dint$222533, Global`dint$222532]*
         TBgamma[Global`rho, Global`d3, Global`dint$222533]) + 
       TBgamma[Global`nu, Global`d3, Global`dint$222533]*
        TBgamma[Global`rho, Global`dint$222533, Global`dint$222532]) + 
     TBgamma[Global`mu, Global`d3, Global`dint$222532]*
      (-(TBgamma[Global`nu, Global`dint$222534, Global`d4]*
         TBgamma[Global`rho, Global`dint$222532, Global`dint$222534]) + 
       TBgamma[Global`nu, Global`dint$222532, Global`dint$222534]*
        TBgamma[Global`rho, Global`dint$222534, Global`d4]))*
    TBvec[Global`p4, Global`rho] + 
   ((TBgamma[Global`mu, Global`dint$222531, Global`d4]*
        TBgamma[Global`nu, Global`dint$222529, Global`dint$222531] - 
       TBgamma[Global`mu, Global`dint$222529, Global`dint$222531]*
        TBgamma[Global`nu, Global`dint$222531, Global`d4])*
      TBgamma[Global`rho, Global`d3, Global`dint$222529] + 
     (TBgamma[Global`mu, Global`dint$222530, Global`dint$222529]*
        TBgamma[Global`nu, Global`d3, Global`dint$222530] - 
       TBgamma[Global`mu, Global`d3, Global`dint$222530]*
        TBgamma[Global`nu, Global`dint$222530, Global`dint$222529])*
      TBgamma[Global`rho, Global`dint$222529, Global`d4])*
    (TBvec[Global`p1, Global`rho] + TBvec[Global`p4, Global`rho]))}
