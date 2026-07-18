(* ::Package:: *)

(* ::Title:: *)
(*Helper functions: printing, unique symbols, paths, caching*)

TBPrint[thing_,level_Integer]:=If[IntegerQ[Global`TBVerbose]&&Global`TBVerbose>=level,Print[thing]];TBPrint[thing_List,level_Integer]:=If[IntegerQ[Global`TBVerbose]&&Global`TBVerbose>=level,Print@@thing];


AlreadyUnique[x_Symbol]:=Module[{split,tailNumbers},
split=StringSplit[SymbolName[x],"$"];
If[Length[split]==1,Return[False]];
tailNumbers=DigitQ[split[[-1]]];
Return[tailNumbers];
]
UniqueStem[x_Symbol]:=Module[{split},
split=StringSplit[SymbolName[x],"$"];
Return[split[[1]]];
]


TBUnique[x_Symbol]:=Module[{},
Return[
Unique[Context[x]<>UniqueStem[x]<>"$"]
];
]


(* GetAllSymbols lives in Tools.m. It used to be defined here as well, with the
   same argument pattern but different semantics; since Tools.m loads after this
   file (TensorBases.m:91 vs :99) that definition silently replaced this one, so
   the copy here was dead code. *)


MakeIndexList[len_Integer,expr___]:=Module[{list},
If[Length[{expr}]==1&&Head[{expr}[[1]]]===List,
list=expr,
list={expr}
];
If[Length[list]==0,Print["Index list is empty!"];Abort[];];
If[Length[list]!=len,Print["Index list must have "~~ToString[len]~~" elements!"];Abort[];];
If[AnyTrue[list,Head[#]=!=List&],Print["An index list must consist of one list for every particle!"];Abort[];];
Return[list];
]


(*The directory probe itself lives in the loader as Global`$TBDIR, because the
loader needs it before BeginPackage in order to Get the Global` context modules.*)
TBDirectory=Global`$TBDIR;
If[Head[TBDirectory]=!=String,
Print["\n!!!!!!!!!!\nCannot find valid TensorBases installation! Cached tensor data is not available, loading the package may take an extremely long time.\n!!!!!!!!!!\n"]
];


AutoSaveRestore[fileName_String,expr_,dir_String:TBDirectory]:=Module[{mdir,file,ret},
mdir=ReleaseHold[dir];
If[StringTake[mdir,{-1}]!="/",mdir=StringJoin[mdir,"/"]];

file=mdir<>fileName<>".m";

If[FileExistsQ[file],
ret=Import[file];
,
ret=ReleaseHold[expr];
Export[file,ret];
];

Return[ret];
];
SetAttributes[AutoSaveRestore,HoldRest]
