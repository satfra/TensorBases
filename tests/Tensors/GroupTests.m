(* FormTracer group registration and the Nf/Nc setters
   (modules/FormTracerGroups.m). All Global` context.

   These mutate FormTracer's global group tables and the values of Nc/Nf, which
   every cached tensor was derived with symbolically. The final test restores
   both unconditionally; keep it last. *)

tests = {};

AppendTo[tests, VerificationTest[
    {MemberQ[Global`GetFormTracerGroups[], Global`color],
     MemberQ[Global`GetFormTracerGroups[], Global`flavor]},
    {True, True},
    TestID -> "Groups: color and flavor are registered after loading qbq"]];

AppendTo[tests, VerificationTest[
    {Global`FormTracerGroupExistsQ[Global`color],
     Global`FormTracerGroupExistsQ[Global`definitelyNotAGroup]},
    {True, False},
    TestID -> "Groups: FormTracerGroupExistsQ discriminates registered groups"]];

AppendTo[tests, VerificationTest[
    Length[Global`GetFormTracerGroupNamesAndTypes[]] ===
        Length[Global`GetFormTracerGroups[]],
    True,
    TestID -> "Groups: names-and-types has one entry per group"]];

(* Re-adding an existing group must be a no-op: each branch of
   AddFormTracerGroup is wrapped in If[Not@FormTracerGroupExistsQ[...]]
   (FormTracerGroups.m:198,228). ProcessBases relies on this, since every basis
   re-declares the groups it needs. *)
AppendTo[tests, VerificationTest[
    Module[{before},
        before = Global`GetFormTracerGroups[];
        Global`AddFormTracerGroup[{Global`color, Global`SUNfund, Global`Nc}];
        Global`GetFormTracerGroups[] === before],
    True,
    TestID -> "Groups: re-adding an existing group is idempotent"]];

AppendTo[tests, VerificationTest[
    Global`GetFormTracerGroupConstant[Global`color], Global`Nc,
    TestID -> "Groups: the color group constant is Nc"]];

(* --- SetNc / SetNf ---------------------------------------------------- *)

AppendTo[tests, VerificationTest[
    Module[{v}, Global`SetNc[3]; v = Global`Nc; Global`SetNc[]; v], 3,
    TestID -> "Groups: SetNc[3] sets Nc to 3"]];

AppendTo[tests, VerificationTest[
    Module[{v}, Global`SetNf[3]; v = Global`Nf; Global`SetNf[]; v], 3,
    TestID -> "Groups: SetNf[3] sets Nf to 3"]];

AppendTo[tests, VerificationTest[
    Module[{v}, Global`SetNc[2]; v = Global`Nc; Global`SetNc[]; v], 2,
    TestID -> "Groups: SetNc[2] sets Nc to 2"]];

(* The symbolic form must come back, or every cached tensor silently changes
   meaning for the rest of the session. *)
AppendTo[tests, VerificationTest[
    Module[{}, Global`SetNc[3]; Global`SetNc[]; NumericQ[Global`Nc]], False,
    TestID -> "Groups: SetNc[] restores a symbolic Nc"]];

AppendTo[tests, VerificationTest[
    Module[{}, Global`SetNf[3]; Global`SetNf[]; NumericQ[Global`Nf]], False,
    TestID -> "Groups: SetNf[] restores a symbolic Nf"]];

(* SetNc[] re-Protects Nc (FormTracerGroups.m:159-169). SetNf[] Unprotects and
   ClearAlls Nf and does not obviously re-Protect it, so this pins the observed
   behaviour of both -- an asymmetry here would let a stray assignment silently
   redefine a group constant. *)
AppendTo[tests, VerificationTest[
    Module[{}, Global`SetNc[3]; Global`SetNc[];
        MemberQ[Attributes[Global`Nc], Protected]],
    True,
    TestID -> "Groups: Nc is Protected after SetNc[]"]];

AppendTo[tests, VerificationTest[
    Module[{}, Global`SetNf[3]; Global`SetNf[];
        MemberQ[Attributes[Global`Nf], Protected]],
    True,
    TestID -> "Groups: Nf is Protected after SetNf[]"]];

(* Unsupported arities fall through to the [i_] branch, which only Prints
   (FormTracerGroups.m:132,170). They must neither abort nor change the value. *)
AppendTo[tests, VerificationTest[
    {TBTestAborts[Global`SetNf[5]], TBTestAborts[Global`SetNc[7]],
     TBTestAborts[Global`SetNf["2"]]},
    {False, False, False},
    TestID -> "Groups: unsupported SetNf/SetNc arguments do not abort"]];

AppendTo[tests, VerificationTest[
    Module[{v}, Global`SetNc[3]; Block[{$Output = {}}, Global`SetNc[5]];
        v = Global`Nc; Global`SetNc[]; v],
    3,
    TestID -> "Groups: an unsupported SetNc argument leaves Nc unchanged"]];

AppendTo[tests, VerificationTest[
    Module[{v}, Global`SetNf[3]; Block[{$Output = {}}, Global`SetNf[5]];
        v = Global`Nf; Global`SetNf[]; v],
    3,
    TestID -> "Groups: an unsupported SetNf argument leaves Nf unchanged"]];

(* Malformed AddFormTracerGroup calls must not corrupt the group table. The
   signature is a single list {name, kind, constant} (FormTracerGroups.m:188). *)
AppendTo[tests, VerificationTest[
    Module[{before},
        before = Global`GetFormTracerGroups[];
        Block[{$Output = {}},
            TBTestAborts[Global`AddFormTracerGroup[Global`color, Global`SUNfund, Global`Nc]];
            TBTestAborts[Global`AddFormTracerGroup[{Global`color, Global`SUNfund}]]];
        Global`GetFormTracerGroups[] === before],
    True,
    TestID -> "Groups: malformed AddFormTracerGroup calls leave the registry intact"]];

(* Leave the session exactly as it was found. *)
AppendTo[tests, VerificationTest[
    Module[{}, Global`SetNc[]; Global`SetNf[];
        {NumericQ[Global`Nc], NumericQ[Global`Nf]}],
    {False, False},
    TestID -> "Groups: teardown restores symbolic Nc and Nf"]];
