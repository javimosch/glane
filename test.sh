#!/bin/sh
# run all glane tests: each tests/*_test.src composes with the src modules.
set -e
cd "$(dirname "$0")"
./build.sh
export GLANE_BIN="$(pwd)/glane"
LIBS="src/common.src src/scan.src src/chunk.src src/store.src src/bm25.src src/guide.src src/bench.src"
fail=0
for t in tests/*_test.src; do
    echo "== $t" >&2
    if ! machin test $LIBS "$t"; then fail=1; fi
done
exit $fail
