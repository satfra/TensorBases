(* ::Package:: *)

(* ::Title:: *)
(*Internal FormTracer glue: contexts, naming, linearity downvalues*)

If[Head[$DistributedContexts]=!=List,$DistributedContexts={}];
$DistributedContexts=$DistributedContexts\[Union]{$Context,"TensorBases`Private`","TensorBases`","FormTracer`","FormTracer`Private`"}


GlobalContext[expr_]:=Module[{$ContextOld,result},
$ContextOld=$Context;
$Context="Global`";
result=ReleaseHold[expr];
$Context=$ContextOld;
Return[result];
];
SetAttributes[GlobalContext,HoldAll]
WithinContext[context_String,expr_]:=Module[{$ContextOld,result},
$ContextOld=$Context;
$Context=context;
Begin[context];
Print["Changed to context", $Context];
result=ReleaseHold[expr];
End[];
$Context=$ContextOld;
Return[result];
];
SetAttributes[WithinContext,HoldRest]


FormTracerNaming[]:=Module[
{outputRulesLorentzTensors,outputRulesGroupTensors,outputRules,
privateOutputRulesLorentzTensors,privateOutputRulesGroupTensors,privateOutputRules},

outputRulesLorentzTensors=Normal[FormTracer`Private`lorentzTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c])};
outputRulesGroupTensors=Normal[FormTracer`Private`groupTensorRep:qlacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c])};
outputRules=Join[outputRulesLorentzTensors,outputRulesGroupTensors];

Print["Lorentz group:   ",outputRulesLorentzTensors//TableForm];
Print[""];
Print["color group:     ",Select[outputRulesGroupTensors,MemberQ[#,color,Infinity]&]//TableForm];
Print[""];
Print["flavor group:    ",Select[outputRulesGroupTensors,MemberQ[#,flavor,Infinity]&]//TableForm];
];


InsertOutputNaming[expr_]:=Module[
{
groups,
outputRulesLorentzTensors,outputRulesGroupTensors,outputRules,
privateOutputRulesLorentzTensors,privateOutputRulesGroupTensors,privateOutputRules,
otherRules
},

outputRulesLorentzTensors=Normal[FormTracer`Private`lorentzTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c]:>b)};
outputRulesGroupTensors=Normal[FormTracer`Private`groupTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c]:>b)};
outputRules=Join[outputRulesLorentzTensors,outputRulesGroupTensors];

privateOutputRulesLorentzTensors=Normal[FormTracer`Private`lorentzTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["TensorBases`Private`TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c]:>b)};
privateOutputRulesGroupTensors=Normal[FormTracer`Private`groupTensorReplacementRulesOutput]/.{(a_[c___]:>b_):>(Symbol["TensorBases`Private`TB"~~StringSplit[ToString[a],"FTx"][[-1]]][c]:>b)};
privateOutputRules=Join[privateOutputRulesLorentzTensors,privateOutputRulesGroupTensors];

groups={
TensorBases`Private`flavor->Global`flavor,
TensorBases`Private`color->Global`color
};

otherRules={
TensorBases`Private`sigma:>Global`sigma,
TensorBases`Private`pdash:>Global`pdash,
TensorBases`Private`psdash:>Global`psdash,

TensorBases`Private`transProj:>Global`transProj,
TensorBases`Private`longProj:>Global`longProj,
TensorBases`Private`transProjMagnetic:>Global`transProjMagnetic,
TensorBases`Private`transProjElectric:>Global`transProjElectric
};

Return[expr//.groups//.outputRules//.privateOutputRules//.otherRules/.a_Symbol/;Context[a]=="TensorBases`Private`":>Symbol["Global`"<>SymbolName[a]]];
];


InsertInputNaming[expr_]:=Module[
{
inputRulesLorentzTensors,inputRulesGroupTensors
},

inputRulesLorentzTensors=Select[Normal[FormTracer`Private`lorentzTensorReplacementRulesInput],MatchQ[_[__]:>_[__]]]/.{
(a_[d__]:>b_[c__]):>(a[d]->Symbol["TB"~~StringSplit[ToString[b],"FTx"][[-1]]][c])
};
inputRulesGroupTensors=Select[Normal[FormTracer`Private`groupTensorReplacementRulesInput],MatchQ[_[__]:>_[__]]]/.{
(a_[d__]:>b_[c__]):>(a[d]->Symbol["TB"~~StringSplit[ToString[b],"FTx"][[-1]]][c])
};

Return[expr//.inputRulesLorentzTensors//.inputRulesGroupTensors];
];


TBFormTrace[expr_]:=Module[{processedExpr,result},
processedExpr=InsertOutputNaming[expr];
result=GlobalContext[FormTracer`FormTrace[processedExpr]];
Return[result];
];


SetAttributes[TBsps,Orderless]
SetAttributes[TBsp,Orderless]

TBsp[0,a_]=0;
TBsp[a_,0]=0;
TBsp[0,0]=0;

TBsps[0,a_]=0;
TBsps[a_,0]=0;
TBsps[0,0]=0;

TBvec[0,mu_]=0;

TBvecs[0,mu_]=0;
TBvecs[p_,0]=0;

TBsp[a_,b_+c_]:= TBsp[a,b]+TBsp[a,c];
TBsp[a_,-1b_]:= -TBsp[a,b];
TBsp[b_,a_?NumericQ c_]:= a TBsp[b,c];

TBsps[a_,b_+c_]:= TBsps[a,b]+TBsps[a,c];
TBsps[a_,-1b_]:= -TBsps[a,b];
TBsps[b_,a_?NumericQ c_]:= a TBsps[b,c];

TBvec[p_+q_,mu_]:=TBvec[p,mu]+TBvec[q,mu];
TBvec[-1 p_,mu_]:= -TBvec[p,mu];
TBvec[n_?NumericQ a_,mu_]:=n TBvec[a,mu];

TBvecs[p_+q_,mu_]:=TBvecs[p,mu]+TBvecs[q,mu];
TBvecs[-1 p_,mu_]:= -TBvecs[p,mu];
TBvecs[n_?NumericQ a_,mu_]:=n TBvecs[a,mu];
