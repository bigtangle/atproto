#!/usr/bin/env sh

# Exit if any command fails
set -e

  export DB_POSTGRES_URL="postgresql://pg:password@127.0.0.1:5433/postgres"

  export REDIS_HOST="127.0.0.1:6380"

  "$@"

