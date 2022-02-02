#!/usr/bin/env bash

# Copyright 2022 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

[[ -n ${DEBUG:-} ]] && set -o xtrace

if ! command -v faketime >/dev/null 2>&1; then
    echo "faketime must be present to convert to vhd" >&2
    exit 1
fi

if ! command -v vhd-util >/dev/null 2>&1; then
    wget http://packages.shapeblue.com.s3-eu-west-1.amazonaws.com/systemvmtemplate/vhd-util -O /tmp/vhd-util
    chmod +x /tmp/vhd-util
    sudo mv /tmp/vhd-util /usr/local/bin/vhd-util
    wget http://packages.shapeblue.com.s3-eu-west-1.amazonaws.com/systemvmtemplate/libvhd.so.1.0 -O /tmp/libvhd.so.1.0
    sudo mv /tmp/libvhd.so.1.0 /usr/lib/libvhd.so.1.0
fi
