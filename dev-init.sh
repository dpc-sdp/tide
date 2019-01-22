#!/usr/bin/env bash
##
# Install development files from the centralised location.
#
# Files already committed within current repository will not be overridden.
##
# To override any files coming from Dev Tools to persist in the current
# repository, modify `.git/info/exclude` file and commit them.
#
# Usage:
# . dev-init.sh
#
# To update all files, including committed:
# ALLOW_OVERRIDE=1 . dev-init.sh
#

# Development only: uncomment and set the commit value to fetch Dev Tools at
# specific commit.
#export GH_COMMIT=COMMIT_SHA

curl https://raw.githubusercontent.com/dpc-sdp/dev-tools/master/install | bash
