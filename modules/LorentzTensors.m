(* ::Package:: *)

(* ::Title:: *)
(*FormTracer extensions: Lorentz tensors, projectors and identities*)

Unprotect[sigma,pdash,psdash];

sigma[v1_,v2_,d1_,d2_]:=Module[{dint1,dint2},TBInsertOutputNaming[I/2 (TBgamma[v1,d1,dint1]TBgamma[v2,dint1,d2]-TBgamma[v2,d1,dint2]TBgamma[v1,dint2,d2])]];pdash[p_,i_,j_]:=Module[{mu},TBInsertOutputNaming[TBgamma[mu,i,j]TBvec[p,mu]]];
psdash[p_,i_,j_]:=Module[{mu},TBInsertOutputNaming[TBgamma[mu,i,j]TBvecs[p,mu]]];

Protect[sigma,pdash,psdash];


TensorBases`Private`LTCache=
FormTracer`Private`combinedLorentzTensorInputCache;
removeObj[expr_]:=Module[{pos},
pos=FirstPosition[TensorBases`Private`LTCache,expr][[1]];
If[IntegerQ[pos],
TensorBases`Private`LTCache=Delete[TensorBases`Private`LTCache,pos]
];
];
removeObj/@{transProj[_,_,_],transProj[_,_,_,_],longProj[_,_,_],transProjMagnetic[_,_,_],transProjElectric[_,_,_]};
ClearAll[removeObj];


DefineCombinedLorentzTensors[
TBInsertOutputNaming[Union[
TensorBases`Private`LTCache,
{
(*zero temperature*)
{
transProj[p,mu,nu],
TBdeltaLorentz[mu,nu]-TBvec[p,mu]TBvec[p,nu]/TBsp[p,p]
},
{
transProj[p,q,mu,nu],
TBdeltaLorentz[mu,nu]-TBvec[p,mu]TBvec[q,nu]/TBsp[p,q]
},
{
longProj[p,mu,nu],
TBvec[p,mu]TBvec[p,nu]/TBsp[p,p]
},
(*finite temperature*)
{
transProjMagnetic[p,mu,nu],
TBdeltaLorentz[mu,nu]-(TBvecs[p,mu]TBvecs[p,nu])/TBsps[p,p]-TBdeltaLorentz[mu,0]*TBdeltaLorentz[nu,0]
},
{
transProjElectric[p,mu,nu],
TBdeltaLorentz[mu,0] TBdeltaLorentz[nu,0]-(TBvec[p,mu] TBvec[p,nu])/TBsp[p,p]+(TBvecs[p,mu] TBvecs[p,nu])/TBsps[p,p]
}
}
]]
];


TensorBases`Private`LTCache=
FormTracer`Private`lorentzTensorIdentitiesInputCache;
removeObj[expr_]:=Module[{pos},
pos=FirstPosition[TensorBases`Private`LTCache,expr][[1]];
If[IntegerQ[pos],
TensorBases`Private`LTCache=Delete[TensorBases`Private`LTCache,pos]
];
];
removeObj/@{transProj[_,_,_],transProj[_,_,_,_],longProj[_,_,_],transProjMagnetic[_,_,_],transProjElectric[_,_,_]};
ClearAll[removeObj];


(* The single source of truth for how two projectors contract. Both the
   FormTracer-side identities and the Mathematica-side rewrite rules
   (TBReplacementsLorentzTensors, below) are built from this list; they used to
   be maintained separately and had drifted apart -- the finite-temperature
   entries existed here but had no rewrite-rule counterpart at all. *)
