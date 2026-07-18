(* ::Package:: *)

(* ::Title:: *)
(*Momentum kinematics: symmetric point and three-point parametrisations*)

Unprotect@TBInfo;
TBInfo["Momenta"]:=Print["Currently, the \!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)package implements the following momentum transformations:
\!\(\*
StyleBox[\"Projections\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\":\",\nFontWeight->\"Bold\"]\)\n\!\(\*
StyleBox[\"TBProjectToSymmetricPoint\",\nFontColor->RGBColor[1, 0.5, 0]]\),\!\(\*
StyleBox[\"TBProjectToSymmetricPointSpatial\",\nFontColor->RGBColor[1, 0.5, 0]]\)
\!\(\*
StyleBox[\"Three\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"-\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"Point\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"functions\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\":\",\nFontWeight->\"Bold\"]\)\n\!\(\*
StyleBox[\"TB3PToS0S1SPhi\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TB3PToS0S1SPhi\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\",\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\"TB3PFromS0as\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\",\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\"TB3PToS0as\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\",\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\"TB3PFromS0S1SPhiQk\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\",\",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\"TB3PToS0S1SPhiQk\",\nFontColor->RGBColor[1, 0.5, 0]]\)
"];
Protect@TBInfo;


TBProjectToSymmetricPoint[expr_,q_Symbol,p_Symbol,momenta___Symbol]:=Module[
{momentaList,nMomenta,rules,qf,
conv=InsertOutputNaming},
momentaList={momenta};
nMomenta=Length[momentaList];
qf=Symbol[ToString[q]<>"f"];
rules=Map[conv@TBsp[#[[1]],#[[2]]]->-(1/(nMomenta-1))conv@TBsp[p,p]&,Subsets[momentaList,{2}]]
\[Union]Map[conv@TBsp[#,#]->conv@TBsp[p,p]&,momentaList]
\[Union]Map[conv@TBsp[#,q]->Symbol["cos"~~StringJoin@(ToString/@Sort[{#,q}])] p q&,momentaList[[1;;nMomenta-1]]]
\[Union]Map[conv@TBsp[#,qf]->Symbol["cos"~~StringJoin@(ToString/@Sort[{#,qf}])] p qf&,momentaList[[1;;nMomenta-1]]]
\[Union]{momentaList[[nMomenta]]->-Total[momentaList[[1;;nMomenta-1]]]};
Global`UseLorentzLinearity[expr]//.rules
]


separateScalarProductsSpatial[expr_]:=Module[{conv=InsertOutputNaming,repl},
repl={
Head[conv[TBsp[a,b]]][q_,p_]:>conv[TBsps[q,p]+TBvec[q,0]TBvec[p,0]],
Head[conv[TBvec[a,b]]][p_,mu_/;mu=!=0]:>conv[TBvecs[p,mu]+TBdeltaLorentz[mu,0]TBvec[p,0]]
};
Global`UseLorentzLinearity[expr]//.repl
]


TBProjectToSymmetricPointSpatial[expr_,q_Symbol,p_Symbol,momenta___Symbol]:=Module[
{momentaList,nMomenta,rules,qf,out,
conv=InsertOutputNaming},
momentaList={momenta};
nMomenta=Length[momentaList];
qf=Symbol[ToString[q]<>"f"];
rules=Map[conv@TBsps[#[[1]],#[[2]]]->-(1/(nMomenta-1))conv@TBsps[p,p]&,Subsets[momentaList,{2}]]
\[Union]Map[conv@TBsps[#,#]->conv@TBsps[p,p]&,momentaList]
\[Union]Map[conv@TBsps[#,q]->Symbol["cos"~~StringJoin@(ToString/@Sort[conv@{#,q}])] p q&,momentaList[[1;;nMomenta-1]]]
\[Union]Map[conv@TBsps[#,qf]->Symbol["cos"~~StringJoin@(ToString/@Sort[conv@{#,qf}])] p qf&,momentaList[[1;;nMomenta-1]]]
\[Union]{momentaList[[nMomenta]]->-Total[momentaList[[1;;nMomenta-1]]]};
out=separateScalarProductsSpatial[Global`UseLorentzLinearity[expr]]//.rules;
Global`UseLorentzLinearity[out]//.rules
]


TB3PToS0S1SPhi[p1_Symbol,p2_Symbol,p3_Symbol,q_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]:=Module[
{change,rules,conv=InsertOutputNaming,
vec4,Qvec,kvec,qvec,ruleqk,ruleqQ,
t,xi,a,s,z,Q,k},

System`$Assumptions=System`$Assumptions&&S0>0&&1>=S1>0&&-\[Pi]<SPhi<=\[Pi];


vec4[\[CapitalTheta]1_,\[CapitalTheta]2_,\[Phi]_]:={Cos[\[CapitalTheta]1],Sin[\[CapitalTheta]1]Cos[\[CapitalTheta]2],Sin[\[CapitalTheta]1]Sin[\[CapitalTheta]2]Cos[\[Phi]],Sin[\[CapitalTheta]1]Sin[\[CapitalTheta]2]Sin[\[Phi]]};
Qvec=Sqrt[sp[Q,Q]]{1,0,0,0};
kvec=Sqrt[sp[k,k]]{sp[k,Q]/(\[Sqrt](sp[Q,Q]sp[k,k])),\[Sqrt](1-(sp[k,Q]/(\[Sqrt](sp[Q,Q]sp[k,k])))^2),0,0};
qvec=q vec4[ArcCos[Symbol["cos1"]],ArcCos[Symbol["cos2"]],Symbol["phi"]];

ruleqk=FullSimplify[(kvec . qvec),Assumptions->$Assumptions&&-1<Symbol["cos1"]<=1&&-1<Symbol["cos2"]<=1&&0<=Symbol["phi"]<2\[Pi]];
ruleqQ=FullSimplify[(Qvec . qvec),Assumptions->$Assumptions&&-1<Symbol["cos1"]<=1&&-1<Symbol["cos2"]<=1&&0<=Symbol["phi"]<2\[Pi]];

change[expr_]:=Global`UseLorentzLinearity[conv[Evaluate[expr//.{
p1->Q,
p2->-k-Q/2,
p3->k-Q/2
}]]];

rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
TBsp[Q,Q]->4t,
TBsp[k,k]->3xi t,
TBsp[Q,k]->2Sqrt[3] Sqrt[t^2 xi]z,
TBsp[k,Q]->2Sqrt[3] Sqrt[t^2 xi]z,

TBsp[k,q]->ruleqk,
TBsp[q,k]->ruleqk,
TBsp[Q,q]->ruleqQ,
TBsp[q,Q]->ruleqQ
}//.{
t->(1-s)/4 S0^2,
xi->(1+s)/(1-s),
z->a/Sqrt[1-s^2]
}//.{
a->S1 Cos[SPhi],
s->S1 Sin[SPhi]
}
]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&1>=S1>=0&&-\[Pi]<SPhi<=\[Pi]&&xi>=0
]
];
Return[
(change[#]//.rules)&
];
];


TB3PToS0S1SPhi[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]:=Module[
{change,rules,conv=InsertOutputNaming,
t,xi,a,s,z,Q,k},
System`$Assumptions=System`$Assumptions&&S0>0&&1>=S1>0&&-\[Pi]<SPhi<=\[Pi];
change[expr_]:=Global`UseLorentzLinearity[conv[Evaluate[expr//.{
p1->Q,
p2->-k-Q/2,
p3->k-Q/2
}]]];
rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
TBsp[Q,Q]->4t,
TBsp[k,k]->3xi t,
TBsp[Q,k]->2Sqrt[3] Sqrt[t^2 xi]z,
TBsp[k,Q]->2Sqrt[3] Sqrt[t^2 xi]z
}//.{
t->(1-s)/4 S0^2,
xi->(1+s)/(1-s),
z->a/Sqrt[1-s^2]
}//.{
a->S1 Cos[SPhi],
s->S1 Sin[SPhi]
}
]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&1>=S1>=0&&-\[Pi]<SPhi<=\[Pi]&&xi>=0
]
];
Return[
(change[#]//.rules)&
];
];
TB3PFromS0S1SPhi[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]:=Module[
{rules,conv=InsertOutputNaming,
t,xi,a,s,z,Q,k},
rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
S0->Sqrt[2t(1+xi)],
S1->Sqrt[a^2+s^2],
SPhi->ArcTan[a,s]
}//.{
a->(2Sqrt[xi]z)/(xi+1),
s->(xi-1)/(xi+1)
}//.{
t->TBsp[Q,Q]/4,
xi->(4TBsp[k,k])/(3TBsp[Q,Q]),
z->TBsp[Q,k]/(\[Sqrt](TBsp[k,k]TBsp[Q,Q]))
}//.{
Q->p1,
k->(p3-p2)/2
}]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&1>=S1>=0&&-\[Pi]<SPhi<=\[Pi]&&xi>=0
]
];
Return[
(#//.rules)&
];
];


TB3PToS0S1SPhiQk[Q_Symbol,k_Symbol,q_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]:=Module[
{rules,conv=InsertOutputNaming,
vec4,Qvec,kvec,qvec,ruleqk,ruleqQ,
t,xi,a,s,z},

System`$Assumptions=System`$Assumptions&&S0>0&&1>=S1>0&&-\[Pi]<SPhi<=\[Pi];


vec4[\[CapitalTheta]1_,\[CapitalTheta]2_,\[Phi]_]:={Cos[\[CapitalTheta]1],Sin[\[CapitalTheta]1]Cos[\[CapitalTheta]2],Sin[\[CapitalTheta]1]Sin[\[CapitalTheta]2]Cos[\[Phi]],Sin[\[CapitalTheta]1]Sin[\[CapitalTheta]2]Sin[\[Phi]]};
Qvec=Sqrt[sp[Q,Q]]{1,0,0,0};
kvec=Sqrt[sp[k,k]]{sp[k,Q]/(\[Sqrt](sp[Q,Q]sp[k,k])),\[Sqrt](1-(sp[k,Q]/(\[Sqrt](sp[Q,Q]sp[k,k])))^2),0,0};
qvec=q vec4[ArcCos[Symbol["cos1"]],ArcCos[Symbol["cos2"]],Symbol["phi"]];

ruleqk=FullSimplify[(kvec . qvec),Assumptions->$Assumptions&&-1<Symbol["cos1"]<=1&&-1<Symbol["cos2"]<=1&&0<=Symbol["phi"]<2\[Pi]];
ruleqQ=FullSimplify[(Qvec . qvec),Assumptions->$Assumptions&&-1<Symbol["cos1"]<=1&&-1<Symbol["cos2"]<=1&&0<=Symbol["phi"]<2\[Pi]];

rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
TBsp[Q,Q]->4t,
TBsp[k,k]->3xi t,
TBsp[Q,k]->2Sqrt[3] Sqrt[t^2 xi]z,
TBsp[k,Q]->2Sqrt[3] Sqrt[t^2 xi]z,

TBsp[k,q]->ruleqk,
TBsp[q,k]->ruleqk,
TBsp[Q,q]->ruleqQ,
TBsp[q,Q]->ruleqQ
}//.{
t->(1-s)/4 S0^2,
xi->(1+s)/(1-s),
z->a/Sqrt[1-s^2]
}//.{
a->S1 Cos[SPhi],
s->S1 Sin[SPhi]
}
]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&1>=S1>=0&&-\[Pi]<SPhi<=\[Pi]&&xi>=0
]
];
Return[
(#//.rules)&
];
];


TB3PToS0S1SPhiQk[Q_Symbol,k_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]:=Module[
{rules,conv=InsertOutputNaming,
t,xi,a,s,z},
System`$Assumptions=System`$Assumptions&&S0>0&&1>=S1>0&&-\[Pi]<SPhi<=\[Pi];

rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
TBsp[Q,Q]->4t,
TBsp[k,k]->3xi t,
TBsp[Q,k]->2Sqrt[3] Sqrt[t^2 xi]z,
TBsp[k,Q]->2Sqrt[3] Sqrt[t^2 xi]z
}//.{
t->(1-s)/4 S0^2,
xi->(1+s)/(1-s),
z->a/Sqrt[1-s^2]
}//.{
a->S1 Cos[SPhi],
s->S1 Sin[SPhi]
}
]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&1>=S1>=0&&-\[Pi]<SPhi<=\[Pi]&&xi>=0
]
];
Return[
(#//.rules)&
];
];
TB3PFromS0S1SPhiQk[Q_Symbol,k_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]:=Module[
{rules,conv=InsertOutputNaming,
t,xi,a,s,z},
rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
S0->Sqrt[2t(1+xi)],
S1->Sqrt[a^2+s^2],
SPhi->ArcTan[a,s]
}//.{
a->(2Sqrt[xi]z)/(xi+1),
s->(xi-1)/(xi+1)
}//.{
t->TBsp[Q,Q]/4,
xi->(4TBsp[k,k])/(3TBsp[Q,Q]),
z->TBsp[Q,k]/(\[Sqrt](TBsp[k,k]TBsp[Q,Q]))
}]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&1>=S1>=0&&-\[Pi]<SPhi<=\[Pi]&&xi>=0
]
];
Return[
(#//.rules)&
];
];


