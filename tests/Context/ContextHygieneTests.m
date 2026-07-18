(* Context hygiene -- the most fragile part of the package.

   bases/*.m carry no context declaration at all, so every symbol in a basis
   definition resolves against whatever $Context is active at Import time
   (modules/Registration.m:284). Everything crossing the public API boundary is
   supposed to have been mapped back into Global` by InsertOutputNaming
   (modules/Internal.m:47-80), whose final catch-all rule rewrites *every*
   remaining TensorBases`Private` symbol.

   These tests pin that contract: no expression handed to a user may contain a
   TensorBases` or TensorBases`Private` symbol. *)

tests = {};

idx1 = {Global`pA, Global`dA, Global`cA, Global`fA};
idx2 = {Global`pB, Global`dB, Global`cB, Global`fB};

Scan[
    Function[{expr, name},
        AppendTo[tests, VerificationTest[
            TBPrivateSymbolsIn[expr], {},
            TestID -> "Context: " <> name <> " returns no TensorBases` symbols"]]] @@ # &,
    {
        {TensorBases`TBGetBasisElement["qbq", 1], "TBGetBasisElement[qbq,1]"},
        {TensorBases`TBGetBasisElement["qbq", All], "TBGetBasisElement[qbq,All]"},
        {TensorBases`TBGetBasisElement["cbc", 1], "TBGetBasisElement[cbc,1]"},
        {TensorBases`TBGetBasisElement["AA", All], "TBGetBasisElement[AA,All]"},
        {TensorBases`TBGetVertex["qbq", All], "TBGetVertex[qbq,All]"},
        {TensorBases`TBGetVertex["AAA", 1], "TBGetVertex[AAA,1] (vertex basis)"},
        {TensorBases`TBGetProjector["AA", 1], "TBGetProjector[AA,1]"},
        {TensorBases`TBGetProjector["qbq", All], "TBGetProjector[qbq,All]"},
        {TensorBases`TBGetMetric["qbq"], "TBGetMetric[qbq]"},
        {TensorBases`TBGetMetric["AAA"], "TBGetMetric[AAA]"},
        {TensorBases`TBGetInverseMetric["AA"], "TBGetInverseMetric[AA]"},
        {TensorBases`TBGetIdentityMatrix["qbq"], "TBGetIdentityMatrix[qbq]"},
        {TensorBases`TBGetIdentityMatrix["cbc"], "TBGetIdentityMatrix[cbc]"},
        {TensorBases`TBGetBasis["cbc"], "TBGetBasis[cbc]"},
        {TensorBases`TBGetBasisFields["AA"], "TBGetBasisFields[AA]"},
        {TensorBases`TBGetIndexSet["qbq", 1, Global`p], "TBGetIndexSet[qbq,1,p]"},
        {TensorBases`TBMakePropagator["AA", {Global`Za, Global`Zl}], "TBMakePropagator[AA,..]"},
        {Global`TBInsertCombinedLorentzTensors[Global`transProj[Global`p, Global`mu, Global`nu]],
            "TBInsertCombinedLorentzTensors"}
    }];

(* InsertOutputNaming hardcodes exactly two group renames, color and flavor
   (Internal.m:63-66). Everything else relies on the catch-all, so pin the two
   special cases explicitly. *)
AppendTo[tests, VerificationTest[
    Context[Global`color], "Global`",
    TestID -> "Context: the color group symbol lives in Global`"]];

AppendTo[tests, VerificationTest[
    Context[Global`flavor], "Global`",
    TestID -> "Context: the flavor group symbol lives in Global`"]];

AppendTo[tests, VerificationTest[
    Context /@ {Global`transProj, Global`longProj, Global`sigma, Global`pdash},
    {"Global`", "Global`", "Global`", "Global`"},
    TestID -> "Context: the Lorentz tensor extensions live in Global`"]];

(* The index symbols an accessor hands back must be Global` too, or they will
   not match the Global` symbols in the tensors they are meant to index. *)
AppendTo[tests, VerificationTest[
    DeleteDuplicates[Context /@ TensorBases`TBGetIndexSet["qbq", 1, Global`p]], {"Global`"},
    TestID -> "Context: TBGetIndexSet returns Global` index symbols"]];

(* $Context must be intact after both a successful and an aborting call.
   GlobalContext (Internal.m:10-17) saves and restores $Context by hand instead
   of using Block, and the package aborts on every error path, so an abort
   raised inside its body would strand the kernel in Global`. Observing this
   requires standing somewhere other than Global`. *)
AppendTo[tests, VerificationTest[
    Block[{$Context = "TBTestSandbox`"},
        TensorBases`TBGetMetric["qbq"];
        $Context],
    "TBTestSandbox`",
    TestID -> "Context: $Context survives a successful accessor call"]];

AppendTo[tests, VerificationTest[
    Block[{$Context = "TBTestSandbox`"},
        TBTestAborts[TensorBases`TBGetMetric["definitelyNotABasis"]];
        $Context],
    "TBTestSandbox`",
    TestID -> "Context: $Context survives an aborting accessor call"]];

(* Whatever happened above, the API must still be usable afterwards. If a
   previous abort had corrupted $Context, the naming bridge would misresolve and
   private symbols would start leaking through. *)
AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[TensorBases`TBGetVertex["qbq", 1]], {},
    TestID -> "Context: the API still returns clean output after an abort"]];
