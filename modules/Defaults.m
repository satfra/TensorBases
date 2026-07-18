(* ::Package:: *)

(* ::Title:: *)
(*Default (unknown basis) implementations*)

TBGetBasisElement[name_String,All,indices___]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetBasisElement[name_String,n_Integer,indices___]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetBasisElement[name_String,All]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetBasisElement[name_String,n_Integer]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetBasisElement[name_String]:=Module[{},
Print["TBGetBasisElement[...] requires at least two arguments! Aborting"];Abort[]
];
TBGetBasisElement[]:=Module[{},
Print["TBGetBasisElement[...] requires at least two arguments! Aborting"];Abort[]
];


TBGetVertex[name_String,All,indices___]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetVertex[name_String,n_Integer,indices___]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetVertex[name_String,All]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetVertex[name_String,n_Integer]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetVertex[name_String]:=Module[{},
Print["TBGetVertex[...] requires at least two arguments! Aborting"];Abort[]
];
TBGetVertex[]:=Module[{},
Print["TBGetVertex[...] requires at least two arguments! Aborting"];Abort[]
];


TBGetMetric[name_String]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetMetric[]:=Module[{},
Print["TBGetMetric[...] requires an argument. Aborting"];Abort[]
];


TBGetInverseMetric[name_String]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetInverseMetric[]:=Module[{},
Print["TBGetInverseMetric[...] requires an argument. Aborting"];Abort[]
];


TBGetProjector[name_String,All,indices___]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetProjector[name_String,n_Integer,indices___]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetProjector[name_String,All]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetProjector[name_String,n_Integer]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetProjector[name_String]:=Module[{},
Print["TBGetProjector[...] requires at least two arguments! Aborting"];Abort[]
];
TBGetProjector[]:=Module[{},
Print["TBGetProjector[...] requires at least two arguments! Aborting"];Abort[]
];


(* These two had no unknown-basis fallback at all, so an unregistered name came
   back unevaluated rather than aborting -- the only accessors in the family
   that failed silently. TBInfo deliberately gets no such default: its string
   argument may be a documentation topic ("Extensions", ...) rather than a
   basis name. *)
TBGetCanonicalProduct[name_String]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetCanonicalProduct[]:=Module[{},
Print["TBGetCanonicalProduct[...] requires an argument. Aborting"];Abort[]
];


TBGetInnerProduct[name_String]:=Module[{},
Print["Unknown basis "~~name~~". Aborting"];Abort[]
];
TBGetInnerProduct[]:=Module[{},
Print["TBGetInnerProduct[...] requires an argument. Aborting"];Abort[]
];


GetBasisName[BasisDefinitionFile_String]:=Module[{},
If[StringPart[BasisDefinitionFile,-2;;]=!={".","m"},Print["File "~~BasisDefinitionFile~~" is not a Mathematica script!"];Abort[]];
Return[StringSplit[StringJoin[StringPart[BasisDefinitionFile,;;-3]],"/"][[-1]]]
];
