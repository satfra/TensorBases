(* Smoke test: the package loads and registers the bases named in tests/init.m.
   This is a stub -- add real suites alongside it. *)

tests = {};

AppendTo[tests, VerificationTest[
    MemberQ[TensorBases`TBList[], "cbc"], True,
    TestID -> "Smoke: package loads and registers the cbc basis"]];
