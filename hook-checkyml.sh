#!/usr/bin/env bash
set -eEu
set -o pipefail

################################################################################
# Fail if any filename has a .yml  extension.
#
################################################################################

declare -i RC=0

has_yml_extension() {
  [[ "$(basename "${1}")" != "$(basename "${1}" .yml)" ]]
}

for filename in "${@}"; do
  if has_yml_extension "${filename}"; then
    echo "[ERROR] ${filename} has an extension please fix"
    RC=1
  else
    echo "[OK]    ${filename}"
  fi
done

exit $RC
