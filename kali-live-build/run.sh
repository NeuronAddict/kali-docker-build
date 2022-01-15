#! /bin/bash

set -eu

/overrides/sync.sh
./build.sh "$@"
