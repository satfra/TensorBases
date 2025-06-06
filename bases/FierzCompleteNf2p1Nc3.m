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
TId[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBdeltaDirac[da,db]TBdeltaFund[flavor,fa,fb]TBdeltaFund[color,ca,cb];
T0[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBdeltaDirac[da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]5Tf[{da_,ca_,fa_},{db_,cb_,fb_},f_]:=TBgamma5[da,db]TBT[flavor,f,fa,fb]TBdeltaFund[color,ca,cb];

Tf[{da_,ca_,fa_},{db_,cb_,fb_},f_]:=TBdeltaDirac[da,db]TBT[flavor,f,fa,fb]TBdeltaFund[color,ca,cb];
\[Gamma]5T0[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBgamma5[da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]\[Mu]T0[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_]:=TBgamma[\[Mu],da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]\[Mu]\[Gamma]5T0[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_]:=Module[{dc},TBgamma[\[Mu],da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]\[Mu]T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_,a_]:=TBgamma[\[Mu],da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]\[Mu]\[Gamma]5T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_,a_]:=Module[{dc},TBgamma[\[Mu],da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[ 2 3]))TBT[color,a,ca,cb]];
T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBdeltaDirac[da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
TfTa[{da_,ca_,fa_},{db_,cb_,fb_},f_,a_]:=TBdeltaDirac[da,db]TBT[flavor,f,fa,fb]TBT[color,a,ca,cb]
\[Gamma]5T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBgamma5[da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]5TfTa[{da_,ca_,fa_},{db_,cb_,fb_},f_,a_]:=TBgamma5[da,db]TBT[flavor,f,fa,fb]TBT[color,a,ca,cb];


(* ::Input::Initialization:: *)
TIdL[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBdeltaDirac[da,db]TBdeltaFundFlavL[fa,fb]TBdeltaFund[color,ca,cb];
T0L[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBdeltaDirac[da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]5T0L[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBgamma5[da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]\[Mu]T0L[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_]:=TBgamma[\[Mu],da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]\[Mu]\[Gamma]5T0L[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_]:=Module[{dc},TBgamma[\[Mu],da,dc]TBgamma5[dc,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]\[Mu]T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_,a_]:=TBgamma[\[Mu],da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]\[Mu]\[Gamma]5T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_,a_]:=Module[{dc},TBgamma[\[Mu],da,dc]TBgamma5[dc,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[ 2 3]))TBT[color,a,ca,cb]];
T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBdeltaDirac[da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]5T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBgamma5[da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];


(* ::Input::Initialization:: *)
TIdS[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBdeltaDirac[da,db]TBdeltaFundFlavS[fa,fb]TBdeltaFund[color,ca,cb];
T0S[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBdeltaDirac[da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]5T0S[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBgamma5[da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]\[Mu]T0S[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_]:=TBgamma[\[Mu],da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]\[Mu]\[Gamma]5T0S[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_]:=Module[{dc},TBgamma[\[Mu],da,dc]TBgamma5[dc,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]\[Mu]T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_,a_]:=TBgamma[\[Mu],da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]\[Mu]\[Gamma]5T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},\[Mu]_,a_]:=Module[{dc},TBgamma[\[Mu],da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[ 2 3]))TBT[color,a,ca,cb]];
T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBdeltaDirac[da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]5T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBgamma5[da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];


(* ::Input::Initialization:: *)
gammai[i_,d1_,d2_]:=TBgamma[i,d1,d2]-TBdeltaLorentz[i,0]TBgamma[0,d1,d2];

\[Gamma]0T0[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBgamma[0,da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]0Tf[{da_,ca_,fa_},{db_,cb_,fb_},f_]:=TBgamma[0,da,db]TBT[flavor,f,fa,fb]TBdeltaFund[color,ca,cb];
\[Gamma]0\[Gamma]5T0[{da_,ca_,fa_},{db_,cb_,fb_}]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]0\[Gamma]5Tf[{da_,ca_,fa_},{db_,cb_,fb_},f_]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db]TBT[flavor,f,fa,fb]TBdeltaFund[color,ca,cb]];
\[Gamma]0T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBgamma[0,da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]0\[Gamma]5T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb]];

