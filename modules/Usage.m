(* ::Package:: *)

(* ::Title:: *)
(*Public symbols and usage messages*)

Tensor::usage="Symbol used by TensorBases to express vertex structures";
Tensor1::usage="Symbol used by TensorBases to express inner & canonical products";
Tensor2::usage="Symbol used by TensorBases to express inner & canonical products";


TBGetBasisElement::usage = "TBGetBasisElement[BasisName_String,n_Integer,indices___]
Obtains the n-th element of the specified basis. The given indices must match the ones specified by the basis, see TBInfo[].
If no indices are given, the standard indices specified by the basis are used.
TBGetBasisElement[BasisName_String,All,indices___]
Returns a list with all elements of the specified basis. The given indices must match the ones specified by the basis, see TBInfo[].
If no indices are given, the standard indices specified by the basis are used.";

TBGetVertex::usage = "TBGetVertex[BasisName_String,n_Integer,indices___]
Obtains the n-th vertex of the specified basis. The given indices must match the ones specified by the basis, see TBInfo[].
If no indices are given, the standard indices specified by the basis are used.
TBGetVertex[BasisName_String,All,indices___]
Returns a list with all vertices of the specified basis. The given indices must match the ones specified by the basis, see TBInfo[].
If no indices are given, the standard indices specified by the basis are used.";

TBGetInnerProduct::usage = "TBGetInnerProduct[BasisName_String]
Returns the bilinear operator \[ScriptCapitalO] that represents the inner product of the specified basis. 
It can be called as \[ScriptCapitalO][Tensor1, n, Tensor2, m], where Tensor1 and Tensor2 are functions with signatures Tensor[BasisName_String, n_Integer, indices___].
For example, \[ScriptCapitalO][TBGetBasisElement, 2, TBGetBasisElement, 1] returns <\!\(\*SubscriptBox[\(e\), \(2\)]\),\!\(\*SubscriptBox[\(e\), \(1\)]\)>.";

TBGetCanonicalProduct::usage = "TBGetCanonicalProduct[BasisName_String]
Returns the bilinear operator \[ScriptCapitalO] that represents the canonical product (i.e. the euclidean inner product) of the specified basis. 
It can be called as \[ScriptCapitalO][Tensor1, n, Tensor2, m], where Tensor1 and Tensor2 are functions with signatures Tensor[BasisName_String, n_Integer, indices___].
For example, \[ScriptCapitalO][TBGetBasisElement, 2, TBGetBasisElement, 1] returns <\!\(\*SubscriptBox[\(e\), \(2\)]\),\!\(\*SubscriptBox[\(e\), \(1\)]\)\!\(\*SubscriptBox[\(>\), \(can\)]\).";

TBGetMetric::usage = "TBGetMetric[BasisName_String]
Returns the metric of the specified basis, i.e. the matrix \!\(\*SubscriptBox[\(g\), \(ij\)]\) = <\!\(\*SubscriptBox[\(e\), \(i\)]\),\!\(\*SubscriptBox[\(e\), \(j\)]\)>, where the \!\(\*SubscriptBox[\(e\), \(i\)]\) are the basis elements of the basis.";

TBGetInverseMetric::usage = "TBGetInverseMetric[BasisName_String]
Returns the inverse of the metric of the specified basis, i.e. the matrix \!\(\*SuperscriptBox[SubscriptBox[\(g\), \(ij\)], \(-1\)]\) = (<\!\(\*SubscriptBox[\(e\), \(i\)]\),\!\(\*SubscriptBox[\(e\), \(j\)]\)>\!\(\*SuperscriptBox[\()\), \(-1\)]\), where the \!\(\*SubscriptBox[\(e\), \(i\)]\) are the basis elements of the basis.";

TBGetBasisFields::usage = "TBGetBasisFields[BasisName_String]
Returns the field content in the order as used for the indices of the basis.";

TBGetProjector::usage = "TBGetBasisProjector[BasisName_String,n_Integer,indices___]
Returns the n-th projector, which is defined by \!\(\*SuperscriptBox[SubscriptBox[\(g\), \(nj\)], \(-1\)]\)\!\(\*SubscriptBox[\(e\), \(j\)]\). The given indices must match the ones specified by the basis, see TBInfo[]. 
If no indices are given, the standard indices specified by the basis are used.
TBGetVertex[BasisName_String,All,indices___]
Returns a list with all projectors of the specified basis, defined by \!\(\*SuperscriptBox[SubscriptBox[\(g\), \(nj\)], \(-1\)]\)\!\(\*SubscriptBox[\(e\), \(j\)]\). The given indices must match the ones specified by the basis, see TBInfo[].
If no indices are given, the standard indices specified by the basis are used.";

