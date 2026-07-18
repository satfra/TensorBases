(*
  init.m
  Bootstrap for the TensorBases test suite: locate the package, load it, and
  define the helpers every suite shares.

  Loading *every* basis in bases/ takes many minutes on a cold cache, so the
  suite restricts itself to a small set via Global`TBBasisList. Add a basis here
  when a test needs it.

  Everything below lives in Global`. Test.m Imports this file at top level and
  evaluates each suite with ToExpression in the same ambient context, so these
  definitions are visible to every *Tests.m file.
*)

$TensorBasesDirectory =
    SelectFirst[
        Join[
            {
                FileNameJoin[{$UserBaseDirectory, "Applications", "TensorBases"}],
                FileNameJoin[{$BaseDirectory, "Applications", "TensorBases"}],
                FileNameJoin[{$InstallationDirectory, "AddOns", "Applications", "TensorBases"}],
                FileNameJoin[{$InstallationDirectory, "AddOns", "Packages", "TensorBases"}],
                FileNameJoin[{$InstallationDirectory, "AddOns", "ExtraPackages", "TensorBases"}],
                FileNameJoin[{DirectoryName[$InputFileName], ".."}]
            },
            Select[$Path, StringContainsQ[#, "TensorBases"] &]
        ],
        DirectoryQ[#] &
    ] <> "/";

Global`TBVerbose = 0;

(* Coverage rationale for this set -- all have prebuilt cache/ directories, so
   the load stays fast:
     cbc         minimal two-point basis, indices {p1,c1}
     qbq         two-point with Dirac + fundamental colour + flavour indices
                 {p1,d1,A1,F1} -- the richest index structure available
     AA          gluon two-point; exercises transProj/longProj and propagators
     AAA         a *vertex* basis (TBVertexBasis["AAA"]=True) -- covers the
                 vertex code path and three-point indices
     AAAClass    second vertex basis with identical indices to AAA, so the two
                 form a TBVertexTransformation pair
     AqbqOpt     three-point tensor bases with identical TBIndices and identical
     AqbqSimple  TBCanonicalProduct -- a TBBasisTransformation pair *)
Global`TBBasisList = {"cbc", "qbq", "AA", "AAA", "AAAClass", "AqbqOpt", "AqbqSimple"};

Block[{Print}, Needs["TensorBases`"]];

Print["  Using TensorBases from: " <> $TensorBasesDirectory];
Print["  Loaded bases: " <> ToString[TensorBases`TBList[]]];


(* ------------------------------------------------------------------ *)
(* Shared test helpers                                                 *)
(* ------------------------------------------------------------------ *)

(* Almost every error path in TensorBases is `Print[...]; Abort[]` rather than
   Message/Throw, so negative tests have to catch an abort and swallow the
   printed diagnostic.

   Silencing is done by redirecting $Output, NOT by Block[{Print}]: Test.m
   installs its own Print DownValue that writes via Write[$Output, ...] when
   running headless, and Block[{Print}] would only strip that back to the
   builtin Print -- which still writes to $Output. Emptying $Output stops
   both. *)
SetAttributes[TBTestAborts, HoldFirst];
TBTestAborts[expr_] := Block[{$Output = {}}, CheckAbort[expr; False, True]];

(* Same, but for the paths that use Message[] instead of a bare Print. Returns
   True iff evaluating expr issued the named message.

   HoldAll, not HoldFirst: the message name has to reach Check unevaluated. With
   HoldFirst the second argument evaluates first, so `foo::bar` arrives as its
   *text* ("...`1`...") and Check silently never matches anything -- every test
   using it would then pass vacuously.

   The outer Quiet is required for a different reason than you might expect: it
   does not defeat Check's detection (verified), but it does stop VerificationTest
   from recording the message and grading the test as a MessagesFailure. *)
SetAttributes[TBTestMessage, HoldAll];
TBTestMessage[expr_, msg_] :=
    Quiet[
        Block[{$Output = {}, $Messages = {}},
            Check[CheckAbort[expr, Null]; "no-message", "message-issued", msg]
        ]
    ] === "message-issued";

(* Capture whatever an expression Prints, as a single string. Used to assert on
   the text of diagnostics. *)
SetAttributes[TBCapturePrint, HoldFirst];
TBCapturePrint[expr_] :=
    Module[{file, stream, text},
        file = FileNameJoin[{$TemporaryDirectory, "tbtest-capture-" <> ToString[$ProcessID] <> ".txt"}];
        stream = OpenWrite[file];
        Block[{$Output = {stream}}, CheckAbort[expr, Null]];
        Close[stream];
        text = Import[file, "Text"];
        Quiet@DeleteFile[file];
        If[StringQ[text], text, ""]
    ];

(* Context hygiene. Everything crossing the public API boundary has been through
   InsertOutputNaming (modules/Internal.m:47-80) and must therefore contain no
   TensorBases` or TensorBases`Private` symbols -- only Global` and System`. *)
TBPrivateSymbolsIn[expr_] :=
    DeleteDuplicates@
        Select[
            Cases[expr, s_Symbol :> HoldForm[s], {0, Infinity}, Heads -> True],
            StringMatchQ[Context @@ #, "TensorBases`*"] &
        ];

(* Strip the $nnn suffix Unique[] appends, so uniquified index symbols can be
   compared by stem. Mirrors TensorBases`Private`UniqueStem (Helpers.m:15). *)
TBSymbolStem[x_Symbol] := StringSplit[SymbolName[x], "$"][[1]];

(* Every TB3PTo* function mutates System`$Assumptions (Kinematics.m:81,134,203,
   250,311,360). Suites that call them must restore this value, or later
   FullSimplify calls slow to a crawl as assumptions accumulate. *)
TBTestBaseAssumptions = System`$Assumptions;
