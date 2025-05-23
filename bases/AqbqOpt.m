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
AqbqOptPreFacSPhi=Sqrt[(3 sp[p1,p1]+sp[p3-p2,p3-p2])/(6 sp[p1,p1])];
AqbqOptPreFacS1=(Sqrt[(3 (sp[p2,p3]^2-sp[p2,p2] sp[p3,p3]))/(sp[p2,p2]+sp[p2,p3]+sp[p3,p3])^2])^-1;
AqbqOptPreFacS0=(Sqrt[TBsp[p1,p1]+TBsp[p2,p2]+TBsp[p3,p3]]/Sqrt[3])^-1


(* ::Input::Initialization:: *)
TBAutoDefine["AqbqOpt"]=True;

TBRequiredGroups["AqbqOpt"]={{color,SUNfund,Nc},{flavor,SUNfund,Nf}};

TBVertex["AqbqOpt"]={A,qb,q};

TBComment["AqbqOpt"]="Quark-gluon vertex basis";

TBVertexStructure["AqbqOpt"]=Tensor[1,2,3];

TBAuthor["AqbqOpt"]="FR Sattler";

TBUsage["AqbqOpt"]={"Indices: 
	A: {\!\(\*SubscriptBox[\(p\), \(1\)]\),\[Mu],\!\(\*SubscriptBox[\(a\), \(1\)]\)}
	\!\(\*OverscriptBox[\(q\), \(_\)]\): {\!\(\*SubscriptBox[\(p\), \(2\)]\),\!\(\*SubscriptBox[\(d\), \(2\)]\),\!\(\*SubscriptBox[\(A\), \(2\)]\),\!\(\*SubscriptBox[\(F\), \(2\)]\)}
	q: {\!\(\*SubscriptBox[\(p\), \(3\)]\),\!\(\*SubscriptBox[\(d\), \(3\)]\),\!\(\*SubscriptBox[\(A\), \(3\)]\),\!\(\*SubscriptBox[\(F\), \(3\)]\)}
We use the general form 
	\[ScriptCapitalL] = (2\[Pi]\!\(\*SuperscriptBox[\()\), \(d\)]\)\[Delta](\!\(\*SubscriptBox[\(p\), \(1\)]\)+\!\(\*SubscriptBox[\(p\), \(2\)]\)+\!\(\*SubscriptBox[\(p\), \(3\)]\))\!\(\*SubscriptBox[\(\[Delta]\), \(\*SubscriptBox[\(F\), \(2\)] \*SubscriptBox[\(F\), \(3\)]\)]\)\!\(\*SuperscriptBox[\(T\), SubscriptBox[\(a\), \(1\)]]\)[\!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\)\!\(\*SubscriptBox[\(]\), SubscriptBox[\(\[Mu]\), \(1\)]]\) 
and the \!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\) are listed in the following:    ",
TableForm[
{
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[Perpendicular]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot]\!\(\*SubscriptBox[\(\[ImaginaryI]\[Gamma]\), \(\[Nu]\)]\)"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[Perpendicular]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot](\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\)\!\(\*SubscriptBox[\()\), \(\[Nu]\)]\)"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[Perpendicular]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot]\!\(\*SubscriptBox[\(\[ImaginaryI]\[Sigma]\), \(\[Nu]\[Rho]\)]\)(\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\)"},
{"\!\(\*SubscriptBox[\(\[ImaginaryI]\[Sigma]\), \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Nu]\)]\)"},
{"\[ImaginaryI](\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Mu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Nu]\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Nu]\)]\)"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[Perpendicular]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\),\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\))\[CenterDot]\!\(\*SubscriptBox[\(\[ImaginaryI]\[Gamma]\), \(\[Nu]\)]\) \!\(\*SubscriptBox[\(p\), \(1\)]\)\[CenterDot](\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\)) - (p1\[CenterDot]p3-p1\[CenterDot]p2)\[CenterDot]\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[Perpendicular]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot]\!\(\*SubscriptBox[\(\[ImaginaryI]\[Gamma]\), \(\[Nu]\)]\)"},
{"\!\(\*FractionBox[\(1\), \(3\)]\){\!\(\*SubscriptBox[\(\[Sigma]\), \(\[Alpha]\[Beta]\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\)+\!\(\*SubscriptBox[\(\[Sigma]\), \(\[Beta]\[Mu]\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Alpha]\)]\)+\!\(\*SubscriptBox[\(\[Sigma]\), \(\[Mu]\[Alpha]\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Beta]\)]\)}"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[Perpendicular]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\),\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\))\[CenterDot]\!\(\*SubscriptBox[\(p\), \(1\)]\)\[CenterDot](\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\))\!\(\*SubscriptBox[\(\[ImaginaryI]\[Sigma]\), \(\[Nu]\[Rho]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\)"},

{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[DoubleVerticalBar]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot]\!\(\*SubscriptBox[\(\[ImaginaryI]\[Gamma]\), \(\[Nu]\)]\)"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[DoubleVerticalBar]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot](\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\)\!\(\*SubscriptBox[\()\), \(\[Nu]\)]\)"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[DoubleVerticalBar]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot]\!\(\*SubscriptBox[\(\[ImaginaryI]\[Gamma]\), \(\[Nu]\)]\) \!\(\*SubscriptBox[\(p\), \(1\)]\)\[CenterDot](\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\))"},
{"\!\(\*SubscriptBox[SuperscriptBox[\(\[CapitalPi]\), \(\[DoubleVerticalBar]\)], \(\[Mu]\[Nu]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\))\[CenterDot]\!\(\*SubscriptBox[\(p\), \(1\)]\)\[CenterDot](\!\(\*SubscriptBox[\(p\), \(2\)]\)-\!\(\*SubscriptBox[\(p\), \(3\)]\))\!\(\*SubscriptBox[\(\[ImaginaryI]\[Sigma]\), \(\[Nu]\[Rho]\)]\)(\!\(\*SubscriptBox[\(p\), \(1\)]\)\!\(\*SubscriptBox[\()\), \(\[Rho]\)]\)"}
},TableHeadings->{{1,2,3,4,5,6,7,8,9,10,11,12}, {"Tensor"}},TableSpacing->{3, 3}]
};

