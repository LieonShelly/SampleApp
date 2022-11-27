#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(git rev-parse --show-toplevel)"

# Setup bundle
bundle install

# Update Pod repo
bundle exec pod repo update

# Setup pods
bundle exec pod install

