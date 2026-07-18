(* Basis lifecycle: TBRestrictBasis, TBUnregister, TBExportBasis, TBExportCache,
   TBImportBasis.

   Everything here operates on throwaway bases derived from qbq so that the
   shared bases the other suites depend on are never disturbed. Scratch files go
   to a per-process temporary directory. *)

tests = {};

scratch = FileNameJoin[{$TemporaryDirectory, "TBTests" <> ToString[$ProcessID]}];
Quiet@CreateDirectory[scratch, CreateIntermediateDirectories -> True];

(* ------------------------------------------------------------------ *)
(* TBRestrictBasis (modules/BasisConstruction.m:307)                   *)
(* ------------------------------------------------------------------ *)

AppendTo[tests, VerificationTest[
    Block[{$Output = {}},
        TensorBases`TBRestrictBasis["qbq", "tbTestRestricted", {1}, scratch];
        TensorBases`TBBasisExists["tbTestRestricted"]],
    True,
    TestID -> "Lifecycle: TBRestrictBasis registers the restricted basis"]];

AppendTo[tests, VerificationTest[
    TensorBases`TBGetBasisSize["tbTestRestricted"], 1,
    TestID -> "Lifecycle: the restricted basis has the requested size"]];

AppendTo[tests, VerificationTest[
    Simplify[TensorBases`TBGetMetric["tbTestRestricted"] .
             TensorBases`TBGetInverseMetric["tbTestRestricted"]],
    IdentityMatrix[1],
    TestID -> "Lifecycle: the restricted basis has a consistent metric"]];

AppendTo[tests, VerificationTest[
    TBPrivateSymbolsIn[TensorBases`TBGetBasisElement["tbTestRestricted", 1]], {},
    TestID -> "Lifecycle: the restricted basis returns no TensorBases` symbols"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBRestrictBasis["qbq", "tbTestOutOfRange", {1, 99}, scratch]],
    True,
    TestID -> "Lifecycle: TBRestrictBasis rejects an out-of-range index"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBRestrictBasis["qbq", "qbq", {1}, scratch]], True,
    TestID -> "Lifecycle: TBRestrictBasis refuses to overwrite an existing basis"]];

(* BUG (modules/BasisConstruction.m:312): the index guard is upper-bound only,
     If[Max[indexList] > Length[...], ...]
   so 0 and negative indices slip through. TBBasis[in][[0]] evaluates to the head
   List rather than a tensor, producing a corrupt basis instead of an error.
   Fix: check 1 <= i <= Length[...] for every requested index. *)
AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBRestrictBasis["qbq", "tbTestZeroIndex", {0}, scratch]],
    True,
    TestID -> "BUG: TBRestrictBasis rejects a zero index (BasisConstruction.m:312)"]];

(* ------------------------------------------------------------------ *)
(* Export                                                              *)
(* ------------------------------------------------------------------ *)