TBLorentzTensorIdentities={
(*zero temperature*)
{transProj[p,mu,rho]transProj[p,rho,nu],transProj[p,mu,nu]},
{transProj[p,mu,rho]transProj[p,nu,rho],transProj[p,mu,nu]},
{transProj[p,rho,mu]transProj[p,rho,nu],transProj[p,mu,nu]},

{longProj[p,mu,rho]longProj[p,rho,nu],longProj[p,mu,nu]},
{longProj[p,mu,rho]longProj[p,nu,rho],longProj[p,mu,nu]},
{longProj[p,rho,mu]longProj[p,rho,nu],longProj[p,mu,nu]},

{transProj[p,mu,rho]longProj[p,rho,nu],0},
{transProj[p,rho,mu]longProj[p,rho,nu],0},
{transProj[p,mu,rho]longProj[p,nu,rho],0},

(*finite temperature*)
{transProjMagnetic[p,mu,rho]transProjMagnetic[p,rho,nu],transProjMagnetic[p,mu,nu]},
{transProjMagnetic[p,mu,rho]transProjMagnetic[p,nu,rho],transProjMagnetic[p,mu,nu]},
{transProjMagnetic[p,rho,mu]transProjMagnetic[p,rho,nu],transProjMagnetic[p,mu,nu]},

{transProjElectric[p,mu,rho]transProjElectric[p,rho,nu],transProjElectric[p,mu,nu]},
{transProjElectric[p,mu,rho]transProjElectric[p,nu,rho],transProjElectric[p,mu,nu]},
{transProjElectric[p,rho,mu]transProjElectric[p,rho,nu],transProjElectric[p,mu,nu]},

{transProjMagnetic[p,mu,rho]transProjElectric[p,rho,nu],0},
{transProjMagnetic[p,mu,rho]transProjElectric[p,nu,rho],0},
{transProjMagnetic[p,rho,mu]transProjElectric[p,rho,nu],0},

{transProjMagnetic[p,mu,rho]longProj[p,rho,nu],0},
{transProjMagnetic[p,mu,rho]longProj[p,nu,rho],0},
{transProjMagnetic[p,rho,mu]longProj[p,rho,nu],0},

{transProjElectric[p,mu,rho]longProj[p,rho,nu],0},
{transProjElectric[p,mu,rho]longProj[p,nu,rho],0},
{transProjElectric[p,rho,mu]longProj[p,rho,nu],0}
};

DefineLorentzTensorIdentities[Union[TensorBases`Private`LTCache,TBLorentzTensorIdentities]];


(* Turn the identity table into rewrite rules.

   Every projector above is symmetric in its two Lorentz indices, so a
   contraction over one shared index reduces no matter which slot that index
   occupies in either factor. The table lists only some of those placements, so
   generate the remaining ones here by swapping each factor's index pair. Times
   is Orderless, so the two *factor* orders need no separate rules once all four
   index placements are present -- that gap is what made
   longProj[p,mu,rho] transProj[p,rho,nu] fail to reduce while the same product
   written the other way round reduced to 0.

   Caveat, pre-existing and unchanged: these rules match a plain Times without
   checking that the shared index is genuinely contracted, so a product whose
   shared index is *open* also collapses. *)
