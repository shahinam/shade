#!/usr/bin/env bash

# Usage ./build.sh ~/Sites/myproject

set -o errexit
set -o pipefail
set -o nounset

# Variables.
readonly SCRIPTS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
readonly APP_BASE="$(dirname "${SCRIPTS_BASE}")"
readonly TARGET_DIR_PATH=${1:-};

# Includes.
. ${SCRIPTS_BASE}/variables.sh
. ${SCRIPTS_BASE}/functions.sh

create_directory ${TARGET_DIR_PATH}
# copy required files.
cp ${APP_BASE}/template/composer.json ${TARGET_DIR_PATH}
cp ${APP_BASE}/template/README.md ${TARGET_DIR_PATH}
cp ${APP_BASE}/template/.gitignore ${TARGET_DIR_PATH}

cd ${TARGET_DIR_PATH}
composer install
# initialize the git repo.
git_init

echo -e "\n${GREEN}You can find the target build at ${TARGET_DIR_PATH}"
