(* TBProjectToSymmetricPoint / TBProjectToSymmetricPointSpatial
   (modules/Kinematics.m:36,60).

   At the symmetric point all momenta have equal magnitude and mutual angles, so
     sp[pi,pi] -> sp[p,p]
     sp[pi,pj] -> -1/(n-1) sp[p,p]     (i != j)
   and the last momentum is eliminated by momentum conservation. *)

tests = {};

sp3[expr_] := TensorBases`TBProjectToSymmetricPoint[expr, Global`q, Global`p,
                  Global`p1, Global`p2, Global`p3];

AppendTo[tests, VerificationTest[
    sp3[Global`sp[Global`p1, Global`p1]], Global`sp[Global`p, Global`p],
    TestID -> "SymmetricPoint: sp[p1,p1] becomes sp[p,p]"]];

AppendTo[tests, VerificationTest[
    sp3[Global`sp[Global`p1, Global`p2]], -Global`sp[Global`p, Global`p]/2,
    TestID -> "SymmetricPoint: sp[p1,p2] becomes -sp[p,p]/2 for three momenta"]];

(* With four momenta the coefficient is -1/(n-1) = -1/3. *)
AppendTo[tests, VerificationTest[
    TensorBases`TBProjectToSymmetricPoint[Global`sp[Global`p1, Global`p2],
        Global`q, Global`p, Global`p1, Global`p2, Global`p3, Global`p4],
    -Global`sp[Global`p, Global`p]/3,
    TestID -> "SymmetricPoint: the off-diagonal coefficient tracks the momentum count"]];

(* The last momentum is eliminated via momentum conservation
   (Kinematics.m:46). *)
AppendTo[tests, VerificationTest[
    Global`UseLorentzLinearity @ sp3[Global`vec[Global`p3, Global`mu]],
    -Global`vec[Global`p1, Global`mu] - Global`vec[Global`p2, Global`mu],
    TestID -> "SymmetricPoint: the last momentum is eliminated"]];

AppendTo[tests, VerificationTest[
    FreeQ[sp3[Global`vec[Global`p3, Global`mu]], Global`p3], True,
    TestID -> "SymmetricPoint: no trace of the eliminated momentum remains"]];

(* The angle symbols are built by string concatenation
     Symbol["cos" ~~ StringJoin @ (ToString /@ Sort[{#, q}])]
   (Kinematics.m:44). That naming is a user-visible contract -- downstream code
   refers to cosp1q by name -- so pin it, including the context. *)
AppendTo[tests, VerificationTest[
    FreeQ[sp3[Global`sp[Global`p1, Global`q]], Global`cosp1q], False,
    TestID -> "SymmetricPoint: the angle symbol is named cosp1q"]];

AppendTo[tests, VerificationTest[
    Context[Global`cosp1q], "Global`",
    TestID -> "SymmetricPoint: the angle symbol lives in Global`"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[sp3[Global`sp[Global`p1, Global`q]]], {},
    TestID -> "SymmetricPoint: the result contains no TensorBases` symbols"]];

(* Spatial variant (Kinematics.m:60). *)
AppendTo[tests, VerificationTest[
    TensorBases`TBProjectToSymmetricPointSpatial[Global`sps[Global`p1, Global`p1],
        Global`q, Global`p, Global`p1, Global`p2, Global`p3],
    Global`sps[Global`p, Global`p],
    TestID -> "SymmetricPoint: the spatial variant maps sps[p1,p1] to sps[p,p]"]];

(* BUG (modules/Kinematics.m:46): the momentum-conservation rule is
     momentaList[[nMomenta]] -> -Total[momentaList[[1 ;; nMomenta - 1]]]
   With a single momentum the sum on the right is over an empty list, so the
   rule reads p1 -> 0 and the sole momentum is silently replaced by zero:
     TBProjectToSymmetricPoint[vec[p1,mu], q, p, p1]  ==>  vec[0, mu]
   No error, no warning -- the expression is simply annihilated. A symmetric
   point is not defined for fewer than two momenta.
   Fix: guard with If[Length[{momenta}] < 2, Print[...]; Abort[]] at the top of
   both TBProjectToSymmetricPoint and TBProjectToSymmetricPointSpatial.

   Asserted as an abort, not as FreeQ[..., vec[0,_]]: the fix prescribed just
   above aborts, so the FreeQ this test originally used never gets a value to
   inspect. Both spellings rule out the silent annihilation; only this one is
   consistent with the guard actually being there. *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBProjectToSymmetricPoint[Global`vec[Global`p1, Global`mu],
              Global`q, Global`p, Global`p1]],
    True,
    TestID -> "BUG: a one-momentum symmetric point does not zero the momentum (Kinematics.m:46)"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBProjectToSymmetricPointSpatial[Global`vec[Global`p1, Global`mu],
              Global`q, Global`p, Global`p1]],
    True,
    TestID -> "SymmetricPoint: the spatial variant also rejects a single momentum"]];
