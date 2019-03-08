#!/usr/bin/env bash
##
# Install development files from the centralised location - Dev-Tools repository.
#
# === WHAT IS DEV-TOOLS ===
# Dev-Tools is a development environment for Drupal sites with tools included.
# https://github.com/dpc-sdp/dev-tools
#
# === WHAT IS THIS FILE AND WHY DO I NEED IT ===
# Using Dev-Tools requires initial installation into your project. Once
# installed, it the can be "attached" in every environment were development
# stack is required. This means that your project will have only small number
# of Dev-Tools files committed - the rest of the files will be downloaded each
# time Dev-Tools needs to be "attached".
#
# This file is a script to download Dev-Tools at the latest stable version and
# "attach" it to the current environment.
# Files already committed within current repository will not be overridden.
#
# Usage:
# ./dev-tools.sh
#
# === HOW TO OVERRIDE LOCALLY EXCLUDED FILES ===
# To override any files coming from Dev-Tools to persist in the current
# repository, modify `.git/info/exclude` file and commit them.
#
# === HOW TO UPDATE DEV-TOOLS ===
# ALLOW_OVERRIDE=1 ./dev-tools.sh
#
# === HOW TO PIN TO SPECIFIC DEV-TOOLS COMMIT ===
# For development of Dev-Tools or debugging of the development stack, it may be
# required to point to the specific Dev-Tools's commit rather then use the latest
# stable version.
#
# Uncomment and set the Dev-Tools's commit value and commit this change.
# export DRUPALDEV_COMMIT=COMMIT_SHA

bash <(curl -L https://raw.githubusercontent.com/dpc-sdp/dev-tools/master/install?"$(date +%s)") "$@"
