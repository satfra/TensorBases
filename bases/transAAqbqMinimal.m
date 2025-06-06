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
TBAutoDefine["transAAqbqMinimal"]=True;

TBRequiredGroups["transAAqbqMinimal"]={{color,SUNfund,Nc},{flavor,SUNfund,Nf}};

TBVertex["transAAqbqMinimal"]={A,A,qb,q};

TBVertexStructure["transAAqbqMinimal"]=Tensor[1,2,3,4]+Tensor[2,1,3,4];

TBComment["transAAqbqMinimal"]="Transversal two-quark-two-gluon vertex basis with two elements.";

TBAuthor["transAAqbqMinimal"]="FR Sattler";

TBMomentumConservation["transAAqbqMinimal"]={p2->-p1-p3-p4}

TBUsage["transAAqbqMinimal"]={"Indices: 
	A: {\!\(\*SubscriptBox[\(p\), \(1\)]\),\[Mu],\!\(\*SubscriptBox[\(a\), \(1\)]\)}
	A: {\!\(\*SubscriptBox[\(p\), \(2\)]\),\[Nu],\!\(\*SubscriptBox[\(a\), \(2\)]\)}
	\!\(\*OverscriptBox[\(q\), \(_\)]\): {\!\(\*SubscriptBox[\(p\), \(3\)]\),\!\(\*SubscriptBox[\(d\), \(3\)]\),\!\(\*SubscriptBox[\(A\), \(3\)]\),\!\(\*SubscriptBox[\(F\), \(3\)]\)}
	q: {\!\(\*SubscriptBox[\(p\), \(4\)]\),\!\(\*SubscriptBox[\(d\), \(4\)]\),\!\(\*SubscriptBox[\(A\), \(4\)]\),\!\(\*SubscriptBox[\(F\), \(4\)]\)}
We define
	\!\(\*SubscriptBox[\(T\), \(\[Mu]\[Nu]\)]\) = [\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\),\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Nu]\)]\)]
	\!\(\*SubscriptBox[\(T\), \(\[Mu]\[Nu]\[Rho]\)]\) = {[\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\),\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Nu]\)]\)],\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Rho]\)]\)}
and use the general form 
	\[ScriptCapitalL] = (2\[Pi]\!\(\*SuperscriptBox[\()\), \(d\)]\)\[Delta](\!\(\*SubscriptBox[\(p\), \(1\)]\)+\!\(\*SubscriptBox[\(p\), \(2\)]\)+\!\(\*SubscriptBox[\(p\), \(3\)]\))\!\(\*SubscriptBox[\(\[Delta]\), \(\*SubscriptBox[\(F\), \(2\)] \*SubscriptBox[\(F\), \(3\)]\)]\)(\!\(\*SuperscriptBox[\(T\), SubscriptBox[\(a\), \(1\)]]\)\!\(\*SubscriptBox[\()\), \(\*SubscriptBox[\(A\), \(3\)] A'\)]\)(\!\(\*SuperscriptBox[\(T\), SubscriptBox[\(a\), \(2\)]]\)\!\(\*SubscriptBox[\()\), \(A' \*SubscriptBox[\(A\), \(4\)]\)]\)\!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\)
where the \!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\) are listed in the following:    ",
TableForm[
{
{"\!\(\*SubscriptBox[\(T\), \(\[Mu]\[Nu]\)]\)"},
{"\!\(\*SubscriptBox[\(\[ImaginaryI]T\), \(\[Rho]\[Mu]\[Nu]\)]\)(-\!\(\*SubscriptBox[\(p\), \(3\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\) + \!\(\*SubscriptBox[\(\[ImaginaryI]T\), \(\[Nu]\[Mu]\[Rho]\)]\)(\!\(\*SubscriptBox[\(p\), \(4\)]\)+\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\) + \!\(\*SubscriptBox[\(\[ImaginaryI]T\), \(\[Nu]\[Rho]\[Mu]\)]\)(\!\(\*SubscriptBox[\(p\), \(4\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\)"}
},TableHeadings->{{1,2}, {"Tensor"}},TableSpacing->{3, 3}]
};

TBIndices["transAAqbqMinimal"]={{p1,mu,a1},{p2,nu,a2},{p3,d3,A3,F3},{p4,d4,A4,F4}}

TBInnerProduct["transAAqbqMinimal"]=Tensor1[1,2,3,4]Tensor2[1,2,4,3]+Tensor1[1,2,3,4]Tensor2[2,1,4,3];


(* ::Input::Initialization:: *)
TBgammaComm[mu_,nu_,d1_,d2_]:=Module[{dint},TBgamma[mu,d1,dint]TBgamma[nu,dint,d2]-TBgamma[nu,d1,dint]TBgamma[mu,dint,d2]]
Tmunu[mu_,nu_,d1_,d2_]:=TBdeltaLorentz[mu,nu]TBdeltaDirac[d1,d2]+TBgammaComm[mu,nu,d1,d2]
Tmunurho[mu_,nu_,rho_,d1_,d2_]:=Module[{dint},TBgammaComm[mu,nu,d1,dint]TBgamma[rho,dint,d2]+TBgamma[rho,d1,dint]TBgammaComm[mu,nu,dint,d2]]


(* ::Input::Initialization:: *)
TBBasis["transAAqbqMinimal"]={
TBdeltaFund[flavor,F3,F4]TBT[color,a1,A3,Aint]TBT[color,a2,Aint,A4]Tmunu [mu,nu,d3,d4]
(*T^(B)*),

TBdeltaFund[flavor,F3,F4]TBT[color,a1,A3,Aint]TBT[color,a2,Aint,A4](
I Tmunurho[rho,mu,nu,d3,d4]vec[-p3,rho]
+I Tmunurho[nu,mu,rho,d3,d4]vec[p4+p1,rho]
+I Tmunurho[nu,rho,mu,d3,d4]vec[p4,rho]
)
(*T^(R)*)
};



