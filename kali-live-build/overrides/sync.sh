#!/bin/bash

set -eu

if [[ -n "$OVERRIDE_PROFILE" ]]
then
  profile=$OVERRIDE_PROFILE
else
  [[ $# -lt 2 ]] && echo "syntaxe: $0 <profile> (or set OVERRIDE_PROFILE env var)" && exit 0
  profile=$1
fi

echo "Override with profile ${profile}"

rsync -v -r -K -p "/overrides/${profile}/"* /live-build-config/
