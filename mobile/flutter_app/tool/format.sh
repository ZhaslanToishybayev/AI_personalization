#!/usr/bin/env bash

# Format Dart/Flutter source consistently.

set -euo pipefail

    flutter format lib test integration_test tool
