#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Catch errors in piped commands

echo "==========================="
echo "Configuring Git..."

# Configure Git with user details
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

echo "Running feed.py script..."
# Run the feed generator script
python /usr/bin/feed.py

echo "Staging changes..."
# Stage, commit, and push changes
git add .
git commit -m "Update Feed" || echo "No changes to commit."
git push --set-upstream origin main || echo "Push failed, check branch setup."

echo "==========================="
