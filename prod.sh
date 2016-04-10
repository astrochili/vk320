#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Clean output folder.
rm -rf public

# Build the project.
hugo -t hugo-zen --config="prod.toml"

# Add changes to git.
git add -A

# Commit changes.
msg="Rebuilding website at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push root to hugo branch
git push origin hugo

# Push public folder to gh-pages branch
git subtree push --prefix=public https://github.com/romanchiller/vk320.git gh-pages

# Clean output folder again.
rm -rf public