(* ::Package:: *)

(* ::Title:: *)
(*Basis and vertex transformations*)

TBBasisTransformation::vertex="Either the basis \"`1`\" or \"`2`\" is a pure vertex basis. Cannot infer the basis elements from the vertices!"; 

TBBasisTransformation[BasisName1_String,BasisName2_String]:=Module[
{isVertex=TrueQ[TBVertexBasis[BasisName1]]||TrueQ[TBVertexBasis[BasisName2]],
cProd,cProd1,cMetric12,cMetric11,cMetric11Inv,momentumConservation},
(*
   The projection operator to get Subscript[b, i] from a vector |v\[RightAngleBracket]=Subscript[\[CapitalSigma], i]Subscript[b, i]|i\[RightAngleBracket] reads (\[LeftAngleBracket]i'\[VerticalSeparator]i\[RightAngleBracket])^-1\[LeftAngleBracket]i'|.
Accordingly, to get Subscript[b, i] from |v\[RightAngleBracket]=Subscript[\[CapitalSigma], i]Subscript[b, i]|i\[RightAngleBracket]=Subscript[\[CapitalSigma], a]Subscript[c, a]|a\[RightAngleBracket], if given the representation in terms of Subscript[c, a], the transformation matrix reads (\[LeftAngleBracket]i'\[VerticalSeparator]i\[RightAngleBracket])^-1\[LeftAngleBracket]i'\[VerticalSeparator]a\[RightAngleBracket] = cMetric11Inv.cMetric12, as calculated below.
*)

If[isVertex,Message[TBBasisTransformation::vertex,BasisName1,BasisName2];Abort[]];

cProd=TBMakeCanonicalProduct[BasisName1,BasisName2];
cProd1=TBMakeCanonicalProduct[BasisName1,BasisName1];

momentumConservation=InsertOutputNaming[TBMomentumConservation[BasisName1]];

cMetric12=Table[
(cProd[TBGetBasisElement,i,TBGetBasisElement,j])//.momentumConservation
,
{i,1,TBGetBasisSize[BasisName1]},{j,1,TBGetBasisSize[BasisName2]}];
cMetric12=Map[
Simplify[Global`UseLorentzLinearity[TBFormTrace[#]]]&
,
cMetric12,{2}];

cMetric11=Table[
(cProd1[TBGetBasisElement,i,TBGetBasisElement,j])//.momentumConservation
,
{i,1,TBGetBasisSize[BasisName1]},{j,1,TBGetBasisSize[BasisName1]}];
cMetric11=Map[
Simplify[Global`UseLorentzLinearity[Simplify[TBFormTrace[#]]]]&
,
cMetric11,{2}];
cMetric11Inv=Inverse[cMetric11];

ParallelMap[Simplify,cMetric11Inv . cMetric12,{2}]
];
TBVertexTransformation[BasisName1_String,BasisName2_String]:=Module[
{cProd,cProd1,cMetric12,cMetric11,cMetric11Inv,momentumConservation},
(*
   The projection operator to get Subscript[b, i] from a vector |v\[RightAngleBracket]=Subscript[\[CapitalSigma], i]Subscript[b, i]|i\[RightAngleBracket] reads (\[LeftAngleBracket]i'\[VerticalSeparator]i\[RightAngleBracket])^-1\[LeftAngleBracket]i'|.
Accordingly, to get Subscript[b, i] from |v\[RightAngleBracket]=Subscript[\[CapitalSigma], i]Subscript[b, i]|i\[RightAngleBracket]=Subscript[\[CapitalSigma], a]Subscript[c, a]|a\[RightAngleBracket], if given the representation in terms of Subscript[c, a], the transformation matrix reads (\[LeftAngleBracket]i'\[VerticalSeparator]i\[RightAngleBracket])^-1\[LeftAngleBracket]i'\[VerticalSeparator]a\[RightAngleBracket] = cMetric11Inv.cMetric12, as calculated below.
*)

cProd=TBMakeCanonicalProduct[BasisName1,BasisName2];
cProd1=TBMakeCanonicalProduct[BasisName1,BasisName1];

momentumConservation=InsertOutputNaming[TBMomentumConservation[BasisName1]];

cMetric12=Table[
(cProd[TBGetVertex,i,TBGetVertex,j])//.momentumConservation
,
{i,1,TBGetBasisSize[BasisName1]},{j,1,TBGetBasisSize[BasisName2]}];

cMetric12=ParallelMap[
Simplify[Global`UseLorentzLinearity[TBFormTrace[#]]]&
,
cMetric12,{2}];

cMetric11=Table[
(cProd1[TBGetVertex,i,TBGetVertex,j])//.momentumConservation
,
{i,1,TBGetBasisSize[BasisName1]},{j,1,TBGetBasisSize[BasisName1]}];
cMetric11=ParallelMap[
Simplify[Global`UseLorentzLinearity[TBFormTrace[#]]]&
,
cMetric11,{2}];
cMetric11Inv=Inverse[cMetric11];

ParallelMap[Simplify,cMetric11Inv . cMetric12,{2}]
];
