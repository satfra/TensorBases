(* TBGetIndexSet and the index plumbing around it (modules/Tools.m:15-27). *)

tests = {};

(* --- the pure two-argument form (Tools.m:25) --- *)
AppendTo[tests, VerificationTest[
    TensorBases`TBGetIndexSet[{Global`p1, Global`d1, Global`A1, Global`F1}, Global`k],
    {Global`k, Global`d1, Global`A1, Global`F1},
    TestID -> "IndexSet: the list form replaces only the momentum slot"]];

AppendTo[tests, VerificationTest[
    TensorBases`TBGetIndexSet[{Global`p1, Global`c1}, -Global`k],
    {-Global`k, Global`c1},
    TestID -> "IndexSet: the list form accepts a compound momentum expression"]];

(* --- the three-argument form (Tools.m:15) --- *)
AppendTo[tests, VerificationTest[
    First[TensorBases`TBGetIndexSet["qbq", 1, Global`k]], Global`k,
    TestID -> "IndexSet: the momentum lands in slot 1"]];

AppendTo[tests, VerificationTest[
    Length[TensorBases`TBGetIndexSet["qbq", 1, Global`k]], 4,
    TestID -> "IndexSet: qbq index sets have four slots"]];

AppendTo[tests, VerificationTest[
    Length[TensorBases`TBGetIndexSet["cbc", 1, Global`k]], 2,
    TestID -> "IndexSet: cbc index sets have two slots"]];

AppendTo[tests, VerificationTest[
    Length[TensorBases`TBGetIndexSet["qbq", 1, Global`k]] ===
        Length[TensorBases`TBGetIndexSet["qbq", 2, Global`k]], True,
    TestID -> "IndexSet: both legs of a two-point basis have equal length"]];

(* Index symbols are freshly Unique'd on every call, so two calls must not
   collide -- otherwise contracting two tensors would tie together indices that
   are meant to be independent. Compare by stem, never by identity. *)
AppendTo[tests, VerificationTest[
    Rest[TensorBases`TBGetIndexSet["qbq", 1, Global`k]] ===
        Rest[TensorBases`TBGetIndexSet["qbq", 1, Global`k]], False,
    TestID -> "IndexSet: successive calls return distinct index symbols"]];

(* The generated names are at least recognisably derived from the declared
   indices d1, A1, F1 of bases/qbq.m:52. *)
AppendTo[tests, VerificationTest[
    StringTake[SymbolName[#], 1] & /@ Rest[TensorBases`TBGetIndexSet["qbq", 1, Global`k]],
    {"d", "A", "F"},
    TestID -> "IndexSet: generated indices are derived from the declared ones"]];

(* BUG (modules/Tools.m:21): TBGetIndexSet uniquifies with
     Map[Unique[SymbolName[#]] &, indices[[2;;]]]
   Unique on a *string* appends the counter with no separator, so the declared
   index d1 becomes d174. That name is ambiguous (d1+74 or d17+4), cannot be
   mapped back to its origin, and can collide with an unrelated user symbol.
   Everywhere else the package uses TBUnique (modules/Helpers.m:21-25), which
   emits Context<>stem<>"$"<>counter -- unambiguous and context-preserving.
   Fix: use TBUnique in TBGetIndexSet. *)
AppendTo[tests, VerificationTest[
    AllTrue[Rest[TensorBases`TBGetIndexSet["qbq", 1, Global`k]],
        StringContainsQ[SymbolName[#], "$"] &],
    True,
    TestID -> "BUG: TBGetIndexSet indices carry a $ separator (Tools.m:21)"]];

(* TBUnique, used by TBGetBasis for closed indices, gets this right -- the
   contrast is the point. *)
AppendTo[tests, VerificationTest[
    AllTrue[Rest[TensorBases`TBGetIndexSet[{Global`p1, Global`d1}, Global`k]],
        StringFreeQ[SymbolName[#], "$"] &],
    True,
    TestID -> "IndexSet: the list form passes declared indices through untouched"]];

(* --- range guard (Tools.m:17) --- *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBGetIndexSet["qbq", 99, Global`k]], True,
    TestID -> "IndexSet: an out-of-range leg index aborts"]];

(* BUG (modules/Tools.m:17): the out-of-range branch reads
     Print["Basis \"" ~~ ... ~~ " elements!" ;] Abort[]
   The `;` sits *inside* the brackets, so Print receives
   CompoundExpression[string, Null] -- i.e. Print[Null]. The user gets a blank
   line and an abort with no indication of what went wrong.
   (The abort itself is correctly conditional: the `]` closes Print[, not If[.)
   Fix: move the `;` outside -- Print[... ~~ " elements!"]; Abort[].
   The wording should also say "index sets" rather than "elements". *)
AppendTo[tests, VerificationTest[
    TBCapturePrint[TensorBases`TBGetIndexSet["qbq", 99, Global`k]],
    _String?(StringContainsQ[#, "qbq"] &),
    TestID -> "BUG: out-of-range TBGetIndexSet names the basis (Tools.m:17)",
    SameTest -> MatchQ]];

(* For contrast, the unknown-basis branch one line above prints correctly. *)
AppendTo[tests, VerificationTest[
    TBCapturePrint[TensorBases`TBGetIndexSet["definitelyNotABasis", 1, Global`k]],
    _String?(StringContainsQ[#, "definitelyNotABasis"] &),
    TestID -> "IndexSet: the unknown-basis diagnostic names the basis",
    SameTest -> MatchQ]];
