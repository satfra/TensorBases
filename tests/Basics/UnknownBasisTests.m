(* Robustness: every public accessor must reject an unknown basis name, and the
   arity guards must reject calls with too few arguments.

   All of these paths diagnose with Print[...]; Abort[] rather than Message, so
   they are probed with TBTestAborts (tests/init.m), which catches the abort and
   swallows the printed diagnostic. *)

tests = {};

nope = "definitelyNotABasis";
idx1 = {Global`pA, Global`dA, Global`cA, Global`fA};
idx2 = {Global`pB, Global`dB, Global`cB, Global`fB};

(* --- unknown basis, element-style accessors --- *)
Scan[
    Function[{f, name},
        AppendTo[tests, VerificationTest[
            {TBTestAborts[f[nope, 1]], TBTestAborts[f[nope, All]],
             TBTestAborts[f[nope, 1, idx1, idx2]], TBTestAborts[f[nope, All, idx1, idx2]]},
            {True, True, True, True},
            TestID -> "UnknownBasis: " <> name <> " aborts on an unknown basis"]]] @@ # &,
    {
        {TensorBases`TBGetBasisElement, "TBGetBasisElement"},
        {TensorBases`TBGetVertex, "TBGetVertex"},
        {TensorBases`TBGetProjector, "TBGetProjector"}
    }];

(* --- unknown basis, single-argument accessors --- *)
Scan[
    Function[{f, name},
        AppendTo[tests, VerificationTest[
            TBTestAborts[f[nope]], True,
            TestID -> "UnknownBasis: " <> name <> " aborts on an unknown basis"]]] @@ # &,
    {
        {TensorBases`TBGetMetric, "TBGetMetric"},
        {TensorBases`TBGetInverseMetric, "TBGetInverseMetric"},
        {TensorBases`TBGetBasisSize, "TBGetBasisSize"},
        {TensorBases`TBGetBasisFields, "TBGetBasisFields"},
        {TensorBases`TBGetIdentityMatrix, "TBGetIdentityMatrix"},
        {TensorBases`TBExportCache, "TBExportCache"},
        {TensorBases`TBUnregister, "TBUnregister"}
    }];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetIndexSet[nope, 1, Global`p]], True,
    TestID -> "UnknownBasis: TBGetIndexSet aborts on an unknown basis"]];

(* BUG (modules/Tools.m:143,150): TBMakePropagator has no unknown-basis guard.
   It dereferences TBInternal[BasisName,"Indices"][[1,1]] straight away, so an
   unknown name first emits a raw Part::partd error that leaks the internal
   symbol name to the user, and only then aborts (from TBGetIndexSet).
   This test asserts the abort AND that no stray message is emitted -- it fails
   today on the message, not on the abort.
   Fix: add the standard MemberQ[TBAvailableBasisNames, ...] guard as the first
   line of TBMakePropagator. *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBMakePropagator[nope, {Global`Za}]], True,
    TestID -> "BUG: TBMakePropagator aborts cleanly on an unknown basis (Tools.m:150)"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBRestrictBasis[nope, "someOutputBasis", {1}]], True,
    TestID -> "UnknownBasis: TBRestrictBasis aborts on an unknown input basis"]];

(* BUG (modules/Tools.m:115,121): TBGetBasis is the only accessor family without
   the `If[Not@MemberQ[TBAvailableBasisNames, BasisName], ...]` guard that all of
   its siblings carry. An unknown name therefore produces a confusing abort from
   deep inside MakeIndexList instead of `Unknown Basis "..."!`.
   Fix: add the standard guard as the first line of both TBGetBasis definitions. *)
AppendTo[tests, VerificationTest[
    TBCapturePrint[TensorBases`TBGetBasis[nope]],
    _String?(StringContainsQ[#, nope] &),
    TestID -> "BUG: TBGetBasis reports the unknown basis name (Tools.m:115)",
    SameTest -> MatchQ]];

(* --- arity guards (modules/Defaults.m:18-23, 38-43, 49-51, 74-79) --- *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetBasisElement["qbq"]],
     TBTestAborts[TensorBases`TBGetBasisElement[]],
     TBTestAborts[TensorBases`TBGetVertex["qbq"]],
     TBTestAborts[TensorBases`TBGetVertex[]],
     TBTestAborts[TensorBases`TBGetProjector["qbq"]],
     TBTestAborts[TensorBases`TBGetProjector[]],
     TBTestAborts[TensorBases`TBGetMetric[]],
     TBTestAborts[TensorBases`TBGetInverseMetric[]]},
    ConstantArray[True, 8],
    TestID -> "UnknownBasis: accessors abort when called with too few arguments"]];

(* --- vertex bases shadow the tensor-only accessors (Registration.m:6-19,97) --- *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetBasisElement["AAA", 1]],
     TBTestAborts[TensorBases`TBGetBasisElement["AAA", All]],
     TBTestAborts[TensorBases`TBGetInnerProduct["AAA"]]},
    {True, True, True},
    TestID -> "UnknownBasis: a vertex basis rejects basis-element and inner-product access"]];

(* ...but its vertex-side accessors must still work. *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetVertex["AAA", 1]],
     TBTestAborts[TensorBases`TBGetMetric["AAA"]],
     TBTestAborts[TensorBases`TBGetCanonicalProduct["AAA"]]},
    {False, False, False},
    TestID -> "UnknownBasis: a vertex basis still serves vertices, metric and canonical product"]];
