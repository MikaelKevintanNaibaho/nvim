return {
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            require("conform").setup({
                -- Map of filetype to formatters
                formatters_by_ft = {
                    lua = { "stylua" },
                    c = { "clang-format-11" },
                    cpp = { "clang-format-11" },
                },

                formatters = {
                    ["clang-format-11"] = {
                        command = "clang-format",
                        prepend_args = {
                            "-style={ \
                            AccessModifierOffset: -4, \
                            AlignAfterOpenBracket: Align, \
                            AlignConsecutiveAssignments: false, \
                            AlignConsecutiveDeclarations: false, \
                            AlignEscapedNewlines: Left, \
                            AlignOperands: true, \
                            AlignTrailingComments: { \
                                Kind: Always, \
                                OverEmptyLines: 1 \
                            }, \
                            AllowAllParametersOfDeclarationOnNextLine: false, \
                            AllowShortBlocksOnASingleLine: false, \
                            AllowShortCaseLabelsOnASingleLine: false, \
                            AllowShortFunctionsOnASingleLine: None, \
                            AllowShortIfStatementsOnASingleLine: false, \
                            AllowShortLoopsOnASingleLine: false, \
                            AlwaysBreakAfterDefinitionReturnType: None, \
                            AlwaysBreakAfterReturnType: None, \
                            AlwaysBreakBeforeMultilineStrings: false, \
                            AlwaysBreakTemplateDeclarations: false, \
                            BinPackArguments: true, \
                            BinPackParameters: true, \
                            BraceWrapping: { \
                                AfterClass: false, \
                                AfterControlStatement: false, \
                                AfterEnum: false, \
                                AfterFunction: true, \
                                AfterNamespace: true, \
                                AfterObjCDeclaration: false, \
                                AfterStruct: false, \
                                AfterUnion: false, \
                                AfterExternBlock: false, \
                                BeforeCatch: false, \
                                BeforeElse: false, \
                                IndentBraces: false, \
                                SplitEmptyFunction: true, \
                                SplitEmptyRecord: true, \
                                SplitEmptyNamespace: true \
                            }, \
                            BreakBeforeBinaryOperators: None, \
                            BreakBeforeBraces: Custom, \
                            BreakBeforeInheritanceComma: false, \
                            BreakBeforeTernaryOperators: false, \
                            BreakConstructorInitializersBeforeComma: false, \
                            BreakConstructorInitializers: BeforeComma, \
                            BreakAfterJavaFieldAnnotations: false, \
                            BreakStringLiterals: false, \
                            ColumnLimit: 80, \
                            CommentPragmas: '^ IWYU pragma:', \
                            CompactNamespaces: false, \
                            ConstructorInitializerAllOnOneLineOrOnePerLine: false, \
                            ConstructorInitializerIndentWidth: 8, \
                            ContinuationIndentWidth: 8, \
                            Cpp11BracedListStyle: false, \
                            DerivePointerAlignment: false, \
                            DisableFormat: false, \
                            ExperimentalAutoDetectBinPacking: false, \
                            FixNamespaceComments: false, \
                            IncludeBlocks: Preserve, \
                            IncludeCategories: [ \
                                { \
                                    Regex: '.*', \
                                    Priority: 1 \
                                } \
                            ], \
                            IncludeIsMainRegex: '(Test)?$', \
                            IndentCaseLabels: false, \
                            IndentGotoLabels: false, \
                            IndentPPDirectives: None, \
                            IndentWidth: 8, \
                            IndentWrappedFunctionNames: false, \
                            JavaScriptQuotes: Leave, \
                            JavaScriptWrapImports: true, \
                            KeepEmptyLinesAtTheStartOfBlocks: false, \
                            MacroBlockBegin: '', \
                            MacroBlockEnd: '', \
                            MaxEmptyLinesToKeep: 1, \
                            NamespaceIndentation: None, \
                            ObjCBinPackProtocolList: Auto, \
                            ObjCBlockIndentWidth: 8, \
                            ObjCSpaceAfterProperty: true, \
                            ObjCSpaceBeforeProtocolList: true, \
                            PenaltyBreakAssignment: 10, \
                            PenaltyBreakBeforeFirstCallParameter: 30, \
                            PenaltyBreakComment: 10, \
                            PenaltyBreakFirstLessLess: 0, \
                            PenaltyBreakString: 10, \
                            PenaltyExcessCharacter: 100, \
                            PenaltyReturnTypeOnItsOwnLine: 60, \
                            PointerAlignment: Right, \
                            ReflowComments: false, \
                            SortIncludes: false, \
                            SortUsingDeclarations: false, \
                            SpaceAfterCStyleCast: false, \
                            SpaceAfterTemplateKeyword: true, \
                            SpaceBeforeAssignmentOperators: true, \
                            SpaceBeforeCtorInitializerColon: true, \
                            SpaceBeforeInheritanceColon: true, \
                            SpaceBeforeParens: ControlStatements, \
                            SpaceBeforeRangeBasedForLoopColon: true, \
                            SpaceInEmptyParentheses: false, \
                            SpacesBeforeTrailingComments: 1, \
                            SpacesInAngles: false, \
                            SpacesInContainerLiterals: false, \
                            SpacesInCStyleCastParentheses: false, \
                            SpacesInParentheses: false, \
                            SpacesInSquareBrackets: false, \
                            Standard: Cpp03, \
                            TabWidth: 8, \
                            UseTab: Always \
                            }",
                        },
                    },
                    ["stylua"] = {
                        prepend_args = {
                            "--config-path",
                            ".stylua.toml",
                        },
                    },
                },

                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
