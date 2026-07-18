(* ::Package:: *)

(* ::Title:: *)
(*FormTracer extensions: groups, constants, naming, linearity*)

GetFormTracerGroups::usage="GetFormTracerGroups[]";
FormTracerGroupExistsQ::usage="GetFormTracerGroupList[name_Symbol]";
GetFormTracerGroupList::usage="GetFormTracerGroupList[name_Symbol]";
AddGroupTensors::usage="AddGroupTensors[groupDef_List]";
GetFormTracerGroupConstants::usage="GetFormTracerGroupConstants[]";
GetFormTracerGroupConstant::usage="GetFormTracerGroupConstant[name_Symbol]";
AddFormTracerGroup::usage="AddFormTracerGroup[{ingroupName_Symbol,inkind_Symbol,inconstant_}]";
UseLorentzLinearitySP::usage="";
UseLorentzLinearityVec::usage="";
UseLorentzLinearity::usage="";
TBInsertCombinedLorentzTensors::usage="";


ShowFormTracerExtensions[]:=Module[{},
Print["\!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\) defines the following functions in extension to \!\(\*
StyleBox[\"FormTracer\",\nFontWeight->\"Bold\"]\) functionality.
In order to get detailed information on each of those, please call their usage messages, e.g. \!\(\*
StyleBox[\"GetFormTracerGroups\",\nFontColor->RGBColor[1, 0.5, 0]]\)::\!\(\*
StyleBox[\"usage\",\nFontColor->RGBColor[0, 0, 1]]\).

\!\(\*
StyleBox[\"GetFormTracerGroups\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"FormTracerGroupExists\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"GetFormTracerGroupList\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"AddGroupTensors\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"AddFormTracerGroup\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"GetFormTracerGroupConstants\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"GetFormTracerGroupConstant\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"UseLorentzLinearitySP\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"UseLorentzLinearityVec\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"UseLorentzLinearity\",\nFontColor->RGBColor[1, 0.5, 0]]\),
\!\(\*
StyleBox[\"TBInsertCombinedLorentzTensors\",\nFontColor->RGBColor[1, 0.5, 0]]\)"];
];


GetFormTracerGroups[]:=FormTracer`Private`groupNames;
FormTracerGroupExistsQ[name_Symbol]:=Module[{},
If[Not@MemberQ[GetFormTracerGroups[],name],
Return[False];,
Return[True];
];
];
GetFormTracerGroupTypes[]:=FormTracer`Private`groupTypes;
GetFormTracerGroupNamesAndTypes[]:=Transpose[{FormTracer`Private`groupNames,FormTracer`Private`groupTypes}]

GetFormTracerGroupList[name_Symbol]:=Module[{idx,type,constant,mRules,funcs},
If[Not@FormTracerGroupExistsQ[name],
Print["Logic error: "~~ToString[name]~~" is not an already defined group"];
Abort[];
];
idx=Flatten[Position[FormTracer`Private`groupNames,name]][[1]];
type=FormTracer`Private`groupTypes[[idx]];
constant=FormTracer`Private`groupConstantsTable[[idx]][[1]];
mRules=Select[Normal[FormTracer`Private`groupTensorReplacementRulesOutput],MemberQ[#,name,Infinity]&];
funcs=mRules//.(a_:>b_):>b//.a_[b___,FormTracer`Private`a$]->a[b,i,j,k];

Join[{type, {name, constant}},funcs]
];
AddGroupTensors[groupDef_List]:=Module[{alreadyPresent},
alreadyPresent=Map[GetFormTracerGroupList,FormTracer`Private`groupNames];
DefineGroupTensors[Join[
alreadyPresent,
{groupDef}
]]
]


RemoveGroupTensor[name_]:=Module[{alreadyPresent,obj},
alreadyPresent=Map[GetFormTracerGroupList,FormTracer`Private`groupNames];
obj=Select[alreadyPresent,MemberQ[#,name,Infinity]&];
If[Length[obj]===0,Print["No group called "<>ToString[name]<>" present!"];Abort[]];
DefineGroupTensors[
DeleteCases[alreadyPresent,obj[[1]]]
]
];


(* Silence the divergence message classes. They are emitted both on the master (when a Parallel* call serialises the symbolic basis data for distribution) and on the subkernels (which re-evaluate it with the numeric constant in scope) and relay them back; turning them Off on the master is the one lever that catches both. The entries are genuinely infinite and the user has accepted that, so we suppress only these three classes, and only while a group constant is set to a numeric value (TBOnDivergenceMessages[] restores them on returning to the symbolic constant). Set Global`TBQuietParallel=False to opt out entirely. *)
TBOffDivergenceMessages[]:=If[!TrueQ[Global`TBQuietParallel===False],
Off[Power::infy];Off[Power::indet];Off[Infinity::indet];]
TBOnDivergenceMessages[]:=(On[Power::infy];On[Power::indet];On[Infinity::indet];)

SetNf[3]:=Module[{},
RemoveGroupTensor[flavor];

Unprotect[Nf];
ClearAll[Nf];
Nf=3;
Protect[Nf];

AddGroupTensors[{FormTracer`SU3fundexplicit, {flavor,3}, deltaAdjFlav[a, b], FFlav[a, b, c], deltaFundFlav[a, b], TFlav[a, b, c], epsAdjFlav[a, b, c],epsFundFlav[a, b, c]}];

TBOffDivergenceMessages[];
]
SetNf[2]:=Module[{},
RemoveGroupTensor[flavor];

Unprotect[Nf];
ClearAll[Nf];
Nf=2;
Protect[Nf];

AddGroupTensors[{FormTracer`SU2fundexplicit, {flavor,2}, deltaAdjFlav[a, b], FFlav[a, b, c], deltaFundFlav[a, b], TFlav[a, b, c], epsAdjFlav[a, b, c],epsFundFlav[a, b, c]}];

TBOffDivergenceMessages[];
]
SetNf[]:=Module[{},
RemoveGroupTensor[flavor];

Unprotect[Nf];
ClearAll[Nf];
AddFormTracerGroup[{flavor,SUNfund,Nf}];

TBOnDivergenceMessages[];
]
SetNf[i_]:=Print["Can only set flavor group number to 2 or 3; to set it to Nf, use SetNf[]"]


SetNc[3]:=Module[{},
RemoveGroupTensor[color];

Unprotect[Nc];
ClearAll[Nc];
Nc=3;
Protect[Nc];

AddGroupTensors[{FormTracer`SU3fundexplicit, {color,3}, deltaAdjCol[a, b], FCol[a, b, c], deltaFundCol[a, b], TCol[a, b, c],epsAdjCol[a, b, c], epsFundCol[a, b, c]}];

TBOffDivergenceMessages[];
]
SetNc[2]:=Module[{},
RemoveGroupTensor[color];

Unprotect[Nc];
ClearAll[Nc];
Nc=2;
Protect[Nc];

AddGroupTensors[{FormTracer`SU2fundexplicit, {color,2}, deltaAdjCol[a, b], FCol[a, b, c], deltaFundCol[a, b], TCol[a, b, c],epsAdjCol[a, b, c], epsFundCol[a, b, c]}];

TBOffDivergenceMessages[];
]
SetNc[]:=Module[{},
RemoveGroupTensor[color];

Unprotect[Nc];
ClearAll[Nc];
Protect[Nc];

AddFormTracerGroup[{color,SUNfund,Nc}];

TBOnDivergenceMessages[];
]
SetNc[i_]:=Print["Can only set color group number to 2 or 3; to set it to Nc, use SetNc[]"]


GetFormTracerGroupConstants[]:=Module[{},
Return[FormTracer`Private`groupConstantsTable[[All,1]]];
];
GetFormTracerGroupConstant[name_Symbol]:=Module[{idx},
idx=Position[GetFormTracerGroups[],name][[1,1]];
Return[GetFormTracerGroupConstants[][[idx]]]
]


MakeConstant[name_Symbol]:=Module[{stripped},
Return[Symbol[SymbolName[name]]];
]
MakeConstant[number_Integer]:=number;


AddFormTracerGroup[{ingroupName_Symbol,inkind_Symbol,inconstant_}]:=Module[
{
groupName,kind,constant,args,
a,b,c
},

groupName=Symbol[SymbolName[ingroupName]];
kind=Symbol["FormTracer`"~~SymbolName[inkind]];
constant=Evaluate[Global`MakeConstant[inconstant]];

If[groupName===color,
Unprotect[color,Nc];
If[Not@FormTracerGroupExistsQ[color],
ClearAll[color];
Print["\!\(\*
StyleBox[\"Group\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"with\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"name\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"color\",\nFontSize->10,\nFontColor->RGBColor[0.5, 0, 0.5]]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"undefined\",\nFontSize->10]\)\!\(\*
StyleBox[\",\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"using\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"default\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"names\",\nFontSize->10]\)\!\(\*
StyleBox[\".\",\nFontSize->10]\)"];
If[IntegerQ[Nc]&&2<=Nc<=3,Print["Nc is set to ", Nc],
ClearAll[Nc]];
AddGroupTensors[{FormTracer`SUNfund, {color,Global`Nc}, deltaAdjCol[a, b], FCol[a, b, c], deltaFundCol[a, b], TCol[a, b, c],epsAdjCol[a, b, c], epsFundCol[a, b, c]}];
];
Protect[color,Nc];
Return[];
];

If[groupName===flavor,
Unprotect[flavor,Nf];
If[Not@FormTracerGroupExistsQ[flavor],
ClearAll[flavor];
Print["\!\(\*
StyleBox[\"Group\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"with\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"name\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"flavor\",\nFontSize->10,\nFontColor->RGBColor[0.5, 0, 0.5]]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"undefined\",\nFontSize->10]\)\!\(\*
StyleBox[\",\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"using\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"default\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"names\",\nFontSize->10]\)\!\(\*
StyleBox[\".\",\nFontSize->10]\)"];
If[IntegerQ[Nf]&&2<=Nf<=3,Print["Nc is set to ", Nc],
ClearAll[Nf]];
AddGroupTensors[{FormTracer`SUNfund, {flavor,Global`Nf}, deltaAdjFlav[a, b], FFlav[a, b, c], deltaFundFlav[a, b], TFlav[a, b, c], epsAdjFlav[a, b, c],epsFundFlav[a, b, c]}];
];
Protect[flavor,Nf];
Return[];
];

Unprotect[Evaluate[groupName]];
If[Not@FormTracerGroupExistsQ[groupName],
ClearAll[Evaluate[groupName]];
Print["\!\(\*
StyleBox[\"Group\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"with\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"name\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)"~~ToString[Style[ToString[groupName],Purple]]~~"\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"undefined\",\nFontSize->10]\)\!\(\*
StyleBox[\",\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"using\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"default\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"names\",\nFontSize->10]\)\!\(\*
StyleBox[\".\",\nFontSize->10]\)"];
If[IntegerQ[constant]&&2<=constant<=3,Print["Group constant is set to ", constant],
Unprotect[Evaluate[constant]];ClearAll[Evaluate[constant]]];
args={kind, {groupName,constant}, deltaAdj[groupName,a, b], F[groupName,a, b, c], deltaFund[groupName,a, b], T[groupName,a, b, c],epsAdj[groupName,a, b, c], epsFund[groupName,a, b, c]};
AddGroupTensors@args;
];
If[Not@IntegerQ[constant],Protect[constant]];
Protect[Evaluate[groupName]];
];


If[Length[Normal[FormTracer`Private`lorentzTensorReplacementRulesInput]]==0,
Print["\!\(\*
StyleBox[\"Lorentz\",\nFontSize->10,\nFontColor->RGBColor[0.5, 0, 0.5]]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"group\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"undefined\",\nFontSize->10]\)\!\(\*
StyleBox[\",\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"using\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"default\",\nFontSize->10]\)\!\(\*
StyleBox[\" \",\nFontSize->10]\)\!\(\*
StyleBox[\"names\",\nFontSize->10]\)\!\(\*
StyleBox[\".\",\nFontSize->10]\)"];
Module[{dirty},
dirty=Select[{"Global`p","Global`mu","Global`q","Global`nu","Global`i","Global`j","Global`k"},
(NameQ[#]&&(OwnValues[#]=!={}||DownValues[#]=!={}))&];
If[dirty=!={},
Print["TensorBases: cleared prior Global definitions on ",dirty," so the Lorentz-group fallback can register them as FORM vectors/indices. Restart the kernel and load TensorBases first if this surprises you."];
Quiet[Unprotect@@dirty];
ClearAll@@dirty;];];
DefineLorentzTensors[deltaLorentz[mu, nu], vec[p, mu], sp[p, q], epsLorentz[i, j, k], deltaDirac[i, j], gamma[mu, i, j], gamma5[i, j], vecs[p, mu], sps[p, q]];
];


TBInsertOutputNaming[expr_]:=Module[
{outputRulesLorentzTensors,outputRulesGroupTensors,outputRules},

outputRulesLorentzTensors=Normal[FormTracer`Private`lorentzTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["Global`TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c]:>b)};
outputRulesGroupTensors=Normal[FormTracer`Private`groupTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["Global`TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c]:>b)};
outputRules=Join[outputRulesLorentzTensors,outputRulesGroupTensors];

Return[expr//.outputRules];
];


TBInsertLorentzNames[expr_]:=Module[
{outputNameRulesLorentzTensors},
outputNameRulesLorentzTensors=Normal[FormTracer`Private`lorentzTensorReplacementRulesOutput]/.{(a_[c___]:>b_[d___]):>(Symbol["Global`TB"~~StringSplit[ToString[a],"FTx"][[-1]]]:>b)};
Return[Evaluate[expr//.outputNameRulesLorentzTensors]];
]


Unprotect[UseLorentzLinearity,UseLorentzLinearitySP,UseLorentzLinearityVec];


UseLorentzLinearitySP[expr_]:=Module[{eval,conv=TBInsertLorentzNames},
SetAttributes[Evaluate[conv[TBsps]],Orderless];
SetAttributes[Evaluate[conv[TBsp]],Orderless];

conv[TBsp][0,a_]=0;
conv[TBsp][a_,0]=0;
conv[TBsp][0,0]=0;

conv[TBsps][0,a_]=0;
conv[TBsps][a_,0]=0;
conv[TBsps][0,0]=0;

conv[TBsp][a_,b_+c_]:= conv[TBsp][a,b]+conv[TBsp][a,c];
conv[TBsp][a_,-1b_]:= -conv[TBsp][a,b];
conv[TBsp][b_,a_?NumericQ c_]:= a conv[TBsp][b,c];

conv[TBsps][a_,b_+c_]:= conv[TBsps][a,b]+conv[TBsps][a,c];
conv[TBsps][a_,-1b_]:= -conv[TBsps][a,b];
conv[TBsps][b_,a_?NumericQ c_]:= a conv[TBsps][b,c];

eval=Evaluate[expr];
ClearAll[
Evaluate[conv[TBsps]],
Evaluate[conv[TBsp]]
];
Return[eval];
];


UseLorentzLinearityVec[expr_]:=Module[{eval,conv=TBInsertLorentzNames},
conv[TBvec][0,mu_]=0;

conv[TBvecs][0,mu_]=0;
conv[TBvecs][p_,0]=0;

conv[TBvec][p_+q_,mu_]:=conv[TBvec][p,mu]+conv[TBvec][q,mu];
conv[TBvec][-1 p_,mu_]:= -conv[TBvec][p,mu];
conv[TBvec][n_?NumericQ a_,mu_]:=n conv[TBvec][a,mu];

conv[TBvecs][p_+q_,mu_]:=conv[TBvecs][p,mu]+conv[TBvecs][q,mu];
conv[TBvecs][-1 p_,mu_]:= -conv[TBvecs][p,mu];
conv[TBvecs][n_?NumericQ a_,mu_]:=n conv[TBvecs][a,mu];

eval=Evaluate[expr];
ClearAll[
Evaluate[conv[TBvec]],
Evaluate[conv[TBvecs]]
];
Return[eval];
];


UseLorentzLinearity[expr_]:=UseLorentzLinearitySP[UseLorentzLinearityVec[expr]];

Protect[UseLorentzLinearity,UseLorentzLinearitySP,UseLorentzLinearityVec];
