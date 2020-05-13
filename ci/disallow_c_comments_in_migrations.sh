#! /bin/sh

set -eu

# We do not use c-style comments in migration files as the stripped
# zero-length migration files cause warning during packaging
# See #3115 for more info
find src/backend/distributed/sql/*.sql -print0 | xargs -0 sed -i 's#/\*\(.*\)\w*\*/#--\1#g'
