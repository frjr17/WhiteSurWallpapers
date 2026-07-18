#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
readonly REPO_DIR
TEST_DIR="$(mktemp -d)"
trap 'rm -rf -- "${TEST_DIR}"' EXIT

background_dir="${TEST_DIR}/home/.local/share/backgrounds/Wallpaper-nord"
properties_dir="${TEST_DIR}/home/.local/share/gnome-background-properties"
mkdir -p "${background_dir}" "${properties_dir}"
touch "${properties_dir}/Mojave.xml"

HOME="${TEST_DIR}/home" bash "${REPO_DIR}/install-gnome-backgrounds.sh" --uninstall -t whitesur >/dev/null

[[ ! -e ${background_dir} ]]
[[ ! -e ${properties_dir}/Mojave.xml ]]

echo "Uninstall test passed"
