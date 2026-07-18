(*
  Test.m
  This script discovers and runs all Mathematica test files ending in "Tests.m"
  in its directory.

  Usage:
    wolfram -script tests/Test.m                        (* run all tests *)
    wolfram -script tests/Test.m Basics/SmokeTests.m    (* run a single file *)
    wolfram -script tests/Test.m Basics                 (* all tests in Basics/ *)

  Each test file must define a top-level `tests` list of VerificationTest[...].
  The exit code is the number of failures.
*)

(* Hide styling if we are in a CLI context. *)

If[$FrontEnd === Null,
    Unprotect[Style];
    Unprotect[StyleBox];
    Unprotect[Print];
    Style[expr_, opts___] := expr;
    StyleBox[expr_, opts___] := expr;
    Print[expr__] := Write[$Output, StringJoin[ToString[#, OutputForm]& /@ {expr}]];
    Protect[Print];
    Protect[StyleBox];
    Protect[Style];
];

(* Perform user-specified initialization tasks *)

Print["Performing initialization tasks..."];

Import[FileNameJoin[{DirectoryName[$InputFileName], "init.m"}]];

Print["Initialization complete.\n"];

(* Function to run and report tests *)

RunAndReportTests[exprText_String, testFileName_String] :=
    Module[{result, successCount, failureCount, succeededKeys, failedKeys, mGreen = RGBColor[0.0235294, 0.235294, 0.0235294], mRed = RGBColor[0.435294, 0, 0]},
        ToExpression[exprText];
        result = If[$VersionNumber >= 12.0,
            TestReport[tests, ProgressReporting -> False],
            TestReport[tests]
        ];
        (* Key names changed between versions *)
        succeededKeys = If[$VersionNumber >= 12.0, result["TestsSucceededKeys"], result["TestsSucceededIndices"]];
        failedKeys = If[$VersionNumber >= 12.0, result["TestsFailedWrongResultsKeys"], result["TestsFailedWrongResultsIndices"]];
        successCount = Length[succeededKeys];
        failureCount = Length[failedKeys];
        Print[Style["  \[Checkmark] " <> ToString[successCount] <> " passed", mGreen], "    ", Style["x " <> ToString[failureCount] <> " failed", mRed]];
        If[successCount > 0,
            Print["\n", Style["  Successful Tests Details:", mGreen, Bold]];
            Scan[(Print["\n", Style["  Test:", mGreen, Bold], " ", #["TestID"]];)&, Values[KeyTake[result["TestResults"], succeededKeys]]]
        ];
        If[failureCount > 0,
            Print["\n", Style["  Failed Tests Details:", mRed, Bold]];
            Scan[
                (
                    Print["\n", Style["  Test:", mRed, Bold], " ", #["TestID"]];
                    Print["    Expected: ", #["ExpectedOutput"]];
                    Print["    Actual:   ", #["ActualOutput"]];
                )&
                ,
                Values[KeyTake[result["TestResults"], failedKeys]]
            ]
        ];
        Return[{successCount, failureCount}];
    ];

(* Main script execution logic *)

result =
    Module[{exprText, testFiles, totalSuccesses = 0, totalFailures = 0, mOrange = RGBColor[0.8, 0.4, 0], mRed = RGBColor[0.435294, 0, 0], mGreen = RGBColor[0.0235294, 0.235294, 0.0235294], testDir, filterArg, filterPath},
        testDir = DirectoryName[$InputFileName];
        AppendTo[$Path, testDir];
        AppendTo[$Path, FileNameJoin[{testDir, "..", "modules"}]];
(* Check for a command-line filter argument.
   $ScriptCommandLine works with wolframscript, but is empty under
   wolfram -script.  For the latter, arguments follow the script path
   in $CommandLine. *)
        filterArg =
            Which[
                Length[$ScriptCommandLine] >= 2,
                    $ScriptCommandLine[[2]]
                ,
                Length[$CommandLine] >= 1,
                    Module[{pos},
                        pos = Position[$CommandLine, "-script"];
                        (* Arguments start two positions after -script (skip script path) *)
                        If[pos =!= {} && Length[$CommandLine] >= pos[[-1, 1]] + 2,
                            $CommandLine[[pos[[-1, 1]] + 2]]
                            ,
                            ""
                        ]
                    ]
                ,
                True,
                    ""
            ];
        If[filterArg =!= "",
            (* Resolve the filter relative to the tests/ directory *)
            filterPath = FileNameJoin[{testDir, filterArg}];
            If[FileExistsQ[filterPath] && !DirectoryQ[filterPath],
                (* Exact file specified *)
                testFiles = {filterPath};
                ,
                If[DirectoryQ[filterPath],
                    (* Directory specified \[LongDash] find all *Tests.m within it *)
                    testFiles = FileNames["*Tests.m", filterPath, 2];
                    ,
                    (* Try as a glob pattern *)
                    testFiles = FileNames[filterArg, testDir, 2];
                    If[testFiles === {},
                        Print["ERROR: No test files matched: " <> filterArg];
                        Exit[1];
                    ];
                ]
            ];
            Print[Style["Running filtered tests (" <> filterArg <> ")...", Bold, mOrange]];
            ,
            testFiles = FileNames["*Tests.m", testDir, 2];
            Print[Style["Discovering and running tests...", Bold, mOrange]];
        ];
        Print[Style["---------------------------------", Bold, mOrange]];
        Scan[
            (
                Print["Running tests from: " <> FileNameTake[#, -2]];
                exprText = Import[#, "Text"];
                If[StringContainsQ[exprText, "tests ="] || StringContainsQ[exprText, "tests="],
                    Module[{results},
                        results = RunAndReportTests[exprText, FileNameTake[#, -2]];
                        totalSuccesses += results[[1]];
                        totalFailures += results[[2]];
                        Print[""]; (* newline separator *)
                    ]
                    ,
                    (
                        Print["  ERROR: Test file ", FileNameTake[#, -2], " does not define a 'tests' variable."];
                        totalFailures++;
                    )
                ]
            )&
            ,
            testFiles
        ];
        Print[Style["---------------------------------", Bold, mOrange]];
        Print[Style["Overall Test Summary", Bold, mOrange]];
        Print[Style["---------------------------------", Bold, mOrange]];
        Print[Style["\[Checkmark] " <> ToString[totalSuccesses] <> " passed", mGreen, Bold], "    ", Style["x " <> ToString[totalFailures] <> " failed", mRed, Bold]];
        Print[Style["---------------------------------", Bold, mOrange]];
        Return[totalFailures];
    ];

Exit[result];
