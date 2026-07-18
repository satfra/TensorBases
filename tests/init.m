(*
  init.m
  Bootstrap for the TensorBases test suite: locate the package and load it.

  Loading *every* basis in bases/ takes many minutes on a cold cache, so the
  suite restricts itself to a small set via Global`TBBasisList. Add a basis here
  when a test needs it.
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
Global`TBBasisList = {"cbc", "qbq"};

Block[{Print}, Needs["TensorBases`"]];

Print["  Using TensorBases from: " <> $TensorBasesDirectory];
Print["  Loaded bases: " <> ToString[TensorBases`TBList[]]];
