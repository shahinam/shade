# Initialize the git repo and add files for initial commit.
git_init() {
  git init
  git add .
  git commit -m 'Initial commit'

  return 0
}

# Create a directory with specified path.
## @param: target_dir
create_directory() {
  local TARGET_DIR=$1;

  if [ -d ${TARGET_DIR} ]; then
    echo -e "${RED}The target directory ${TARGET_DIR_PATH} already exists."
    echo -e "Please remove it before proceeding or use a different directory.\n"
    exit 1
  fi

  mkdir ${TARGET_DIR}

  if [ $? -ne 0 ] ; then
    echo -e "Failed to create ${TARGET_DIR}"
    exit 1
  fi

  return 0
}
