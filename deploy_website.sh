#!/bin/bash

set -ex

REPO="git@github.com:josketres/gh-pages-template.git"

DIR=temp-clone

# Delete any existing temporary website clone
rm -rf $DIR

# Clone the current repo into temp folder
git clone $REPO $DIR

# Move working directory into temp folder
cd $DIR

# Checkout and track the gh-pages branch
git checkout -t origin/gh-pages

# Delete everything
rm -rf *

# Copy website files from real repo
cp -R ../website/* .

# Stage all files in git and create a commit
git add .
git add -u
git commit -m "Website at $(date)"

# Push the new files up to GitHub
git push origin gh-pages

# Delete our temp folder
cd ..
rm -rf $DIR

# website is available under http://josketres.github.io/gh-pages-template.
