#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

from=$1
to=$2

if [[ "${to}" =~ "^${FILES_DIR}" ]]; then
    rsync -rltpog --chown=www-data:www-data "${from}" "${to}"
    # Ensure files volume permissions are still correct.
    init-volumes.sh
else
    echo "Invalid destination. Must be under ${FILES_DIR}"
    exit 1
fi