TBIndices["AqbqOpt"]={{p1,mu,a1},{p2,d2,A2,F2},{p3,d3,A3,F3}};

TBMomentumConservation["AqbqOpt"]={p1->-p2-p3};

TBBasis["AqbqOpt"]={
	TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3]transProj[p1,mu,nu](I TBgamma[nu,d2,d3])
	(*T^(1)*),
	
	AqbqOptPreFacS0 AqbqOptPreFacSPhi^-1 AqbqOptPreFacS1 TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3]transProj[p1,mu,nu]TBvec[p2-p3,nu]TBdeltaDirac[d2,d3]
	(*T^(2)*),
	
	AqbqOptPreFacS0 AqbqOptPreFacSPhi^-1 AqbqOptPreFacS1 TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3](transProj[p1,mu,nu](I sigma[nu,rho,d2,d3]TBvec[p2-p3,rho])-TBsp[p1,p2-p3]/TBsp[p1,p1] I sigma[mu,rho3,d2,d3]TBvec[p1,rho3])
	(*T^(3)*),
	
	AqbqOptPreFacS0 AqbqOptPreFacSPhi TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3](I sigma[mu,rho,d2,d3]TBvec[p1,rho])
	(*T^(4)*),
	
	AqbqOptPreFacS0^2 AqbqOptPreFacS1 TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3]transProj[p1,mu,nu]TBvec[p2-p3,nu](I pdash[p1,d2,d3])
	(*T^(5)*),
	
AqbqOptPreFacS0^2 AqbqOptPreFacSPhi^-2 AqbqOptPreFacS1^2 TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3]transProj[p1,mu,rho](
(-I pdash[p2-p3,d2,d3])( TBvec[p2-p3,rho])
-(4 (TBsp[p2,p3]^2-TBsp[p2,p2] TBsp[p3,p3]))/(3 TBsp[p1,p1]) ( I TBgamma[rho,d2,d3])
-sp[p1,p3-p2]/sp[p1,p1] TBvec[p2-p3,rho](I pdash[p1,d2,d3])
)
(*T^(6)*),
	
	AqbqOptPreFacS0^2 AqbqOptPreFacS1 TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3] 1/3 ( sigma[alpha,beta,d2,dint]TBgamma[mu,dint,d3]+sigma[beta,mu,d2,dint]TBgamma[alpha,dint,d3]+sigma[mu,alpha,d2,dint]TBgamma[beta,dint,d3])TBvec[p1+p2,alpha]TBvec[p1-p2,beta]
	(*T^(7)*),

AqbqOptPreFacS0^3 AqbqOptPreFacSPhi^-1 AqbqOptPreFacS1^2 TBT[color,a1,A2,A3] TBdeltaFund[flavor,F2,F3](transProj[p1,mu,rho] 1/2 ( pdash[p2,d2,md1]pdash[p3,md1,d3]-pdash[p3,d2,md1]pdash[p2,md1,d3])( TBvec[p2-p3,rho])
-(-2 (TBsp[p2,p3]^2-TBsp[p2,p2] TBsp[p3,p3]))/(3TBsp[p1,p1]) I sigma[mu,rho3,d2,d3]TBvec[p1,rho3]
)
(*T^(8)*),

TBT[color,a1,A2,A3]TBdeltaFund[flavor,F2,F3]longProj[p1,mu,rho]( I TBgamma[rho,d2,d3])
(*T^(9)*),

AqbqOptPreFacS0 TBT[color,a1,A2,A3]TBdeltaFund[flavor,F2,F3]longProj[p1,mu,rho]( TBvec[p2-p3,rho]TBdeltaDirac[d2,d3])
(*T^(10)*),

AqbqOptPreFacS0 TBT[color,a1,A2,A3]TBdeltaFund[flavor,F2,F3]longProj[p1,mu,rho](-I pdash[p2-p3,d2,d3])( TBvec[p2-p3,rho])
(*T^(11)*),

AqbqOptPreFacS0 TBT[color,a1,A2,A3]TBdeltaFund[flavor,F2,F3]longProj[p1,mu,rho] 1/2 ( pdash[p2,d2,md1]pdash[p3,md1,d3]-pdash[p3,d2,md1]pdash[p2,md1,d3])( TBvec[p2-p3,rho])
(*T^(12)*)
};

TBInnerProduct["AqbqOpt"]=Tensor1[1,2,3]Tensor2[1,3,2];



