#!/bin/bash

# Exit on any error
set -e

# Validate that TEMPLATE_ID parameter is provided
if [ -z "$1" ]; then
    echo "Error: TEMPLATE_ID parameter is required"
    echo "Usage: $0 <TEMPLATE_ID>"
    exit 1
fi

TEMPLATE_ID="$1"

./.github/actions/smoke-test/build.sh ${TEMPLATE_ID}
./.github/actions/smoke-test/test.sh ${TEMPLATE_ID}
