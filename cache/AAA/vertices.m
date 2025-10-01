(* Created with the Wolfram Language : www.wolfram.com *)
{I*TBF[color, a1, a2, a3]*(TBdeltaLorentz[nui, rhoi]*
    (-TBvec[p1, mui] - 2*TBvec[p2, mui]) + TBdeltaLorentz[mui, rhoi]*
    (2*TBvec[p1, nui] + TBvec[p2, nui]) + TBdeltaLorentz[mui, nui]*
    (-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*transProj[p1, mu, mui]*
  transProj[-p1 - p2, rho, rhoi]*transProj[p2, nu, nui], 
 I*TBF[color, a1, a2, a3]*(-TBvec[p1, mui] - 2*TBvec[p2, mui])*
  (2*TBvec[p1, nui] + TBvec[p2, nui])*(TBvec[p1, rhoi] - TBvec[p2, rhoi])*
  transProj[p1, mu, mui]*transProj[-p1 - p2, rho, rhoi]*
  transProj[p2, nu, nui], I*TBF[color, a1, a2, a3]*
  (sp[p1, p1]*TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 
     2*TBvec[p2, mui]) + sp[p2, p2]*TBdeltaLorentz[mui, rhoi]*
    (2*TBvec[p1, nui] + TBvec[p2, nui]) + sp[-p1 - p2, -p1 - p2]*
    TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[p1, mu, mui]*transProj[-p1 - p2, rho, rhoi]*
  transProj[p2, nu, nui], I*TBF[color, a1, a2, a3]*
  (sp[p1 + 2*p2, p1]*TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 
     2*TBvec[p2, mui]) + sp[-2*p1 - p2, p2]*TBdeltaLorentz[mui, rhoi]*
    (2*TBvec[p1, nui] + TBvec[p2, nui]) + sp[p1 - p2, -p1 - p2]*
    TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[p1, mu, mui]*transProj[-p1 - p2, rho, rhoi]*
  transProj[p2, nu, nui], I*longProj[-p1 - p2, rho, rhoi]*
  TBF[color, a1, a2, a3]*(TBdeltaLorentz[nui, rhoi]*
    (-TBvec[p1, mui] - 2*TBvec[p2, mui]) + TBdeltaLorentz[mui, rhoi]*
    (2*TBvec[p1, nui] + TBvec[p2, nui]) + TBdeltaLorentz[mui, nui]*
    (-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*transProj[p1, mu, mui]*
  transProj[p2, nu, nui], I*longProj[p2, nu, nui]*TBF[color, a1, a2, a3]*
  (TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 2*TBvec[p2, mui]) + 
   TBdeltaLorentz[mui, rhoi]*(2*TBvec[p1, nui] + TBvec[p2, nui]) + 
   TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[p1, mu, mui]*transProj[-p1 - p2, rho, rhoi], 
 I*longProj[p1, mu, mui]*longProj[p2, nu, nui]*TBF[color, a1, a2, a3]*
  (TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 2*TBvec[p2, mui]) + 
   TBdeltaLorentz[mui, rhoi]*(2*TBvec[p1, nui] + TBvec[p2, nui]) + 
   TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[-p1 - p2, rho, rhoi], I*longProj[-p1 - p2, rho, rhoi]*
  longProj[p2, nu, nui]*TBF[color, a1, a2, a3]*
  (TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 2*TBvec[p2, mui]) + 
   TBdeltaLorentz[mui, rhoi]*(2*TBvec[p1, nui] + TBvec[p2, nui]) + 
   TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[p1, mu, mui], I*longProj[p1, mu, mui]*
  longProj[-p1 - p2, rho, rhoi]*TBF[color, a1, a2, a3]*
  (TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 2*TBvec[p2, mui]) + 
   TBdeltaLorentz[mui, rhoi]*(2*TBvec[p1, nui] + TBvec[p2, nui]) + 
   TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[p2, nu, nui], I*longProj[-p1 - p2, rho, rhoi]*
  TBF[color, a1, a2, a3]*(-TBvec[p1, mui] - 2*TBvec[p2, mui])*
  (2*TBvec[p1, nui] + TBvec[p2, nui])*(TBvec[p1, rhoi] - TBvec[p2, rhoi])*
  transProj[p1, mu, mui]*transProj[p2, nu, nui], 
 I*longProj[p2, nu, nui]*TBF[color, a1, a2, a3]*
  (-TBvec[p1, mui] - 2*TBvec[p2, mui])*(2*TBvec[p1, nui] + TBvec[p2, nui])*
  (TBvec[p1, rhoi] - TBvec[p2, rhoi])*transProj[p1, mu, mui]*
  transProj[-p1 - p2, rho, rhoi], I*longProj[p1, mu, mui]*
  TBF[color, a1, a2, a3]*(-TBvec[p1, mui] - 2*TBvec[p2, mui])*
  (2*TBvec[p1, nui] + TBvec[p2, nui])*(TBvec[p1, rhoi] - TBvec[p2, rhoi])*
  transProj[-p1 - p2, rho, rhoi]*transProj[p2, nu, nui], 
 I*longProj[p1, mu, mui]*longProj[-p1 - p2, rho, rhoi]*longProj[p2, nu, nui]*
  TBF[color, a1, a2, a3]*(-TBvec[p1, mui] - 2*TBvec[p2, mui])*
  (2*TBvec[p1, nui] + TBvec[p2, nui])*(TBvec[p1, rhoi] - TBvec[p2, rhoi]), 
 I*longProj[p1, mu, mui]*TBF[color, a1, a2, a3]*
  (sp[p1, p1]*TBdeltaLorentz[nui, rhoi]*(-TBvec[p1, mui] - 
     2*TBvec[p2, mui]) + sp[p2, p2]*TBdeltaLorentz[mui, rhoi]*
    (2*TBvec[p1, nui] + TBvec[p2, nui]) + sp[-p1 - p2, -p1 - p2]*
    TBdeltaLorentz[mui, nui]*(-TBvec[p1, rhoi] + TBvec[p2, rhoi]))*
  transProj[-p1 - p2, rho, rhoi]*transProj[p2, nu, nui]}
