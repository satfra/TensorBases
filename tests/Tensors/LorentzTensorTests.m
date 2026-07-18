(* The Global`-context Lorentz tensor extensions (modules/LorentzTensors.m).

   These are loaded before BeginPackage, so they live in Global`, NOT in
   TensorBases`. Qualifying them as TensorBases`transProj would silently intern a
   fresh, definition-less symbol and every test below would pass vacuously.

   TBInsertCombinedLorentzTensors (LorentzTensors.m:129) is pure -- it applies
   TBReplacementsLorentzTensors and the combined-tensor list with no FormTracer
   call -- which makes it the most directly unit-testable function in the
   package. *)

tests = {};

ins = Global`TBInsertCombinedLorentzTensors;

(* --- explicit expansions --- *)
AppendTo[tests, VerificationTest[
    Simplify[ins[Global`transProj[Global`p, Global`mu, Global`nu]] -
        (Global`deltaLorentz[Global`mu, Global`nu] -
         Global`vec[Global`p, Global`mu] Global`vec[Global`p, Global`nu] /
             Global`sp[Global`p, Global`p])],
    0,
    TestID -> "Lorentz: transProj expands to delta - p_mu p_nu / p^2"]];

AppendTo[tests, VerificationTest[
    Simplify[ins[Global`longProj[Global`p, Global`mu, Global`nu]] -
        Global`vec[Global`p, Global`mu] Global`vec[Global`p, Global`nu] /
            Global`sp[Global`p, Global`p]],
    0,
    TestID -> "Lorentz: longProj expands to p_mu p_nu / p^2"]];

