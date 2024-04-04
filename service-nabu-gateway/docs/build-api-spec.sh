#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

npx @redocly/cli bundle ./$SCRIPT_DIR/api.yml --lint --output ./$SCRIPT_DIR/generated/openapi --skip-rule no-ambiguous-paths || true
npx @redocly/cli build-docs ./$SCRIPT_DIR/api.yml --output ./$SCRIPT_DIR/generated/index.html
open file://$SCRIPT_DIR/generated/index.html
