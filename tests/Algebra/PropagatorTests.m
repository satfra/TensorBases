(* TBMakePropagator (modules/Tools.m:143) and TBGetIdentityMatrix
   (modules/Tools.m:6,30). *)

tests = {};

(* Inverting a diagonal two-point function must give the reciprocals. *)
AppendTo[tests, VerificationTest[
    Simplify @ TensorBases`TBMakePropagator["AA", {Global`Za, Global`Zl}],
    {1/Global`Za, 1/Global`Zl},
    TestID -> "Propagator: AA inverse propagator {Za,Zl} inverts to {1/Za,1/Zl}"]];

AppendTo[tests, VerificationTest[
    Simplify @ TensorBases`TBMakePropagator["cbc", {Global`Zc}],
    {1/Global`Zc},
    TestID -> "Propagator: cbc inverse propagator {Zc} inverts to {1/Zc}"]];

(* Inversion is an involution -- normalisation-independent, so it is the robust
   form of the same statement. *)
Scan[
    Function[{b, coeffs},
        AppendTo[tests, VerificationTest[
            Simplify @ TensorBases`TBMakePropagator[b, TensorBases`TBMakePropagator[b, coeffs]],
            coeffs,
            TestID -> "Propagator: " <> b <> " inversion is an involution"]]] @@ # &,
    {
        {"cbc", {Global`Zc}},
        {"AA", {Global`Za, Global`Zl}}
    }];

AppendTo[tests, VerificationTest[
    Length @ TensorBases`TBMakePropagator["AA", {Global`Za, Global`Zl}],
    TensorBases`TBGetBasisSize["AA"],
    TestID -> "Propagator: the result has one coefficient per basis element"]];

(* The three-argument form only substitutes the basis' declared momentum
   (Tools.m:183-186). *)
AppendTo[tests, VerificationTest[
    {FreeQ[TensorBases`TBMakePropagator["AA", {Global`Za, Global`Zl}, Global`kk], Global`p1],
     FreeQ[TensorBases`TBMakePropagator["AA", {Global`Za, Global`Zl}, Global`kk], Global`kk]},
    {True, True},
    TestID -> "Propagator: the momentum form eliminates the declared momentum p1"]];

(* BUG (modules/Tools.m:143,168): TBMakePropagator never checks that InvProp has
   one entry per basis element. Tools.m:168 dots it straight against the vertex
   list, so a wrong-length argument produces a burst of raw Dot::dotsh shape
   errors -- leaking internal symbol names -- before aborting somewhere further
   down. The abort does happen; what fails here is that it is not clean.
   Fix: guard with
     If[Length[InvProp] =!= TBGetBasisSize[BasisName],
        Print["..."]; Abort[]]
   as the first line of TBMakePropagator. *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBMakePropagator["cbc", {Global`Za, Global`Zl, Global`Zx}]], True,
    TestID -> "BUG: a too-long inverse propagator is rejected cleanly (Tools.m:168)"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBMakePropagator["AA", {Global`Za}]], True,
    TestID -> "BUG: a too-short inverse propagator is rejected cleanly (Tools.m:168)"]];

(* --- TBGetIdentityMatrix --- *)

(* chooseDelta (Tools.m:51-68) has no fallback branch: an index whose kind it
   does not recognise makes it return Null, which then silently poisons the
   product. qbq is the strongest probe available -- Dirac, fundamental colour
   and fundamental flavour indices all at once. *)
AppendTo[tests, VerificationTest[
    FreeQ[TensorBases`TBGetIdentityMatrix["qbq"], Null], True,
    TestID -> "IdentityMatrix: qbq identity contains no Null factors"]];

AppendTo[tests, VerificationTest[
    Sort[Head /@ List @@ TensorBases`TBGetIdentityMatrix["qbq"]],
    Sort[{Global`deltaDirac, Global`deltaFundCol, Global`deltaFundFlav}],
    TestID -> "IdentityMatrix: qbq identity is delta_dirac * delta_colour * delta_flavour"]];

AppendTo[tests, VerificationTest[
    {FreeQ[TensorBases`TBGetIdentityMatrix["cbc"], Null],
     FreeQ[TensorBases`TBGetIdentityMatrix["AA"], Null]},
    {True, True},
    TestID -> "IdentityMatrix: cbc and AA identities contain no Null factors"]];

(* Only defined for two-point functions (Tools.m:35-37). *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetIdentityMatrix["AAA"]],
     TBTestAborts[TensorBases`TBGetIdentityMatrix["AqbqOpt"]]},
    {True, True},
    TestID -> "IdentityMatrix: three-point bases are rejected"]];

(* MakeIndexList (Helpers.m:36-38) guards the index arity. *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetIdentityMatrix["qbq",
        {Global`pA, Global`dA, Global`cA, Global`fA}]],
     TBTestAborts[TensorBases`TBGetIdentityMatrix["qbq", Global`pA, Global`pB]]},
    {True, True},
    TestID -> "IdentityMatrix: malformed index lists are rejected"]];
