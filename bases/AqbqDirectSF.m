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
TBAutoDefine["AqbqDirectSF"]=True;

TBRequiredGroups["AqbqDirectSF"]={{color,SUNfund,Nc},{flavor,SUNfund,Nf}};

TBVertex["AqbqDirectSF"]="A\!\(\*OverscriptBox[\(q\), \(_\)]\)q";

TBVertexStructure["AqbqDirectSF"]=Tensor[1,2,3];

TBComment["AqbqDirectSF"]="Quark-gluon vertex basis, directly from (\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\)\!\(\*SubscriptBox[\(D\), \(\[Mu]\)]\)\!\(\*SuperscriptBox[\()\), \(n\)]\)";

TBAuthor["AqbqDirectSF"]="FR Sattler";

TBUsage["AqbqDirectSF"]={"Indices: 
	A: {\!\(\*SubscriptBox[\(p\), \(1\)]\),\[Mu],\!\(\*SubscriptBox[\(a\), \(1\)]\)}
	\!\(\*OverscriptBox[\(q\), \(_\)]\): {\!\(\*SubscriptBox[\(p\), \(2\)]\),\!\(\*SubscriptBox[\(d\), \(2\)]\),\!\(\*SubscriptBox[\(A\), \(2\)]\)}
	q: {\!\(\*SubscriptBox[\(p\), \(3\)]\),\!\(\*SubscriptBox[\(d\), \(3\)]\),\!\(\*SubscriptBox[\(A\), \(3\)]\)}
We use the general form 
	\[ScriptCapitalL] = (2\[Pi]\!\(\*SuperscriptBox[\()\), \(d\)]\)\[Delta](\!\(\*SubscriptBox[\(p\), \(1\)]\)+\!\(\*SubscriptBox[\(p\), \(2\)]\)+\!\(\*SubscriptBox[\(p\), \(3\)]\))\!\(\*SuperscriptBox[\(T\), SubscriptBox[\(a\), \(1\)]]\)[\!\(\*SubscriptBox[\(\[Tau]\), \(i\)]\)\!\(\*SubscriptBox[\(]\), SubscriptBox[\(\[Mu]\), \(1\)]]\) 
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

TBIndices["AqbqDirectSF"]={{p1,mu,a1},{p2,d2,A2},{p3,d3,A3}};

TBMomentumConservation["AqbqDirectSF"]={p1->-p2-p3};

TBBasis["AqbqDirectSF"]={
TBT[color,a1,A2,A3]transProj[p1,mu,rho]( I TBgamma[rho,d2,d3])
(*T^(1)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho]( TBvec[p2-p3,rho])TBdeltaDirac[d2,d3]
(*T^(2)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho]( pdash[p2-p3,d2,md])TBgamma[rho,md,d3]
(*T^(3)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho](-pdash[p2+p3,d2,md]TBgamma[rho,md,d3])
(*T^(4)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho]( I pdash[p2+p3,d2,d3]TBvec[p2-p3,rho])
(*T^(5)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho]((-I pdash[p2-p3,d2,d3])( TBvec[p2-p3,rho])-
(4 (sp[p2,p3]^2-sp[p2,p2] sp[p3,p3]))/(3 (sp[p2,p2]+2 sp[p2,p3]+sp[p3,p3])) ( I TBgamma[rho,d2,d3]))
(*T^(6)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho] I/2 ( pdash[p2,d2,dint1]pdash[p3,dint1,dint2]-pdash[p3,d2,dint1]pdash[p2,dint1,dint2])TBgamma[rho,dint2,d3]
(*T^(7)*),

TBT[color,a1,A2,A3]transProj[p1,mu,rho] 1/2 ( pdash[p2,d2,md1]pdash[p3,md1,d3]-pdash[p3,d2,md1]pdash[p2,md1,d3])( TBvec[p2-p3,rho])
(*T^(8)*),

TBT[color,a1,A2,A3]longProj[p1,mu,rho]( I TBgamma[rho,d2,d3])
(*T^(9)*),

TBT[color,a1,A2,A3]longProj[p1,mu,rho]( TBvec[p2-p3,rho]TBdeltaDirac[d2,d3])
(*T^(10)*),

TBT[color,a1,A2,A3]longProj[p1,mu,rho](-I pdash[p2-p3,d2,d3])( TBvec[p2-p3,rho])
(*T^(11)*),

TBT[color,a1,A2,A3]longProj[p1,mu,rho] 1/2 ( pdash[p2,d2,md1]pdash[p3,md1,d3]-pdash[p3,d2,md1]pdash[p2,md1,d3])( TBvec[p2-p3,rho])
(*T^(12)*)
};

TBInnerProduct["AqbqDirectSF"]=Tensor1[1,2,3]Tensor2[1,3,2];
