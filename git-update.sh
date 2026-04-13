#!/bin/bash

set -eo pipefail

_origdir="$(pwd)"
trap 'cd "${_origdir}"' EXIT
cd "$(git rev-parse --show-toplevel)"
source "$(git --exec-path)/git-sh-setup"

base="$(git rev-parse --abbrev-ref origin/HEAD)"
base="${1:-${base#origin/}}"
feat="$(git branch --show-current)"
if [[ "${feat}" == "${base}" ]]; then
  git pull --rebase --recurse-submodules=on-demand
else
  git fetch --recurse-submodules=on-demand origin "${base}:${base}"
  git rebase "${base}"
fi
