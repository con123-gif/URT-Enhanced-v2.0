# Q161x deferred — CI #177 infrastructure repair (GPT, 2026-11-16)
Status: OPEN physical identification; CI repair only, no mathematical gate closed.

GitHub Actions run 43926774545 cancelled stage (research) at its 30-minute job limit after ~30m18s. Other stages, including research_heavy, succeeded. The aggregate marked 155 research checks as gating failures because many never returned a result, not because their assertions failed. No scientific operator or assertion is changed.

Repair: partition the existing 155 research-stage registry checks, in original registry order, round-robin into four parallel matrix stages research_a through research_d (39,39,39,38). Their IDs, commands, timeouts, claims, gating flags, and ordering relative to other checks remain unchanged. The orchestrator derives stage names from registry.toml, so no workflow edit is required. This is a scheduling fix, not a relaxation of any gate. If any genuine check fails on rerun, that failure must be repaired separately.

Verification: connector-side exact audit counted 155 source research entries and 155 partitioned entries, distribution 39/39/39/38. A fail-on-error standalone certificate is included for CI; local execution against full registry was unavailable because the runtime cannot clone GitHub (DNS resolution failed). No local PASS is claimed.
Next question: does the partitioned run complete all 155 gating checks without cancellation and identify any genuine assertion failure?
