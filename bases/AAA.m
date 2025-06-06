(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
TBAutoDefine["AAA"]=True;

TBRequiredGroups["AAA"]={{color,SUNfund,Nc}};

TBVertex["AAA"]={A,A,A};

TBVertexBasis["AAA"]=True;

TBComment["AAA"]="Three-gluon vertex basis";

TBAuthor["AAA"]="FR Sattler";

TBUsage["AAA"]={"Indices: 
	A: {\!\(\*SubscriptBox[\(p\), \(1\)]\),\[Mu],\!\(\*SubscriptBox[\(a\), \(1\)]\)}
	A: {\!\(\*SubscriptBox[\(p\), \(2\)]\),\[Nu],\!\(\*SubscriptBox[\(a\), \(2\)]\)}
	A: {\!\(\*SubscriptBox[\(p\), \(3\)]\),\[Rho],\!\(\*SubscriptBox[\(a\), \(3\)]\)}
We use the general form 
	\[ScriptCapitalL] = (2\[Pi]\!\(\*SuperscriptBox[\()\), \(d\)]\)\[Delta](\!\(\*SubscriptBox[\(p\), \(1\)]\)+\!\(\*SubscriptBox[\(p\), \(2\)]\)+\!\(\*SubscriptBox[\(p\), \(3\)]\))\!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\)
and the \!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\) are listed in the following:    ",
TableForm[
{
{"\!\(\*SuperscriptBox[\(f\), \(\*SubscriptBox[\(a\), \(1\)] \*SubscriptBox[\(a\), \(2\)] \*SubscriptBox[\(a\), \(3\)]\)]\)\!\(\*SubscriptBox[\(\[Delta]\), \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\)"}
},TableHeadings->{{1}, {"Tensor"}},TableSpacing->{3, 3}]
};

TBIndices["AAA"]={{p1,mu,a1},{p2,nu,a2},{p3,rho,a3}};

TBMomentumConservation["AAA"]={p3->-p1-p2};

TBBasis["AAA"]=I TBF[color,a1,a2,a3] {
(*TRANSVERSAL*)
transProj[p1,mu,mui]transProj[p2,nu,nui]transProj[p3,rho,rhoi] 
(TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

transProj[p1,mu,mui]transProj[p2,nu,nui]transProj[p3,rho,rhoi] 
(TBvec[q1,mui]TBvec[q2,nui]TBvec[q3,rhoi]),

transProj[p1,mu,mui]transProj[p2,nu,nui]transProj[p3,rho,rhoi] 
(sp[p3,p3]TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +sp[p2,p2]TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +sp[p1,p1]TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

transProj[p1,mu,mui]transProj[p2,nu,nui]transProj[p3,rho,rhoi] 
(omega[3]TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +omega[2]TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +omega[1]TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

(*LONGITUDINAL*)

transProj[p1,mu,mui]transProj[p2,nu,nui]longProj[p3,rho,rhoi]
(TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

transProj[p1,mu,mui]longProj[p2,nu,nui]transProj[p3,rho,rhoi]
(TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

longProj[p1,mu,mui]longProj[p2,nu,nui]transProj[p3,rho,rhoi]
(TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

transProj[p1,mu,mui]longProj[p2,nu,nui]longProj[p3,rho,rhoi]
(TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),

longProj[p1,mu,mui]transProj[p2,nu,nui]longProj[p3,rho,rhoi]
(TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui]),


transProj[p1,mu,mui]transProj[p2,nu,nui]longProj[p3,rho,rhoi]
(TBvec[q1,mui]TBvec[q2,nui]TBvec[q3,rhoi]),


transProj[p1,mu,mui]longProj[p2,nu,nui]transProj[p3,rho,rhoi]
(TBvec[q1,mui]TBvec[q2,nui]TBvec[q3,rhoi]),


longProj[p1,mu,mui]transProj[p2,nu,nui]transProj[p3,rho,rhoi]
(TBvec[q1,mui]TBvec[q2,nui]TBvec[q3,rhoi]),


longProj[p1,mu,mui]longProj[p2,nu,nui]longProj[p3,rho,rhoi]
(TBvec[q1,mui]TBvec[q2,nui]TBvec[q3,rhoi]),

	longProj[p1,mu,mui]transProj[p2,nu,nui]transProj[p3,rho,rhoi] 
(sp[p3,p3]TBdeltaLorentz[mui,nui]TBvec[p2-p1,rhoi] +sp[p2,p2]TBdeltaLorentz[mui,rhoi] TBvec[p1-p3,nui] +sp[p1,p1]TBdeltaLorentz[nui,rhoi]TBvec[p3-p2,mui])
}//.omega[i_]:>sp[Symbol["q"<>ToString[i]],Symbol["p"<>ToString[i]]]//.{q1->p2-p3,q2->p3-p1,q3->p1-p2};

TBCanonicalProduct["AAA"]=Tensor1[1,2,3]Tensor2[1,2,3]



