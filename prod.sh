#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Parse commit message
msg="Rebuilding website at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Add, commit and push source changes to root branch
git add -A
git commit -m "$msg"
git push origin hugo

# Build the project
hugo --config="prod.toml" --destination="../public/"

# Add, commit and push website changes to root branch
cd ../public
git add -A
git commit -m "$msg"
git push origin gh-pages
cd ../hugo