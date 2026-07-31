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

(* Momentum routing (Tools.m:172-183). All momenta are incoming: both factors
   are expanded with their first leg at +p, so the returned dressings belong to
   the same basis elements, at the same momenta, as the supplied ones. The
   inverse propagator used to be built at (-p,+p), which evaluated its tensors
   at -p while re-using the given dressings unchanged -- consistent only for
   dressings even under p -> -p.

   For qbq that is the textbook S(p) = (-i Z pslash + M)/(Z^2 p^2 + M^2); the
   momentum-odd pslash dressing is what pins the routing down. *)
AppendTo[tests, VerificationTest[
    Simplify @ TensorBases`TBMakePropagator["qbq", {Global`Z, Global`M}],
    {-Global`Z, Global`M}/(Global`M^2 + Global`Z^2 Global`sp[Global`p1, Global`p1]),
    TestID -> "Propagator: qbq inverts to the textbook (-i Z pslash + M)/D"]];

(* qbqFT is the sharper probe: its temporal element is a bare gamma_0, so a
   dressing that is *not* even in p -- omega-tilde = p_0 + I mu at finite
   chemical potential -- passes through untouched, while the spatial element
   I gamma.p is momentum-odd. Both dressings must come back negative relative
   to the mass term, which is Inverse[i Cw gamma_0 + i Zperp gamma.p + mq];
   checked independently against explicit Euclidean Dirac matrices. Under the
   old routing the spatial one came back positive. *)
AppendTo[tests, VerificationTest[
    Module[{prop = TensorBases`TBMakePropagator["qbqFT",
                     {Global`Cw, Global`Zperp, Global`mq}]},
        Simplify[Global`mq prop/prop[[3]]]],
    {-Global`Cw, -Global`Zperp, Global`mq},
    TestID -> "Propagator: qbqFT dressings match Inverse[Gamma] at the same momentum"]];

AppendTo[tests, VerificationTest[
    Simplify[Global`mq / TensorBases`TBMakePropagator["qbqFT",
                {Global`Cw, Global`Zperp, Global`mq}][[3]]],
    Global`Cw^2 + Global`mq^2 + Global`Zperp^2 Global`sps[Global`p1, Global`p1],
    TestID -> "Propagator: qbqFT denominator is Cw^2 + mq^2 + Zperp^2 p_spatial^2"]];

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
