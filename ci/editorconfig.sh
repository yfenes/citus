#!/bin/sh
set -euo pipefail
for f in $(git ls-tree -r HEAD --name-only); do
    if [ "$f" = "${f%.out}" ]  &&
        [ "$f" = "${f%.data}" ] &&
        [ "$f" = "${f%.png}" ] &&
        [ -f "$f" ] &&
        [ "$(echo "$f" | cut -d / -f1)" != "vendor" ] &&
        [ "$(dirname "$f")" != "src/test/regress/output" ]
    then
        # Trim trailing whitespace
        sed -e 's/[[:space:]]*$//' -i "./$f"
        # Add final newline if not there
        if [ -n "$(tail -c1 "$f")" ]; then
            echo >> "$f"
        fi
    fi
done

# We do not use c-style comments in migration files as the stripped
# zero-length migration files cause warning during packaging
# See #3115 for more info
find src/backend/distributed/sql/*.sql -print0 | xargs -0 sed -i 's#/\*\(.*\)\w*\*/#--\1#g'
