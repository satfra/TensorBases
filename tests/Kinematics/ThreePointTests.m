(* The TB3P* three-point parametrisations (modules/Kinematics.m).

   Each of these returns a *function* built from a Dispatch rule set, not a
   transformed expression -- so the shape assertions below matter as much as the
   round trips.

   Every "To" direction mutates System`$Assumptions as a side effect
   (Kinematics.m:81,134,203,250,311,360). Each test restores it via Block, or
   assumptions accumulate across the suite and later FullSimplify calls slow to
   a crawl. *)

tests = {};

(* --- shape: all six constructors return functions --- *)
AppendTo[tests, VerificationTest[
    Block[{System`$Assumptions = System`$Assumptions},
        Head /@ {
            TensorBases`TB3PToS0S1SPhi[Global`p1, Global`p2, Global`p3,
                Global`S0, Global`S1, Global`SPhi],
            TensorBases`TB3PFromS0S1SPhi[Global`p1, Global`p2, Global`p3,
                Global`S0, Global`S1, Global`SPhi],
            TensorBases`TB3PToS0S1SPhiQk[Global`Q, Global`k,
                Global`S0, Global`S1, Global`SPhi],
            TensorBases`TB3PFromS0S1SPhiQk[Global`Q, Global`k,
                Global`S0, Global`S1, Global`SPhi],
            TensorBases`TB3PToS0as[Global`p1, Global`p2, Global`p3,
                Global`S0, Global`a, Global`s],
            TensorBases`TB3PFromS0as[Global`p1, Global`p2, Global`p3,
                Global`S0, Global`a, Global`s]}],
    ConstantArray[Function, 6],
    TestID -> "ThreePoint: every TB3P constructor returns a function"]];

(* --- round trips: From . To must be the identity on the invariants --- *)
(* The physical domain. The positivity of the momentum invariants has to be
   stated here even though TB3PFromS0S1SPhi already passes exactly these
   conditions to its own FullSimplify (Kinematics.m:180) -- see the BUG test at
   the end of this file for why those have no effect. *)
positivity = Global`sp[Global`p1, Global`p1] > 0 &&
             Global`sp[Global`p2, Global`p2] > 0 &&
             Global`sp[Global`p1, Global`p1] + 4 Global`sp[Global`p1, Global`p2] +
                 4 Global`sp[Global`p2, Global`p2] > 0;

assumptions = Global`S0 > 0 && 1 >= Global`S1 > 0 &&
              -Pi < Global`SPhi <= Pi && positivity;

(* The parametrisation is built from p1 -> Q, p2 -> -k - Q/2, p3 -> k - Q/2
   (Kinematics.m:93-95), which already satisfies p1 + p2 + p3 = 0. The round trip
   therefore closes only *modulo momentum conservation*: without it, the residual
   on sp[p2,p2] is
     (sp[p1,p1] - 2 sp[p1,p2] + 2 sp[p1,p3] - 3 sp[p2,p2] - 2 sp[p2,p3] + sp[p3,p3])/4
   which vanishes identically once p3 = -p1 - p2. UseLorentzLinearity is what
   expands sp[p1, -p1-p2] into its terms. *)
conserve[expr_] :=
    Global`UseLorentzLinearity[expr /. Global`p3 -> -Global`p1 - Global`p2];

roundTrip[invariant_] :=
    Block[{System`$Assumptions = System`$Assumptions},
        Module[{to, from},
            to = TensorBases`TB3PToS0S1SPhi[Global`p1, Global`p2, Global`p3,
                     Global`S0, Global`S1, Global`SPhi];
            from = TensorBases`TB3PFromS0S1SPhi[Global`p1, Global`p2, Global`p3,
                     Global`S0, Global`S1, Global`SPhi];
            FullSimplify[conserve[from[to[invariant]] - invariant],
                Assumptions -> System`$Assumptions && assumptions]]
    ];

Scan[
    Function[{invariant, name},
        AppendTo[tests, VerificationTest[
            roundTrip[invariant], 0,
            TestID -> "ThreePoint: S0/S1/SPhi round trip is the identity on " <> name]]] @@ # &,
    {
        {Global`sp[Global`p1, Global`p1], "sp[p1,p1]"},
        {Global`sp[Global`p2, Global`p2], "sp[p2,p2]"},
        {Global`sp[Global`p3, Global`p3], "sp[p3,p3]"},
        {Global`sp[Global`p1, Global`p2], "sp[p1,p2]"}
    }];

roundTripAS[invariant_] :=
    Block[{System`$Assumptions = System`$Assumptions},
        Module[{to, from},
            to = TensorBases`TB3PToS0as[Global`p1, Global`p2, Global`p3,
                     Global`S0, Global`a, Global`s];
            from = TensorBases`TB3PFromS0as[Global`p1, Global`p2, Global`p3,
                     Global`S0, Global`a, Global`s];
            FullSimplify[conserve[from[to[invariant]] - invariant],
                Assumptions -> System`$Assumptions && Global`S0 > 0 &&
                    0 <= Global`a <= 1 && 0 <= Global`s < 1 && positivity]]
    ];

Scan[
    Function[{invariant, name},
        AppendTo[tests, VerificationTest[
            roundTripAS[invariant], 0,
            TestID -> "ThreePoint: S0/a/s round trip is the identity on " <> name]]] @@ # &,
    {
        {Global`sp[Global`p1, Global`p1], "sp[p1,p1]"},
        {Global`sp[Global`p1, Global`p2], "sp[p1,p2]"}
    }];

AppendTo[tests, VerificationTest[
    Block[{System`$Assumptions = System`$Assumptions},
        TBPrivateSymbolsIn[
            TensorBases`TB3PToS0S1SPhi[Global`p1, Global`p2, Global`p3,
                Global`S0, Global`S1, Global`SPhi][Global`sp[Global`p1, Global`p1]]]],
    {},
    TestID -> "ThreePoint: the parametrised result contains no TensorBases` symbols"]];

