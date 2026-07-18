<div class="feature-card rounded-xl p-6">
  <div class="flex items-start gap-4">
    <div class="w-12 h-12 rounded-lg bg-blue-500/10 flex items-center justify-center flex-shrink-0">
      <span class="text-2xl">🌾</span>
    </div>
    <div>
      <h3 class="text-xl font-semibold text-white mb-2">glane is born — graph-first agent memory</h3>
      <p class="text-white/40 leading-relaxed">A new self-hosted knowledge engine in one static binary. Sync a repo, search it with BM25, walk the entity graph, and get versioned generations — no Docker, Postgres, or vector DB required.</p>
    </div>
  </div>
</div>

<div class="feature-card rounded-xl p-6">
  <div class="flex items-start gap-4">
    <div class="w-12 h-12 rounded-lg bg-emerald-500/10 flex items-center justify-center flex-shrink-0">
      <span class="text-2xl">📦</span>
    </div>
    <div>
      <h3 class="text-xl font-semibold text-white mb-2">Context packs — the agent pre-work verb</h3>
      <p class="text-white/40 leading-relaxed"><code>glane context "task" --budget N</code> seeds search, expands along the graph, and returns a token-budgeted pack with citations. Also available over HTTP and MCP so agents can call it before starting work.</p>
    </div>
  </div>
</div>

<div class="feature-card rounded-xl p-6">
  <div class="flex items-start gap-4">
    <div class="w-12 h-12 rounded-lg bg-purple-500/10 flex items-center justify-center flex-shrink-0">
      <span class="text-2xl">🕸️</span>
    </div>
    <div>
      <h3 class="text-xl font-semibold text-white mb-2">Deterministic graph + honest forget</h3>
      <p class="text-white/40 leading-relaxed">Markdown, code, and JSON extractors build nodes and edges with provenance — no LLM required. <code>log</code>, <code>diff</code>, and <code>forget</code> turn every sync into a versioned generation with real tombstones.</p>
    </div>
  </div>
</div>

<div class="feature-card rounded-xl p-6">
  <div class="flex items-start gap-4">
    <div class="w-12 h-12 rounded-lg bg-amber-500/10 flex items-center justify-center flex-shrink-0">
      <span class="text-2xl">🔌</span>
    </div>
    <div>
      <h3 class="text-xl font-semibold text-white mb-2">Serve + MCP for agents</h3>
      <p class="text-white/40 leading-relaxed"><code>glane serve</code> exposes <code>/v1/search</code>, <code>/v1/context</code>, <code>/v1/query</code>, and <code>POST /mcp</code> tools (<code>glane_context</code>, <code>glane_search</code>, <code>glane_status</code>, <code>glane_query</code>) on a sequential, race-safe loop.</p>
    </div>
  </div>
</div>

<div class="feature-card rounded-xl p-6">
  <div class="flex items-start gap-4">
    <div class="w-12 h-12 rounded-lg bg-cyan-500/10 flex items-center justify-center flex-shrink-0">
      <span class="text-2xl">🏠</span>
    </div>
    <div>
      <h3 class="text-xl font-semibold text-white mb-2">Self-hosted OSS launch</h3>
      <p class="text-white/40 leading-relaxed">MIT license, README, <code>llms.txt</code>, vs-Cognee note, and a clear roadmap: self-hosted only — no cloud remotes for now. Optional embeddings stay localhost-capped (max 10) so laptops stay safe.</p>
    </div>
  </div>
</div>
