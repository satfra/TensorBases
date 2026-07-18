(* ::Package:: *)

(* ::Title:: *)
(*Basis construction and restriction*)

ReduceTensorList[tensors_List,innerProduct_,{Indices__List}]:=Module[
{allInternalIndicesList,IndicesList,partIndicesList,product,rr,basisElements},

(*First, check for consistency of all indices in the tensors*)
allInternalIndicesList=Map[FormTracer`GetOpenIndices,tensors];
If[Not@(SameQ@@allInternalIndicesList),
Print["Tensor list "<>ToString[tensors,FormatType->InputForm]<> " has inconsistent open indices!"];Abort[];
];

(*Then, remove all external indices not relevant for the current tensor list and check for consistency with the tensor indices*)
IndicesList=Map[Join[{#[[1]]},Select[#[[2;;]],(MemberQ[allInternalIndicesList[[1]],#]&)]]&,{Indices}];
partIndicesList=Map[Select[#[[2;;]],(MemberQ[allInternalIndicesList[[1]],#]&)]&,{Indices}];

If[Not@SameQ[Sort@Flatten[{partIndicesList}],Sort@allInternalIndicesList[[1]]],
Print["Tensor list "<>ToString[tensors,FormatType->InputForm]<> " has inconsistent indices with external indices!"];Abort[];
];

(*Construct a metric*)
product=MakeInnerProduct[innerProduct,IndicesList];
rr=Table[product[tensors[[i]],tensors[[j]]]//TBFormTrace//Global`UseLorentzLinearity//Simplify,{i,1,Length@tensors},{j,1,Length@tensors}];

(*Find all linearly independent elements*)
rr=rr//Transpose//RowReduce;
basisElements=Flatten[FirstPosition[#,1,Nothing]&/@rr];

Return[tensors[[basisElements]]//Global`UseLorentzLinearity//Simplify];
]


(*TBConstructBasis[___]:=Module[{},Print["Please use the correct pattern for Basis construction: \n",TBConstructBasis::usage];Abort[];
];*)


Options[TBConstructBasis]={
"Name"->"",
"RequiredGroups"->{{}},
"Vertex"->"",
"VertexStructure"->Tensor,
"InnerProduct"->Tensor1*Tensor2,
"CanonicalProduct"->Null,
"Indices"->{{}},
"MomentumConservation"->{},
"Tensors"->{{}},
"Replacements"->{},
"Comment"->"",
"Author"->"User",
"Usage"->"",
"CacheDirectory"->"./TBCache"
};

TBConstructBasis::invalid="The argument \"`1`\" with value \"`2`\" is invalid."
TBConstructBasis::warning="The argument \"`1`\" with value \"`2`\" is missing. Some functions may/will break."

TBConstructBasis::InvalidArgument="TBConstructBasis takes only named arguments, see TBConstructBasis::usage";
TBConstructBasis[___]:=(Message[TBConstructBasis::InvalidArgument];Abort[]);

TBConstructBasis[OptionsPattern[]]:=Module[
{BasisName,RequiredGroups,Vertex,VertexStructure,InnerProduct,CanonicalProduct,Comment,Author,Usage,Indices,MomentumConservation,Tensors,Replacements,CacheDirectory},

BasisName=OptionValue["Name"];
If[Head@BasisName=!=String||BasisName==="",Message[TBConstructBasis::invalid,"Name",BasisName];Abort[]];

RequiredGroups=OptionValue["RequiredGroups"];
If[Head@RequiredGroups=!=List&&AnyTrue[RequiredGroups,Head[#]=!=List&],Message[TBConstructBasis::invalid,"RequiredGroups",RequiredGroups];Abort[]];

Vertex=OptionValue["Vertex"];
If[Head@Vertex=!=List||AnyTrue[Vertex,Head[#]=!=Symbol&],Message[TBConstructBasis::invalid,"Vertex",Vertex];Abort[]];

VertexStructure=OptionValue["VertexStructure"];
If[Head@VertexStructure===List||FreeQ[VertexStructure,Tensor,Infinity],Message[TBConstructBasis::invalid,"VertexStructure",VertexStructure];Abort[]];

InnerProduct=OptionValue["InnerProduct"];
If[Head@InnerProduct===List||FreeQ[InnerProduct,Tensor1,Infinity]||FreeQ[InnerProduct,Tensor2,Infinity],Message[TBConstructBasis::invalid,"InnerProduct",InnerProduct];Abort[]];

CanonicalProduct=OptionValue["CanonicalProduct"];
If[Head@InnerProduct===List||FreeQ[InnerProduct,Tensor1,Infinity]||FreeQ[InnerProduct,Tensor2,Infinity],Message[TBConstructBasis::warning,"CanonicalProduct",InnerProduct]];

Indices=OptionValue["Indices"];
If[Head@Indices=!=List||AnyTrue[Indices,Head[#]=!=List&],Message[TBConstructBasis::invalid,"Indices",Indices];Abort[]];

MomentumConservation=OptionValue["MomentumConservation"];
If[Head@MomentumConservation=!=List,Message[TBConstructBasis::invalid,"MomentumConservation",MomentumConservation];Abort[]];

Tensors=OptionValue["Tensors"];
If[Head@Tensors=!=List&&AnyTrue[Tensors,Head[#]=!=List&],Message[TBConstructBasis::invalid,"Tensors",Tensors];Abort[]];

Replacements=OptionValue["Replacements"];
If[Head@Replacements=!=List||AnyTrue[Replacements,(Head[#]=!=Rule&&Head[#]=!=RuleDelayed)&],Message[TBConstructBasis::invalid,"Replacements",Replacements];Abort[]];

Author=OptionValue["Author"];
Usage=OptionValue["Usage"];
Comment=OptionValue["Comment"];
CacheDirectory=OptionValue["CacheDirectory"];

TBConstructBasis[BasisName,RequiredGroups,Vertex,VertexStructure,InnerProduct,Comment,Author,Usage,Indices,MomentumConservation,Tensors,Replacements,CacheDirectory,CanonicalProduct]
];


TBConstructBasis[
	BasisName_String,
{RequiredGroups___List},
	Vertex_List,
	VertexStructure_,
	InnerProduct_,
	Comment_String,
	Author_String,
	Usage_,
	{Indices__List},
	MomentumConservation_List,
	{Tensors__List},
	Replacements_List,
	CacheDirectory_String:"./TBCache",
CanonicalProduct_:Null
  ]:=Module[{reducedTensors,maximalSet,basis},
If[MemberQ[TBAvailableBasisNames,BasisName],Print["Basis \""~~BasisName~~"\" has been already defined!"];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];

TBReplacements[BasisName]=Replacements;
TBIndices[BasisName]={Indices};
TBMomentumConservation[BasisName]=MomentumConservation;
TBVertex[BasisName]=Vertex;
TBVertexBasis[BasisName]=False;
TBAuthor[BasisName]=Author;
TBComment[BasisName]=Comment;
TBUsage[BasisName]=Usage;
TBInnerProduct[BasisName]=InnerProduct;
TBCanonicalProduct[BasisName]=CanonicalProduct;
TBVertexStructure[BasisName]=VertexStructure;
TBRequiredGroups[BasisName]={RequiredGroups};

TBCheckRequirements[BasisName];

(*Build a maximal set by doing the tensor product*)
maximalSet=Flatten[TensorProduct@@{Tensors}]//.MomentumConservation;
(*If necessary, reduce it*)
TBBasis[BasisName]=ReduceTensorList[maximalSet,InnerProduct,{Indices}]//InsertInputNaming;

TBInternal[BasisName,"Indices"]=InsertOutputNaming[{Indices}];
TBInternal[BasisName,"Replacements"]=Replacements;
TBInternal[BasisName,"Basis"]=TBMakeBasis[BasisName]//InsertInputNaming;
TBInternal[BasisName,"Length"]=TBBasisLength[BasisName];
TBInternal[BasisName,"InnerProduct"]=TBMakeInnerProduct[BasisName];
TBInternal[BasisName,"CanonicalProduct"]=TBMakeCanonicalProduct[BasisName];

TBInternal[BasisName,"Vertices"]=TBMakeVertices[BasisName]//InsertInputNaming;
TBInternal[BasisName,"Metric"]=TBBuildMetric[BasisName]//InsertInputNaming;
TBInternal[BasisName,"InverseMetric"]=TBBuildInverseMetric[BasisName]//InsertInputNaming;
TBInternal[BasisName,"Projectors"]=TBBuildProjectors[BasisName]//InsertInputNaming;

Unprotect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
TBDefineTBGetBasisElement[BasisName];
TBDefineTBGetVertex[BasisName];
TBDefineTBGetMetric[BasisName];
TBDefineTBGetInnerProduct[BasisName];
TBDefineTBGetCanonicalProduct[BasisName];
TBDefineTBGetInverseMetric[BasisName];
TBDefineTBGetProjector[BasisName];
TBDefineTBInfo[BasisName];
TBAddBasisDocumentation[BasisName];
Protect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];

TBPrint[BasisName~~": done.",1];

End[];
EndPackage[];
];


Options[TBConstructVertexBasis]={
"Name"->"",
"RequiredGroups"->{{}},
"Vertex"->"",
"VertexStructure"->Tensor,
"CanonicalProduct"->Null,
"Indices"->{{}},
"MomentumConservation"->{},
"Tensors"->{{}},
"Replacements"->{},
"Comment"->"",
"Author"->"User",
"Usage"->"",
"CacheDirectory"->"./TBCache"
};

TBConstructVertexBasis::invalid="The argument \"`1`\" with value \"`2`\" is invalid."
TBConstructVertexBasis::warning="The argument \"`1`\" with value \"`2`\" is missing. Some functions may/will break."

TBConstructVertexBasis::InvalidArgument="TBConstructBasis takes only named arguments, see TBConstructBasis::usage";
TBConstructVertexBasis[___]:=(Message[TBConstructVertexBasis::InvalidArgument];Abort[]);

TBConstructVertexBasis[OptionsPattern[]]:=Module[
{BasisName,RequiredGroups,Vertex,VertexStructure,CanonicalProduct,Comment,Author,Usage,Indices,MomentumConservation,Tensors,Replacements,CacheDirectory},

BasisName=OptionValue["Name"];
If[Head@BasisName=!=String||BasisName==="",Message[TBConstructVertexBasis::invalid,"Name",BasisName];Abort[]];

RequiredGroups=OptionValue["RequiredGroups"];
If[Head@RequiredGroups=!=List&&AnyTrue[RequiredGroups,Head[#]=!=List&],Message[TBConstructVertexBasis::invalid,"RequiredGroups",RequiredGroups];Abort[]];

Vertex=OptionValue["Vertex"];
If[Head@Vertex=!=List||AnyTrue[Vertex,Head[#]=!=Symbol&],Message[TBConstructVertexBasis::invalid,"Vertex",Vertex];Abort[]];

VertexStructure=OptionValue["VertexStructure"];
If[Head@VertexStructure===List||FreeQ[VertexStructure,Tensor,Infinity],Message[TBConstructVertexBasis::invalid,"VertexStructure",VertexStructure];Abort[]];

CanonicalProduct=OptionValue["CanonicalProduct"];
If[Head@CanonicalProduct===List||FreeQ[CanonicalProduct,Tensor1,Infinity]||FreeQ[CanonicalProduct,Tensor2,Infinity],Message[TBConstructVertexBasis::warning,"CanonicalProduct",CanonicalProduct]];

Indices=OptionValue["Indices"];
If[Head@Indices=!=List||AnyTrue[Indices,Head[#]=!=List&],Message[TBConstructVertexBasis::invalid,"Indices",Indices];Abort[]];

MomentumConservation=OptionValue["MomentumConservation"];
If[Head@MomentumConservation=!=List,Message[TBConstructVertexBasis::invalid,"MomentumConservation",MomentumConservation];Abort[]];

Tensors=OptionValue["Tensors"];
If[Head@Tensors=!=List&&AnyTrue[Tensors,Head[#]=!=List&],Message[TBConstructVertexBasis::invalid,"Tensors",Tensors];Abort[]];

Replacements=OptionValue["Replacements"];
If[Head@Replacements=!=List||AnyTrue[Replacements,(Head[#]=!=Rule&&Head[#]=!=RuleDelayed)&],Message[TBConstructVertexBasis::invalid,"Replacements",Replacements];Abort[]];

Author=OptionValue["Author"];
Usage=OptionValue["Usage"];
Comment=OptionValue["Comment"];
CacheDirectory=OptionValue["CacheDirectory"];

TBConstructVertexBasis[BasisName,RequiredGroups,Vertex,VertexStructure,Comment,Author,Usage,Indices,MomentumConservation,Tensors,Replacements,CacheDirectory,CanonicalProduct]
];


TBConstructVertexBasis[
	BasisName_String,
{RequiredGroups___List},
	Vertex_List,
	VertexStructure_,
	Comment_String,
	Author_String,
	Usage_,
	{Indices__List},
	MomentumConservation_List,
	{Tensors__List},
	Replacements_List,
	CacheDirectory_String:"./TBCache",
  CanonicalProduct_:Null
  ]:=Module[{reducedTensors,maximalSet,basis},
BeginPackage["TensorBases`"];
Begin["`Private`"];

If[MemberQ[TBAvailableBasisNames,BasisName],Print["Basis \""~~BasisName~~"\" has been already defined!"];Abort[]];

TBReplacements[BasisName]=Replacements;
TBIndices[BasisName]={Indices};
TBMomentumConservation[BasisName]=MomentumConservation;
TBVertex[BasisName]=Vertex;
TBVertexBasis[BasisName]=True;
TBAuthor[BasisName]=Author;
TBComment[BasisName]=Comment;
TBUsage[BasisName]=Usage;
TBCanonicalProduct[BasisName]=CanonicalProduct;
TBVertexStructure[BasisName]=VertexStructure;
TBRequiredGroups[BasisName]={RequiredGroups};

TBCheckRequirements[BasisName];

(*Build a maximal set by doing the tensor product*)
maximalSet=Flatten[TensorProduct@@{Tensors}]//.MomentumConservation;
(*If necessary, reduce it*)
TBBasis[BasisName]=ReduceTensorList[maximalSet,CanonicalProduct,{Indices}]//InsertInputNaming;

TBInternal[BasisName,"Indices"]=InsertOutputNaming[{Indices}];
TBInternal[BasisName,"Replacements"]=Replacements;
TBInternal[BasisName,"Length"]=TBBasisLength[BasisName];
TBInternal[BasisName,"InnerProduct"]=TBMakeInnerProduct[BasisName];
TBInternal[BasisName,"CanonicalProduct"]=TBMakeCanonicalProduct[BasisName];

TBInternal[BasisName,"Vertices"]=TBMakeVertices[BasisName]//InsertInputNaming;
TBInternal[BasisName,"Metric"]=TBBuildMetric[BasisName]//InsertInputNaming;
TBInternal[BasisName,"InverseMetric"]=TBBuildInverseMetric[BasisName]//InsertInputNaming;
TBInternal[BasisName,"Projectors"]=TBBuildProjectors[BasisName]//InsertInputNaming;

Unprotect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
TBUnDefineTBGetBasisElement[BasisName];
TBDefineTBGetVertex[BasisName];
TBDefineTBGetMetric[BasisName];
TBUnDefineTBGetInnerProduct[BasisName];
TBDefineTBGetCanonicalProduct[BasisName];
TBDefineTBGetInverseMetric[BasisName];
TBDefineTBGetProjector[BasisName];
TBDefineTBInfo[BasisName];
TBAddBasisDocumentation[BasisName];

Protect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];

TBPrint[BasisName~~": done.",1];

End[];
EndPackage[];
];


TBRestrictBasis[inBasisName_String, outBasisName_String, {indices__Integer},CacheDirectory_String:"./TBCache"]:=Module[{indexList},
If[Not@MemberQ[TBAvailableBasisNames,inBasisName],Print["Unknown Basis \""~~inBasisName~~"\"!"];Abort[]];
If[MemberQ[TBAvailableBasisNames,outBasisName],Print["Basis \""~~outBasisName~~"\" already exists!"];Abort[]];

indexList={indices} ;
If[Not@AllTrue[indexList,(#<=Length[TBInternal[inBasisName,"Basis"]])&],Print["Indices out of range!"];Abort[]];

BeginPackage["TensorBases`"];
Begin["`Private`"];
TBAutoDefine[outBasisName]=True;
TBRequiredGroups[outBasisName]=TBRequiredGroups[inBasisName];
TBVertex[outBasisName]=TBVertex[inBasisName];
TBVertexStructure[outBasisName]=TBVertexStructure[inBasisName];
TBVertexBasis[outBasisName]=TBVertexBasis[inBasisName];
TBInnerProduct[outBasisName]=TBInnerProduct[inBasisName];
TBCanonicalProduct[outBasisName]=TBCanonicalProduct[inBasisName];
TBComment[outBasisName]=TBComment[inBasisName];
TBAuthor[outBasisName]=TBAuthor[inBasisName];
TBUsage[outBasisName]=TBUsage[inBasisName];
TBIndices[outBasisName]=TBIndices[inBasisName];
TBMomentumConservation[outBasisName]=TBMomentumConservation[inBasisName];
TBBasis[outBasisName]=Map[TBBasis[inBasisName][[#]]&,indexList];

Unprotect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
TBAutoDefineBasisNoLoad[outBasisName,CacheDirectory];
Protect[TBGetBasisElement,TBGetMetric,TBGetInverseMetric,TBGetProjector,TBInfo,TBGetVertex,TBGetInnerProduct,TBGetCanonicalProduct];
End[];
EndPackage[];
]


TBUnregister[BasisName_String]:=Module[{},
If[Not@MemberQ[TBAvailableBasisNames,BasisName],Print["Unknown Basis \""~~BasisName~~"\"!"];Abort[]];

TBAvailableBasisNames=DeleteCases[TBAvailableBasisNames,BasisName];
]
