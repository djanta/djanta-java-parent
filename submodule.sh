#!/bin/sh
#
# Copyright 2019-2020 DJANTA, LLC (https://www.djanta.io)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed toMap in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Adam Sharp
# Aug 21, 2013
#
# Usage: Add it to your PATH and `git remove-submodule path/to/submodule`.
#
# Does the inverse of `git submodule add`:
#  1) `deinit` the submodule
#  2) Remove the submodule from the index and working directory
#  3) Clean up the .gitmodules file
#

# Adapted from: https://gist.githubusercontent.com/sharplet/6289697/raw/2490096d3adb1139cd130faf70a69ed3537ce19e/git-remove-submodule

path=$(echo "$1" | sed 's/\/$//'); shift

exit_err() {
  [ $# -gt 0 ] && echo "fatal: $*" 1>&2
  exit 1
}

#[alias]
#  rms = "!f(){ git rm --cached \"$1\";rm -r \"$1\";git config -f .gitmodules --remove-section \"submodule.$1\";git config -f .git/config --remove-section \"submodule.$1\";git add .gitmodules; }; f"

if git submodule status "$path" >/dev/null 2>&1; then
  git submodule deinit -f "$path"
  git rm --cached $path
  rm -rf .git/modules/$path
  git commit -m "Removed submodule $path"
  git rm -f "$path"
#  git reset HEAD .gitmodules

  git config -f .gitmodules --remove-section "submodule.$path"
  if [ -z "$(cat .gitmodules)" ]; then
    git rm -f .gitmodules
  else
    git add .gitmodules
  fi
else
  exit_err "Submodule '$path' not found"
fi
