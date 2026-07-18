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

If[TBVertexBasis[BasisName],
TBExportVertexCache[BasisName,CacheFolder],
TBExportTensorCache[BasisName,CacheFolder]
]
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

TBComment[\""<>BasisName<>"\"]="<>ToString[TBComment[BasisName],FormatType->InputForm]<>";

TBAuthor[\""<>BasisName<>"\"]="<>ToString[TBAuthor[BasisName],FormatType->InputForm]<>";

TBUsage[\""<>BasisName<>"\"]="<>ToString[TBUsage[BasisName],FormatType->InputForm]<>";

TBIndices[\""<>BasisName<>"\"]="<>ToString[TBIndices[BasisName],FormatType->InputForm]<>";

TBMomentumConservation[\""<>BasisName<>"\"]="<>ToString[TBMomentumConservation[BasisName],FormatType->InputForm]<>";

TBBasis[\""<>BasisName<>"\"]="<>ToString[TBBasis[BasisName],FormatType->InputForm]<>";
";
Export[folder~~"/"~~BasisName~~".m",outputCode,"Text"];

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

TBComment[\""<>BasisName<>"\"]="<>ToString[TBComment[BasisName],FormatType->InputForm]<>";

TBAuthor[\""<>BasisName<>"\"]="<>ToString[TBAuthor[BasisName],FormatType->InputForm]<>";

TBUsage[\""<>BasisName<>"\"]="<>ToString[TBUsage[BasisName],FormatType->InputForm]<>";

TBIndices[\""<>BasisName<>"\"]="<>ToString[TBIndices[BasisName],FormatType->InputForm]<>";

TBMomentumConservation[\""<>BasisName<>"\"]="<>ToString[TBMomentumConservation[BasisName],FormatType->InputForm]<>";

TBBasis[\""<>BasisName<>"\"]="<>ToString[TBBasis[BasisName],FormatType->InputForm]<>";
";
Export[folder~~"/"~~BasisName~~".m",outputCode,"Text"];
End[];
EndPackage[];
];

TBExportBasis[BasisName_String,folder_String:"./"]:=Module[{outputCode},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

If[TBVertexBasis[BasisName],
TBExportVertexBasis[BasisName,folder],
TBExportTensorBasis[BasisName,folder]
]
];
