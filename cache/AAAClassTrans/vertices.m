(* Created with the Wolfram Language : www.wolfram.com *)
{I*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
  (TBdeltaLorentz[Global`nui, Global`rhoi]*(-TBvec[Global`p1, Global`mui] - 
     2*TBvec[Global`p2, Global`mui]) + 
   TBdeltaLorentz[Global`mui, Global`rhoi]*(2*TBvec[Global`p1, Global`nui] + 
     TBvec[Global`p2, Global`nui]) + TBdeltaLorentz[Global`mui, Global`nui]*
    (-TBvec[Global`p1, Global`rhoi] + TBvec[Global`p2, Global`rhoi]))*
  Global`transProj[Global`p1, Global`mu, Global`mui]*
  Global`transProj[-Global`p1 - Global`p2, Global`rho, Global`rhoi]*
  Global`transProj[Global`p2, Global`nu, Global`nui]}
