# glane

**Agent-first, graph-first knowledge engine in one static binary. There is no UI.**

glane (*glaner* = to glean) gathers knowledge from your repos into a versioned graph you can search, query, and pack into a token-budgeted **context** before an agent starts work. Clean-room design inspired by [Cognee](https://github.com/topoteretes/cognee) ideas — redesigned from first principles for the [machin](https://github.com/javimosch/machin) / [cli-specs](https://cli-specs.intrane.fr/) ecosystem.

**Self-hosted OSS only.** No hosted cloud product for now — you run the binary where your files are.

```sh
glane init
glane sync .
glane context "how does sync handle deletions?" --budget 2000
glane serve --port 7670   # HTTP + MCP for agents
```

## Why glane

| Pillar | What it means |
|---|---|
| **Graph is truth** | docs / chunks / nodes / edges / commits in `.glane/`; BM25 + vectors are rebuildable caches |
| **Deterministic first** | markdown / code / JSON extractors with zero LLM; optional embeddings later |
| **Versioned knowledge** | every sync/commit/forget is a generation → `log` / `diff` / honest `forget` |
| **Agent-native** | JSON stdout, typed errors, semantic exits 80–119, embedded `guide` + `help-json` |
| **One binary** | pure [MFL](https://github.com/javimosch/machin), ~240 KB native, no Docker / Postgres / vector DB to boot |

## Quickstart

Needs [machin](https://github.com/javimosch/machin) to build:

```sh
git clone https://github.com/javimosch/glane.git
cd glane && ./build.sh
./glane init
./glane sync .
./glane search "error handling" --limit 5
./glane context "explain the store layout" --budget 1500 --mode lexical
./glane guide --human
```

Composable plumbing:

```sh
glane scan . | glane chunk | glane extract | glane commit
```

## Commands (porcelain)

| Command | Role |
|---|---|
| `sync <path>` | scan → chunk → extract → commit (incremental) |
| `search <q>` | BM25 / semantic / hybrid (`--mode`) |
| `query …` | graph: `neighbors` / `path` / `subgraph` |
| `context <task>` | **killer verb** — budgeted context pack + citations |
| `log` / `diff` / `forget` | generations + honest delete |
| `embed` | optional int8 vectors (localhost only, **hard max 10**/run — smoke-safe) |
| `serve` | sequential HTTP + `POST /mcp` |
| `bench` | laptop-friendly self-benchmark (default 1000 docs, sequential) |
| `guide` / `help-json` | embedded operator manual |

Full catalog: `glane help-json`. Machine manual: `glane guide`.

## HTTP + MCP

```sh
glane serve --port 7670
```

| Route | Purpose |
|---|---|
| `GET /health` | liveness |
| `GET /status` | store stats |
| `POST /v1/search` | `{query, limit?, mode?}` |
| `POST /v1/context` | `{task, budget?, seeds?, depth?, mode?}` |
| `POST /v1/query` | `{op: neighbors\|path\|subgraph, …}` |
| `POST /mcp` | MCP JSON-RPC: `initialize`, `tools/list`, `tools/call` |

MCP tools: `glane_context`, `glane_search`, `glane_status`, `glane_query`.

## Benchmarks (self-hosted, sequential)

`glane bench --docs N` (N ≤ 5000). Measured on a laptop, synthetic corpus, graph extract included — not a marketing peak:

Example on a laptop (`glane bench --docs 200`, sequential, graph extract included):

```json
{"docs":200,"cold_sync_ms":449,"incr_sync_ms":133,"search_p95_ms":3,"context_ms":5,"context_chunks":11}
```

Re-run on your machine: `glane init && glane bench --docs 1000`.

## Embeddings (optional)

Contract: OpenAI-compatible `POST /v1/embeddings` via `GLANE_EMBED_URL` (default `http://127.0.0.1:8095/v1/embeddings`).

- **Host must be localhost / 127.0.0.1**
- **Hard max 10 vectors per `glane embed`**
- Default dim 64 (`GLANE_EMBED_DIM`), text truncated (`GLANE_EMBED_MAXCHARS`)
- `sync` never auto-embeds

Vectors are an int8 cache — delete `vectors.jsonl` anytime; the graph remains.

## vs Cognee (short)

See [docs/vs-cognee.md](docs/vs-cognee.md). Headline: time-to-first-answer from zero is `init && sync && search` in one binary vs docker-compose + Postgres + vector DB + Python + LLM keys.

## Project status

OSS **self-hosted only** (MIT). Roadmap: [ROADMAP.md](ROADMAP.md). Changelog: [CHANGELOG.md](CHANGELOG.md). Agent brief: [llms.txt](llms.txt).

## Develop

```sh
./build.sh
./test.sh          # unit tests (offline; no machweb)
./glane version
```

Max ~500 LOC per `.src` file. Store I/O lives in `src/store.src` only.
