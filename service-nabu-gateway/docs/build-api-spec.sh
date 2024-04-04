#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

npx @redocly/cli bundle ./api.yml --lint --output ./generated/openapi --skip-rule no-ambiguous-paths || true
npx @redocly/cli build-docs ./api.yml --output ./generated/index.html
open file://$SCRIPT_DIR/generated/index.html