(* BUG (modules/Kinematics.m:81,134,203,250,311,360): each "To" constructor
   assigns to System`$Assumptions rather than passing assumptions locally. The
   caller's global state is silently mutated, the assumptions accumulate across
   calls, and every later FullSimplify in the session pays for them.
   Fix: build the assumption expression locally and pass it via
   FullSimplify[..., Assumptions -> ...] instead of assigning to
   System`$Assumptions. *)
AppendTo[tests, VerificationTest[
    Block[{System`$Assumptions = System`$Assumptions},
        Module[{before = System`$Assumptions},
            TensorBases`TB3PToS0S1SPhi[Global`p1, Global`p2, Global`p3,
                Global`S0, Global`S1, Global`SPhi];
            System`$Assumptions === before]],
    True,
    TestID -> "BUG: TB3PToS0S1SPhi does not mutate $Assumptions (Kinematics.m:81)"]];

(* BUG (modules/Kinematics.m:180, and likewise :238, :271, :298): the Assumptions
   passed to the internal FullSimplify are written with a bare `sp`:
     Assumptions -> ... && sp[p1,p1] >= 0 && sp[p2,p2] >= 0 && sp[p3,p3] >= 0 ...
   Inside the package `sp` resolves to TensorBases`Private`sp, an inert symbol
   unrelated to the TBsp/Global`sp the rules are actually written in. Those
   assumptions therefore constrain nothing, and the parametrisation cannot close
   its own round trip: the residual on sp[p2,p2] is a difference of square roots
   that only vanishes given sp[p1,p1] > 0. The caller has to supply the
   positivity externally (see `positivity` above) to get an identity.
   The same bare-`sp` confusion appears in the Qvec/kvec constructions at
   Kinematics.m:85-86, 207-208, 314-315.
   Fix: use TBsp throughout Kinematics.m; the Qk variants' assumptions should
   also refer to Q and k rather than p1, p2, p3. *)
AppendTo[tests, VerificationTest[
    Block[{System`$Assumptions = System`$Assumptions},
        Module[{to, from},
            to = TensorBases`TB3PToS0S1SPhi[Global`p1, Global`p2, Global`p3,
                     Global`S0, Global`S1, Global`SPhi];
            from = TensorBases`TB3PFromS0S1SPhi[Global`p1, Global`p2, Global`p3,
                     Global`S0, Global`S1, Global`SPhi];
            FullSimplify[
                conserve[from[to[Global`sp[Global`p2, Global`p2]]] -
                         Global`sp[Global`p2, Global`p2]],
                Assumptions -> Global`S0 > 0 && 1 >= Global`S1 > 0 &&
                    -Pi < Global`SPhi <= Pi]]],
    0,
    TestID -> "BUG: TB3PFromS0S1SPhi's own positivity assumptions take effect (Kinematics.m:180)"]];

(* The suite must leave $Assumptions exactly as it found it. *)
AppendTo[tests, VerificationTest[
    System`$Assumptions === TBTestBaseAssumptions, True,
    TestID -> "ThreePoint: the suite leaves $Assumptions unchanged"]];
