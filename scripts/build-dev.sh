#!/usr/bin/env bash

# Usage: ./build-dev.sh shade-dev

set -o errexit
set -o pipefail
set -o nounset

# Variables.
readonly SCRIPTS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
readonly APP_BASE="$(dirname "${SCRIPTS_BASE}")"
readonly TARGET_DIR_NAME=${1:-};
readonly TARGET_DIR_BASE=$(dirname "${APP_BASE}")
readonly TARGET_DIR_PATH=${TARGET_DIR_BASE}/${TARGET_DIR_NAME}

# Includes.
. ${SCRIPTS_BASE}/variables.sh
. ${SCRIPTS_BASE}/functions.sh

if [ -z ${TARGET_DIR_NAME} ]; then
    echo -e "${RED}Please specify the name of taget directory to build files."
    echo -e "${DEFAULT}  usage: ${BASH_SOURCE[0]} target-dir-name\n"
    exit 1
fi

create_directory ${TARGET_DIR_PATH}
# copy required files.
cp ${APP_BASE}/template/composer.development.json ${TARGET_DIR_PATH}/composer.json
cp ${APP_BASE}/template/README.md ${TARGET_DIR_PATH}
cp ${APP_BASE}/template/.gitignore ${TARGET_DIR_PATH}

cd ${TARGET_DIR_PATH}
composer install
# initialize the git repo.
git_init

echo -e "\n${GREEN}You can find the target build at ${TARGET_DIR_PATH}"

# For local dev, remove the build files.

cd ${APP_BASE}
rm -rf docroot
rm -rf vendor

