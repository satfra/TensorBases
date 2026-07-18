(* ::Package:: *)

(* ::Title:: *)
(*Cache clearing and load-time basis processing*)

ClearCache[BasisDefinitionFile_String]:=Module[{BasisName=GetBasisName[BasisDefinitionFile]},
If[Global`TBRebuildCache===True,
TBPrint["Removing cache in "~~TBDirectory~~"cache/"~~BasisName~~"/",1];
DeleteDirectory[TBDirectory~~"cache/"~~BasisName~~"/",DeleteContents->True]//Quiet;
];
];


ProcessBases[]:=Module[{startTime,endTime},
startTime=AbsoluteTime[];
TBPrint["\n\n  \!\(\*
StyleBox[\"Started\",\nFontSize->14]\)\!\(\*
StyleBox[\" \",\nFontSize->14]\)\!\(\*
StyleBox[\"processing\",\nFontSize->14]\)\!\(\*
StyleBox[\" \",\nFontSize->14]\)\!\(\*
StyleBox[\"of\",\nFontSize->14]\)\!\(\*
StyleBox[\" \",\nFontSize->14]\)\!\(\*
StyleBox[\"bases\",\nFontSize->14]\)\!\(\*
StyleBox[\".\",\nFontSize->14]\)",1];

If[Head[Global`TBBasisList]===List,
basisDefinitionFiles=Flatten[Map[FileNames[ToString[#]~~".m",TBDirectory~~"bases/"]&,Global`TBBasisList]],
basisDefinitionFiles=FileNames[__~~".m",TBDirectory~~"bases/"]
];

TBPrint[{"Processing files: ",TableForm[basisDefinitionFiles]},1];

TBAvailableBasisNames={};
TBBasisDocs={};
Unprotect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
ClearCache/@basisDefinitionFiles;
TBAutoDefineBasis/@basisDefinitionFiles;
Protect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];

endTime=AbsoluteTime[];

TBPrint["\n-------------------------------\n",1];
TBPrint["  \!\(\*
StyleBox[\"Basis\",\nFontSize->14]\)\!\(\*
StyleBox[\" \",\nFontSize->14]\)\!\(\*
StyleBox[\"processing\",\nFontSize->14]\)\!\(\*
StyleBox[\" \",\nFontSize->14]\)finished after "~~ToString[Round[(endTime-startTime)/60]]~~"min\!\(\*
StyleBox[\".\",\nFontSize->14]\)",1]
TBPrint["",1];
];

