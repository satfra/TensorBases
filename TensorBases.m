(* ::Package:: *)

(* ::Title:: *)
(*TensorBases*)


(* ::Text:: *)
(*Tensor bases for QCD interactions. Companion package to arXiv:2503.05580.*)
(**)
(*This file is the loader: it locates the installation, pulls in FormTracer and the*)
(*Global` context extensions, opens the TensorBases` context, and Gets the*)
(*implementation modules from modules/ in dependency order.*)
(**)
(*This file and everything in modules/ is hand-written -- edit it directly.*)
(*The files in bases/, by contrast, are still generated from the bases/*.nb notebooks.*)


(* ::Section:: *)
(*Installation directory*)


(* Global`$TBDIR is resolved before BeginPackage because the Global` context
   modules below are loaded from it. The private TBDirectory (modules/Helpers.m)
   is set from this value. *)
Global`$TBDIR=SelectFirst[
Join[
{
FileNameJoin[{$UserBaseDirectory,"Applications","TensorBases"}],
FileNameJoin[{$BaseDirectory,"Applications","TensorBases"}],
FileNameJoin[{$InstallationDirectory,"AddOns","Applications","TensorBases"}],
FileNameJoin[{$InstallationDirectory,"AddOns","Packages","TensorBases"}],
FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","TensorBases"}]
},
Select[$Path,StringContainsQ[#,"TensorBases"]&]
],
DirectoryQ[#]&
]<>"/";


(* ::Section:: *)
(*Global` context: self-update, FormTracer and its extensions*)


(* Load order here is load-bearing:
   - FormTracerLoad must precede FormTracerGroups: the group code dereferences
     FormTracer`Private` symbols at definition time, not at call time.
   - FormTracerGroups must precede LorentzTensors: the latter calls
     TBInsertOutputNaming / TBInsertLorentzNames at top level. *)
Get[Global`$TBDIR<>"modules/SelfUpdate.m"];
Get[Global`$TBDIR<>"modules/FormTracerLoad.m"];
Get[Global`$TBDIR<>"modules/FormTracerGroups.m"];
Get[Global`$TBDIR<>"modules/LorentzTensors.m"];


(* ::Section:: *)
(*Begin package*)


BeginPackage["TensorBases`"];
Unprotect["TensorBases`*"];
Unprotect["TensorBases`Private`*"];
ClearAll["TensorBases`*"];
ClearAll["TensorBases`Private`*"];


If[Head[$DistributedContexts]=!=List,$DistributedContexts={}];
$DistributedContexts=$DistributedContexts\[Union]{$Context,"TensorBases`Private`","TensorBases`","FormTracer`","FormTracer`Private`"}


(* ::Section:: *)
(*Exports*)


Get[Global`$TBDIR<>"modules/Usage.m"];


(* ::Section:: *)
(*Implementation*)


Begin["`Private`"];


(* Load order here is load-bearing:
   - Helpers defines TBDirectory and AutoSaveRestore (with its HoldRest
     attribute), both of which Registration.m uses as evaluated default
     arguments, so it must come first.
   - LoadBases only *defines* ProcessBases; it is invoked at the very bottom of
     this file, once every module is available. *)
Get[Global`$TBDIR<>"modules/Internal.m"];
Get[Global`$TBDIR<>"modules/Helpers.m"];
Get[Global`$TBDIR<>"modules/Defaults.m"];
Get[Global`$TBDIR<>"modules/AutoDefine.m"];
Get[Global`$TBDIR<>"modules/Registration.m"];
Get[Global`$TBDIR<>"modules/BasisConstruction.m"];
Get[Global`$TBDIR<>"modules/ImportExport.m"];
Get[Global`$TBDIR<>"modules/LoadBases.m"];
Get[Global`$TBDIR<>"modules/Transformations.m"];
Get[Global`$TBDIR<>"modules/Tools.m"];
Get[Global`$TBDIR<>"modules/Kinematics.m"];


(* ::Section:: *)
(*Load the bases*)


If[Global`TBSkipBaseProcessing=!=True,
ProcessBases[]
];


(* ::Section:: *)
(*End package*)


(*Distribute only the TensorBases symbols needed on parallel subkernels*)DistributeDefinitions[
(*Public symbols*)
TBEvaluateBasisElement,TBEvaluateVertex,TBFormTrace,TBInternal,TBVertexBasis,TBGetBasisSize,Tensor,Tensor1,Tensor2,(*Output naming symbols with their DownValues*)
TBsp,TBsps,TBvec,TBvecs,(*Private helpers used inside parallel lambdas*)TensorBases`Private`InsertOutputNaming,TensorBases`Private`GlobalContext,TensorBases`Private`MakeIndexList,TensorBases`Private`TBUnique,TensorBases`Private`AlreadyUnique,TensorBases`Private`UniqueStem,TensorBases`Private`TBPrint,TensorBases`Private`chooseMap,TensorBases`Private`chooseTable
];


Protect["TensorBases`*"];


End[];


EndPackage[];