\[Gamma]iT0[{da_,ca_,fa_},{db_,cb_,fb_},i_]:=gammai[i,da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]iTf[{da_,ca_,fa_},{db_,cb_,fb_},i_,f_]:=gammai[i,da,db]TBT[flavor,f,fa,fb]TBdeltaFund[color,ca,cb];
\[Gamma]i\[Gamma]5T0[{da_,ca_,fa_},{db_,cb_,fb_},i_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]i\[Gamma]5Tf[{da_,ca_,fa_},{db_,cb_,fb_},i_,f_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db]TBT[flavor,f,fa,fb]TBdeltaFund[color,ca,cb]];
\[Gamma]iT0Ta[{da_,ca_,fa_},{db_,cb_,fb_},i_,a_]:=gammai[i,da,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]i\[Gamma]5T0Ta[{da_,ca_,fa_},{db_,cb_,fb_},i_,a_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb]];


(* ::Input::Initialization:: *)
gammai[i_,d1_,d2_]:=TBgamma[i,d1,d2]-TBdeltaLorentz[i,0]TBgamma[0,d1,d2];

\[Gamma]0T0L[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBgamma[0,da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]0\[Gamma]5T0L[{da_,ca_,fa_},{db_,cb_,fb_}]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]0T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBgamma[0,da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]0\[Gamma]5T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb]];

\[Gamma]iT0L[{da_,ca_,fa_},{db_,cb_,fb_},i_]:=gammai[i,da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]i\[Gamma]5T0L[{da_,ca_,fa_},{db_,cb_,fb_},i_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]iT0TaL[{da_,ca_,fa_},{db_,cb_,fb_},i_,a_]:=gammai[i,da,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]i\[Gamma]5T0TaL[{da_,ca_,fa_},{db_,cb_,fb_},i_,a_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db](TBdeltaFundFlavL[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb]];


(* ::Input::Initialization:: *)
gammai[i_,d1_,d2_]:=TBgamma[i,d1,d2]-TBdeltaLorentz[i,0]TBgamma[0,d1,d2];

\[Gamma]0T0S[{da_,ca_,fa_},{db_,cb_,fb_}]:=TBgamma[0,da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]0\[Gamma]5T0S[{da_,ca_,fa_},{db_,cb_,fb_}]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]0T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=TBgamma[0,da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]0\[Gamma]5T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},a_]:=Module[{dc},TBgamma[0,da,dc]TBgamma5[dc,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb]];

\[Gamma]iT0S[{da_,ca_,fa_},{db_,cb_,fb_},i_]:=gammai[i,da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb];
\[Gamma]i\[Gamma]5T0S[{da_,ca_,fa_},{db_,cb_,fb_},i_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBdeltaFund[color,ca,cb]];
\[Gamma]iT0TaS[{da_,ca_,fa_},{db_,cb_,fb_},i_,a_]:=gammai[i,da,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb];
\[Gamma]i\[Gamma]5T0TaS[{da_,ca_,fa_},{db_,cb_,fb_},i_,a_]:=Module[{dc},gammai[i,da,dc]TBgamma5[dc,db](TBdeltaFundFlavS[fa,fb]/(Sqrt[2 3]))TBT[color,a,ca,cb]];


(* ::Input::Initialization:: *)
TBdeltaFundFlavL[a_,b_]=TBdeltaFund[flavor,a,b]-TBdeltaFund[flavor,a,3]TBdeltaFund[flavor,b,3];
TBdeltaFundFlavS[a_,b_]=TBdeltaFund[flavor,a,b]-TBdeltaFundFlavL[a,b];


(* ::Input::Initialization:: *)
TBsigma[mu_,nu_,\[Alpha]_,\[Beta]_]:=With[{id1=Unique[a],id2=Unique[a]},I/2 (TBgamma[mu,\[Alpha],id1]TBgamma[nu,id1,\[Beta]]-TBgamma[nu,\[Alpha],id2]TBgamma[mu,id2,\[Beta]])];


