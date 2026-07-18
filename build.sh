#!/bin/sh
# build glane: compose the modules -> one .mfl -> one native binary
set -e
cd "$(dirname "$0")"
machin encode framework/machweb.src \
  src/common.src src/scan.src src/chunk.src src/extract.src src/store.src \
  src/bm25.src src/graph.src src/embed.src src/vector.src src/history.src \
  src/context.src src/serve.src src/guide.src src/bench.src src/main.src \
  > glane.mfl
machin build glane.mfl -o glane
echo "built ./glane" >&2
