#!/bin/sh

# MIT License
#
# Copyright (c) 2021 Kazuhito Suda
#
# This file is part of FIWARE Big Bang
#
# https://github.com/lets-fiware/FIWARE-Big-Bang
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -ue

: "${CLIENT_ID:?CLIENT_ID not found}"
: "${CLIENT_SECRET:?CLIENT_SECRET not found}"

LOG_LEVEL="${LOG_LEVEL:-info}"
HOST="${HOST:-http://keyrock:3000}"
VERBOSE="${VERBOSE:-false}"

if ${VERBOSE}; then
  VERBOSE=--verbose
else
  VERBOSE=""
fi

echo "HOST=${HOST}"
echo "LOG_LEVEL=${LOG_LEVEL}"
echo "VERBOSE=${VERBOSE}"

NGSI_GO="/usr/local/bin/ngsi --stderr ${LOG_LEVEL} --config ./ngsi-go-config.json --cache ./ngsi-go-token-cache.json"

${NGSI_GO} tokenproxy server --idmHost "${HOST}" --clientId "${CLIENT_ID}" --clientSecret "${CLIENT_SECRET}" "${VERBOSE}"