AppendTo[tests, VerificationTest[
    Block[{$Output = {}},
        TensorBases`TBExportBasis["tbTestRestricted", scratch];
        FileExistsQ[FileNameJoin[{scratch, "tbTestRestricted.m"}]]],
    True,
    TestID -> "Lifecycle: TBExportBasis writes <name>.m"]];

AppendTo[tests, VerificationTest[
    Block[{$Output = {}},
        TensorBases`TBExportCache["tbTestRestricted", scratch];
        AllTrue[{"basis", "vertices", "metric", "inverseMetric", "projectors"},
            FileExistsQ[FileNameJoin[{scratch, "tbTestRestricted", # <> ".m"}]] &]],
    True,
    TestID -> "Lifecycle: TBExportCache writes all five cache files"]];

(* BUG (modules/ImportExport.m:63-88): TBExportTensorBasis emits TBAutoDefine,
   TBRequiredGroups, TBVertex, TBVertexBasis, TBVertexStructure, TBInnerProduct,
   TBComment, TBAuthor, TBUsage, TBIndices, TBMomentumConservation and TBBasis --
   but NOT TBCanonicalProduct and NOT TBReplacements. Re-importing the file
   therefore yields a basis with no canonical product, which
   TBCheckBasisDefinitions only warns about (AutoDefine.m:20) and which then makes
   TBBasisTransformation abort with TBMakeCanonicalProduct::noProduct. The export
   is lossy in a way that is not detected until much later.
   Fix: emit both fields in TBExportTensorBasis; TBExportVertexBasis
   (ImportExport.m:100-123) symmetrically omits TBVertexStructure and
   TBInnerProduct and needs the same treatment. *)
AppendTo[tests, VerificationTest[
    StringContainsQ[Import[FileNameJoin[{scratch, "tbTestRestricted.m"}], "Text"],
        "TBCanonicalProduct["],
    True,
    TestID -> "BUG: TBExportBasis emits TBCanonicalProduct (ImportExport.m:63)"]];

AppendTo[tests, VerificationTest[
    StringContainsQ[Import[FileNameJoin[{scratch, "tbTestRestricted.m"}], "Text"],
        "TBReplacements["],
    True,
    TestID -> "BUG: TBExportBasis emits TBReplacements (ImportExport.m:63)"]];

(* ------------------------------------------------------------------ *)
(* Import guards (modules/ImportExport.m:6, modules/Defaults.m:82)      *)
(* ------------------------------------------------------------------ *)

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBImportBasis[
        FileNameJoin[{scratch, "tbTestRestricted.m"}], scratch]],
    True,
    TestID -> "Lifecycle: importing an already-registered basis is refused"]];

AppendTo[tests, VerificationTest[
    TBTestAborts[TensorBases`TBImportBasis["/nonexistent/notAScript.txt", scratch]],
    True,
    TestID -> "Lifecycle: TBImportBasis rejects a non-.m file"]];

(* ------------------------------------------------------------------ *)
(* TBUnregister (modules/BasisConstruction.m:338)                      *)
(* ------------------------------------------------------------------ *)

AppendTo[tests, VerificationTest[
    Block[{$Output = {}},
        TensorBases`TBUnregister["tbTestRestricted"];
        {TensorBases`TBBasisExists["tbTestRestricted"],
         MemberQ[TensorBases`TBList[], "tbTestRestricted"]}],
    {False, False},
    TestID -> "Lifecycle: TBUnregister removes the name from the registry"]];

AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetBasisSize["tbTestRestricted"]],
     TBTestAborts[TensorBases`TBGetBasisFields["tbTestRestricted"]],
     TBTestAborts[TensorBases`TBExportCache["tbTestRestricted"]],
     TBTestAborts[TensorBases`TBUnregister["tbTestRestricted"]]},
    {True, True, True, True},
    TestID -> "Lifecycle: registry-guarded accessors reject an unregistered basis"]];

(* BUG (modules/BasisConstruction.m:338-342): TBUnregister does nothing but
     TBAvailableBasisNames = DeleteCases[TBAvailableBasisNames, BasisName]
   The per-basis DownValues installed by TBDefineTBGet* (Registration.m:213-221)
   survive, as do TBInternal[BasisName, _] and the TBBasisDocs entry. So the
   basis is only half-removed: everything that guards on TBAvailableBasisNames
   rejects it (tested above), while everything dispatched on a literal-name
   DownValue happily keeps serving the stale data.

   This breaks the override workflow that Usage.m:194 and ImportExport.m:8-9
   explicitly advertise -- unregister, then re-import a modified definition under
   the same name. The re-registration appends its DownValues *after* the stale
   ones and adds a second TBBasisDocs entry, so the user keeps querying the old
   basis with no indication anything is wrong.
   Fix: in TBUnregister also Unset the per-basis DownValues on the eight
   TBGet*/TBInfo heads, drop the TBBasisDocs entry, and Clear the
   TBInternal[BasisName, _] values. *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[TensorBases`TBGetVertex["tbTestRestricted", 1]],
     TBTestAborts[TensorBases`TBGetMetric["tbTestRestricted"]],
     TBTestAborts[TensorBases`TBGetInverseMetric["tbTestRestricted"]],
     TBTestAborts[TensorBases`TBGetProjector["tbTestRestricted", 1]],
     TBTestAborts[TensorBases`TBGetCanonicalProduct["tbTestRestricted"]]},
    {True, True, True, True, True},
    TestID -> "BUG: TBUnregister clears the per-basis accessors (BasisConstruction.m:338)"]];

(* Teardown: the shared bases must be exactly as the suite found them. *)
AppendTo[tests, VerificationTest[
    Quiet@DeleteDirectory[scratch, DeleteContents -> True];
    Sort[TensorBases`TBList[]], Sort[Global`TBBasisList],
    TestID -> "Lifecycle: teardown leaves the shared registry untouched"]];
