(* ::Package:: *)

(* ::Title:: *)
(*Basis auto-definition: checks and object construction*)

TBCheck[BasisName_String,Trait_String,f_]:=f[Symbol["TB"~~Trait][BasisName]];
TBCheckBasisDefinitions[BasisName_String]:=Module[{errorPrefix},
errorPrefix="AutoDefineBasis:"~~BasisName~~": ";
If[Not@TBCheck[BasisName,"AutoDefine",#===True&],Return[False];];
If[Not@TBCheck[BasisName,"Vertex",ListQ],TBPrint[errorPrefix~~"Vertex definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"VertexStructure",Head[#]=!=TBVertexStructure&],TBPrint[errorPrefix~~"Vertex structure missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Comment",StringQ],TBPrint[errorPrefix~~"Comment definition missing!",2];TBComment[BasisName]=""];
If[Not@TBCheck[BasisName,"Author",StringQ],TBPrint[errorPrefix~~"Author definition missing!",2];TBAuthor[BasisName]=""];
If[Not@TBCheck[BasisName,"VertexBasis",BooleanQ],TBPrint[errorPrefix~~"VertexBasis setting missing, setting to False!",2];TBVertexBasis[BasisName]=False];
If[Not@TBCheck[BasisName,"MomentumConservation",ListQ],TBPrint[errorPrefix~~"Momentum conservation missing!",2];TBMomentumConservation[BasisName]={}];
If[Not@TBCheck[BasisName,"Usage",Head[#]=!=TBUsage&],TBPrint[errorPrefix~~"Usage definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Indices",ListQ],TBPrint[errorPrefix~~"Indices definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Basis",ListQ],TBPrint[errorPrefix~~"Basis definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"InnerProduct",Head[#]=!=TBInnerProduct&],TBPrint[errorPrefix~~"InnerProduct definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"CanonicalProduct",Head[#]=!=TBCanonicalProduct&],TBPrint[errorPrefix~~"CanonicalProduct definition missing! Some functions may/will break.",1]];
If[Not@TBCheck[BasisName,"Replacements",ListQ],TBPrint[errorPrefix~~"Replacements definition missing!",2];TBReplacements[BasisName]={}];
Return[True];
];

TBCheckVertexBasisDefinitions[BasisName_String]:=Module[{errorPrefix},
errorPrefix="AutoDefineBasis:"~~BasisName~~": ";
If[Not@TBCheck[BasisName,"AutoDefine",#===True&],Return[False];];
If[Not@TBCheck[BasisName,"Vertex",ListQ],TBPrint[errorPrefix~~"Vertex definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Comment",StringQ],TBPrint[errorPrefix~~"Comment definition missing!",2];TBComment[BasisName]=""];
If[Not@TBCheck[BasisName,"Author",StringQ],TBPrint[errorPrefix~~"Author definition missing!",2];TBAuthor[BasisName]=""];
If[Not@TBCheck[BasisName,"MomentumConservation",ListQ],TBPrint[errorPrefix~~"Momentum conservation missing!",2];TBMomentumConservation[BasisName]={}];
If[Not@TBCheck[BasisName,"VertexBasis",BooleanQ],TBPrint[errorPrefix~~"VertexBasis setting missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Usage",Head[#]=!=TBUsage&],TBPrint[errorPrefix~~"Usage definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Indices",ListQ],TBPrint[errorPrefix~~"Indices definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Basis",ListQ],TBPrint[errorPrefix~~"Basis definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"CanonicalProduct",Head[#]=!=TBCanonicalProduct&],TBPrint[errorPrefix~~"CanonicalProduct definition missing!",0];Abort[]];
If[Not@TBCheck[BasisName,"Replacements",ListQ],TBPrint[errorPrefix~~"Replacements definition missing!",2];TBReplacements[BasisName]={}];
Return[True];
];

TBCheckRequirements[BasisName_String]:=Module[{errorPrefix,toString,groups},
errorPrefix="AutoDefineBasis:"~~BasisName~~": ";
If[Not@TBCheck[BasisName,"RequiredGroups",ListQ],Print[errorPrefix,"RequiredGroups definition missing!"];Abort[]];
toString[a_Symbol]:=SymbolName[a];
toString[a_]:=ToString[a];
groups=Map[toString,TBRequiredGroups[BasisName],{2}];
TBPrint["Basis "~~BasisName~~" requires "~~ToString[groups],1];
GlobalContext[Map[Global`AddFormTracerGroup,TBRequiredGroups[BasisName]]];
Return[True];
];


chooseMap[obj_]:=If[ByteCount[obj]>30000,ParallelMap,Map];
chooseMap[size_Integer]:=If[size>8,ParallelMap,Map];

chooseTable[obj_]:=If[ByteCount[obj]>30000,ParallelTable,Table];
chooseTable[size_Integer]:=If[size>8,ParallelTable,Table];


TBMakeBasis[BasisName_String]:=Module[
{rawBasis=TBBasis[BasisName],momentumConservation},

momentumConservation=InsertOutputNaming[TBMomentumConservation[BasisName]];

Return[FullSimplify@(InsertOutputNaming[rawBasis]//.momentumConservation)];
];

TBBasisLength[BasisName_String]:=TBBasis[BasisName]//Length;


TBEvaluateBasisElement[BasisName_String,n_Integer,indices___]:=Module[{rawBasisElement,idxList,originalIndices,newIndices,replacements},
If[n>TBInternal[BasisName,"Length"]||n<1,Print[n," is outside of range [1,"~~ToString[TBInternal[BasisName,"Length"]]~~"] for basis "~~BasisName];Abort[]];

fixIndices[expr_]:=Module[{closedIndices,IndexReplacements},
closedIndices=FormTracer`GetClosedIndices[InsertOutputNaming@TBInternal[BasisName,"Basis"][[n]]];
IndexReplacements:=Thread[closedIndices->Map[TBUnique,closedIndices]];
Return[expr//.IndexReplacements];
];

rawBasisElement=InsertOutputNaming@TBInternal[BasisName,"Basis"][[n]]//fixIndices;

idxList=MakeIndexList[TBInternal[BasisName,"Indices"]//Length,indices];
originalIndices=Flatten[TBInternal[BasisName,"Indices"]];
newIndices=Flatten[idxList];
replacements=Thread[originalIndices->newIndices];
rawBasisElement=rawBasisElement/.replacements;

Return[rawBasisElement]
];


TBMakeInnerProduct[BasisName_String]:=Module[
{Indices,product,operator},
Indices=TBInternal[BasisName,"Indices"];

product=If[TBVertexBasis[BasisName]===True,
TBCanonicalProduct[BasisName]/.Tensor1[a___]:>Tensor1@@Map[Indices[[#]]&,{a}],
TBInnerProduct[BasisName]/.Tensor1[a___]:>Tensor1@@Map[Indices[[#]]&,{a}]
];
product=product/.Tensor2[a___]:>Tensor2@@Map[Indices[[#]]&,{a}];

operator[t1_,i_,t2_,j_]:=Module[{},
Return[product/.Tensor1[indices___]:>t1[BasisName,i,indices]/.Tensor2[indices___]:>t2[BasisName,j,indices]];
];

Return[operator]
];


TBMakeCanonicalProduct::canonical="The canonical products of the given bases \"`1`\" and \"`2`\" do not agree.";
TBMakeCanonicalProduct::noProduct="The canonical product for the basis \"`1`\" has not been defined!";

TBMakeCanonicalProduct[BasisName1_String,BasisName2_String]:=Module[
{Indices1,Indices2,product,operator},
Indices1=TBInternal[BasisName1,"Indices"];
Indices2=TBInternal[BasisName2,"Indices"];

If[(Head[Evaluate[TBCanonicalProduct[BasisName1]]]===TBCanonicalProduct)||(TBCanonicalProduct[BasisName1]===Null),
Message[TBMakeCanonicalProduct::noProduct,BasisName1];Abort[]];
If[TBCanonicalProduct[BasisName1]=!=TBCanonicalProduct[BasisName1],
Message[TBMakeCanonicalProduct::canonical,BasisName1,BasisName2];Abort[]];

product=TBCanonicalProduct[BasisName1]/.Tensor1[a___]:>Tensor1@@Map[Indices1[[#]]&,{a}];
product=product/.Tensor2[a___]:>Tensor2@@Map[Indices2[[#]]&,{a}];

operator[t1_,i_,t2_,j_]:=Module[{},
Return[product/.Tensor1[indices___]:>t1[BasisName1,i,indices]/.Tensor2[indices___]:>t2[BasisName2,j,indices]];
];

Return[operator]
];


TBMakeCanonicalProduct[BasisName_String]:=Module[
{Indices,product,operator},
Indices=TBInternal[BasisName,"Indices"];

product=TBCanonicalProduct[BasisName]/.Tensor1[a___]:>Tensor1@@Map[Indices[[#]]&,{a}];
product=product/.Tensor2[a___]:>Tensor2@@Map[Indices[[#]]&,{a}];

operator[t1_,i_,t2_,j_]:=Module[{},
If[
(Head[Evaluate[TBCanonicalProduct[BasisName]]]===TBCanonicalProduct)||(TBCanonicalProduct[BasisName]===Null),
Print["The canonical product for the basis \""<>BasisName<>"\" has not been defined!"];Abort[]];
Return[product/.Tensor1[indices___]:>t1[BasisName,i,indices]/.Tensor2[indices___]:>t2[BasisName,j,indices]];
];

Return[operator]
];


TBMakeVertices[BasisName_String]:=Module[
{Indices=TBInternal[BasisName,"Indices"],vertices,
rawBasis=TBBasis[BasisName],momentumConservation},

If[TBVertexBasis[BasisName]===True,
momentumConservation=InsertOutputNaming[TBMomentumConservation[BasisName]];
Return[FullSimplify@(InsertOutputNaming[rawBasis]//.momentumConservation)];
];

vertices=TBVertexStructure[BasisName]/.Tensor[a___]:>Tensor@@Map[Indices[[#]]&,{a}];

vertices=chooseMap[TBInternal[BasisName,"Length"]][
FullSimplify[vertices/.Tensor[indices___]:>TBEvaluateBasisElement[BasisName,#,indices]]&,
Table[i,{i,1,TBInternal[BasisName,"Length"]}]
];

Return[vertices];
];


TBEvaluateVertex[BasisName_String,n_Integer,indices___]:=Module[{rawVertex,idxList,originalIndices,newIndices,replacements},
If[n>TBInternal[BasisName,"Length"]||n<1,
Print[n," is outside of range [1,"~~ToString[TBInternal[BasisName,"Length"]]~~"] for basis "~~BasisName];Abort[]];

fixIndices[expr_]:=Module[{closedIndices,IndexReplacements},
closedIndices=FormTracer`GetClosedIndices[InsertOutputNaming@TBInternal[BasisName,"Vertices"][[n]]];
IndexReplacements:=Thread[closedIndices->Map[TBUnique,closedIndices]];
Return[expr//.IndexReplacements];
];

rawVertex=InsertOutputNaming@TBInternal[BasisName,"Vertices"][[n]]//fixIndices;

idxList=MakeIndexList[TBInternal[BasisName,"Indices"]//Length,indices];
originalIndices=Flatten[TBInternal[BasisName,"Indices"]];
newIndices=Flatten[idxList];
replacements=Thread[originalIndices->newIndices];
rawVertex=rawVertex/.replacements;

Return[rawVertex]
];


TBBuildMetric[BasisName_String]:=Module[
{metric,momentumConservation},

momentumConservation=InsertOutputNaming[TBMomentumConservation[BasisName]];

If[TBVertexBasis[BasisName]===True,
metric=Table[
TBFormTrace[
TBInternal[BasisName,"InnerProduct"][
TBEvaluateVertex,i,
TBEvaluateVertex,j
]//.momentumConservation
]//.momentumConservation//.TBInternal[BasisName,"Replacements"]//Global`UseLorentzLinearity
,{i,1,TBInternal[BasisName,"Length"]},{j,1,TBInternal[BasisName,"Length"]}];

metric=chooseMap[metric][FullSimplify,metric];

Return[metric]
];

metric=Table[
TBFormTrace[
TBInternal[BasisName,"InnerProduct"][
TBEvaluateBasisElement,i,
TBEvaluateBasisElement,j
]//.momentumConservation
]//.momentumConservation//.TBInternal[BasisName,"Replacements"]//Global`UseLorentzLinearity
,{i,1,TBInternal[BasisName,"Length"]},{j,1,TBInternal[BasisName,"Length"]}];

metric=chooseMap[metric][FullSimplify,metric];

Return[metric]
];


TBBuildInverseMetric[BasisName_String]:=Module[
{det,inverseMetric},
det=FullSimplify[Det[TBInternal[BasisName,"Metric"]]];

If[det===0,
Print["AutoDefineBasis:"~~BasisName~~": Basis is overcomplete! Determinand is "~~ToString[det]~~""];Abort[];];

inverseMetric=Simplify[Inverse[TBInternal[BasisName,"Metric"]]];

Return[inverseMetric]
];


TBBuildProjectors[BasisName_String]:=Module[
{projectors,i,j},

If[TBVertexBasis[BasisName]===True,
projectors=chooseTable[TBInternal[BasisName,"Length"]][
Simplify[
Sum[TBInternal[BasisName,"InverseMetric"][[i,j]]TBEvaluateVertex[BasisName,j,TBInternal[BasisName,"Indices"]],{j,1,TBInternal[BasisName,"Length"]}]//.TBInternal[BasisName,"Replacements"]
],
{i,1,TBInternal[BasisName,"Length"]}
];

Return[projectors]
];

projectors=chooseTable[TBInternal[BasisName,"Length"]][
Simplify[
Sum[TBInternal[BasisName,"InverseMetric"][[i,j]]TBEvaluateBasisElement[BasisName,j,TBInternal[BasisName,"Indices"]],{j,1,TBInternal[BasisName,"Length"]}]//.TBInternal[BasisName,"Replacements"]
],
{i,1,TBInternal[BasisName,"Length"]}
];

Return[projectors]
];


TBEvaluateProjector[BasisName_String,n_Integer,indices___]:=Module[{rawProjector,idxList,originalIndices,newIndices,replacements},
If[n>TBInternal[BasisName,"Length"]||n<1,
Print[n," is outside of range [1,"~~ToString[TBInternal[BasisName,"Length"]]~~"] for basis "~~BasisName];Abort[]];

fixIndices[expr_]:=Module[{closedIndices,IndexReplacements},
closedIndices=FormTracer`GetClosedIndices[InsertOutputNaming@TBInternal[BasisName,"Projectors"][[n]]];
IndexReplacements:=Thread[closedIndices->Map[TBUnique,closedIndices]];
Return[expr//.IndexReplacements];
];

rawProjector=InsertOutputNaming@TBInternal[BasisName,"Projectors"][[n]]//fixIndices;

idxList=MakeIndexList[TBInternal[BasisName,"Indices"]//Length,indices];
originalIndices=Flatten[TBInternal[BasisName,"Indices"]];
newIndices=Flatten[idxList];
replacements=Thread[originalIndices->newIndices];
rawProjector=rawProjector/.replacements;

Return[rawProjector]
];

