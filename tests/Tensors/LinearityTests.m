(* Global`UseLorentzLinearity (modules/FormTracerGroups.m:335-387).

   It expands sums and numeric factors inside the user-facing sp/sps/vec/vecs by
   temporarily attaching Orderless and linearity DownValues to those symbols,
   evaluating, and then clearing them again. *)

tests = {};

ul = Global`UseLorentzLinearity;

AppendTo[tests, VerificationTest[
    ul[Global`sp[Global`p, Global`q1 + Global`q2]],
    Global`sp[Global`p, Global`q1] + Global`sp[Global`p, Global`q2],
    TestID -> "Linearity: sp is additive in its second slot"]];

AppendTo[tests, VerificationTest[
    ul[Global`sp[Global`p1 + Global`p2, Global`q]],
    Global`sp[Global`p1, Global`q] + Global`sp[Global`p2, Global`q],
    TestID -> "Linearity: sp is additive in its first slot"]];

AppendTo[tests, VerificationTest[
    ul[Global`sp[Global`p, -Global`q]], -Global`sp[Global`p, Global`q],
    TestID -> "Linearity: sp pulls out a sign"]];

AppendTo[tests, VerificationTest[
    ul[Global`sp[Global`p, 3 Global`q]], 3 Global`sp[Global`p, Global`q],
    TestID -> "Linearity: sp pulls out a numeric factor"]];

AppendTo[tests, VerificationTest[
    ul[Global`vec[Global`p1 + Global`p2, Global`mu]],
    Global`vec[Global`p1, Global`mu] + Global`vec[Global`p2, Global`mu],
    TestID -> "Linearity: vec is additive"]];

AppendTo[tests, VerificationTest[
    ul[Global`vec[-Global`p, Global`mu]], -Global`vec[Global`p, Global`mu],
    TestID -> "Linearity: vec pulls out a sign"]];

AppendTo[tests, VerificationTest[
    ul[Global`vecs[2 Global`p, Global`mu]], 2 Global`vecs[Global`p, Global`mu],
    TestID -> "Linearity: vecs pulls out a numeric factor"]];

AppendTo[tests, VerificationTest[
    ul[Global`sps[Global`p, Global`q1 + Global`q2]],
    Global`sps[Global`p, Global`q1] + Global`sps[Global`p, Global`q2],
    TestID -> "Linearity: sps is additive"]];

(* Both factors of a product must expand in one pass. *)
(* Both factors expand, though the result is left factored rather than
   distributed -- compare under Expand. *)
AppendTo[tests, VerificationTest[
    Expand @ ul[Global`sp[Global`p, Global`q1 + Global`q2] *
                Global`vec[Global`p1 + Global`p2, Global`mu]],
    Expand[(Global`sp[Global`p, Global`q1] + Global`sp[Global`p, Global`q2]) *
           (Global`vec[Global`p1, Global`mu] + Global`vec[Global`p2, Global`mu])],
    TestID -> "Linearity: both factors of a product expand in one pass"]];

AppendTo[tests, VerificationTest[
    ul[ul[Global`sp[Global`p, Global`q1 + Global`q2]]],
    ul[Global`sp[Global`p, Global`q1 + Global`q2]],
    TestID -> "Linearity: UseLorentzLinearity is a fixed point"]];

AppendTo[tests, VerificationTest[
    ul[Global`someUnrelatedHead[Global`x]], Global`someUnrelatedHead[Global`x],
    TestID -> "Linearity: unrelated expressions pass through untouched"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[ul[Global`sp[Global`p, Global`q1 + Global`q2]]], {},
    TestID -> "Linearity: the result contains no TensorBases` symbols"]];

(* BUG (modules/FormTracerGroups.m:355-359, 378-382): UseLorentzLinearitySP and
   UseLorentzLinearityVec attach their linearity rules to the user-facing
   Global`sp / Global`vec symbols and then ClearAll those symbols outright.
   ClearAll does not distinguish the rules the function just added from
   definitions the *user* set up beforehand, so calling UseLorentzLinearity --
   which every transformation and kinematics routine does internally -- silently
   destroys them. The function is also not reentrant for the same reason.
   Fix: save and restore DownValues/Attributes around the block (for example
   with Internal`InheritedBlock) instead of clearing the symbols. *)
AppendTo[tests, VerificationTest[
    Module[{result},
        Global`sp[Global`tbTestUserA, Global`tbTestUserB] = 99;
        ul[Global`sp[Global`p, Global`q1 + Global`q2]];
        result = Global`sp[Global`tbTestUserA, Global`tbTestUserB];
        Quiet@Unset[Global`sp[Global`tbTestUserA, Global`tbTestUserB]];
        result],
    99,
    TestID -> "BUG: UseLorentzLinearity preserves user definitions of sp (FormTracerGroups.m:355)"]];