(* Completeness: the two projectors sum to the identity. *)
AppendTo[tests, VerificationTest[
    Simplify[ins[Global`transProj[Global`p, Global`mu, Global`nu] +
                 Global`longProj[Global`p, Global`mu, Global`nu]] -
        Global`deltaLorentz[Global`mu, Global`nu]],
    0,
    TestID -> "Lorentz: transProj + longProj is the identity"]];

(* --- projector algebra --- *)
AppendTo[tests, VerificationTest[
    ins[Global`transProj[Global`p, Global`mu, Global`rho] *
        Global`transProj[Global`p, Global`rho, Global`nu]],
    ins[Global`transProj[Global`p, Global`mu, Global`nu]],
    TestID -> "Lorentz: transProj is idempotent"]];

AppendTo[tests, VerificationTest[
    ins[Global`longProj[Global`p, Global`mu, Global`rho] *
        Global`longProj[Global`p, Global`rho, Global`nu]],
    ins[Global`longProj[Global`p, Global`mu, Global`nu]],
    TestID -> "Lorentz: longProj is idempotent"]];

AppendTo[tests, VerificationTest[
    ins[Global`transProj[Global`p, Global`mu, Global`rho] *
        Global`longProj[Global`p, Global`rho, Global`nu]],
    0,
    TestID -> "Lorentz: transProj and longProj are orthogonal"]];

(* BUG (modules/LorentzTensors.m:107): TBReplacementsLorentzTensors is
   order-sensitive. transProj[p,mu,rho] longProj[p,rho,nu] reduces to 0 (above),
   but the same product written the other way round does not -- it expands to
     vec[p,mu] vec[p,rho] (deltaLorentz[rho,nu] - vec[p,nu] vec[p,rho]/sp[p,p])
                                                                     / sp[p,p]
   and stays there, because Simplify cannot perform the formal sum over the
   repeated index rho; only a rewrite rule can. The product of two projectors is
   commutative, so both orderings must reduce.
   Fix: add the mirrored contraction rules to TBReplacementsLorentzTensors. *)
AppendTo[tests, VerificationTest[
    ins[Global`longProj[Global`p, Global`mu, Global`rho] *
        Global`transProj[Global`p, Global`rho, Global`nu]],
    0,
    TestID -> "BUG: longProj . transProj also reduces to zero (LorentzTensors.m:107)"]];

(* --- stability --- *)
AppendTo[tests, VerificationTest[
    ins[ins[Global`transProj[Global`p, Global`mu, Global`rho] *
            Global`longProj[Global`p, Global`rho, Global`nu] +
            Global`transProj[Global`p, Global`mu, Global`nu]]],
    ins[Global`transProj[Global`p, Global`mu, Global`rho] *
        Global`longProj[Global`p, Global`rho, Global`nu] +
        Global`transProj[Global`p, Global`mu, Global`nu]],
    TestID -> "Lorentz: TBInsertCombinedLorentzTensors is a fixed point"]];

AppendTo[tests, VerificationTest[
    ins[Global`someUnrelatedHead[Global`x, Global`y]],
    Global`someUnrelatedHead[Global`x, Global`y],
    TestID -> "Lorentz: unrelated expressions pass through untouched"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[ins[Global`transProj[Global`p, Global`mu, Global`nu]]], {},
    TestID -> "Lorentz: expansion contains no TensorBases` symbols"]];

(* The two-momentum form (LorentzTensors.m:36). *)
AppendTo[tests, VerificationTest[
    Simplify[ins[Global`transProj[Global`p, Global`q, Global`mu, Global`nu]] -
        (Global`deltaLorentz[Global`mu, Global`nu] -
         Global`vec[Global`p, Global`mu] Global`vec[Global`q, Global`nu] /
             Global`sp[Global`p, Global`q])],
    0,
    TestID -> "Lorentz: the two-momentum transProj expands correctly"]];

(* BUG (modules/LorentzTensors.m:107): the finite-temperature projectors
   transProjMagnetic and transProjElectric have orthogonality identities
   registered with FormTracer (LorentzTensors.m:84-102), but no corresponding
   entries in TBReplacementsLorentzTensors. TBInsertCombinedLorentzTensors
   therefore expands both into their component form and never reduces the
   product to zero, unlike its zero-temperature counterpart above. Anyone
   working at finite T gets a silently unsimplified expression.
   Fix: add the finite-T contraction rules to TBReplacementsLorentzTensors. *)
AppendTo[tests, VerificationTest[
    Simplify @ ins[Global`transProjMagnetic[Global`p, Global`mu, Global`rho] *
                   Global`transProjElectric[Global`p, Global`rho, Global`nu]],
    0,
    TestID -> "BUG: magnetic and electric projectors are orthogonal (LorentzTensors.m:107)"]];

(* --- Dirac structures. sigma and pdash mint fresh Module dummies on every
       call (LorentzTensors.m:8), so they can never be compared with === and
       must be canonicalised first. --- *)
canonicalDummies[expr_] :=
    Module[{dummies},
        dummies = DeleteDuplicates @ Cases[expr,
            s_Symbol /; StringContainsQ[SymbolName[s], "$"], {0, Infinity}, Heads -> True];
        expr /. Thread[dummies -> Table[Symbol["Global`tbTestIdx" <> ToString[i]],
                                        {i, Length[dummies]}]]
    ];

AppendTo[tests, VerificationTest[
    canonicalDummies[Global`pdash[Global`p, Global`i, Global`j]],
    canonicalDummies[Global`pdash[Global`p, Global`i, Global`j]],
    TestID -> "Lorentz: pdash is reproducible modulo dummy index renaming"]];

(* Note the output naming: pdash is *defined* with TBgamma/TBvec but wrapped in
   TBInsertOutputNaming, so what reaches the user is gamma/vec in Global`. *)
AppendTo[tests, VerificationTest[
    MatchQ[canonicalDummies[Global`pdash[Global`p, Global`i, Global`j]],
        Global`gamma[d_, Global`i, Global`j] Global`vec[Global`p, d_]],
    True,
    TestID -> "Lorentz: pdash is gamma_mu p_mu with a shared dummy index"]];

AppendTo[tests, VerificationTest[
    MatchQ[canonicalDummies[Global`psdash[Global`p, Global`i, Global`j]],
        Global`gamma[d_, Global`i, Global`j] Global`vecs[Global`p, d_]],
    True,
    TestID -> "Lorentz: psdash is the spatial counterpart of pdash"]];

AppendTo[tests, VerificationTest[
    Simplify[canonicalDummies[Global`sigma[Global`mu, Global`nu, Global`i, Global`j]] +
             canonicalDummies[Global`sigma[Global`nu, Global`mu, Global`i, Global`j]]],
    0,
    TestID -> "Lorentz: sigma is antisymmetric in its two Lorentz indices"]];
