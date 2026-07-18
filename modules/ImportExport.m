(* ::Package:: *)

(* ::Title:: *)
(*Importing and exporting bases and caches*)

TBImportBasis[BasisDefinitionFile_String,CacheDirectory_String:"./TBCache"]:=Module[
{BasisName=GetBasisName[BasisDefinitionFile]},
If[MemberQ[TBAvailableBasisNames,BasisName],Print["Basis \""~~BasisName~~"\" already exists! If you wish to overwrite it, use \!\(\*
StyleBox[\"TBUnregister\",\nFontColor->RGBColor[1, 0.5, 0]]\)."];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];
Unprotect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
TBAutoDefineBasis[BasisDefinitionFile,CacheDirectory];
Protect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
End[];
EndPackage[];
]


TBExportTensorCache[BasisName_String,CacheFolder_String:"./TBCache"]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];
Export[CacheFolder~~"/"~~BasisName~~"/basis.m",TBInternal[BasisName,"Basis"]];
Export[CacheFolder~~"/"~~BasisName~~"/vertices.m",TBInternal[BasisName,"Vertices"]];
Export[CacheFolder~~"/"~~BasisName~~"/metric.m",TBInternal[BasisName,"Metric"]];
Export[CacheFolder~~"/"~~BasisName~~"/inverseMetric.m",TBInternal[BasisName,"InverseMetric"]];
Export[CacheFolder~~"/"~~BasisName~~"/projectors.m",TBInternal[BasisName,"Projectors"]];
End[];
EndPackage[];
];

TBExportVertexCache[BasisName_String,CacheFolder_String:"./TBCache"]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];
Export[CacheFolder~~"/"~~BasisName~~"/vertices.m",TBInternal[BasisName,"Vertices"]];
Export[CacheFolder~~"/"~~BasisName~~"/metric.m",TBInternal[BasisName,"Metric"]];
Export[CacheFolder~~"/"~~BasisName~~"/inverseMetric.m",TBInternal[BasisName,"InverseMetric"]];
Export[CacheFolder~~"/"~~BasisName~~"/projectors.m",TBInternal[BasisName,"Projectors"]];
End[];
EndPackage[];
];

TBExportCache[BasisName_String,CacheFolder_String:"./TBCache"]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

(* TrueQ, and an explicit guard: a bare If[TBVertexBasis[name],..] returns
   Null when the trait is unset, so neither branch would run and the call
   would silently do nothing. *)
If[Head[Evaluate[TBVertexBasis[BasisName]]]===TBVertexBasis,
Print["Basis \""~~BasisName~~"\" does not declare TBVertexBasis!"];Abort[]];
If[TrueQ[TBVertexBasis[BasisName]],
TBExportVertexCache[BasisName,CacheFolder],
TBExportTensorCache[BasisName,CacheFolder]
]
];


(* Emit "TBTrait["name"]=value;" for a trait that may legitimately be unset, and
   nothing at all when it is. Writing it unconditionally would put the literal
   unevaluated TBTrait["name"] into the exported file. Traits that used to be
   dropped entirely here (TBCanonicalProduct, TBReplacements, TBVertexStructure,
   TBInnerProduct) made the export lossy in a way that only surfaced much later,
   when a re-imported basis aborted with TBMakeCanonicalProduct::noProduct. *)
TBExportTrait[BasisName_String,trait_,traitName_String]:=If[
Head[Evaluate[trait[BasisName]]]===trait,
"",
"\n"<>traitName<>"[\""<>BasisName<>"\"]="<>ToString[trait[BasisName],FormatType->InputForm]<>";\n"
];

TBExportTensorBasis[BasisName_String,folder_String:"./"]:=Module[{outputCode},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];
outputCode="(* Basis Export from TensorBases package *)

