(* Created with the Wolfram Language : www.wolfram.com *)
{(I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBdeltaLorentz[Global`mu, Global`nu]*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]) + 
    TBsp[Global`p2, Global`p2]*TBvec[Global`p1, Global`mu]*
     TBvec[Global`p1, Global`nu] - TBsp[Global`p1, Global`p2]*
     TBvec[Global`p1, Global`nu]*TBvec[Global`p2, Global`mu] - 
    TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`mu]*
     TBvec[Global`p2, Global`nu] + TBsp[Global`p1, Global`p1]*
     TBvec[Global`p2, Global`mu]*TBvec[Global`p2, Global`nu])*
   (TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`rho] - 
    TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`rho]))/
  (Sqrt[2]*(Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]]*
   (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^(3/2)), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBsp[Global`p2, Global`p2]*TBvec[Global`p1, Global`mu] - 
    TBsp[Global`p1, Global`p2]*TBvec[Global`p2, Global`mu])*
   ((TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     TBvec[Global`p1, Global`nu] - (TBsp[Global`p1, Global`p1] + 
      TBsp[Global`p1, Global`p2])*TBvec[Global`p2, Global`nu])*
   (TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`rho] - 
    TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`rho]))/
  ((Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])]*
   (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^(3/2)), 
 ((-I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBsp[Global`p2, Global`p2]*TBvec[Global`p1, Global`mu] - 
    TBsp[Global`p1, Global`p2]*TBvec[Global`p2, Global`mu])*
   (TBdeltaLorentz[Global`rho, Global`nu]*(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]) - 
    TBsp[Global`p2, Global`p2]*TBvec[Global`p1, Global`nu]*
     TBvec[Global`p1, Global`rho] + TBsp[Global`p1, Global`p2]*
     TBvec[Global`p1, Global`rho]*TBvec[Global`p2, Global`nu] + 
    (TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`nu] - 
      TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`nu])*
     TBvec[Global`p2, Global`rho]))/(Sqrt[2]*(Global`Nc - Global`Nc^3)*
   Sqrt[TBsp[Global`p2, Global`p2]]*(-TBsp[Global`p1, Global`p2]^2 + 
     TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])^(3/2)), 
 ((-I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   ((TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     TBvec[Global`p1, Global`nu] - (TBsp[Global`p1, Global`p1] + 
      TBsp[Global`p1, Global`p2])*TBvec[Global`p2, Global`nu])*
   (TBdeltaLorentz[Global`rho, Global`mu]*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]) + 
    TBsp[Global`p2, Global`p2]*TBvec[Global`p1, Global`mu]*
     TBvec[Global`p1, Global`rho] - TBsp[Global`p1, Global`p2]*
     TBvec[Global`p1, Global`rho]*TBvec[Global`p2, Global`mu] - 
    TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`mu]*
     TBvec[Global`p2, Global`rho] + TBsp[Global`p1, Global`p1]*
     TBvec[Global`p2, Global`mu]*TBvec[Global`p2, Global`rho]))/
  (Sqrt[2]*(Global`Nc - Global`Nc^3)*(TBsp[Global`p1, Global`p2]^2 - 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
   Sqrt[(TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])]), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p1, Global`rho]*(TBdeltaLorentz[Global`mu, Global`nu]*
     (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2]) - TBsp[Global`p2, Global`p2]*
     TBvec[Global`p1, Global`mu]*TBvec[Global`p1, Global`nu] + 
    TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`nu]*
     TBvec[Global`p2, Global`mu] + 
    (TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`mu] - 
      TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`mu])*
     TBvec[Global`p2, Global`nu]))/(Sqrt[2]*(Global`Nc - Global`Nc^3)*
   Sqrt[TBsp[Global`p1, Global`p1]]*(-TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p1, Global`rho]*(TBsp[Global`p2, Global`p2]*
     TBvec[Global`p1, Global`mu] - TBsp[Global`p1, Global`p2]*
     TBvec[Global`p2, Global`mu])*
   (-((TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
      TBvec[Global`p1, Global`nu]) + (TBsp[Global`p1, Global`p1] + 
      TBsp[Global`p1, Global`p2])*TBvec[Global`p2, Global`nu]))/
  ((Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])]*
   (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2])), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p2, Global`mu]*(TBdeltaLorentz[Global`rho, Global`nu]*
     (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2]) - TBsp[Global`p2, Global`p2]*
     TBvec[Global`p1, Global`nu]*TBvec[Global`p1, Global`rho] + 
    TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`rho]*
     TBvec[Global`p2, Global`nu] + 
    (TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`nu] - 
      TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`nu])*
     TBvec[Global`p2, Global`rho]))/(Sqrt[2]*(Global`Nc - Global`Nc^3)*
   Sqrt[TBsp[Global`p2, Global`p2]]*(-TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBvec[Global`p1, Global`nu] + TBvec[Global`p2, Global`nu])*
   (TBdeltaLorentz[Global`rho, Global`mu]*(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]) - 
    TBsp[Global`p2, Global`p2]*TBvec[Global`p1, Global`mu]*
     TBvec[Global`p1, Global`rho] + TBsp[Global`p1, Global`p2]*
     TBvec[Global`p1, Global`rho]*TBvec[Global`p2, Global`mu] + 
    (TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`mu] - 
      TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`mu])*
     TBvec[Global`p2, Global`rho]))/(Sqrt[2]*(Global`Nc - Global`Nc^3)*
   Sqrt[TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
     TBsp[Global`p2, Global`p2]]*(-TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p2, Global`mu]*(TBvec[Global`p1, Global`nu] + 
    TBvec[Global`p2, Global`nu])*(TBsp[Global`p1, Global`p2]*
     TBvec[Global`p1, Global`rho] - TBsp[Global`p1, Global`p1]*
     TBvec[Global`p2, Global`rho]))/((Global`Nc - Global`Nc^3)*
   Sqrt[TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]*
     (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])]), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (-((TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
      TBvec[Global`p2, Global`mu]*TBvec[Global`p2, Global`nu]) + 
    TBsp[Global`p2, Global`p2]*(TBvec[Global`p1, Global`nu]*
       TBvec[Global`p2, Global`mu] + TBvec[Global`p1, Global`mu]*
       (TBvec[Global`p1, Global`nu] + TBvec[Global`p2, Global`nu])))*
   (-(TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`rho]) + 
    TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`rho]))/
  (Sqrt[2]*(Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])]*
   (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2])), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBvec[Global`p2, Global`mu]*(-2*TBsp[Global`p1, Global`p2]*
       TBvec[Global`p1, Global`nu] + TBsp[Global`p1, Global`p1]*
       TBvec[Global`p2, Global`nu]) + TBsp[Global`p2, Global`p2]*
     (-(TBvec[Global`p1, Global`nu]*TBvec[Global`p2, Global`mu]) + 
      TBvec[Global`p1, Global`mu]*(TBvec[Global`p1, Global`nu] + 
        TBvec[Global`p2, Global`nu])))*
   (-(TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`rho]) + 
    TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`rho]))/
  (Sqrt[2]*(Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])]*
   (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2])), 
 ((-I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p1, Global`rho]*TBvec[Global`p2, Global`mu]*
   (TBvec[Global`p1, Global`nu] + TBvec[Global`p2, Global`nu]))/
  ((Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])]), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p1, Global`rho]*
   (-((TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
      TBvec[Global`p2, Global`mu]*TBvec[Global`p2, Global`nu]) + 
    TBsp[Global`p2, Global`p2]*(TBvec[Global`p1, Global`nu]*
       TBvec[Global`p2, Global`mu] + TBvec[Global`p1, Global`mu]*
       (TBvec[Global`p1, Global`nu] + TBvec[Global`p2, Global`nu]))))/
  (Sqrt[2]*(Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])]), 
 (I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBvec[Global`p1, Global`rho]*(TBvec[Global`p2, Global`mu]*
     (-2*TBsp[Global`p1, Global`p2]*TBvec[Global`p1, Global`nu] + 
      TBsp[Global`p1, Global`p1]*TBvec[Global`p2, Global`nu]) + 
    TBsp[Global`p2, Global`p2]*(-(TBvec[Global`p1, Global`nu]*
        TBvec[Global`p2, Global`mu]) + TBvec[Global`p1, Global`mu]*
       (TBvec[Global`p1, Global`nu] + TBvec[Global`p2, Global`nu]))))/
  (Sqrt[2]*(Global`Nc - Global`Nc^3)*Sqrt[TBsp[Global`p1, Global`p1]*
     TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])])}
