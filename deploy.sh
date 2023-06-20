#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo

# Commit changes.
msg="build: rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git add .
git commit -m "$msg"

# Push public directory to gh-pages branch
git subtree push --prefix public origin gh-pages
