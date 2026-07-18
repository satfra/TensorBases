(* Registry and basic inspection API: TBList, TBBasisExists, TBGetBasisSize,
   TBGetBasisFields. *)

tests = {};

AppendTo[tests, VerificationTest[
    TensorBases`TBBasisExists["qbq"], True,
    TestID -> "Registry: TBBasisExists is True for a registered basis"]];

AppendTo[tests, VerificationTest[
    TensorBases`TBBasisExists["definitelyNotABasis"], False,
    TestID -> "Registry: TBBasisExists is False for an unregistered basis"]];

(* The pattern is TBBasisExists[BasisName_], not [_String] (Registration.m:169),
   so non-string arguments must answer False rather than returning unevaluated
   or aborting. *)
AppendTo[tests, VerificationTest[
    {TensorBases`TBBasisExists[42], TensorBases`TBBasisExists[{"qbq"}],
     TensorBases`TBBasisExists[Global`qbq]}, {False, False, False},
    TestID -> "Registry: TBBasisExists tolerates non-string arguments"]];

AppendTo[tests, VerificationTest[
    {TensorBases`TBGetBasisSize["cbc"], TensorBases`TBGetBasisSize["qbq"],
     TensorBases`TBGetBasisSize["AA"]}, {1, 2, 2},
    TestID -> "Registry: TBGetBasisSize returns the expected sizes"]];

AppendTo[tests, VerificationTest[
    AllTrue[TensorBases`TBList[], TensorBases`TBGetBasisSize[#] > 0 &], True,
    TestID -> "Registry: every registered basis has a positive size"]];

(* TBGetBasisSize reads TBInternal[...,"Vertices"] rather than "Length"
   (Tools.m:85); these must agree for every basis or the accessors disagree
   about how many elements exist. *)
AppendTo[tests, VerificationTest[
    Select[TensorBases`TBList[],
        Length[TensorBases`TBGetVertex[#, All]] =!= TensorBases`TBGetBasisSize[#] &], {},
    TestID -> "Registry: TBGetBasisSize agrees with Length of TBGetVertex[..,All]"]];

AppendTo[tests, VerificationTest[
    Select[Select[TensorBases`TBList[], # =!= "AAA" && # =!= "AAAClass" &],
        Length[TensorBases`TBGetProjector[#, All]] =!= TensorBases`TBGetBasisSize[#] &], {},
    TestID -> "Registry: TBGetBasisSize agrees with Length of TBGetProjector[..,All]"]];

AppendTo[tests, VerificationTest[
    TensorBases`TBGetBasisFields["AA"], {Global`A, Global`A},
    TestID -> "Registry: TBGetBasisFields returns the gluon two-point content"]];

AppendTo[tests, VerificationTest[
    TensorBases`TBGetBasisFields["qbq"], {Global`qb, Global`q},
    TestID -> "Registry: TBGetBasisFields returns the quark two-point content"]];

AppendTo[tests, VerificationTest[
    TensorBases`TBGetBasisFields["AAA"], {Global`A, Global`A, Global`A},
    TestID -> "Registry: TBGetBasisFields returns three fields for a 3-point basis"]];

(* Field symbols cross the public boundary, so they must be Global`, not the
   TensorBases`Private` symbols the basis file was imported into. *)
AppendTo[tests, VerificationTest[
    DeleteDuplicates[Context /@ TensorBases`TBGetBasisFields["qbq"]], {"Global`"},
    TestID -> "Registry: TBGetBasisFields returns Global` symbols"]];
