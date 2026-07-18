(* ::Package:: *)

(* Web installer for the TensorBases paclet. Hand-written -- edit directly. *)



TensorBases::allowinternetuse="You have forbidden Mathematica to access the internet. Either allow Mathematica to access the internet or download TensorBases from github manually.";
If[Not["AllowInternetUse" /. SystemInformation["Network"]],
Message[TensorBases::allowinternetuse];
Abort[];
];

TensorBasesZipLocation="https://github.com/satfra/TensorBases/archive/refs/heads/main.zip";
TensorBasesInstallDir=FileNameJoin[{$UserBaseDirectory,"Applications"}];


TensorBasesInstaller::zipdownloadfailed="Download from "<>TensorBasesZipLocation<>" failed.";
TensorBasesInstaller::installationfailed="\nInstallation failed. Please read the error messages for more information!";

Print["Downloading TensorBases ..."];
TensorBasesArchive=FileNameJoin[{$TemporaryDirectory,"TensorBases.zip"}];
If[$VersionNumber >= 11.2,
URLDownload[TensorBasesZipLocation, TensorBasesArchive],
Module[{data},
data = Quiet[Import[TensorBasesZipLocation, "Byte"]];
If[ListQ[data] && Length[data] > 0,
Close[BinaryWrite[OpenWrite[TensorBasesArchive, BinaryFormat -> True], data]],
Message[TensorBasesInstaller::zipdownloadfailed]; Abort[]
]
]
]

tmpTensorBasesImport=Import[TensorBasesArchive];
If[tmpTensorBasesImport==="{\"error\":\"Not Found\"}"||tmpTensorBasesImport==="404: Not Found",
Message[TensorBasesInstaller::zipdownloadfailed];Abort[];
];

newVersionString=(List@@Import[TensorBasesArchive,FileNameJoin[{"TensorBases-main","PacletInfo.m"}]])[[1]]["Version"];

TensorBasesFiles=FileNameJoin[{TensorBasesInstallDir,#}]&/@Import[TensorBasesArchive];
TensorBasesFilesExist=FileExistsQ/@TensorBasesFiles;
TensorBasesExistingInstallation=Or@@TensorBasesFilesExist;
TensorBasesExistingPacletInfo=FileNameJoin[{TensorBasesInstallDir,"TensorBases","PacletInfo.m"}];
TensorBasesExistingVersionString=If[FileExistsQ[TensorBasesExistingPacletInfo],(List@@Import[TensorBasesArchive,FileNameJoin[{"TensorBases-main","PacletInfo.m"}]])[[1]]["Version"],"unknown"];


deleteExisting=False;
deleteExisting=If[TensorBasesExistingInstallation,
ChoiceDialog["The installer has found an existing TensorBases installation.
Do you want to overwrite the existing installation version "<>TensorBasesExistingVersionString<>" with version "<>newVersionString<>"?
Otherwise the installation will be aborted.",
WindowTitle->"TensorBases Installation",WindowSize->{Medium,All}],False];

If[deleteExisting,DeleteFile[Pick[TensorBasesFiles,TensorBasesFilesExist]]];

If[TensorBasesExistingInstallation&&deleteExisting===False,
(*abort installation*)
Print["TensorBases installation aborted."];,
(*install TensorBases*)
installationSuccess=Check[
ExtractArchive[TensorBasesArchive,TensorBasesInstallDir];
If[DirectoryQ[TensorBasesInstallDir~~"/TensorBases"],
DeleteDirectory[TensorBasesInstallDir~~"/TensorBases",DeleteContents->True];
];
RenameDirectory[TensorBasesInstallDir~~"/TensorBases-main",TensorBasesInstallDir~~"/TensorBases"];
Get["TensorBases`"]
,$Failed];
If[installationSuccess===$Failed,
(*installation failed*)
Message[TensorBasesInstaller::installationfailed];,
(*installation successful*)
Quiet[If[$VersionNumber >= 14.0, PacletDataRebuild[], PacletManager`RebuildPacletData[]]];
Print["Installation was successful."];
];
];

Quiet[DeleteFile[TensorBasesArchive]];
