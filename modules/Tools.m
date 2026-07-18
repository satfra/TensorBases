(* ::Package:: *)

(* ::Title:: *)
(*Tools: identity matrices, index sets, propagators*)

TBGetIdentityMatrix[BasisName_String]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

Return[
(TBGetIdentityMatrix[BasisName,##]&)@@TBInternal[BasisName,"Indices"]
];
];


TBGetIndexSet[BasisName_String,id_Integer,p_]:=Module[{indices},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];
If[id>Length[TBInternal[BasisName,"Indices"]],Print["Basis \""~~BasisName~~"\" has only "~~ToString[Length[TBInternal[BasisName,"Indices"]]]~~" elements!";]Abort[]];
indices=TBInternal[BasisName,"Indices"][[id]];
Return[
Join[{p},
Map[Unique[SymbolName[#]]&,indices[[2;;]]]
]
];
];
TBGetIndexSet[set_List,p_]:=Module[{},
Return[Join[{p},set[[2;;]]]];
];


TBGetIdentityMatrix[BasisName_String,indices___]:=Module[
{groups,diracIndices,lorentzIndices,fundIndices,adjIndices,
idxList,originalIndices,newIndices,replacements,
chooseDelta,deltas},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];
If[Length[TBInternal[BasisName,"Indices"]]=!=2,
Print["Can only create an identity matrix for two-point functions!"];Abort[]
];

groups=If[Length[Flatten@TBRequiredGroups[BasisName]]>0
,
Map[Symbol[SymbolName[#]]&,TBRequiredGroups[BasisName][[All,1]]]
,
{}
];

diracIndices=FormTracer`GetOpenDiracIndices[InsertOutputNaming@TBInternal[BasisName,"Vertices"][[1]]];
lorentzIndices=FormTracer`GetOpenLorentzIndices[InsertOutputNaming@TBInternal[BasisName,"Vertices"][[1]]];
fundIndices=Map[FormTracer`GetOpenFundGroupIndices[InsertOutputNaming@TBInternal[BasisName,"Vertices"][[1]],#]&,groups];
adjIndices=Map[FormTracer`GetOpenAdjGroupIndices[InsertOutputNaming@TBInternal[BasisName,"Vertices"][[1]],#]&,groups];

chooseDelta[i_,j_]:=Module[{idx},
If[MemberQ[diracIndices,i],
Return[TBdeltaDirac[i,j]];
];
If[MemberQ[lorentzIndices,i],
Return[TBdeltaLorentz[i,j]];
];
For[idx=1,idx<=Length[groups],idx++,
If[MemberQ[fundIndices[[idx]],i],
Return[TBdeltaFund[groups[[idx]],i,j]];
];
];
For[idx=1,idx<=Length[groups],idx++,
If[MemberQ[adjIndices[[idx]],i],
Return[TBdeltaAdj[groups[[idx]],i,j]];
];
];
];

originalIndices=TBInternal[BasisName,"Indices"];
idxList=MakeIndexList[TBInternal[BasisName,"Indices"]//Length,indices];
newIndices=Flatten[idxList];
replacements=Thread[Flatten[originalIndices]->newIndices];

deltas=Map[chooseDelta[#[[1]],#[[2]]]&,Transpose[originalIndices][[2;;]]];

Return[
Times@@deltas/.replacements//InsertOutputNaming
];
];


TBGetBasisSize[BasisName_String]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];
Return[Length[TBInternal[BasisName,"Vertices"]]];
];


TBGetBasisFields[BasisName_String]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];
Return[InsertOutputNaming@TBVertex[BasisName]];
];


exclusions[a_]:=And@@{a=!=List,a=!=Complex,a=!=Plus,a=!=Power}
GetAllSymbols[expr_]:=DeleteDuplicates@Cases[Flatten[{expr}//.Times[a_,b__]:>{a,b}/.a_Symbol[b__]/;exclusions[a]:>{a,b}],_Symbol,Infinity]


TBGetProjector[BasisName,i,idxSet2,idxSet1]


GetIdentityVector[BasisName_,p_]:=Module[{idxSet1,idxSet2},
idxSet1=TBGetIndexSet[BasisName,1,p];
idxSet2=TBGetIndexSet[BasisName,1,p];

Table[
TBFormTrace[
TBGetProjector[BasisName,i,idxSet2,idxSet1]TBGetIdentityMatrix[BasisName,idxSet1,idxSet2]
]//FullSimplify,
{i,1,TBGetBasisSize[BasisName]}
]//Return;
];


TBGetBasis[BasisName_String]:=Module[{},
Return[
TBGetBasis[BasisName,##]&@@TBInternal[BasisName,"Indices"]
];
];

TBGetBasis[BasisName_String,indices___]:=Module[{
idxList,originalIndices,newIndices,replacements,
rawBasis,fixIndices
},

fixIndices[expr_]:=Module[{closedIndices,IndexReplacements},
closedIndices=FormTracer`GetClosedIndices[InsertOutputNaming@expr];
IndexReplacements:=Thread[closedIndices->Map[TBUnique,closedIndices]];
Return[expr//.IndexReplacements];
];

originalIndices=TBInternal[BasisName,"Indices"];
idxList=MakeIndexList[TBInternal[BasisName,"Indices"]//Length,indices];
newIndices=Flatten[idxList];
replacements=Thread[Flatten[originalIndices]->newIndices];

rawBasis=Map[fixIndices,InsertOutputNaming@TBInternal[BasisName,"Basis"]];

Return[rawBasis//.replacements]
];


TBMakePropagator[BasisName_String,InvProp_List]:=Module[{
idxSet1,idxSet2,idxSet3,invPropR,
Prop,T2,T3,
projections,idvec,identities,solution,
makeList,b,A,p
},

p=TBInternal[BasisName,"Indices"][[1,1]];

idxSet1=TBGetIndexSet[BasisName,1,p];
idxSet2=TBGetIndexSet[BasisName,1,p];
idxSet3=TBGetIndexSet[BasisName,1,p];

invPropR=Map[Unique["a"]&,InvProp];

Prop=Table[Unique["v"<>ToString[i]],{i,1,TBGetBasisSize[BasisName]}];
FormTracer`AddExtraVars@@(GetAllSymbols[Prop]\[Union]GetAllSymbols[invPropR]);

T2=Table[TBGetVertex[BasisName,i,{p,idxSet2[[2;;]]},{-p,idxSet3[[2;;]]}],{i,1,TBGetBasisSize[BasisName]}];
T3=Table[TBGetVertex[BasisName,i,{-p,idxSet3[[2;;]]},{p,idxSet1[[2;;]]}],{i,1,TBGetBasisSize[BasisName]}];

idvec=GetIdentityVector[BasisName,p];

projections=Table[
TBFormTrace[
TBGetProjector[BasisName,i,{p,idxSet1[[2;;]]},{-p,idxSet2[[2;;]]}](Prop . T2) (invPropR . T3)//InsertInputNaming
]//FullSimplify
,{i,1,TBGetBasisSize[BasisName]}
];

makeList[expr_]:=If[Head[expr]===Plus,List@@expr,{expr}];

identities=Map[(#[[1]]==#[[2]])&,Transpose[{projections,idvec}]];
{b,A}=CoefficientArrays[identities,Prop];

solution=LinearSolve[A,-b];

Return[solution/.Thread[invPropR->InvProp]];
];

TBMakePropagator[BasisName_String,InvProp_List,p_]:=Module[{prop},
prop=TBMakePropagator[BasisName,InvProp];
Return[prop/.TBInternal[BasisName,"Indices"][[1,1]]:>p];
]


