#!/bin/sh
#
# Copyright 2015-2019 DJANTA, LLC (https://www.djanta.io)
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

is_git_submodule() {
  project_version="$(print_project_version)"
  if [[ "$project_version" =~ ^[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+$ ]]; then
    echo "Build started by release commit $project_version. Will synchronize to maven central."
    return 0
  else
    return 1
  fi

  git submodule update --init --recursive --remote --merge
}

#is_git_submodule