TBAutoDefine[\""<>BasisName<>"\"]="<>ToString[TBAutoDefine[BasisName],FormatType->InputForm]<>";

TBRequiredGroups[\""<>BasisName<>"\"]="<>ToString[TBRequiredGroups[BasisName],FormatType->InputForm]<>";

TBVertex[\""<>BasisName<>"\"]="<>ToString[TBVertex[BasisName],FormatType->InputForm]<>";

TBVertexBasis[\""<>BasisName<>"\"]=False;

TBVertexStructure[\""<>BasisName<>"\"]="<>ToString[TBVertexStructure[BasisName],FormatType->InputForm]<>";

TBInnerProduct[\""<>BasisName<>"\"]="<>ToString[TBInnerProduct[BasisName],FormatType->InputForm]<>";
"<>TBExportTrait[BasisName,TBCanonicalProduct,"TBCanonicalProduct"]<>TBExportTrait[BasisName,TBReplacements,"TBReplacements"]<>"
TBComment[\""<>BasisName<>"\"]="<>ToString[TBComment[BasisName],FormatType->InputForm]<>";

TBAuthor[\""<>BasisName<>"\"]="<>ToString[TBAuthor[BasisName],FormatType->InputForm]<>";

TBUsage[\""<>BasisName<>"\"]="<>ToString[TBUsage[BasisName],FormatType->InputForm]<>";

TBIndices[\""<>BasisName<>"\"]="<>ToString[TBIndices[BasisName],FormatType->InputForm]<>";

TBMomentumConservation[\""<>BasisName<>"\"]="<>ToString[TBMomentumConservation[BasisName],FormatType->InputForm]<>";

TBBasis[\""<>BasisName<>"\"]="<>ToString[TBBasis[BasisName],FormatType->InputForm]<>";
";
Export[FileNameJoin[{folder,BasisName<>".m"}],outputCode,"Text"];

End[];
EndPackage[];
];

TBExportVertexBasis[BasisName_String,folder_String:"./"]:=Module[{outputCode},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];
outputCode="(* Basis Export from TensorBases package *)

TBAutoDefine[\""<>BasisName<>"\"]="<>ToString[TBAutoDefine[BasisName],FormatType->InputForm]<>";

TBRequiredGroups[\""<>BasisName<>"\"]="<>ToString[TBRequiredGroups[BasisName],FormatType->InputForm]<>";

TBVertex[\""<>BasisName<>"\"]="<>ToString[TBVertex[BasisName],FormatType->InputForm]<>";

TBVertexBasis[\""<>BasisName<>"\"]="<>ToString[TBVertexBasis[BasisName],FormatType->InputForm]<>";

TBCanonicalProduct[\""<>BasisName<>"\"]="<>ToString[TBCanonicalProduct[BasisName],FormatType->InputForm]<>";
"<>TBExportTrait[BasisName,TBVertexStructure,"TBVertexStructure"]<>TBExportTrait[BasisName,TBInnerProduct,"TBInnerProduct"]<>TBExportTrait[BasisName,TBReplacements,"TBReplacements"]<>"
TBComment[\""<>BasisName<>"\"]="<>ToString[TBComment[BasisName],FormatType->InputForm]<>";

TBAuthor[\""<>BasisName<>"\"]="<>ToString[TBAuthor[BasisName],FormatType->InputForm]<>";

TBUsage[\""<>BasisName<>"\"]="<>ToString[TBUsage[BasisName],FormatType->InputForm]<>";

TBIndices[\""<>BasisName<>"\"]="<>ToString[TBIndices[BasisName],FormatType->InputForm]<>";

TBMomentumConservation[\""<>BasisName<>"\"]="<>ToString[TBMomentumConservation[BasisName],FormatType->InputForm]<>";

TBBasis[\""<>BasisName<>"\"]="<>ToString[TBBasis[BasisName],FormatType->InputForm]<>";
";
Export[FileNameJoin[{folder,BasisName<>".m"}],outputCode,"Text"];
End[];
EndPackage[];
];

TBExportBasis[BasisName_String,folder_String:"./"]:=Module[{outputCode},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

If[Head[Evaluate[TBVertexBasis[BasisName]]]===TBVertexBasis,
Print["Basis \""~~BasisName~~"\" does not declare TBVertexBasis!"];Abort[]];
If[TrueQ[TBVertexBasis[BasisName]],
TBExportVertexBasis[BasisName,folder],
TBExportTensorBasis[BasisName,folder]
]
];
