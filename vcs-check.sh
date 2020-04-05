#!/usr/bin/env bash

if [[ $(git rev-parse --abbrev-ref HEAD) == master ]]; then commitlint -E HUSKY_GIT_PARAMS; fi