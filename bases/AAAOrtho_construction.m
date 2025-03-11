(* Created with the Wolfram Language : www.wolfram.com *)
{((TBdeltaLorentz[mu, nu]*(TBsp[p1, p2]^2 - TBsp[p1, p1]*TBsp[p2, p2]) + 
    TBsp[p2, p2]*TBvec[p1, mu]*TBvec[p1, nu] - TBsp[p1, p2]*TBvec[p1, nu]*
     TBvec[p2, mu] - TBsp[p1, p2]*TBvec[p1, mu]*TBvec[p2, nu] + 
    TBsp[p1, p1]*TBvec[p2, mu]*TBvec[p2, nu])*(TBsp[p1, p2]*TBvec[p1, rho] - 
    TBsp[p1, p1]*TBvec[p2, rho]))/(Sqrt[2]*Sqrt[TBsp[p1, p1]]*
   (-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])^(3/2)), 
 ((TBsp[p2, p2]*TBvec[p1, mu] - TBsp[p1, p2]*TBvec[p2, mu])*
   ((TBsp[p1, p2] + TBsp[p2, p2])*TBvec[p1, nu] - 
    (TBsp[p1, p1] + TBsp[p1, p2])*TBvec[p2, nu])*
   (TBsp[p1, p2]*TBvec[p1, rho] - TBsp[p1, p1]*TBvec[p2, rho]))/
  (Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])^(3/2)), 
 -(((TBsp[p2, p2]*TBvec[p1, mu] - TBsp[p1, p2]*TBvec[p2, mu])*
    (TBdeltaLorentz[rho, nu]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2]) - 
     TBsp[p2, p2]*TBvec[p1, nu]*TBvec[p1, rho] + TBsp[p1, p2]*TBvec[p1, rho]*
      TBvec[p2, nu] + (TBsp[p1, p2]*TBvec[p1, nu] - 
       TBsp[p1, p1]*TBvec[p2, nu])*TBvec[p2, rho]))/
   (Sqrt[2]*Sqrt[TBsp[p2, p2]]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])^
     (3/2))), -((((TBsp[p1, p2] + TBsp[p2, p2])*TBvec[p1, nu] - 
     (TBsp[p1, p1] + TBsp[p1, p2])*TBvec[p2, nu])*
    (TBdeltaLorentz[rho, mu]*(TBsp[p1, p2]^2 - TBsp[p1, p1]*TBsp[p2, p2]) + 
     TBsp[p2, p2]*TBvec[p1, mu]*TBvec[p1, rho] - TBsp[p1, p2]*TBvec[p1, rho]*
      TBvec[p2, mu] - TBsp[p1, p2]*TBvec[p1, mu]*TBvec[p2, rho] + 
     TBsp[p1, p1]*TBvec[p2, mu]*TBvec[p2, rho]))/
   (Sqrt[2]*(TBsp[p1, p2]^2 - TBsp[p1, p1]*TBsp[p2, p2])*
    Sqrt[(TBsp[p1, p1] + 2*TBsp[p1, p2] + TBsp[p2, p2])*
      (-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])])), 
 (TBvec[p1, rho]*(TBdeltaLorentz[mu, nu]*(-TBsp[p1, p2]^2 + 
      TBsp[p1, p1]*TBsp[p2, p2]) - TBsp[p2, p2]*TBvec[p1, mu]*TBvec[p1, nu] + 
    TBsp[p1, p2]*TBvec[p1, nu]*TBvec[p2, mu] + 
    (TBsp[p1, p2]*TBvec[p1, mu] - TBsp[p1, p1]*TBvec[p2, mu])*TBvec[p2, nu]))/
  (Sqrt[2]*Sqrt[TBsp[p1, p1]]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])), 
 (TBvec[p1, rho]*(TBsp[p2, p2]*TBvec[p1, mu] - TBsp[p1, p2]*TBvec[p2, mu])*
   (-((TBsp[p1, p2] + TBsp[p2, p2])*TBvec[p1, nu]) + 
    (TBsp[p1, p1] + TBsp[p1, p2])*TBvec[p2, nu]))/
  (Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])), 
 (TBvec[p2, mu]*(TBdeltaLorentz[rho, nu]*(-TBsp[p1, p2]^2 + 
      TBsp[p1, p1]*TBsp[p2, p2]) - TBsp[p2, p2]*TBvec[p1, nu]*
     TBvec[p1, rho] + TBsp[p1, p2]*TBvec[p1, rho]*TBvec[p2, nu] + 
    (TBsp[p1, p2]*TBvec[p1, nu] - TBsp[p1, p1]*TBvec[p2, nu])*
     TBvec[p2, rho]))/(Sqrt[2]*Sqrt[TBsp[p2, p2]]*
   (-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])), 
 ((TBvec[p1, nu] + TBvec[p2, nu])*
   (TBdeltaLorentz[rho, mu]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2]) - 
    TBsp[p2, p2]*TBvec[p1, mu]*TBvec[p1, rho] + TBsp[p1, p2]*TBvec[p1, rho]*
     TBvec[p2, mu] + (TBsp[p1, p2]*TBvec[p1, mu] - 
      TBsp[p1, p1]*TBvec[p2, mu])*TBvec[p2, rho]))/
  (Sqrt[2]*Sqrt[TBsp[p1, p1] + 2*TBsp[p1, p2] + TBsp[p2, p2]]*
   (-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])), 
 (TBvec[p2, mu]*(TBvec[p1, nu] + TBvec[p2, nu])*
   (TBsp[p1, p2]*TBvec[p1, rho] - TBsp[p1, p1]*TBvec[p2, rho]))/
  Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
     TBsp[p2, p2])*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])], 
 ((-((TBsp[p1, p1] + 2*TBsp[p1, p2])*TBvec[p2, mu]*TBvec[p2, nu]) + 
    TBsp[p2, p2]*(TBvec[p1, nu]*TBvec[p2, mu] + TBvec[p1, mu]*
       (TBvec[p1, nu] + TBvec[p2, nu])))*(-(TBsp[p1, p2]*TBvec[p1, rho]) + 
    TBsp[p1, p1]*TBvec[p2, rho]))/
  (Sqrt[2]*Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])), 
 ((TBvec[p2, mu]*(-2*TBsp[p1, p2]*TBvec[p1, nu] + 
      TBsp[p1, p1]*TBvec[p2, nu]) + TBsp[p2, p2]*
     (-(TBvec[p1, nu]*TBvec[p2, mu]) + TBvec[p1, mu]*
       (TBvec[p1, nu] + TBvec[p2, nu])))*(-(TBsp[p1, p2]*TBvec[p1, rho]) + 
    TBsp[p1, p1]*TBvec[p2, rho]))/
  (Sqrt[2]*Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])]*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])), 
 -((TBvec[p1, rho]*TBvec[p2, mu]*(TBvec[p1, nu] + TBvec[p2, nu]))/
   Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])]), 
 (TBvec[p1, rho]*(-((TBsp[p1, p1] + 2*TBsp[p1, p2])*TBvec[p2, mu]*
      TBvec[p2, nu]) + TBsp[p2, p2]*(TBvec[p1, nu]*TBvec[p2, mu] + 
      TBvec[p1, mu]*(TBvec[p1, nu] + TBvec[p2, nu]))))/
  (Sqrt[2]*Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])]), 
 (TBvec[p1, rho]*(TBvec[p2, mu]*(-2*TBsp[p1, p2]*TBvec[p1, nu] + 
      TBsp[p1, p1]*TBvec[p2, nu]) + TBsp[p2, p2]*
     (-(TBvec[p1, nu]*TBvec[p2, mu]) + TBvec[p1, mu]*
       (TBvec[p1, nu] + TBvec[p2, nu]))))/
  (Sqrt[2]*Sqrt[TBsp[p1, p1]*TBsp[p2, p2]*(TBsp[p1, p1] + 2*TBsp[p1, p2] + 
      TBsp[p2, p2])*(-TBsp[p1, p2]^2 + TBsp[p1, p1]*TBsp[p2, p2])])}
