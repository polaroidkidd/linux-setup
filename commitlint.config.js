module.exports = {
    rules: {
        "body-leading-blank": [2, "always"],
        "body-max-line-length": [2, "always", 72],
        "footer-leading-blank": [2, "always"],
        "header-max-length": [2, "always", 50],
        "subject-empty": [2, "never"],
        "subject-full-stop": [2, "never", "."],
        "type-empty": [2, "never"],
        "type-enum": [
            2,
            "always",
            [
                "build",
                "chore",
                "ci",
                "docs",
                "feat",
                "fix",
                "perf",
                "refactor",
                "revert",
                "style",
                "test",
                "wip",
            ],
        ],
    },
};