TB3PToS0as[p1_Symbol,p2_Symbol,p3_Symbol,q_Symbol,S0_Symbol,a_Symbol,s_Symbol]:=Module[
{change,rules,conv=InsertOutputNaming,
vec4,Qvec,kvec,qvec,ruleqk,ruleqQ,
t,xi,z,Q,k},
System`$Assumptions=System`$Assumptions&&S0>0&&1>=a>=0&&0<=s<=1;

vec4[\[CapitalTheta]1_,\[CapitalTheta]2_,\[Phi]_]:={Cos[\[CapitalTheta]1],Sin[\[CapitalTheta]1]Cos[\[CapitalTheta]2],Sin[\[CapitalTheta]1]Sin[\[CapitalTheta]2]Cos[\[Phi]],Sin[\[CapitalTheta]1]Sin[\[CapitalTheta]2]Sin[\[Phi]]};
Qvec=Sqrt[sp[Q,Q]]{1,0,0,0};
kvec=Sqrt[sp[k,k]]{sp[k,Q]/Sqrt[sp[Q,Q]sp[k,k]],Sqrt[1-(sp[k,Q]/Sqrt[sp[Q,Q]sp[k,k]])^2],0,0};
qvec=q vec4[ArcCos[Symbol["cos1"]],ArcCos[Symbol["cos2"]],Symbol["phi"]];

ruleqk=FullSimplify[(kvec . qvec),Assumptions->$Assumptions&&-1<Symbol["cos1"]<=1&&-1<Symbol["cos2"]<=1&&0<=Symbol["phi"]<2\[Pi]];
ruleqQ=FullSimplify[(Qvec . qvec),Assumptions->$Assumptions&&-1<Symbol["cos1"]<=1&&-1<Symbol["cos2"]<=1&&0<=Symbol["phi"]<2\[Pi]];

change[expr_]:=Global`UseLorentzLinearity[conv[Evaluate[expr//.{
p1->Q,
p2->-k-Q/2,
p3->k-Q/2
}]]];

rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
TBsp[Q,Q]->4t,
TBsp[k,k]->3xi t,
TBsp[Q,k]->2Sqrt[3] Sqrt[t^2 xi]z,
TBsp[k,Q]->2Sqrt[3] Sqrt[t^2 xi]z,

TBsp[k,q]->ruleqk,
TBsp[q,k]->ruleqk,
TBsp[Q,q]->ruleqQ,
TBsp[q,Q]->ruleqQ
}//.{
t->(1-s)/4 S0^2,
xi->(1+s)/(1-s),
z->a/Sqrt[1-s^2]
}
]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&xi>=0
]
];
Return[
(change[#]//.rules)&
];
];


TB3PToS0as[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,a_Symbol,s_Symbol]:=Module[
{change,rules,conv=InsertOutputNaming,
t,xi,z,Q,k},
System`$Assumptions=System`$Assumptions&&S0>0&&1>=a>=0&&0<=s<=1;

change[expr_]:=Global`UseLorentzLinearity[conv[Evaluate[expr//.{
p1->Q,
p2->-k-Q/2,
p3->k-Q/2
}]]];
rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[
{
TBsp[Q,Q]->4t,
TBsp[k,k]->3xi t,
TBsp[Q,k]->2Sqrt[3] Sqrt[t^2 xi]z,
TBsp[k,Q]->2Sqrt[3] Sqrt[t^2 xi]z
}//.{
t->(1-s)/4 S0^2,
xi->(1+s)/(1-s),
z->a/Sqrt[1-s^2]
}
]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&xi>=0
]
];
Return[
(change[#]//.rules)&
];
];

TB3PFromS0as[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,a_Symbol,s_Symbol]:=Module[
{rules,conv=InsertOutputNaming,
t,xi,z,Q,k},
rules=Dispatch[
FullSimplify[
Global`UseLorentzLinearity[
conv[Evaluate[{
S0->Sqrt[2t(1+xi)],
a->(2Sqrt[xi]z)/(xi+1),
s->(xi-1)/(xi+1)
}//.{
t->TBsp[Q,Q]/4,
xi->(4TBsp[k,k])/(3TBsp[Q,Q]),
z->TBsp[Q,k]/Sqrt[TBsp[k,k]TBsp[Q,Q]]
}//.{
Q->p1,
k->(p3-p2)/2
}]]
],
Assumptions->System`$Assumptions&&sp[p1,p1]>=0&&sp[p2,p2]>=0&&sp[p3,p3]>=0&&0<=a<=1&&0<=s<=1&&S0>=0&&xi>=0
]
];
Return[
(#//.rules)&
];
];
