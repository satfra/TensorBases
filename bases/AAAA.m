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
ff[ca_,cb_,cc_,cd_]:=Module[{i},TBF[color,i,ca,cb]TBF[color,i,cc,cd]]


(* ::Input::Initialization:: *)
TBAutoDefine["AAAA"]=True;

TBRequiredGroups["AAAA"]={{color,SUNfund,Nc}};

TBVertex["AAAA"]="AAAA";

TBVertexBasis["AAAA"]=True;

TBComment["AAAA"]="Four-gluon vertex basis";

TBAuthor["AAAA"]="FR Sattler";

TBUsage["AAAA"]={"Indices: 
	A: {\!\(\*SubscriptBox[\(p\), \(1\)]\),\[Mu],\!\(\*SubscriptBox[\(a\), \(1\)]\)}
	A: {\!\(\*SubscriptBox[\(p\), \(2\)]\),\[Nu],\!\(\*SubscriptBox[\(a\), \(2\)]\)}
	A: {\!\(\*SubscriptBox[\(p\), \(3\)]\),\[Rho],\!\(\*SubscriptBox[\(a\), \(3\)]\)}
	A: {\!\(\*SubscriptBox[\(p\), \(4\)]\),\[Sigma],\!\(\*SubscriptBox[\(a\), \(4\)]\)}
We use the general form 
	\[ScriptCapitalL] = (2\[Pi]\!\(\*SuperscriptBox[\()\), \(d\)]\)\[Delta](\!\(\*SubscriptBox[\(p\), \(1\)]\)+\!\(\*SubscriptBox[\(p\), \(2\)]\)+\!\(\*SubscriptBox[\(p\), \(3\)]\)+\!\(\*SubscriptBox[\(p\), \(4\)]\))\!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\)
and the \!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\) are listed in the following:    ",
TableForm[
{
{"\!\(\*FractionBox[\(1\), \(8\)]\)\!\(\*SuperscriptBox[\(f\), \(\*SubscriptBox[\(ca\), \(1\)] \*SubscriptBox[\(a\), \(2\)]\)]\)\!\(\*SuperscriptBox[\(f\), \(\*SubscriptBox[\(ca\), \(3\)] \*SubscriptBox[\(a\), \(4\)]\)]\)(\!\(\*SubscriptBox[\(\[Delta]\), \(\[Mu]\[Rho]\)]\)\!\(\*SubscriptBox[\(\[Delta]\), \(\[Nu]\[Sigma]\)]\)-\!\(\*SubscriptBox[\(\[Delta]\), \(\[Mu]\[Sigma]\)]\)\!\(\*SubscriptBox[\(\[Delta]\), \(\[Nu]\[Rho]\)]\))"}
},TableHeadings->{{1}, {"Tensor"}},TableSpacing->{3, 3}]
};

TBIndices["AAAA"]={{p1,mu,a1},{p2,nu,a2},{p3,rho,a3},{p4,sig,a4}};

TBMomentumConservation["AAAA"]={p4->-p1-p2-p3};

TBBasis["AAAA"]={
	transProj[p1,mu,v1]transProj[p2,nu,v2]transProj[p3,rho,v3]transProj[p4,sig,v4]
(ff[a1,a2,a3,a4](TBdeltaLorentz[v1,v3]TBdeltaLorentz[v2,v4]-TBdeltaLorentz[v1,v4]TBdeltaLorentz[v2,v3])
+ff[a1,a3,a2,a4](TBdeltaLorentz[v1,v2]TBdeltaLorentz[v3,v4]-TBdeltaLorentz[v1,v4]TBdeltaLorentz[v2,v3])
+ff[a1,a4,a2,a3](TBdeltaLorentz[v1,v2]TBdeltaLorentz[v3,v4]-TBdeltaLorentz[v1,v3]TBdeltaLorentz[v2,v4]))
	(*T^(1)*),

	transProj[p1,mu,v1]transProj[p2,nu,v2]longProj[p3,rho,v3]longProj[p4,sig,v4]
(ff[a1,a2,a3,a4](TBdeltaLorentz[v1,v3]TBdeltaLorentz[v2,v4]-TBdeltaLorentz[v1,v4]TBdeltaLorentz[v2,v3])
+ff[a1,a3,a2,a4](TBdeltaLorentz[v1,v2]TBdeltaLorentz[v3,v4]-TBdeltaLorentz[v1,v4]TBdeltaLorentz[v2,v3])
+ff[a1,a4,a2,a3](TBdeltaLorentz[v1,v2]TBdeltaLorentz[v3,v4]-TBdeltaLorentz[v1,v3]TBdeltaLorentz[v2,v4]))
	(*T^(2)*),

	transProj[p1,mu,v1]transProj[p2,nu,v2]transProj[p3,rho,v3]longProj[p4,sig,v4]
(ff[a1,a2,a3,a4](TBdeltaLorentz[v1,v3]TBdeltaLorentz[v2,v4]-TBdeltaLorentz[v1,v4]TBdeltaLorentz[v2,v3])
+ff[a1,a3,a2,a4](TBdeltaLorentz[v1,v2]TBdeltaLorentz[v3,v4]-TBdeltaLorentz[v1,v4]TBdeltaLorentz[v2,v3])
+ff[a1,a4,a2,a3](TBdeltaLorentz[v1,v2]TBdeltaLorentz[v3,v4]-TBdeltaLorentz[v1,v3]TBdeltaLorentz[v2,v4]))
	(*T^(2)*)
};

TBCanonicalProduct["AAAA"]=Tensor1[1,2,3,4]Tensor2[1,2,3,4];



