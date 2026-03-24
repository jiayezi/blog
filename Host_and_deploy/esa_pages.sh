#!/usr/bin/env bash

#------------------------------------------------------------------------------
# @file
# Builds a Hugo site hosted on Alibaba Cloud ESA Pages.
#
# Assumes ESA Pages environment has:
# - Node.js pre-installed (as seen in logs)
# - git, curl, tar available
#------------------------------------------------------------------------------

set -euo pipefail
# Enable debugging output so if it fails, the ESA Pages log prints the exact failing command
set -x

# Ensure timezone is consistent for Hugo generating dates
export TZ=Asia/Shanghai

HUGO_VERSION=0.159.0

# 1. Initialize Git Submodules
# (CRITICAL: ESA Pages default checkout doesn't pull submodule configs, which makes themes/PaperMod empty!)
echo "Configuring Git and initializing submodules..."
git config core.quotepath false
git submodule update --init --recursive

# Some themes or Hugo features require unshallow git clone to calculate dates properly
if [ "$(git rev-parse --is-shallow-repository)" = "true" ]; then
  git fetch --unshallow
fi

# 2. Install Hugo locally
echo "Installing Hugo ${HUGO_VERSION}..."
# Create a local bin folder for our executables
mkdir -p "${HOME}/.local/bin"
export PATH="${HOME}/.local/bin:${PATH}"

# Using curl with -LJO for safe following redirects, into a temp tarball
curl -sL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" -o hugo.tar.gz
tar -C "${HOME}/.local/bin" -xzf hugo.tar.gz hugo
rm hugo.tar.gz

# Verify Hugo installation
echo "Verifying installations..."
hugo version
node --version

# 3. Build Site
echo "Building the site..."
hugo --gc --minify

# 4. Generate Pagefind Search Index
echo "Running Pagefind..."
# Add -y to prevent npm from requiring interactive Y/N prompts since there's no package.json
npx -y pagefind --site public --language zh

echo "✅ Build completed successfully."
