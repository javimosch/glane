# ROADMAP

**Product stance:** glane is **OSS, self-hosted only**. No hosted cloud / multi-tenant remotes in the active plan. If that changes later, it will be an explicit new milestone — not implied by M0–M5.

## Done

| Milestone | What shipped |
|---|---|
| **M0** | init / scan / chunk / commit / sync + BM25 + bench + guide |
| **M1** | graph layer, deterministic extractors, `query`, doc tombstones, incremental BM25 |
| **M2** | int8 vectors (localhost-capped), `search --mode`, hybrid RRF |
| **M3** | `log` / `diff` / `forget` generations |
| **M4** | `context` packs + sequential HTTP/MCP `serve` |
| **M5** | launch polish: README, llms.txt, vs-Cognee note, changelog, bench includes `context_ms` |
| **M6** | RAG quality loop: imports/calls + `glane-parse-*` plugins, `glane eval` (gold hit@context ≥98%), vector GC on forget, path-boosted context |

## Near-term (self-hosted)

Priority order — pick when needed, not a forced queue:

1. **Ops ergonomics** — `update` verb (cli-specs), release binaries, install script
2. **Bulk embed path** — `GLANE_EMBED_HARD_MAX` raises the per-run cap on localhost; still no remote hosts. Further: uncapped dedicated-box presets (e.g. rbm21)
3. **Store backend** — optional grange-backed collections (dogfood) behind the same CLI
4. **Hardening** — time-travel reads (`status --at`), larger bench profiles still sequential/CPU-capped

## Explicitly out of scope (for now)

- Hosted glane.intrane.fr / team sync remotes
- Peage metering / multi-tenant cloud
- Mandatory LLM extraction in the default path
- Desktop / web UI

## Design invariants (do not break)

- Graph is source of truth; indexes are caches
- Max ~500 LOC per source file
- JSON on stdout, diagnostics on stderr, typed errors, exits 80–119
- `sync` never silently calls the network (embed stays opt-in)