TBInfo::usage = "TBInfo[_String]
Return information on a given object. 
TBInfo[] prints all available bases with some usage information. 
TBInfo[BasisName] prints detailed information provided by this basis.
TBInfo[\"FormTracer\"] prints all defined groups and identites which FormTracer currently knows.
TBInfo[\"Extensions\"] prints all extensions to FormTracer, defined by the TensorBases package.
TBInfo[\"Momenta\"] prints all momentum transformations that can be performed by the TensorBases package.";

TBImportBasis::usage = "TBImportBasis[BasisDefinitionFile_String,CacheDirectory_String:\"./TBCache\"]
Import a custom basis definition file. The optional argument CacheDirectory can be set to choose a specific location where the intermediate files from processing the basis are stored.";

TBExportBasis::usage = "TBExportBasis[BasisName_String,folder_String:\"./\"]
Export a basis definition file. The basis with the name BasisName has to be loaded in memory. If the optional argument folder is given, this will be the location where the exported basis definition will be placed.";

TBRestrictBasis::usage = "TBRestrictBasis[inBasisName_String, outBasisName_String, {indices__Integer}, CacheDirectory_String:\"./TBCache\"]
Restrict an existing basis. The new basis will be called outBasisName and only contain the basis elements specified by the given indices.";

TBConstructBasis::usage = "TBConstructBasis[options...]

Construct a new basis from a given set of Tensors.
Example call:
TBConstructBasis[\[IndentingNewLine]\"Name\"->\"FourFermionBasis\",\[IndentingNewLine]\"Vertex\"->{psibar,psi,psibar,psi},\[IndentingNewLine]\"VertexStructure\"->2(Tensor[1,2,3,4]-Tensor[1,4,3,2]),\[IndentingNewLine]\"InnerProduct\"->2Tensor1[1,2,3,4](Tensor2[2,1,4,3]-Tensor2[4,1,2,3]),\[IndentingNewLine]\"Indices\"->{{p1,d1},{p2,d2},{p3,d3},{p4,d4}},\[IndentingNewLine]\"Tensors\"->{{deltaDirac[d1,d2]deltaDirac[d3,d4],gamma[mu,d1,d2]gamma[mu,d3,d4],gamma5[d1,d2]gamma5[d3,d4],gamma[mu,d1,dint1]gamma5[dint1,d2]gamma[mu,d3,d3int]gamma5[d3int,d4],sigma[mu,nu,d1,d2]sigma[mu,nu,d3,d4]\[IndentingNewLine]}}\[IndentingNewLine]]
For all possible options, see Options[TBConstructBasis]

";

TBConstructVertexBasis::usage = "TBConstructVertexBasis[options...]

Construct a new vertex basis from a given set of Tensors.
Example call:
TBConstructBasis[\[IndentingNewLine]\"Name\"->\"FourFermionBasis\",\[IndentingNewLine]\"Vertex\"->{psibar,psi,psibar,psi},\[IndentingNewLine]\"VertexStructure\"->2(Tensor[1,2,3,4]-Tensor[1,4,3,2]),\[IndentingNewLine]\"Indices\"->{{p1,d1},{p2,d2},{p3,d3},{p4,d4}},\[IndentingNewLine]\"Tensors\"->{{deltaDirac[d1,d2]deltaDirac[d3,d4],gamma[mu,d1,d2]gamma[mu,d3,d4],gamma5[d1,d2]gamma5[d3,d4],gamma[mu,d1,dint1]gamma5[dint1,d2]gamma[mu,d3,d3int]gamma5[d3int,d4],sigma[mu,nu,d1,d2]sigma[mu,nu,d3,d4]\[IndentingNewLine]}}\[IndentingNewLine]]
For all possible options, see Options[TBConstructBasis]

";

TBExportCache::usage = "TBExportCache[BasisName_String,CacheFolder_String:\"./TBCache\"]
Exports everything in memory of the Basis BasisName onto disk in the folder CacheFolder.";

TBUnregister::usage = "TBUnregister[BasisName_String]
Remove an existing basis from internal memory. This does not delete or change any files on disk.";

TBBasisExists::usage = "TBBasisExists[BasisName_String]
Returns True or False, depending if the given Basis exists in memory.";

TBList::usage = "TBList[]
Returns as a list all basis names in memory.";


TBBasisTransformation::usage = "TBBasisTransformation[toBasis_String,fromBasis_String]
Returns a matrix for the transformation of coordinates (i.e. dressings) from the basis \"fromBasis\" to the basis \"toBasis\".
I.e. given a set of dressings dress = {d1,d2,d3...} in \"fromBasis\", we get the set of dressings dressbar = {db1,db2,db3,...} in \"toBasis\" from dressbar = TBBasisTransformation[toBasis,fromBasis].dress";

TBVertexTransformation::usage = "TBVertexTransformation[toBasis_String,fromBasis_String]
Returns a matrix for the transformation of coordinates (i.e. (!) vertex dressings) from the basis \"fromBasis\" to the basis \"toBasis\".
I.e. given a set of (!) vertex dressings dress = {d1,d2,d3...} in \"fromBasis\", we get the set of dressings dressbar = {db1,db2,db3,...} in \"toBasis\" from dressbar = TBBasisTransformation[toBasis,fromBasis].dress";


TBGetIdentityMatrix::usage = "TBGetIdentityMatrix[BasisName_String,indices___]
Returns an identity matrix for the given two-point function BasisName. Works only for two-point functions.
If no indices are given, the standard indices specified by the basis are used.";

TBGetBasisSize::usage = "TBGetBasisSize[BasisName_String]
Get the size of a basis of with name \"BasisName\".";

TBGetIndexSet::usage = "TBGetIndexSet[BasisName_String,id_Integer,p_Symbol]
Get a unique index set for particle id in the Basis \"BasisName\" with momentum p.
TBGetIndexSet[set_List,p_]
Change the momentum of an index set to p.
";

TBGetBasis::usage= "TBGetBasis[BasisName_String,indices___]
Returns a list with all basis elements.
If no indices are given, the standard indices specified by the basis are used.";

TBMakePropagator::usage = "TBMakePropagator[BasisName_String,InvProp_List]
For a two-point basis \"BasisName\", obtain a propagator for a given inverse propagator.
InvProp should be a list of basis element coefficients making up the inverse propagator.
For example, {\[ImaginaryI], Mq[p]} for the Basis \"qbq\" for the standard quark propagator in vacuum.
TBMakePropagator[BasisName_String,InvProp_List,p]
Uses the momentum p in the output.";


TB3PToS0S1SPhi::usage="TB3PToS0S1SPhi[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]
Given three momenta p1,p2,p3, obtain a function which transforms these to the representation in terms of S0,S1 and SPhi.
Returns a function which takes one argument, the expression to be transformed.

TB3PToS0S1SPhi[p1_Symbol,p2_Symbol,p3_Symbol,q_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]
If an additional momentum q is supplied, it is included in the transformation. Currently this assumes that q is a four-dimensional vector and is described by
q={cos1,\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)cos1,\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos1\), \(2\)]\)]\)\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)Cos[phi],\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos1\), \(2\)]\)]\)\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)Sin[phi]}
";

