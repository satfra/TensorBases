(* TBBasisTransformation and TBVertexTransformation (modules/Transformations.m).

   Both return cMetric11Inv . cMetric12, the matrix taking coefficients in the
   second basis to coefficients in the first. *)

tests = {};

(* Transforming a basis into itself must be the identity: it computes
   Inverse[cMetric11] . cMetric11 through two independent code paths. *)
Scan[
    Function[b,
        AppendTo[tests, VerificationTest[
            Simplify @ TensorBases`TBBasisTransformation[b, b],
            IdentityMatrix[TensorBases`TBGetBasisSize[b]],
            TestID -> "Transformation: TBBasisTransformation[" <> b <> "," <> b <> "] is the identity"]]],
    {"cbc", "qbq", "AA"}];

(* BUG (modules/Transformations.m:41,76 -- ParallelMap, and FormTracer's FORM
   invocation): this identity holds mathematically, and does hold in a fresh
   kernel that computes nothing else. In a longer session it fails
   intermittently, with FormTracer reporting

     DeleteFile::fdnfnd: ... "/tmp/runform_2026-07-18-18-32-51.355007-f29.frm"
                             not found.
     FormTracer`ImportFormResult::noformoutput: An unknown FORM error occured!
                                               No FORM output was generated.

   TBBasisTransformation and TBVertexTransformation map Simplify over the metric
   with ParallelMap, so several subkernels invoke FORM concurrently. FORM's
   scratch files are named from a timestamp alone, so two subkernels starting in
   the same instant collide and one deletes the other's file. The failure is
   silent at the API level: the affected matrix entries simply come back
   unreduced or wrong, and a transformation the user believes is exact is not.

   This test is therefore *flaky by nature* -- it passes when the race does not
   hit. It is left asserting the true invariant rather than being weakened,
   because the underlying non-reproducibility is the defect worth fixing.
   Fix: give FORM scratch files a per-kernel-unique name (include $KernelID or
   $ProcessID), or serialise the FORM calls in the transformation routines. *)
AppendTo[tests, VerificationTest[
    Simplify @ TensorBases`TBVertexTransformation["AAA", "AAA"],
    IdentityMatrix[TensorBases`TBGetBasisSize["AAA"]],
    TestID -> "BUG: TBVertexTransformation[AAA,AAA] is reproducibly the identity (Transformations.m:41)"]];

(* AqbqOpt and AqbqSimple span the same space with identical indices and
   canonical products, so the two transformations between them are mutually
   inverse. This is the real round trip. *)
AppendTo[tests, VerificationTest[
    Dimensions @ TensorBases`TBBasisTransformation["AqbqOpt", "AqbqSimple"],
    {TensorBases`TBGetBasisSize["AqbqOpt"], TensorBases`TBGetBasisSize["AqbqSimple"]},
    TestID -> "Transformation: AqbqOpt <- AqbqSimple has the expected shape"]];

AppendTo[tests, VerificationTest[
    Simplify[TensorBases`TBBasisTransformation["AqbqOpt", "AqbqSimple"] .
             TensorBases`TBBasisTransformation["AqbqSimple", "AqbqOpt"]],
    IdentityMatrix[TensorBases`TBGetBasisSize["AqbqOpt"]],
    TestID -> "Transformation: AqbqOpt <-> AqbqSimple round trip is the identity"]];

(* A vertex basis has no basis elements, so TBBasisTransformation must reject it
   with TBBasisTransformation::vertex (Transformations.m:6,14). *)
AppendTo[tests, VerificationTest[
    TBTestMessage[TensorBases`TBBasisTransformation["AAA", "qbq"],
                  TensorBases`TBBasisTransformation::vertex],
    True,
    TestID -> "Transformation: a vertex basis in argument 1 is rejected"]];

(* BUG (modules/Transformations.m:9): the guard reads
     isVertex = TBVertexBasis[BasisName1] || TBVertexBasis[BasisName1]
   -- argument 1 twice. A vertex basis passed as argument *2* therefore sails
   past the guard and aborts much later, deep inside TBGetBasisElement, with a
   diagnostic about the wrong basis. The call still aborts, so only the message
   channel distinguishes the two; that is what this test checks.
   Fix: the second term should be TBVertexBasis[BasisName2]. *)
AppendTo[tests, VerificationTest[
    TBTestMessage[TensorBases`TBBasisTransformation["qbq", "AAA"],
                  TensorBases`TBBasisTransformation::vertex],
    True,
    TestID -> "BUG: a vertex basis in argument 2 is rejected (Transformations.m:9)"]];

(* BUG (modules/AutoDefine.m:120): the canonical-product consistency check reads
     If[TBCanonicalProduct[BasisName1] =!= TBCanonicalProduct[BasisName1], ...]
   -- again argument 1 twice -- so TBMakeCanonicalProduct::canonical can never
   fire. Two bases with genuinely different canonical products
     AqbqOpt  Tensor1[1,2,3] Tensor2[1,3,2]
     AAA      Tensor1[1,2,3] Tensor2[1,2,3]
   are silently combined into a meaningless transformation matrix instead.
   Fix: the second term should be TBCanonicalProduct[BasisName2].

   Note on the message name: TBMakeCanonicalProduct is an *internal* symbol, so
   its messages live on TensorBases`Private`TBMakeCanonicalProduct. This test
   originally named TensorBases`TBMakeCanonicalProduct, which is a different
   (and otherwise unused) symbol in the public context, so the message could
   never match no matter what the source did. *)
AppendTo[tests, VerificationTest[
    TBTestMessage[TensorBases`TBVertexTransformation["AqbqOpt", "AAA"],
                  TensorBases`Private`TBMakeCanonicalProduct::canonical],
    True,
    TestID -> "BUG: mismatched canonical products are rejected (AutoDefine.m:120)"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[TensorBases`TBBasisTransformation["qbq", "qbq"]], {},
    TestID -> "Transformation: the result contains no TensorBases` symbols"]];
