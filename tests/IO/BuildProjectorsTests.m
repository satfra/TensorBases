(* "BuildProjectors" -> False: a vertex basis used ONLY as a Feynman rule.

   Such a basis is read through TBGetVertex and never projected with, so building its metric,
   inverse metric and projectors is pure waste -- and on a large vertex basis that waste dominates
   everything else. Measured on the finite-T electric/magnetic gluon vertex bases (qcd-codes SP_EM):
   the three-point Gram cost 125 s, and the four-point one had not finished after an hour at 13 GB.

   Two things have to hold for the option to be safe rather than merely fast:
     * projecting with such a basis must FAIL LOUDLY, not return something plausible, and
     * a cached import must not quietly recompute what construction skipped -- which is why the
       trait travels in the exported definition file and TBAutoDefineVertexBasis honours it.

   Everything here works on throwaway bases so the shared ones are never disturbed. *)

tests = {};

scratchBP = FileNameJoin[{$TemporaryDirectory, "TBBuildProjTests" <> ToString[$ProcessID]}];
Quiet@CreateDirectory[scratchBP, CreateIntermediateDirectories -> True];

(* A deliberately cheap two-element ghost-gluon-like basis: this suite is about the option, not
   about the algebra. *)
bpIdx = {{Global`p1, Global`mu, Global`a1}, {Global`p2, Global`a2}, {Global`p3, Global`a3}};
bpT1  = I Global`FCol[Global`a1, Global`a2, Global`a3] *
        Global`transProj[Global`p1, Global`mu, Global`nu] Global`vec[Global`p2, Global`nu];
bpT2  = I Global`FCol[Global`a1, Global`a2, Global`a3] Global`vec[Global`p1, Global`mu];

bpMake[name_String, opts___] := Block[{$Output = {}},
  TensorBases`TBConstructVertexBasis[
    "Name" -> name,
    "RequiredGroups" -> {{Global`color, FormTracer`SUNfund, Global`Nc}},
    "Vertex" -> {Global`A, Global`cb, Global`c},
    "VertexStructure" -> TensorBases`Tensor[1, 2, 3],
    "CanonicalProduct" -> TensorBases`Tensor1[1, 2, 3] TensorBases`Tensor2[1, 2, 3],
    "Indices" -> bpIdx,
    "MomentumConservation" -> {Global`p3 -> -Global`p1 - Global`p2},
    "Tensors" -> {{bpT1, bpT2}}, opts]];

(* dummy indices are minted fresh per construction (TBUnique), so two builds of the same tensor
   differ only in those names; compare modulo them *)
bpCanon[e_] := Module[{d = DeleteDuplicates@Cases[e, s_Symbol /; StringContainsQ[SymbolName[s], "$"], Infinity]},
  e /. Thread[d -> Table[Symbol["bpDummy" <> ToString[i]], {i, Length[d]}]]];

bpMake["tbTestBPDefault"];
bpMake["tbTestBPNoProj", "BuildProjectors" -> False];

(* ------------------------------------------------------------------ *)
(* the default path must be completely unchanged                       *)
(* ------------------------------------------------------------------ *)

AppendTo[tests, VerificationTest[
    FreeQ[TensorBases`TBGetMetric["tbTestBPDefault"], _TensorBases`TBGetMetric], True,
    TestID -> "BuildProjectors: the default build still has a metric"]];

AppendTo[tests, VerificationTest[
    Simplify[TensorBases`TBGetMetric["tbTestBPDefault"] .
             TensorBases`TBGetInverseMetric["tbTestBPDefault"]],
    IdentityMatrix[2],
    TestID -> "BuildProjectors: the default build has a consistent metric"]];

(* ------------------------------------------------------------------ *)
(* "BuildProjectors" -> False                                          *)
(* ------------------------------------------------------------------ *)

AppendTo[tests, VerificationTest[
    TensorBases`TBGetBasisSize["tbTestBPNoProj"], 2,
    TestID -> "BuildProjectors: a Feynman-rule-only basis is still registered"]];

AppendTo[tests, VerificationTest[
    bpCanon[TensorBases`TBGetVertex["tbTestBPNoProj", 1, Sequence @@ bpIdx]] ===
    bpCanon[TensorBases`TBGetVertex["tbTestBPDefault", 1, Sequence @@ bpIdx]],
    True,
    TestID -> "BuildProjectors: the vertex is identical to the default build"]];

(* The whole safety argument: these must abort rather than return anything. *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetMetric["tbTestBPNoProj"]], True,
    TestID -> "BuildProjectors: TBGetMetric aborts on a Feynman-rule-only basis"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetInverseMetric["tbTestBPNoProj"]], True,
    TestID -> "BuildProjectors: TBGetInverseMetric aborts on a Feynman-rule-only basis"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetProjector["tbTestBPNoProj", 1, Sequence @@ bpIdx]], True,
    TestID -> "BuildProjectors: TBGetProjector aborts on a Feynman-rule-only basis"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetProjector["tbTestBPNoProj", 1]], True,
    TestID -> "BuildProjectors: TBGetProjector aborts for every arity"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBConstructVertexBasis["Name" -> "tbTestBPBadFlag",
      "RequiredGroups" -> {{Global`color, FormTracer`SUNfund, Global`Nc}},
      "Vertex" -> {Global`A, Global`cb, Global`c},
      "VertexStructure" -> TensorBases`Tensor[1, 2, 3],
      "CanonicalProduct" -> TensorBases`Tensor1[1, 2, 3] TensorBases`Tensor2[1, 2, 3],
      "Indices" -> bpIdx, "MomentumConservation" -> {Global`p3 -> -Global`p1 - Global`p2},
      "Tensors" -> {{bpT1, bpT2}}, "BuildProjectors" -> "yes"]],
    True,
    {TensorBases`TBConstructVertexBasis::invalid},
    TestID -> "BuildProjectors: a non-boolean value is rejected"]];

(* ------------------------------------------------------------------ *)
(* export / import round trip                                          *)
(* ------------------------------------------------------------------ *)

Block[{$Output = {}},
  TensorBases`TBExportBasis["tbTestBPNoProj", scratchBP];
  TensorBases`TBExportCache["tbTestBPNoProj", scratchBP]];

AppendTo[tests, VerificationTest[
    StringContainsQ[Import[FileNameJoin[{scratchBP, "tbTestBPNoProj.m"}], "Text"],
                    "TBHasProjectors"],
    True,
    TestID -> "BuildProjectors: the exported definition carries the trait"]];

(* A constructed basis used to export the self-referential TBAutoDefine["x"]=TBAutoDefine["x"],
   which made TBImportBasis decline to register it at all. *)
AppendTo[tests, VerificationTest[
    StringFreeQ[Import[FileNameJoin[{scratchBP, "tbTestBPNoProj.m"}], "Text"],
                "TBAutoDefine[\"tbTestBPNoProj\"]=TBAutoDefine["],
    True,
    TestID -> "BuildProjectors: the export sets TBAutoDefine rather than self-referencing it"]];

AppendTo[tests, VerificationTest[
    {FileExistsQ[FileNameJoin[{scratchBP, "tbTestBPNoProj", "vertices.m"}]],
     FileExistsQ[FileNameJoin[{scratchBP, "tbTestBPNoProj", "metric.m"}]],
     FileExistsQ[FileNameJoin[{scratchBP, "tbTestBPNoProj", "projectors.m"}]]},
    {True, False, False},
    TestID -> "BuildProjectors: the cache holds vertices but no metric or projectors"]];

Block[{$Output = {}},
  TensorBases`TBUnregister["tbTestBPNoProj"];
  TensorBases`TBImportBasis[FileNameJoin[{scratchBP, "tbTestBPNoProj.m"}], scratchBP]];

AppendTo[tests, VerificationTest[
    TensorBases`TBBasisExists["tbTestBPNoProj"], True,
    TestID -> "BuildProjectors: a constructed basis survives an export/import round trip"]];

AppendTo[tests, VerificationTest[
    FreeQ[TensorBases`TBGetVertex["tbTestBPNoProj", 1, Sequence @@ bpIdx], _TensorBases`TBGetVertex],
    True,
    TestID -> "BuildProjectors: the re-imported basis still serves vertices"]];

(* The point of carrying the trait: without it AutoSaveRestore would find no cache file here and
   silently COMPUTE the metric on the import path, reinstating the cost the flag exists to avoid. *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetProjector["tbTestBPNoProj", 1, Sequence @@ bpIdx]], True,
    TestID -> "BuildProjectors: the re-imported basis still has no projectors"]];

AppendTo[tests, VerificationTest[
    FileExistsQ[FileNameJoin[{scratchBP, "tbTestBPNoProj", "metric.m"}]], False,
    TestID -> "BuildProjectors: the import did not recompute and cache a metric"]];

(* ------------------------------------------------------------------ *)
(* "Reduce" -> False: skip the linear-independence search              *)
(* ------------------------------------------------------------------ *)

(* ReduceTensorList finds a maximal independent subset by building the full n x n table of
   TBFormTrace'd inner products -- the same expensive Gram "BuildProjectors" avoids, computed again
   for a different reason. For a hand-written basis whose elements are independent by construction
   it establishes nothing. *)
bpMake["tbTestBPNoReduce", "BuildProjectors" -> False, "Reduce" -> False];

AppendTo[tests, VerificationTest[
    TensorBases`TBGetBasisSize["tbTestBPNoReduce"], 2,
    TestID -> "Reduce: the tensors are taken verbatim"]];

AppendTo[tests, VerificationTest[
    bpCanon[TensorBases`TBGetVertex["tbTestBPNoReduce", 1, Sequence @@ bpIdx]] ===
    bpCanon[TensorBases`TBGetVertex["tbTestBPDefault", 1, Sequence @@ bpIdx]],
    True,
    TestID -> "Reduce: skipping the reduction leaves the vertices unchanged"]];

(* Order matters as much as count: the dressing <-> element assignment downstream is positional. *)
AppendTo[tests, VerificationTest[
    bpCanon[TensorBases`TBGetVertex["tbTestBPNoReduce", 2, Sequence @@ bpIdx]] ===
    bpCanon[TensorBases`TBGetVertex["tbTestBPDefault", 2, Sequence @@ bpIdx]],
    True,
    TestID -> "Reduce: the element order is preserved"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBConstructVertexBasis["Name" -> "tbTestBPBadReduce",
      "RequiredGroups" -> {{Global`color, FormTracer`SUNfund, Global`Nc}},
      "Vertex" -> {Global`A, Global`cb, Global`c},
      "VertexStructure" -> TensorBases`Tensor[1, 2, 3],
      "CanonicalProduct" -> TensorBases`Tensor1[1, 2, 3] TensorBases`Tensor2[1, 2, 3],
      "Indices" -> bpIdx, "MomentumConservation" -> {Global`p3 -> -Global`p1 - Global`p2},
      "Tensors" -> {{bpT1, bpT2}}, "Reduce" -> 0]],
    True,
    {TensorBases`TBConstructVertexBasis::invalid},
    TestID -> "Reduce: a non-boolean value is rejected"]];

(* Teardown: the shared registry must be exactly as this file found it. Leaving the throwaway bases
   registered fails Lifecycle's teardown assertion, which is the point of having one. *)
AppendTo[tests, VerificationTest[
    Block[{$Output = {}},
      Scan[If[TensorBases`TBBasisExists[#], TensorBases`TBUnregister[#]] &,
           {"tbTestBPDefault", "tbTestBPNoProj", "tbTestBPNoReduce"}]];
    Quiet@DeleteDirectory[scratchBP, DeleteContents -> True];
    Select[TensorBases`TBList[], StringStartsQ[#, "tbTestBP"] &], {},
    TestID -> "BuildProjectors: teardown leaves the shared registry untouched"]];
