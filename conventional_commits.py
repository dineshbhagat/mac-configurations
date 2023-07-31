import os
import re

from commitizen import defaults
from commitizen.cz.base import BaseCommitizen
from commitizen.cz.utils import multiple_line_breaker, required_validator
from commitizen.defaults import Questions
from commitizen.cz.exceptions import CzException

__all__ = ["ConventionalCommitsCz"]

issueRE = re.compile(r"\w+-\d+")
def parse_jira_issues(text):
    if not text:
        return ""

    issues = text.strip().split(", ")
    for issue in issues:
        if not issueRE.search(issue):
            raise CzException(f"JIRA scope of '{issue}' is invalid")

    if len(issues) == 1:
        return issues[0]

    return required_validator(", ".join(issues), msg="JIRA scope is required")

def parse_scope(text):
    if not text:
        return ""

    scope = text.strip().split()
    if len(scope) == 1:
        return scope[0]

    return "-".join(scope)


def parse_subject(text):
    if isinstance(text, str):
        text = text.strip(".").strip()

    return required_validator(text, msg="Subject is required.")


class ConventionalCommitsCz(BaseCommitizen):
    bump_pattern = defaults.bump_pattern
    bump_map = defaults.bump_map
    bump_map_major_version_zero = defaults.bump_map_major_version_zero
    commit_parser = defaults.commit_parser
    version_parser = defaults.version_parser
    change_type_map = {
        "feat": "Feat",
        "fix": "Fix",
        "refactor": "Refactor",
        "perf": "Perf",
    }
    changelog_pattern = defaults.bump_pattern

    def questions(self) -> Questions:
        questions: Questions = [
            {
                "type": "list",
                "name": "prefix",
                "message": "Select the type of change you are committing",
                "choices": [
                    {
                        "value": "fix",
                        "name": "fix: A bug fix. Correlates with PATCH in SemVer",
                        "key": "x",
                    },
                    {
                        "value": "feat",
                        "name": "feat: A new feature. Correlates with MINOR in SemVer",
                        "key": "f",
                    },
                    {
                        "value": "docs",
                        "name": "docs: Documentation only changes",
                        "key": "d",
                    },
                    {
                        "value": "style",
                        "name": (
                            "style: Changes that do not affect the "
                            "meaning of the code (white-space, formatting,"
                            " missing semi-colons, etc)"
                        ),
                        "key": "s",
                    },
                    {
                        "value": "refactor",
                        "name": (
                            "refactor: A code change that neither fixes "
                            "a bug nor adds a feature"
                        ),
                        "key": "r",
                    },
                    {
                        "value": "perf",
                        "name": "perf: A code change that improves performance",
                        "key": "p",
                    },
                    {
                        "value": "test",
                        "name": (
                            "test: Adding missing or correcting " "existing tests"
                        ),
                        "key": "t",
                    },
                    {
                        "value": "build",
                        "name": (
                            "build: Changes that affect the build system or "
                            "external dependencies (example scopes: pip, docker, npm)"
                        ),
                        "key": "b",
                    },
                    {
                        "value": "ci",
                        "name": (
                            "ci: Changes to our CI configuration files and "
                            "scripts (example scopes: GitLabCI)"
                        ),
                        "key": "c",
                    },
                    {
                        "value": "chore",
                        "name": (
                            "chor: changes that do not relate to a fix or feature and "
                            "don't modify src or test files (for example updating dependencies)"
                        ),
                        "key": "h",
                    },
                    {
                        "value": "revert",
                        "name": (
                            "revert: reverts a previous commit"
                        ),
                        "key": "z",
                    },
                ],
            },
            {
                "type": "input",
                "name": "jira_issue",
                "filter": parse_jira_issues,
                "message": (
                    "JIRA issue. Of form $JIRA_Project$-$Issue_Number$:\n"
                ),
            },
            {
                "type": "input",
                "name": "scope",
                "message": (
                    "What is the scope of this change? (EPIC name or class or file name): (press [enter] to skip)\n"
                ),
                "filter": parse_scope,
            },
            {
                "type": "input",
                "name": "subject",
                "filter": parse_subject,
                "message": (
                    "Write a short and imperative summary of the code changes: (lower case and no period)\n"
                ),
            },
            {
                "type": "input",
                "name": "body",
                "message": (
                    "additional contextual information about the code changes: "
                    "(press [enter] to skip)\n"
                ),
                "filter": multiple_line_breaker,
            },
            {
                "type": "confirm",
                "message": "Is this a BREAKING CHANGE? Correlates with MAJOR in SemVer",
                "name": "is_breaking_change",
                "default": False,
            },
            {
                "type": "input",
                "name": "footer",
                "message": (
                    "Footer. Information about Breaking Changes and "
                    "reference issues that this commit closes: (press [enter] to skip)\n"
                ),
            },
        ]
        return questions

    def message(self, answers: dict) -> str:
        prefix = answers["prefix"]
        # ----- New addition -----
        jira_issue = answers["jira_issue"]
        # ------------------------
        scope = answers["scope"]
        subject = answers["subject"]
        body = answers["body"]
        footer = answers["footer"]
        is_breaking_change = answers["is_breaking_change"]
        body_message = ""

        if jira_issue:
            ji = issueRE.search(jira_issue).group()
            ji = f"[{ji}] - "
            body_message = f"\n\n{jira_issue}"
        if scope:
            scope = f"({scope})"
        if body:
            body_message = body_message + f"\n\n{body} \n "
        if is_breaking_change:
            footer = f"BREAKING CHANGE: {footer}"
        if footer:
            footer = f"\n\n{footer}"

        message = f"{ji}{prefix}{scope}: {subject}{body_message}{footer}"

        return message

    def example(self) -> str:
        return (
            "[ABCD-1234] - fix(Stability): fixing one of the bug\n"
            "\n"
            "https://jira.target.com/browse/ABCD-1234\n"
            "\n"
            "closes issue #12"
        )
        # original example
        #return (
        #    "fix: correct minor typos in code\n"
        #    "\n"
        #    "see the issue for details on the typos fixed\n"
        #    "\n"
        #    "closes issue #12"
        #)

    def schema(self) -> str:
        return (
            "[<jira_issue>] - <type>(<scope>): <subject>\n"
            "<BLANK LINE>\n"
            "<body>\n"
            "<BLANK LINE>\n"
            "(BREAKING CHANGE: )<footer>"
        )
        # original schema
        # return (
        #     "<type>(<scope>): <subject>\n"
        #     "<BLANK LINE>\n"
        #     "<body>\n"
        #     "<BLANK LINE>\n"
        #     "(BREAKING CHANGE: )<footer>"
        # )

    def schema_pattern(self) -> str:
        PATTERN = (
            r"(?s)"  # To explictly make . match new line
            r"[\w+-\d+)*]" # jira issue
            r"(build|ci|chore|docs|feat|fix|perf|refactor|style|test|chore|revert|bump)"  # type
            r"(\(\S+\))?!?:"  # scope
            r"( [^\n\r]+)"  # subject
            r"((\n\n.*)|(\s*))?$"
        )
        # Original pattern
        # PATTERN = (
        #     r"(?s)"  # To explictly make . match new line
        #     r"(build|ci|chore|docs|feat|fix|perf|refactor|style|test|chore|revert|bump)"  # type
        #     r"(\(\S+\))?!?:"  # scope
        #     r"( [^\n\r]+)"  # subject
        #     r"((\n\n.*)|(\s*))?$"
        # )
        return PATTERN

    def info(self) -> str:
        dir_path = os.path.dirname(os.path.realpath(__file__))
        filepath = os.path.join(dir_path, "conventional_commits_info.txt")
        with open(filepath, "r") as f:
            content = f.read()
        return content

    def process_commit(self, commit: str) -> str:
        pat = re.compile(self.schema_pattern())
        m = re.match(pat, commit)
        if m is None:
            return ""
        return m.group(3).strip()