TBSwapLorentzIndices[h_[q_,a_,b_]]:=h[q,b,a];
TBLorentzIndexPlacements[lhs_]:=DeleteDuplicates[
Times@@@Tuples[Map[{#,TBSwapLorentzIndices[#]}&,List@@lhs]]
];
(* Built with Apply, not With[...]/RuleDelayed[...]: RuleDelayed is HoldRest, so
   wrapping it in a scoping construct renames the *pattern* variables on the
   left (p -> p$) while leaving the right-hand side referring to bare p. The
   rule then matches and rewrites to unbound globals -- silently, and only for
   the entries whose result is a tensor rather than 0. Applying RuleDelayed to
   an already-evaluated {lhs, rhs} pair sidesteps the renaming entirely. *)
TBMakeLorentzContractionRule[lhs_,reduced_]:=RuleDelayed@@{
lhs/.{p->Pattern[p,Blank[]],mu->Pattern[mu,Blank[]],nu->Pattern[nu,Blank[]],rho->Pattern[rho,Blank[]]},
reduced
};
TBReplacementsLorentzTensors=DeleteDuplicates@Flatten@Map[
Function[entry,
Map[TBMakeLorentzContractionRule[#,entry[[2]]]&,TBLorentzIndexPlacements[entry[[1]]]]
],
TBLorentzTensorIdentities
];
TBCombinedLorentzTensorsList={
transProj[p_,mu_,nu_]:>TBInsertOutputNaming[TBdeltaLorentz[mu,nu]-TBvec[p,mu]TBvec[p,nu]/TBsp[p,p]],
transProj[p_,q_,mu_,nu_]:>TBInsertOutputNaming[TBdeltaLorentz[mu,nu]-TBvec[p,mu]TBvec[q,nu]/TBsp[p,q]],
longProj[p_,mu_,nu_]:>TBInsertOutputNaming[TBvec[p,mu]TBvec[p,nu]/TBsp[p,p]],
(*finite temperature*)
transProjMagnetic[p_,mu_,nu_]:>TBInsertOutputNaming[TBdeltaLorentz[mu,nu]-(TBvecs[p,mu]TBvecs[p,nu])/TBsps[p,p]-TBdeltaLorentz[mu,0]*TBdeltaLorentz[nu,0]],
transProjElectric[p_,mu_,nu_]:>TBInsertOutputNaming[TBdeltaLorentz[mu,0] TBdeltaLorentz[nu,0]-(TBvec[p,mu] TBvec[p,nu])/TBsp[p,p]+(TBvecs[p,mu] TBvecs[p,nu])/TBsps[p,p]]
};
TBInsertCombinedLorentzTensors[expr_]:=expr//.TBReplacementsLorentzTensors//.TBCombinedLorentzTensorsList;


ShowFormTracerDefinitions[]:=Module[{els},
Print["FormTracer Names:          ",TableForm[Join[
{
{"\!\(\*SubscriptBox[\(\[Delta]\), \(ij\)]\) in Lorentz group",TBdeltaLorentz[i,j]},
{"\!\(\*SubscriptBox[\(p\), \(\[Mu]\)]\) Lorentz vector",TBvec[p,\[Mu]]},
{"\!\(\*SubscriptBox[\(p\), \(i\)]\) spatial Lorentz vector",TBvecs[p,i]},
{"\!\(\*SubscriptBox[\(p\), \(\[Mu]\)]\)\!\(\*SubscriptBox[\(q\), \(\[Mu]\)]\) scalar product",TBsp[p,q]},
{"\!\(\*SubscriptBox[\(p\), \(i\)]\)\!\(\*SubscriptBox[\(q\), \(i\)]\) spatial calar product ",TBsps[p,q]},
{"",""},

{"\!\(\*SubscriptBox[\(\[Delta]\), \(ij\)]\) in Spinor group",TBdeltaDirac[i,j]},
{"\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\)",TBgamma[\[Mu],d1,d2]},
{"\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\)",TBgamma5[d1,d2]},
{"\!\(\*SubscriptBox[\(\[Epsilon]\), \(\[Mu]\[Nu]\[Rho]\)]\)",TBepsLorentz[\[Mu],\[Nu],\[Rho]]},
{"",""}
},
Flatten[Map[{
{"adjoint \!\(\*SubscriptBox[\(\[Delta]\), \(ab\)]\)",TBdeltaAdj[#,a,b]},
{"fundamental \!\(\*SubscriptBox[\(\[Delta]\), \(AB\)]\)",TBdeltaFund[#,A,B]},
{"\!\(\*FractionBox[SubscriptBox[\(f\), \(abc\)], \(2\)]\)",TBF[#,a, b, c]},
{"(\!\(\*SubscriptBox[\(t\), \(a\)]\)\!\(\*SubscriptBox[\()\), \(BC\)]\)",TBT[#,a, B, C]},
{"\!\(\*SubscriptBox[\(\[Epsilon]\), \(abc\)]\)",TBepsAdj[#,a, b, c]},
{"\!\(\*SubscriptBox[\(\[Epsilon]\), \(ABC\)]\)",TBepsFund[#,A, B, C]},
{"group constant",GetFormTracerGroupConstant[#]},
{"",""}}&,GetFormTracerGroups[]],1]
]//TBInsertOutputNaming
,TableHeadings->{Join[
{"Lorentz","","","","","",
"spinor","","","",""},
Flatten[Map[{#,"","","","","","",""}&,
Map[ToString[#[[1]]]<>"("<>ToString[#[[2]]]<>")"&,GetFormTracerGroupNamesAndTypes[]]
],1]
]
, {"object","name"}},TableSpacing->{3, 3}]];

els=Transpose[{
TBCombinedLorentzTensorsList//.(a_[b___]:>f_):>a@@ToExpression[StringReplace[ToString[{b}],"_"->""]],
TBCombinedLorentzTensorsList//.(a_[b___]:>f_):>f
}];
Print["\nCombined Lorentz tensors:   ",TableForm[Transpose[{els[[All,2]]}],TableHeadings->{els[[All,1]],{"replacement","name"}},TableSpacing->{3, 5}]];
Print["\nThese can be explicitly evaluated by using e.g. \!\(\*
StyleBox[\"TBInsertCombinedLorentzTensors\",\nFontColor->RGBColor[1, 0.5, 0]]\)[transProj[p,\[Mu],\[Nu]]]"];

Print["\n
TensorBases defines additionally the following Lorentz tensors:
   sigma[\[Mu],\[Nu],\!\(\*SubscriptBox[\(d\), \(1\)]\),\!\(\*SubscriptBox[\(d\), \(2\)]\)] : \!\(\*FractionBox[\(\[ImaginaryI]\), \(2\)]\)[\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\),\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Nu]\)]\)\!\(\*SubscriptBox[\(]\), \(\*SubscriptBox[\(d\), \(1\)] \*SubscriptBox[\(d\), \(2\)]\)]\)
   pdash[p,\!\(\*SubscriptBox[\(d\), \(1\)]\),\!\(\*SubscriptBox[\(d\), \(2\)]\)] : (\!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\)]\)\!\(\*SubscriptBox[\(p\), \(\[Mu]\)]\)\!\(\*SubscriptBox[\()\), \(\*SubscriptBox[\(d\), \(1\)] \*SubscriptBox[\(d\), \(2\)]\)]\)
   psdash[p,\!\(\*SubscriptBox[\(d\), \(1\)]\),\!\(\*SubscriptBox[\(d\), \(2\)]\)] : (\!\(\*SubscriptBox[\(\[Gamma]\), \(i\)]\)\!\(\*SubscriptBox[\(p\), \(i\)]\)\!\(\*SubscriptBox[\()\), \(\*SubscriptBox[\(d\), \(1\)] \*SubscriptBox[\(d\), \(2\)]\)]\)

Further useful functions defined by TensorBases:
\!\(\*
StyleBox[\"UseLorentzLinearity\",\nFontColor->RGBColor[1, 0.5, 0]]\)[expr] expands all scalar products and vectors in expr (e.g. sp[p1,p2-p3] -> sp[p1,p2]-sp[p1,p3])
\!\(\*
StyleBox[\"AddFormTracerGroup\",\nFontColor->RGBColor[1, 0.5, 0]]\)[{name,kind,constant}] adds a group to FormTracer where name is an identifier, kind is one of {SUNfund, SONfund, SU3fundexplicit, SU2fundexplicit,SPNfund} (see also FormTracer`ShowGroupTemplates[]) and constant is the identifier for the group constant.
\!\(\*
StyleBox[\"RemoveFormTracerGroup\",\nFontColor->RGBColor[1, 0.5, 0]]\)[name] removes a group from FormTracer where name is an identifier.
\!\(\*
StyleBox[\"SetNf\",\nFontColor->RGBColor[1, 0.5, 0]]\)[3],\!\(\*
StyleBox[\"SetNf\",\nFontColor->RGBColor[1, 0.5, 0]]\)[2],\!\(\*
StyleBox[\"SetNf\",\nFontColor->RGBColor[1, 0.5, 0]]\)[] sets the flavor number to 3, 2 or the general Nf.
\!\(\*
StyleBox[\"SetNc\",\nFontColor->RGBColor[1, 0.5, 0]]\)[3],\!\(\*
StyleBox[\"SetNc\",\nFontColor->RGBColor[1, 0.5, 0]]\)[2],\!\(\*
StyleBox[\"SetNc\",\nFontColor->RGBColor[1, 0.5, 0]]\)[] sets the color number to 3, 2 or the general Nc.
"];
];
