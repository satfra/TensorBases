(* The defining property of the basis/projector pair:

       < P_i | e_j >  =  delta_ij

   This is the strongest single regression test in the suite. It exercises the
   basis elements, the projectors, the metric that produced them, the inner
   product, the InsertOutputNaming bridge and the FormTracer trace end to end,
   on the cached data in cache/<Basis>/. If a refactor silently changes the
   physics, this is what catches it.

   Three details are load-bearing, each learned by getting it wrong first:

   1. The pairing must use the basis' *own* inner product, not a bare trace.
      TBInnerProduct["AA"] carries a factor 2 (bases/AA.m:33), so a plain
      FormTrace of P_i e_j yields diag(1/2,1/2) rather than the identity.
   2. Momentum conservation has to be imposed, or qbq leaves a residual
      -sp[p1,p2]/sp[p1,p1] that is only 1 once p2 = -p1.
   3. UseLorentzLinearity must run before Simplify, or sp[p1,-p1] never reduces
      to -sp[p1,p1]. modules/Transformations.m:25 does the same three steps.

   The trace uses FormTracer`FormTrace rather than the package-internal
   TBFormTrace: the accessors already return FormTracer's user-facing naming, so
   no TensorBases`Private` symbol is needed. *)

tests = {};

(* n-point momentum conservation: the last momentum is minus the sum of the
   others. Every basis in the suite declares its momenta as p1..pn. *)
momentumRule[b_String] :=
    Module[{momenta},
        momenta = Table[Symbol["Global`p" <> ToString[i]],
                        {i, Length[TensorBases`TBGetBasisFields[b]]}];
        {Last[momenta] -> -Total[Most[momenta]]}
    ];

reduce[expr_, b_String] :=
    Simplify[Global`UseLorentzLinearity[expr //. momentumRule[b]]];

dualityMatrix[b_String, product_, tensor_] :=
    Module[{n = TensorBases`TBGetBasisSize[b], op = product[b]},
        Table[
            reduce[FormTracer`FormTrace[op[TensorBases`TBGetProjector, i, tensor, j]], b],
            {i, n}, {j, n}]
    ];

(* --- tensor bases: projectors are dual to the basis elements --- *)
Scan[
    Function[b,
        AppendTo[tests, VerificationTest[
            dualityMatrix[b, TensorBases`TBGetInnerProduct, TensorBases`TBGetBasisElement],
            IdentityMatrix[TensorBases`TBGetBasisSize[b]],
            TestID -> "Projector: " <> b <> " projectors are dual to the basis elements"]]],
    {"cbc", "qbq", "AA", "AqbqOpt", "AqbqSimple"}];

(* --- vertex bases: no basis elements exist (Registration.m:264 replaces
       TBGetBasisElement with an abort stub), so the vertices play that role and
       the canonical product replaces the inner product. --- *)
Scan[
    Function[b,
        AppendTo[tests, VerificationTest[
            dualityMatrix[b, TensorBases`TBGetCanonicalProduct, TensorBases`TBGetVertex],
            IdentityMatrix[TensorBases`TBGetBasisSize[b]],
            TestID -> "Projector: " <> b <> " (vertex basis) projectors are dual to the vertices"]]],
    {"AAA", "AAAClass"}];
