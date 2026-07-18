(* ::Package:: *)

(* ::Title:: *)
(*Self-update check and welcome banner*)

If[("AllowInternetUse" /. SystemInformation["Network"]) && $FrontEnd=!=Null,
Module[{TBCurPacletAddr,TBCurPaclet,TBCurVersion,
TBInstalledPaclet,TBInstalledVersion},

TBCurPacletAddr="https://github.com/satfra/TensorBases/raw/refs/heads/main/PacletInfo.m";
TBCurPaclet=Import[TBCurPacletAddr];

If[TBCurPaclet=!=$Failed,
TBCurPaclet=(List@@TBCurPaclet)[[1]];
TBCurVersion=TBCurPaclet["Version"];

TBInstalledPaclet=(List@@Import[FileNameJoin[{$UserBaseDirectory,"Applications","TensorBases","PacletInfo.m"}]])[[1]];
TBInstalledVersion=TBInstalledPaclet["Version"];

If[TBCurVersion=!=TBInstalledVersion,
If[ChoiceDialog[
TemplateApply["There is a newer TensorBases version on the internet. 
The installed version is `a`, whereas `b` is available. Do you want to install it?",<|"a"->TBInstalledVersion,"b"->TBCurVersion|>]
,WindowTitle->"Update TensorBases",WindowSize->{Medium,All}],
Import["https://raw.githubusercontent.com/satfra/TensorBases/main/TensorBasesInstaller.m"];
Echo["Please restart your Kernel."];Exit[],
Print["Consider updating the TensorBases package for bugfixes and new features!"];
];
];
];
];
];


Print["Mathematica package \!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)loaded"]
Print["\!\(\*
StyleBox[\"Authors\",\nFontWeight->\"Bold\"]\): Andreas Gei\[SZ]el, Franz Richard Sattler"]
Print["\!\(\*
StyleBox[\"Version\",\nFontWeight->\"Bold\"]\): 1.0"]
Print["\!\(\*
StyleBox[\"Year\",\nFontWeight->\"Bold\"]\): 2025"]
Print["For a list of available bases, call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[]. For further information on a particular basis, call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[\"\!\(\*
StyleBox[\"BasisName\",\nFontColor->GrayLevel[0.5]]\)\"]."]
Print[""]
Print["This package provides the methods \!\(\*
StyleBox[\"TBGetBasisElement\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBGetInnerProduct\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBGetMetric\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBGetInverseMetric\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBGetProjector\",\nFontColor->RGBColor[1, 0.5, 0]]\) for every tensor basis available."]
Print["For closer explanations, please call their usage messages, e.g. \!\(\*
StyleBox[\"TBGetProjector\",\nFontColor->RGBColor[1, 0.5, 0]]\)::\!\(\*
StyleBox[\"usage\",\nFontColor->RGBColor[0, 0, 1]]\)."]
Print[""]
Print["Other useful tools include \!\(\*
StyleBox[\"TBBasisTransformation\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBVertexTransformation\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBGetIdentityMatrix\",\nFontColor->RGBColor[1, 0.5, 0]]\), \!\(\*
StyleBox[\"TBGetBasisSize\",\nFontColor->RGBColor[1, 0.5, 0]]\),\!\(\*
StyleBox[\" \",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\"TBGetIndexSet\",\nFontColor->RGBColor[1, 0.5, 0]]\),\!\(\*
StyleBox[\" \",\nFontColor->RGBColor[1, 0.5, 0]]\)\!\(\*
StyleBox[\"TBMakePropagator\",\nFontColor->RGBColor[1, 0.5, 0]]\)."]
Print[""]
Print["To build or manipulate bases, please call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[\"BaseBuilder\"]."]
Print[""]
Print["To show information on the used notation, call \!\(\*
StyleBox[\"TBInfo\",\nFontColor->RGBColor[1, 0.5, 0]]\)[\"Notation\"]."]
Print[""]
