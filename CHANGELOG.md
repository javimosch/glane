# Changelog

## 0.7.0 — M6 RAG quality

- Richer code extractors: `imports` / `calls` + `module` nodes (`code_xtract.src`)
- Optional `glane-parse-<ext>` plugin protocol (`parse_plugin.src`)
- `glane eval` — gold JSONL RAG accuracy (hit if citations cover `must_include`; pass ≥ 98%)
- Context ranking: path-boost, content-token query, term-coverage (dogfood on machin docs)
- Embed: small batches + retry; `GLANE_EMBED_HARD_MAX` / `GLANE_EMBED_BATCH` for dogfood
- Scan prunes `.claude` / `node_modules` / `vendor` (worktree flood)
- Vector GC on `forget` (`vec_gc_orphans`)
- Gold fixture: `testdata/rag_gold.jsonl`

## 0.6.0 — M5 launch polish

- README, `llms.txt`, `docs/vs-cognee.md`, `ROADMAP.md`, MIT `LICENSE`
- `glane bench` report now includes `context_ms` / `context_used` / `context_chunks`
- Roadmap clarified: **OSS self-hosted only** (no cloud remotes for now)

## 0.5.0 — M4 context + serve

- `glane context <task> --budget N` — seed search + graph expand + citations
- `glane serve [--port 7670]` — sequential HTTP + MCP (`POST /mcp`)

## 0.4.0 — M3 generations

- `glane log`, `glane diff [<from> <to>]`, `glane forget <selector>`
- Exit code 90 `GLANE_FORGET_MISS`

## 0.3.0 — M2 embeddings

- `glane embed` (localhost only, hard max 10)
- `search --mode lexical|semantic|hybrid` (RRF)
- int8 `vectors.jsonl` cache

## 0.2.0 — M1 graph

- Deterministic extractors, nodes/edges, `query neighbors|path|subgraph`
- Doc tombstones, incremental BM25 postings

## 0.1.0 — M0 ingest

- init / scan / chunk / commit / sync + BM25 + bench + guide/help-json
