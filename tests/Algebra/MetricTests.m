(* Metric invariants. These are the cheapest end-to-end check that the cached
   per-basis data in cache/<Basis>/ is self-consistent: the metric and inverse
   metric are derived independently (modules/AutoDefine.m via TBBuildMetric /
   TBBuildInverseMetric), so their product being the identity is a real
   constraint rather than a tautology. *)

tests = {};

bases = TensorBases`TBList[];

Scan[
    Function[b,
        Module[{n = TensorBases`TBGetBasisSize[b]},

            AppendTo[tests, VerificationTest[
                Dimensions[TensorBases`TBGetMetric[b]], {n, n},
                TestID -> "Metric: " <> b <> " metric is square of the basis size"]];

            AppendTo[tests, VerificationTest[
                Dimensions[TensorBases`TBGetInverseMetric[b]], {n, n},
                TestID -> "Metric: " <> b <> " inverse metric is square of the basis size"]];

            AppendTo[tests, VerificationTest[
                Simplify[TensorBases`TBGetMetric[b] . TensorBases`TBGetInverseMetric[b]],
                IdentityMatrix[n],
                TestID -> "Metric: " <> b <> " metric . inverse metric is the identity"]];

            AppendTo[tests, VerificationTest[
                Simplify[TensorBases`TBGetInverseMetric[b] . TensorBases`TBGetMetric[b]],
                IdentityMatrix[n],
                TestID -> "Metric: " <> b <> " inverse metric . metric is the identity"]];

            AppendTo[tests, VerificationTest[
                Simplify[Det[TensorBases`TBGetMetric[b]]] === 0, False,
                TestID -> "Metric: " <> b <> " metric is non-degenerate"]];
        ]],
    bases];

(* Metric symmetry is NOT universal, and asserting it for every basis would be
   wrong. M_ij = <e_i|e_j>, so M is symmetric only when the basis' inner product
   is itself symmetric under exchanging Tensor1 and Tensor2:

     cbc, qbq  Tensor1[1,2] Tensor2[2,1]     symmetric
     AA        2 Tensor1[1,2] Tensor2[1,2]   symmetric
     AAA       Tensor1[1,2,3] Tensor2[1,2,3] symmetric
     Aqbq*     Tensor1[1,2,3] Tensor2[1,3,2] NOT symmetric -- legs 2 and 3 are
                                             swapped between the two tensors

   AqbqSimple's metric is measurably asymmetric (8 non-zero entries in
   M - Transpose[M]) while its twin AqbqOpt is symmetric, despite the two having
   identical inner products, indices and momentum conservation. That difference
   is a property of the chosen tensors -- AqbqOpt is the orthogonalised variant --
   not a defect, so only the symmetric-pairing bases are asserted here. *)
Scan[
    Function[b,
        AppendTo[tests, VerificationTest[
            Simplify[TensorBases`TBGetMetric[b] - Transpose[TensorBases`TBGetMetric[b]]],
            ConstantArray[0, {TensorBases`TBGetBasisSize[b], TensorBases`TBGetBasisSize[b]}],
            TestID -> "Metric: " <> b <> " metric is symmetric"]]],
    {"cbc", "qbq", "AA", "AAA", "AAAClass"}];
