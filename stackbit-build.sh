#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5f42b58d3588fa001e2248d8/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5f42b58d3588fa001e2248d8
curl -s -X POST https://api.stackbit.com/project/5f42b58d3588fa001e2248d8/webhook/build/ssgbuild > /dev/null
make prepare && hugo --source demo --baseURL "/"
curl -s -X POST https://api.stackbit.com/project/5f42b58d3588fa001e2248d8/webhook/build/publish > /dev/null
