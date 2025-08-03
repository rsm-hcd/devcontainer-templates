#!/bin/bash
TEMPLATE_ID="$1"

./.github/actions/smoke-test/build.sh ${TEMPLATE_ID}
./.github/actions/smoke-test/test.sh ${TEMPLATE_ID}
