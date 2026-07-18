# glane vs Cognee

glane is a **clean-room** redesign inspired by Cognee’s mental model (remember / recall / graph+vector knowledge), not a fork. Goals diverge on purpose.

## What we keep

- Graph + lexical (+ optional vector) hybrid retrieval
- “Memory for agents” as the product, not a human dashboard
- Ingest → structure → query as the core loop

## Where we diverge

| Axis | Cognee (typical) | glane |
|---|---|---|
| Boot | Docker + Postgres + vector DB + Python | one static binary, `.glane/` on disk |
| Extraction | LLM-first | **deterministic parsers first**; LLM optional later |
| Source of truth | graph ≈ vectors as peers | **graph is truth**; vectors are a rebuildable int8 cache |
| Versioning | opaque / soft-delete vibes | append-only **generations** (`log` / `diff` / `forget`) |
| Agent surface | Python APIs / services | **CLI + HTTP + MCP**, cli-specs compliant |
| Embeddings | required for the happy path | optional; localhost smoke capped at **10**/run |
| Hosting model | cloud-friendly stack | **OSS self-hosted only** (for now) |

## Time-to-first-answer

On a laptop with a small repo:

```sh
glane init && glane sync . && glane search "X" --limit 5
```

No compose file, no migrations, no API keys. That is the number we optimize for.

`glane context "task" --budget N` is the verb agents actually need before starting work — seed + graph expand + citations under a token budget.

## Fairness note

Cognee is broader and LLM-centric by design; glane is narrower and deterministic-first. If you need heavy semantic entity extraction out of the box, Cognee’s path may fit better. If you want a single binary that agents can `sync` and `context` without a platform, glane is the fit.
