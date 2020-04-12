#!/bin/bash
#
# Copyright (C) 2017-2018 The LineageOS Project
# Copyright (C) 2020 AospExtended Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e


# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

# Override anything that may come from the calling environment
CM_ROOT="$MY_DIR"/../../..
BOARD=msm8974
DEVICE_COMMON=${BOARD}-common
INITIAL_COPYRIGHT_YEAR=2017
VENDOR=samsung

HELPER="$CM_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$CM_ROOT" true

# Copyright headers
write_headers $BOARD TARGET_BOARD_PLATFORM

write_makefiles "$MY_DIR"/common-proprietary-files.txt

write_footers
