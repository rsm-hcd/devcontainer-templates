#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c

# Image specific tests
check "deno-postgres" deno test -A

# Report result
reportResults