(* ::Input::Initialization:: *)
\[Sigma]munuT0T0[{da_,ca_,fa_},{db_,cb_,fb_},il1_,il2_]:=
TBdeltaFund[color,ca,cb](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBsigma[il1,il2,da,db]

\[Sigma]munuT0Ta[{da_,ca_,fa_},{db_,cb_,fb_},il1_,il2_,a_]:=
TBT[color,a,ca,cb](TBdeltaFund[flavor,fa,fb]/(Sqrt[2 3]))TBsigma[il1,il2,da,db]

\[Sigma]munuTfT0[{da_,ca_,fa_},{db_,cb_,fb_},il1_,il2_,f_]:=
TBdeltaFund[color,ca,cb]TBT[flavor,f,fa,fb]TBsigma[il1,il2,da,db]

\[Sigma]munuTfTa[{da_,ca_,fa_},{db_,cb_,fb_},il1_,il2_,f_,a_]:=
TBT[color,a,ca,cb]TBT[flavor,f,fa,fb]TBsigma[il1,il2,da,db]


(* ::Input::Initialization:: *)
TBAutoDefine["FierzCompleteNf2p1Nc3"]=True;

TBRequiredGroups["FierzCompleteNf2p1Nc3"]={{color,SUNfund,Nc},{flavor,SUNfund,Nf}};

TBVertex["FierzCompleteNf2p1Nc3"]={qb,q,qb,q};

TBVertexStructure["FierzCompleteNf2p1Nc3"]=2Tensor[1,2,3,4]-2Tensor[3,2,1,4];

TBComment["FierzCompleteNf2p1Nc3"]="Fierz-complete, \!\(\*SubscriptBox[\(U\), \(A\)]\)(1) symmetric basis for \!\(\*SubscriptBox[\(N\), \(f\)]\)=2+1, \!\(\*SubscriptBox[\(N\), \(c\)]\)=3 as given in arXiv:2012.06231.";

TBAuthor["FierzCompleteNf2p1Nc3"]="Andreas Gei\[SZ]el";

TBUsage["FierzCompleteNf2p1Nc3"]={"Indices: 
	\!\(\*OverscriptBox[\(q\), \(_\)]\): {\!\(\*SubscriptBox[\(p\), \(1\)]\),\!\(\*SubscriptBox[\(d\), \(1\)]\),\!\(\*SubscriptBox[\(A\), \(1\)]\),\!\(\*SubscriptBox[\(F\), \(1\)]\)}
	q: {\!\(\*SubscriptBox[\(p\), \(2\)]\),\!\(\*SubscriptBox[\(d\), \(2\)]\),\!\(\*SubscriptBox[\(A\), \(2\)]\),\!\(\*SubscriptBox[\(F\), \(2\)]\)}
    \!\(\*OverscriptBox[\(q\), \(_\)]\): {\!\(\*SubscriptBox[\(p\), \(3\)]\),\!\(\*SubscriptBox[\(d\), \(3\)]\),\!\(\*SubscriptBox[\(A\), \(3\)]\),\!\(\*SubscriptBox[\(F\), \(3\)]\)}
	q: {\!\(\*SubscriptBox[\(p\), \(4\)]\),\!\(\*SubscriptBox[\(d\), \(4\)]\),\!\(\*SubscriptBox[\(A\), \(4\)]\),\!\(\*SubscriptBox[\(F\), \(4\)]\)}
We suppress the momentum-conservation delta (2\[Pi]\!\(\*SuperscriptBox[\()\), \(d\)]\)\[Delta](\!\(\*SubscriptBox[\(p\), \(1\)]\)+\!\(\*SubscriptBox[\(p\), \(2\)]\)+\!\(\*SubscriptBox[\(p\), \(3\)]\)+\!\(\*SubscriptBox[\(p\), \(4\)]\)).
The implemented tensor strucures correspond to the following channels:    ",
TableForm[
{
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V + A)\), \(\[LeftDoubleBracketingBar], \(l\)\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V + A)\), \( \[Perpendicular] \(, \(l\)\)\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V - A)\), \(\[LeftDoubleBracketingBar], \(l\)\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubscriptBox[\((V - A)\), \(\[Perpendicular]\)], l\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubsuperscriptBox[\((V + A)\), \(\[LeftDoubleBracketingBar]\), \(\[Dagger]\)], l\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubsuperscriptBox[\((V + A)\), \(\[Perpendicular]\), \(\[Dagger]\)], l\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubsuperscriptBox[\((V - A)\), \(\[LeftDoubleBracketingBar]\), \(\[Dagger]\)], l\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubsuperscriptBox[\((V - A)\), \(\[Perpendicular]\), \(\[Dagger]\)], l\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(l\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubscriptBox[\((V + A)\), \(\[LeftDoubleBracketingBar]\)], s\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubscriptBox[\((V - A)\), \(\[LeftDoubleBracketingBar]\)], s\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubsuperscriptBox[\((V + A)\), \(\[Perpendicular]\), \(\[Dagger]\)], s\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(\*SubsuperscriptBox[\((V - A)\), \(\[Perpendicular]\), \(\[Dagger]\)], s\)]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((S - P)\), \(s\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\((S - P)\), \(s\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SubscriptBox[\(1\), \(s\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V + A)\), \(\[LeftDoubleBracketingBar]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V + A)\), \(\[Perpendicular]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V - A)\), \(\[LeftDoubleBracketingBar]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((V - A)\), \(\[Perpendicular]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\((V + A)\), \(\[LeftDoubleBracketingBar]\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\((V + A)\), \(\[Perpendicular]\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) + (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\((V - A)\), \(\[LeftDoubleBracketingBar]\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\((V - A)\), \(\[Perpendicular]\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(i\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\((S - P)\), \(1 + ISO\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)+(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\((S - P)\), \(1 + ISO\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)+(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)\!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubscriptBox[\(T\), \( \[Perpendicular] \(-\[LeftDoubleBracketingBar], \(\\\ \)\(1 + \\\ ISO\)\)\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Sigma]\), \(ij\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - 2(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Sigma]\), \(0  i\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)+(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\)\!\(\*SubscriptBox[\(\[Sigma]\), \(ij\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\)\!\(\*SubscriptBox[\(\[Sigma]\), \(0  i\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"},
{"\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), SubsuperscriptBox[\(T\), \( \[Perpendicular] \(-\[LeftDoubleBracketingBar], \(\\\ \)\(1 + \\\ ISO\)\)\), \(\[Dagger]\)]]\)","(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Sigma]\), \(ij\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - 2(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SubscriptBox[\(\[Sigma]\), \(0  i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)+(\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\)\!\(\*SubscriptBox[\(\[Sigma]\), \(ij\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\) - (\!\(\*OverscriptBox[\(q\), \(_\)]\) \!\(\*SuperscriptBox[\(T\), SubscriptBox[\(F\), \(l\)]]\)\!\(\*SubscriptBox[\(\[Sigma]\), \(0  i\)]\)\!\(\*SuperscriptBox[\(T\), \(a\)]\) q\!\(\*SuperscriptBox[\()\), \(2\)]\)"}
},TableHeadings->{{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26}, {"Name","Channel"}},TableSpacing->{3, 3}],
"This bases can also be found in arXiv:2012.06231."
};

TBIndices["FierzCompleteNf2p1Nc3"]={{p1,d1,A1,F1},{p2,d2,A2,F2},{p3,d3,A3,F3},{p4,d4,A4,F4}};

TBMomentumConservation["FierzCompleteNf2p1Nc3"]={};

TBBasis["FierzCompleteNf2p1Nc3"]={

\[Gamma]0T0L[i1,i2]\[Gamma]0T0L[i3,i4]+I \[Gamma]0\[Gamma]5T0L[i1,i2]I \[Gamma]0\[Gamma]5T0L[i3,i4],
(*Subscript[(V+A), \[DoubleVerticalBar]],l*)

\[Gamma]iT0L[i1,i2,i]\[Gamma]iT0L[i3,i4,i]+I \[Gamma]i\[Gamma]5T0L[i1,i2,i]I \[Gamma]i\[Gamma]5T0L[i3,i4,i],
(*Subscript[V+A), \[Perpendicular]],l*)

\[Gamma]0T0L[i1,i2]\[Gamma]0T0L[i3,i4]-I \[Gamma]0\[Gamma]5T0L[i1,i2]I \[Gamma]0\[Gamma]5T0L[i3,i4],
(*Subscript[(V-A), \[DoubleVerticalBar]],l*)

\[Gamma]iT0L[i1,i2,i]\[Gamma]iT0L[i3,i4,i]-I \[Gamma]i\[Gamma]5T0L[i1,i2,i]I \[Gamma]i\[Gamma]5T0L[i3,i4,i],
(*Subscript[(V-A), \[Perpendicular]],l*)

\[Gamma]0T0TaL[i1,i2,a]\[Gamma]0T0TaL[i3,i4,a]+I \[Gamma]0\[Gamma]5T0TaL[i1,i2,a]I \[Gamma]0\[Gamma]5T0TaL[i3,i4,a],
(*\!\(
\*SubsuperscriptBox[\((V + A)\), \(\[DoubleVerticalBar]\), \(adj\)], l\)*)

\[Gamma]iT0TaL[i1,i2,i,a]\[Gamma]iT0TaL[i3,i4,i,a]+I \[Gamma]i\[Gamma]5T0TaL[i1,i2,i,a]I \[Gamma]i\[Gamma]5T0TaL[i3,i4,i,a],
(*\!\(
\*SubsuperscriptBox[\((V + A)\), \(\[Perpendicular]\), \(adj\)], l\)*)

\[Gamma]0T0TaL[i1,i2,a]\[Gamma]0T0TaL[i3,i4,a]-I \[Gamma]0\[Gamma]5T0TaL[i1,i2,a]I \[Gamma]0\[Gamma]5T0TaL[i3,i4,a],
(*\!\(
\*SubsuperscriptBox[\((V - A)\), \(\[DoubleVerticalBar]\), \(adj\)], l\)*)

\[Gamma]iT0TaL[i1,i2,i,a]\[Gamma]iT0TaL[i3,i4,i,a]-I \[Gamma]i\[Gamma]5T0TaL[i1,i2,i,a]I \[Gamma]i\[Gamma]5T0TaL[i3,i4,i,a],
(*\!\(
\*SubsuperscriptBox[\((V - A)\), \(\[Perpendicular]\), \(adj\)], l\)*)

\[Gamma]0T0S[i1,i2]\[Gamma]0T0S[i3,i4]+I \[Gamma]0\[Gamma]5T0S[i1,i2]I \[Gamma]0\[Gamma]5T0S[i3,i4],
(*Subscript[(V+A), \[DoubleVerticalBar]],s*)

\[Gamma]0T0S[i1,i2]\[Gamma]0T0S[i3,i4]-I \[Gamma]0\[Gamma]5T0S[i1,i2]I \[Gamma]0\[Gamma]5T0S[i3,i4],
(*Subscript[(V-A), \[DoubleVerticalBar]],s*)

\[Gamma]iT0TaS[i1,i2,i,a]\[Gamma]iT0TaS[i3,i4,i,a]+I \[Gamma]i\[Gamma]5T0TaS[i1,i2,i,a]I \[Gamma]i\[Gamma]5T0TaS[i3,i4,i,a],
(*\!\(
\*SubsuperscriptBox[\((V + A)\), \(\[Perpendicular]\), \(adj\)], s\)*)

\[Gamma]iT0TaS[i1,i2,i,a]\[Gamma]iT0TaS[i3,i4,i,a]-I \[Gamma]i\[Gamma]5T0TaS[i1,i2,i,a]I \[Gamma]i\[Gamma]5T0TaS[i3,i4,i,a],
(*\!\(
\*SubsuperscriptBox[\((V - A)\), \(\[Perpendicular]\), \(adj\)], s\)*)

T0S[i1,i2]T0S[i3,i4] - \[Gamma]5T0S[i1,i2]\[Gamma]5T0S[i3,i4],
(*(S-P),s*)

T0TaS[i1,i2,a]T0TaS[i3,i4,a] - \[Gamma]5T0TaS[i1,i2,a]\[Gamma]5T0TaS[i3,i4,a],
(*(S-P)^(adj.),s*)

\[Gamma]0T0[i1,i2]\[Gamma]0T0[i3,i4]+I \[Gamma]0\[Gamma]5T0[i1,i2]I \[Gamma]0\[Gamma]5T0[i3,i4],
(*Subscript[(V+A), \[DoubleVerticalBar]]*)

\[Gamma]iT0[i1,i2,i]\[Gamma]iT0[i3,i4,i]+I \[Gamma]i\[Gamma]5T0[i1,i2,i]I \[Gamma]i\[Gamma]5T0[i3,i4,i],
(*Subscript[V+A), \[Perpendicular]]*)

\[Gamma]0T0[i1,i2]\[Gamma]0T0[i3,i4]-I \[Gamma]0\[Gamma]5T0[i1,i2]I \[Gamma]0\[Gamma]5T0[i3,i4],
(*Subscript[(V-A), \[DoubleVerticalBar]]*)

\[Gamma]iT0[i1,i2,i]\[Gamma]iT0[i3,i4,i]-I \[Gamma]i\[Gamma]5T0[i1,i2,i]I \[Gamma]i\[Gamma]5T0[i3,i4,i],
(*Subscript[(V-A), \[Perpendicular]]*)

\[Gamma]0T0Ta[i1,i2,a]\[Gamma]0T0Ta[i3,i4,a]+I \[Gamma]0\[Gamma]5T0Ta[i1,i2,a]I \[Gamma]0\[Gamma]5T0Ta[i3,i4,a],
(*Subsuperscript[(V+A), \[DoubleVerticalBar], adj]*)

\[Gamma]iT0Ta[i1,i2,i,a]\[Gamma]iT0Ta[i3,i4,i,a]+I \[Gamma]i\[Gamma]5T0Ta[i1,i2,i,a]I \[Gamma]i\[Gamma]5T0Ta[i3,i4,i,a],
(*Subsuperscript[(V+A), \[Perpendicular], adj]*)

\[Gamma]0T0Ta[i1,i2,a]\[Gamma]0T0Ta[i3,i4,a]-I \[Gamma]0\[Gamma]5T0Ta[i1,i2,a]I \[Gamma]0\[Gamma]5T0Ta[i3,i4,a],
(*Subsuperscript[(V-A), \[DoubleVerticalBar], adj]*)

\[Gamma]iT0Ta[i1,i2,i,a]\[Gamma]iT0Ta[i3,i4,i,a]-I \[Gamma]i\[Gamma]5T0Ta[i1,i2,i,a]I \[Gamma]i\[Gamma]5T0Ta[i3,i4,i,a],
(*Subsuperscript[(V-A), \[Perpendicular], adj]*)

T0[i1,i2]T0[i3,i4]- \[Gamma]5T0[i1,i2]\[Gamma]5T0[i3,i4] + 3/8 (Tf[i1,i2,f]Tf[i3,i4,f]-\[Gamma]5Tf[i1,i2,f]\[Gamma]5Tf[i3,i4,f]),
(*Subscript[(S-P), 1-ISO]*)

T0Ta[i1,i2,a]T0Ta[i3,i4,a]- \[Gamma]5T0Ta[i1,i2,a]\[Gamma]5T0Ta[i3,i4,a] + 3/8 (TfTa[i1,i2,f,a]TfTa[i3,i4,f,a]-\[Gamma]5TfTa[i1,i2,f,a]\[Gamma]5TfTa[i3,i4,f,a]),
(*Subsuperscript[(S-P), 1-ISO, adj.]*)

Sum[\[Sigma]munuT0T0[i1,i2,il1,il2]\[Sigma]munuT0T0[i3,i4,il1,il2] ,{il1,1,3},{il2,1,3}]- 2Sum[ \[Sigma]munuT0T0[i1,i2,0,il2]\[Sigma]munuT0T0[i3,i4,0,il2] ,{il2,1,3}]+ 3/8 (Sum[\[Sigma]munuTfT0[i1,i2,il1,il2,af]\[Sigma]munuTfT0[i3,i4,il1,il2,af],{il1,1,3},{il2,1,3}]-2 Sum[\[Sigma]munuTfT0[i1,i2,0,il2,af]\[Sigma]munuTfT0[i3,i4,0,il2,af],{il2,1,3}]),
(*Subscript[(T), \[Perpendicular]-\[DoubleVerticalBar]], 1+ ISO*)

Sum[\[Sigma]munuT0Ta[i1,i2,il1,il2,ac]\[Sigma]munuT0Ta[i3,i4,il1,il2,ac] ,{il1,1,3},{il2,1,3}]- 2Sum[\[Sigma]munuT0Ta[i1,i2,0,il2,ac]\[Sigma]munuT0Ta[i3,i4,0,il2,ac] ,{il2,1,3}]+ 3/8 (Sum[\[Sigma]munuTfTa[i1,i2,il1,il2,af,ac]\[Sigma]munuTfTa[i3,i4,il1,il2,af,ac],{il1,1,3},{il2,1,3}]-2 Sum[\[Sigma]munuTfTa[i1,i2,0,il2,af,ac]\[Sigma]munuTfTa[i3,i4,0,il2,af,ac],{il2,1,3}])
(*Subsuperscript[(T), \[Perpendicular]-\[DoubleVerticalBar], adj.]*)

}//.Thread[{i1,i2,i3,i4}->Map[#[[2;;]]&,TBIndices["FierzCompleteNf2p1Nc3"]]];

TBInnerProduct["FierzCompleteNf2p1Nc3"]=(2Tensor1[1,2,3,4]Tensor2[2,1,4,3]-2Tensor1[1,2,3,4]Tensor2[2,3,4,1]);
