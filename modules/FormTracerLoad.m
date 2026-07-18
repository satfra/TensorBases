(* ::Package:: *)

(* ::Title:: *)
(*Locating, installing and loading FormTracer*)

FormTracerLoaded[]:=(Length[Select[$Packages,#=="FormTracer`"&]]>0);
FormTracerInstalled[]:=Module[{FTDirectory},
FTDirectory=SelectFirst[
Join[
{
FileNameJoin[{$UserBaseDirectory,"Applications","FormTracer"}],
FileNameJoin[{$BaseDirectory,"Applications","FormTracer"}],
FileNameJoin[{$InstallationDirectory,"AddOns","Applications","FormTracer"}],
FileNameJoin[{$InstallationDirectory,"AddOns","Packages","FormTracer"}],
FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","FormTracer"}]
},
Select[$Path,StringContainsQ[#,"FormTracer"]&]
],
DirectoryQ[#]&
]<>"/"//Quiet;
If[Head[FTDirectory]=!=String,Return[False]];
Return[True];
];

If[Not@FormTracerInstalled[],If[ChoiceDialog["FormTracer does not seem to be installed. Do you want to install it?",WindowTitle->"Install FormTracer",WindowSize->{Medium,All}],If[$VersionNumber>=11.2,
Import["https://raw.githubusercontent.com/FormTracer/FormTracer/master/src/FormTracerInstaller.m"],Module[{formTracerZipURL,formTracerArchive,formTracerInstallDir,data},formTracerZipURL="https://raw.githubusercontent.com/FormTracer/FormTracer/master/FormTracer.zip";
formTracerArchive=FileNameJoin[{$TemporaryDirectory,"FormTracer.zip"}];
formTracerInstallDir=FileNameJoin[{$UserBaseDirectory,"Applications"}];
Print["Downloading FormTracer ..."];
data=Quiet[Import[formTracerZipURL,"Byte"]];
If[!ListQ[data]||Length[data]===0,
Print["Download of FormTracer failed."];Abort[]
];
Close[BinaryWrite[OpenWrite[formTracerArchive,BinaryFormat->True],data]];
ExtractArchive[formTracerArchive,formTracerInstallDir];
Quiet[DeleteFile[formTracerArchive]];
Print["FormTracer installed successfully."];
]
],
Print["The \!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\) package requires \!\(\*
StyleBox[\"FormTracer\",\nFontWeight->\"Bold\"]\) to run."];Abort[];
];
];

If[Not@FormTracerLoaded[],
Block[{Print},Get["FormTracer`"]];
If[FormTracerLoaded[],
Print["\!\(\*
StyleBox[\"FormTracer\",\nFontWeight->\"Bold\"]\) package loaded. "];,
Print["Error: Could not load \!\(\*
StyleBox[\"FormTracer\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)package."];Abort[];
],
Print["\!\(\*
StyleBox[\"FormTracer\",\nFontWeight->\"Bold\"]\) package already loaded. "];
Print["Clearing all extra variables for compatibility!\n"];
FormTracer`DefineExtraVars[];
];

Block[{Print},FiniteT[True];]
Block[{Print},FastGamma5Trace[True];]

If[Head[$DistributedContexts]=!=List,$DistributedContexts={}];
$DistributedContexts=$DistributedContexts\[Union]{"FormTracer`","FormTracer`Private`"}


Print["To see all (user-defined and package-defined) FormTracer definitions, call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[\"FormTracer\"]."];
Print["Furthermore, \!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)extends \!\(\*
StyleBox[\"FormTracer\",\nFontWeight->\"Bold\"]\). To see all extensions, call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[\"Extensions\"]"];


Print["\nTo see all momentum transformations that can be performed by \!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\), call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[\"Momenta\"].\n"];