TB3PFromS0S1SPhi::usage="TB3PFromS0S1SPhi[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]
Given three momenta p1,p2,p3, obtain a function which transforms from the representation in terms of S0,S1 and SPhi back to the momenta p1,p2,p3.
Returns a function which takes one argument, the expression to be transformed.
";

TB3PToS0S1SPhiQk::usage="TB3PToS0S1SPhi[Q_Symbol,k_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]
Given two momenta Q,k obtain a function which transforms these to the representation in terms of S0,S1 and SPhi.
Returns a function which takes one argument, the expression to be transformed.

TB3PToS0S1SPhi[Q_Symbol,k_Symbol,q_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]
If an additional momentum q is supplied, it is included in the transformation. Currently this assumes that q is a four-dimensional vector and is described by
q={cos1,\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)cos1,\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos1\), \(2\)]\)]\)\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)Cos[phi],\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos1\), \(2\)]\)]\)\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)Sin[phi]}
";

TB3PFromS0S1SPhiQk::usage="TB3PFromS0S1SPhi[Q_Symbol,k_Symbol,S0_Symbol,S1_Symbol,SPhi_Symbol]
Given two momenta Q,k, obtain a function which transforms from the representation in terms of S0,S1 and SPhi back to the momenta Q,k.
Returns a function which takes one argument, the expression to be transformed.
";

