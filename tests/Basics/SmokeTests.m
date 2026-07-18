(* Smoke test: the package loads and registers the bases named in tests/init.m. *)

tests = {};

AppendTo[tests, VerificationTest[
    MemberQ[TensorBases`TBList[], "cbc"], True,
    TestID -> "Smoke: package loads and registers the cbc basis"]];

AppendTo[tests, VerificationTest[
    Sort[TensorBases`TBList[]], Sort[Global`TBBasisList],
    TestID -> "Smoke: exactly the bases requested in init.m are registered"]];

AppendTo[tests, VerificationTest[
    AllTrue[TensorBases`TBList[], StringQ], True,
    TestID -> "Smoke: TBList returns a list of strings"]];

AppendTo[tests, VerificationTest[
    AllTrue[TensorBases`TBList[], TensorBases`TBBasisExists], True,
    TestID -> "Smoke: TBBasisExists agrees with TBList"]];

(* The package must not leak its API into Global`. If a test file forgets the
   TensorBases` prefix, Mathematica silently interns a fresh Global` symbol and
   the test then passes vacuously -- this catches that class of mistake. *)
AppendTo[tests, VerificationTest[
    Names["Global`TBGet*"], {},
    TestID -> "Smoke: no TBGet* symbols leaked into Global`"]];

(* Guard the helpers themselves. TBTestMessage in particular fails open: if its
   holding attributes regress, every negative test built on it passes without
   testing anything. *)
Global`TBSelfTest::probe = "probe `1`";

AppendTo[tests, VerificationTest[
    TBTestAborts[Abort[]], True,
    TestID -> "Helper: TBTestAborts detects an abort"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[42], False,
    TestID -> "Helper: TBTestAborts does not fire on a normal result"]];

AppendTo[tests, VerificationTest[
    TBTestMessage[(Message[Global`TBSelfTest::probe, 1]; Abort[]), Global`TBSelfTest::probe], True,
    TestID -> "Helper: TBTestMessage detects a message followed by an abort"]];

AppendTo[tests, VerificationTest[
    TBTestMessage[42, Global`TBSelfTest::probe], False,
    TestID -> "Helper: TBTestMessage does not fire when no message is issued"]];

AppendTo[tests, VerificationTest[
    TBTestMessage[(Message[Global`TBSelfTest::other, 1]; 7), Global`TBSelfTest::probe], False,
    TestID -> "Helper: TBTestMessage discriminates between different messages"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[Hold[TensorBases`Private`someSymbol]] =!= {}, True,
    TestID -> "Helper: TBPrivateSymbolsIn detects a private symbol"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[Global`a + Global`b], {},
    TestID -> "Helper: TBPrivateSymbolsIn ignores Global` symbols"]];
