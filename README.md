Git Workflow Scripts
====================

Bash helpers for daily branch & merge-request workflow on **GitLab**.

## Install

Clone this repo, `cd` to this dir and create symlinks in one dir of `$PATH`:

```bash
# macOS (Homebrew)
for cmd in git-*.sh; do ln -s "$(pwd)/${cmd}" /opt/homebrew/bin/${cmd%.sh}; done

# Linux / Intel Mac
for cmd in git-*.sh; do ln -s "$(pwd)/${cmd}" /usr/local/bin/${cmd%.sh}; done
```

## Commands

- `git work <type>-<name>` — create or switch to a feature branch

  Type must be one of: `feat`, `fix`, `doc`, `epic`, `chore`.

- `git request [-r reviewer] [-t title] [-m description] [base]` — push and create a merge request

  Default title is taken from the last commit message. `-r` can be repeated.

- `git update [base]` — rebase current branch on the base branch

  If you encounter conflicts, resolve them and `git rebase --continue`.

- `git done [base]` — switch to base branch, delete the feature branch, and prune