TB3PToS0as::usage="TB3PToS0as[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,a_Symbol,s_Symbol]
Given three momenta p1,p2,p3, obtain a function which transforms these to the representation in terms of S0, a and s.
Returns a function which takes one argument, the expression to be transformed.

TB3PToS0as[p1_Symbol,p2_Symbol,p3_Symbol,q_Symbol,S0_Symbol,a_Symbol,s_Symbol]
If an additional momentum q is supplied, it is included in the transformation. Currently this assumes that q is a four-dimensional vector and is described by
q={cos1,\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)cos1,\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos1\), \(2\)]\)]\)\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)Cos[phi],\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos1\), \(2\)]\)]\)\!\(\*SqrtBox[\(1 - \*SuperscriptBox[\(cos2\), \(2\)]\)]\)Sin[phi]}
";

TB3PFromS0as::usage="TB3PFromS0as[p1_Symbol,p2_Symbol,p3_Symbol,S0_Symbol,a_Symbol,s_Symbol]
Given three momenta p1,p2,p3, obtain a function which transforms from the representation in terms of S0, a and s back to the momenta p1,p2,p3.
Returns a function which takes one argument, the expression to be transformed.
";

TBProjectToSymmetricPoint::usage="TBProjectToSymmetricPoint[expr_,q_Symbol,p_Symbol,momenta___Symbol]
Project an expression with internal loop momentum q to the symmetric point with average momentum p. The last arguments should be all involved momenta. 
According to their number, the correct symmetric-point configuration is chosen.
";

TBProjectToSymmetricPointSpatial::usage="TBProjectToSymmetricPointSpatial[expr_,q_Symbol,p_Symbol,momenta___Symbol]
Project an expression with internal loop momentum q to the symmetric point in the d-1 dimensional subspace with average momentum p.
This is useful for applications at finite temperature, where the 0th component is discrete.
The last arguments should be all involved momenta. According to their number, the correct symmetric-point configuration is chosen.
";


TBInfo["FormTracer"]:=Global`ShowFormTracerDefinitions[];
TBInfo["Extensions"]:=Global`ShowFormTracerExtensions[];


TBInfo["BaseBuilder"]:=Print@"TensorBases provides facilities for exporting and importing bases:
\nTBImportBasis and TBExportBasis allow for importing user-written basis definition files and automatic export of bases in memory to such definition files.
\nTBExportCache writes any basis data in memory to disk at a specified location.
\nTBUnregister allows to remove basis names from the registry, which allows one to overwrite bases by custom imports.
\nTBRestrictBasis creates a new basis from an old one by simple restriction.
\nTBConstructBasis creates a new basis from a set of primitive tensors. The method automatically takes tensor products of multiple given tensor spaces and reduces any overcomplete set using a given inner product to a minimal basis (a maximal linearly independent set).
\nTBConstructVertexBasis creates a new vertex basis from a set of primitive tensors. 
\nFor usage help with the aforementioned functions, please call their usage messages, e.g. TBConstructBasis::usage.
";


TBInfo["Notation"]:=Print@"\!\(\*
StyleBox[\"TensorBases\",\nFontWeight->\"Bold\"]\) uses the following conventions and notation:
For a given group, \!\(\*SuperscriptBox[\(T\), \(a\)]\) denotes the generators of the group in the fundamental representation, \!\(\*SuperscriptBox[\(t\), \(a\)]\) denotes the generators in the adjoint representation.
\!\(\*SubscriptBox[\(\[Epsilon]\), \(abc\)]\) is the fully anti-symmetric Levi-Civita symbol.
The \!\(\*SuperscriptBox[\(T\), \(a\)]\) are normalised as 
	tr[\!\(\*SuperscriptBox[\(T\), \(a\)]\)\!\(\*SuperscriptBox[\(T\), \(b\)]\)] = \!\(\*FractionBox[\(1\), \(2\)]\)\!\(\*SubscriptBox[\(\[Delta]\), \(ab\)]\).
The \!\(\*SubscriptBox[\(\[Gamma]\), \(\[Mu]\(\\\ \)\)]\)denote Euclidean gamma matrices and accordingly \!\(\*SubscriptBox[\(\[Gamma]\), \(5\(\\\ \)\)]\)= \!\(\*SubscriptBox[\(\[Gamma]\), \(0\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(1\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(2\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(3\)]\)
";
