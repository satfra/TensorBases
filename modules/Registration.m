(* ::Package:: *)

(* ::Title:: *)
(*Getter registration, documentation and TBAutoDefineBasis*)

TBUnDefineTBGetBasisElement[BasisName_String]:=Module[{},
TBGetBasisElement[BasisName,n_Integer,indices___]:=Module[{},
Print[BasisName~~" is a Vertex basis - no basis elements are available!"];Abort[];
];
TBGetBasisElement[BasisName,n_Integer]:=Module[{},
Print[BasisName~~" is a Vertex basis - no basis elements are available!"];Abort[];
];
TBGetBasisElement[BasisName,All,indices___]:=Module[{},
Print[BasisName~~" is a Vertex basis - no basis elements are available!"];Abort[];
];
TBGetBasisElement[BasisName,All]:=Module[{},
Print[BasisName~~" is a Vertex basis - no basis elements are available!"];Abort[];
];
];


TBDefineTBGetBasisElement[BasisName_String]:=Module[{},
TBGetBasisElement[BasisName,n_Integer,indices___]:=Module[{},
Return[
InsertOutputNaming[
TBEvaluateBasisElement[BasisName,n,indices]
]
];
];
TBGetBasisElement[BasisName,n_Integer]:=Module[{},
Return[
InsertOutputNaming[
(TBEvaluateBasisElement[BasisName,n,##]&)@@TBInternal[BasisName,"Indices"]
]
];
];
TBGetBasisElement[BasisName,All,indices___]:=Module[{},
Return[
TBGetBasisElement[BasisName,#,indices]&/@Range[TBInternal[BasisName,"Length"]]
];
];
TBGetBasisElement[BasisName,All]:=Module[{},
Return[
TBGetBasisElement[BasisName,#]&/@Range[TBInternal[BasisName,"Length"]]
];
];
];
TBDefineTBGetVertex[BasisName_String]:=Module[{},
TBGetVertex[BasisName,n_Integer,indices___]:=Module[{},
Return[
InsertOutputNaming[
TBEvaluateVertex[BasisName,n,indices]
]
];
];
TBGetVertex[BasisName,n_Integer]:=Module[{},
Return[
InsertOutputNaming[
TBEvaluateVertex[BasisName,n,##]&@@TBInternal[BasisName,"Indices"]
]
];
];
TBGetVertex[BasisName,All,indices___]:=Module[{},
Return[
TBGetVertex[BasisName,#,indices]&/@Range[TBInternal[BasisName,"Length"]]
];
];
TBGetVertex[BasisName,All]:=Module[{},
Return[
TBGetVertex[BasisName,#]&/@Range[TBInternal[BasisName,"Length"]]
];
];
];
TBDefineTBGetMetric[BasisName_String]:=Module[{},
TBGetMetric[BasisName]:=Module[{},
Return[
InsertOutputNaming[
TBInternal[BasisName,"Metric"]
]
];
];
];
TBDefineTBGetInnerProduct[BasisName_String]:=Module[{},
TBGetInnerProduct[BasisName]:=Module[{},
Return[
TBInternal[BasisName,"InnerProduct"]
];
];
];
TBDefineTBGetCanonicalProduct[BasisName_String]:=Module[{},
TBGetCanonicalProduct[BasisName]:=Module[{},
Return[
TBInternal[BasisName,"CanonicalProduct"]
];
];
];
TBUnDefineTBGetInnerProduct[BasisName_String]:=Module[{},
TBGetInnerProduct[BasisName]:=Module[{},
Print[BasisName~~" is a Vertex basis - no inner product is available!"];Abort[];
];
];
TBDefineTBGetInverseMetric[BasisName_String]:=Module[{},
TBGetInverseMetric[BasisName]:=Module[{},
Return[
InsertOutputNaming[
TBInternal[BasisName,"InverseMetric"]
]
];
];
];
TBDefineTBGetProjector[BasisName_String]:=Module[{},
TBGetProjector[BasisName,n_Integer,indices___]:=Module[{},
Return[
InsertOutputNaming[
TBEvaluateProjector[BasisName,n,indices]
]
];
];
TBGetProjector[BasisName,n_Integer]:=Module[{},
Return[
InsertOutputNaming[
TBEvaluateProjector[BasisName,n,##]&@@TBInternal[BasisName,"Indices"]
]
];
];
TBGetProjector[BasisName,All,indices___]:=Module[{},
Return[
TBGetProjector[BasisName,#,indices]&/@Range[TBInternal[BasisName,"Length"]]
];
];
TBGetProjector[BasisName,All]:=Module[{},
Return[
TBGetProjector[BasisName,#]&/@Range[TBInternal[BasisName,"Length"]]
];
];
];


TBDefineTBInfo[BasisName_String]:=Module[{},
TBInfo[BasisName]:=Module[{},
Print@@TBUsage[BasisName];
];
];


TBAvailableBasisNames={};
TBBasisDocs={};
TBAddBasisDocumentation[BasisName_String]:=Module[{toString},
toString[a_Symbol]:=SymbolName[a];
toString[a_]:=ToString[a];

If[MemberQ[TBAvailableBasisNames,BasisName],Print["WARNING: TBAddBasisDocumentation: Possible doubling of bases detected!"];Return[]];
TBAvailableBasisNames=Append[TBAvailableBasisNames,BasisName];
TBBasisDocs=Append[TBBasisDocs,
<|
"Name"->BasisName,
"Vertex"->InsertOutputNaming@TBVertex[BasisName],
"Indices"->TBInternal[BasisName,"Indices"],
"Groups"->Map[toString,TBRequiredGroups[BasisName],{2}],
(* Vertex bases carry no inner product (TBCheckVertexBasisDefinitions never
   requires one), so reading the symbol unconditionally would store the
   unevaluated TBInnerProduct["name"] as the documented value. *)
"InnerProduct"->If[Head[Evaluate[TBInnerProduct[BasisName]]]===TBInnerProduct,
None,
Style[GlobalContext[StringReplace[ToString[InsertOutputNaming[TBInnerProduct[BasisName]]],{a:DigitCharacter~~" "~~b:LetterCharacter:>a~~" "~~b," "->"","]"->"] "}]],FontSize->10]],
"Comment"->TBComment[BasisName],
"Author"->TBAuthor[BasisName]
|>
];
];


TBList[]:=TBAvailableBasisNames;
TBBasisExists[BasisName_]:=MemberQ[TBAvailableBasisNames,BasisName];


TBAutoDefineTensorBasis[BasisName_String,folderPrefix_String:TBDirectory<>"cache"]:=Module[
{errorPrefix,check},
TBPrint["\n-------------------------------\n",1];

check=TBCheckBasisDefinitions[BasisName];
check=check&&TBCheckRequirements[BasisName];

If[Not@check,TBPrint["Skipping processing of "~~BasisName~~".",1];Return[]];
TBPrint["Processing Tensor basis "~~BasisName~~".",1];

TBInternal[BasisName,"Replacements"]=InsertOutputNaming[TBReplacements[BasisName]];
TBInternal[BasisName,"Indices"]=InsertOutputNaming[TBIndices[BasisName]];
TBInternal[BasisName,"Basis"]=AutoSaveRestore[BasisName~~"/basis",
TBPrint[BasisName~~": Making Basis...",2];
TBMakeBasis[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"Length"]=TBBasisLength[BasisName];
TBInternal[BasisName,"InnerProduct"]=TBMakeInnerProduct[BasisName];
TBInternal[BasisName,"CanonicalProduct"]=TBMakeCanonicalProduct[BasisName];
TBInternal[BasisName,"Vertices"]=AutoSaveRestore[BasisName~~"/vertices",
TBPrint[BasisName~~": Calculating Vertices...",2];
TBMakeVertices[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"Metric"]=AutoSaveRestore[BasisName~~"/metric",
TBPrint[BasisName~~": Calculating Metric...",2];
TBBuildMetric[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"InverseMetric"]=AutoSaveRestore[BasisName~~"/inverseMetric",
TBPrint[BasisName~~": Calculating InverseMetric...",2];
TBBuildInverseMetric[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"Projectors"]=AutoSaveRestore[BasisName~~"/projectors",
TBPrint[BasisName~~": Calculating Projectors...",2];
TBBuildProjectors[BasisName]//InsertInputNaming,
folderPrefix
];

TBDefineTBGetBasisElement[BasisName];
TBDefineTBGetVertex[BasisName];
TBDefineTBGetMetric[BasisName];
TBDefineTBGetInnerProduct[BasisName];
TBDefineTBGetCanonicalProduct[BasisName];
TBDefineTBGetInverseMetric[BasisName];
TBDefineTBGetProjector[BasisName];
TBDefineTBInfo[BasisName];

TBAddBasisDocumentation[BasisName];

TBPrint[BasisName~~": done.",1];
]


TBAutoDefineVertexBasis[BasisName_String,folderPrefix_String:TBDirectory<>"cache"]:=Module[
{errorPrefix,check},
TBPrint["\n-------------------------------\n",1];

check=TBCheckVertexBasisDefinitions[BasisName];
check=check&&TBCheckRequirements[BasisName];

If[Not@check,TBPrint["Skipping processing of "~~BasisName~~".",1];Return[]];
TBPrint["Processing Vertex basis "~~BasisName~~".",1];

TBInternal[BasisName,"Replacements"]=InsertOutputNaming[TBReplacements[BasisName]];
TBInternal[BasisName,"Indices"]=InsertOutputNaming[TBIndices[BasisName]];
TBInternal[BasisName,"Length"]=TBBasisLength[BasisName];
TBInternal[BasisName,"InnerProduct"]=TBMakeInnerProduct[BasisName];
TBInternal[BasisName,"CanonicalProduct"]=TBMakeCanonicalProduct[BasisName];
TBInternal[BasisName,"Vertices"]=AutoSaveRestore[BasisName~~"/vertices",
TBPrint[BasisName~~": Calculating Vertices...",2];
TBMakeVertices[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"Metric"]=AutoSaveRestore[BasisName~~"/metric",
TBPrint[BasisName~~": Calculating Metric...",2];
TBBuildMetric[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"InverseMetric"]=AutoSaveRestore[BasisName~~"/inverseMetric",
TBPrint[BasisName~~": Calculating InverseMetric...",2];
TBBuildInverseMetric[BasisName]//InsertInputNaming,
folderPrefix
];
TBInternal[BasisName,"Projectors"]=AutoSaveRestore[BasisName~~"/projectors",
TBPrint[BasisName~~": Calculating Projectors...",2];
TBBuildProjectors[BasisName]//InsertInputNaming,
folderPrefix
];

TBUnDefineTBGetBasisElement[BasisName];
TBDefineTBGetVertex[BasisName];
TBDefineTBGetMetric[BasisName];
TBUnDefineTBGetInnerProduct[BasisName];
TBDefineTBGetCanonicalProduct[BasisName];
TBDefineTBGetInverseMetric[BasisName];
TBDefineTBGetProjector[BasisName];
TBDefineTBInfo[BasisName];

TBAddBasisDocumentation[BasisName];

TBPrint[BasisName~~": done.",1];
]


TBAutoDefineBasis[BasisDefinitionFile_String,folderPrefix_String:TBDirectory<>"cache"]:=Module[
{BasisName=GetBasisName[BasisDefinitionFile],oldDirectory,errorPrefix,check,contents},

oldDirectory=Directory[];
SetDirectory[DirectoryName[BasisDefinitionFile]];
Import[FileNameTake[BasisDefinitionFile,-1]];
SetDirectory[oldDirectory];

If[TBVertexBasis[BasisName]===True,
TBAutoDefineVertexBasis[BasisName,folderPrefix],
TBAutoDefineTensorBasis[BasisName,folderPrefix]
];
];


TBAutoDefineBasisNoLoad[BasisName_String,folderPrefix_String:TBDirectory<>"cache"]:=Module[
{},

If[TBVertexBasis[BasisName]===True,
TBAutoDefineVertexBasis[BasisName,folderPrefix],
TBAutoDefineTensorBasis[BasisName,folderPrefix]
];
];


Unprotect[TBInfo];
TBInfo[]:=Module[{data},
data=Map[{#["Name"],#["Vertex"],Grid[#["Indices"]],#["InnerProduct"],Grid[#["Groups"]],#["Comment"],#["Author"]}&,TBBasisDocs];
Grid[
Join[{{"Name","Vertex","Indices","Inner product","Groups","Comment","Author"}},data],
Dividers->{{2->True},{2->True}},
ItemStyle->Directive[FontSize->13],
Spacings->{1.5,1.5},
ItemSize->{{Scaled[0.2],Scaled[0.1],Scaled[0.1],Scaled[0.15],Scaled[0.1],Scaled[0.25],Scaled[0.1]}}
]//Print;
]


MakeInnerProduct[innerProduct_,IndicesList_List]:=Module[{fixIndices,product},

fixIndices[expr_]:=Module[{closedIndices,IndexReplacements},
closedIndices=FormTracer`GetClosedIndices[expr];
IndexReplacements:=Thread[closedIndices->Map[TBUnique,closedIndices]];
Return[expr//.IndexReplacements];
];

product[t1_,t2_]:=Module[{ten1,ten2,res},
ten1[indices__]:=fixIndices[t1]/.Thread[Flatten[IndicesList]->Flatten[{indices}]];
ten2[indices__]:=fixIndices[t2]/.Thread[Flatten[IndicesList]->Flatten[{indices}]];

res=innerProduct/.Tensor1[a__]:>Tensor1@@Map[IndicesList[[#]]&,{a}]/.Tensor2[a__]:>Tensor2@@Map[IndicesList[[#]]&,{a}];
res=res/.Tensor1:>ten1/.Tensor2:>ten2;

Return[res];
];

Return[product];
]
