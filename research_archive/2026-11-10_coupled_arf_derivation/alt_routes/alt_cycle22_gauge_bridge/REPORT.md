# alt_cycle22 — gauge the bridge

Classification: PROVED on H1–H4.
Advances a physical ARF? No.

## Result
Cbridge was rebuilt with Tr = 160 and Tr(Cbridge²) = 800. Its icosahedral vertex
block is 4 P_1 + 4 P_3, nonzero on all 30 edges and on all 36 off-edge pairs.

Each off-edge pair has between 2 and 10 shortest incidence paths (lengths 2 or 3);
none has a unique shortest path. Two recipes that use only existing edge links,
with no new continuous couplings, were tested: (A) the average of the Wilson lines
along all shortest paths, and (B) the single lexicographically first shortest path.
Both restore exact finite gauge invariance of S_Hodge + S_Cbridge (residuals
2.8×10^{-14} and 0) and therefore the first Ward identity, for q = 1.

The two recipes produce substantially different currents (relative ℓ² difference
0.855). The current is therefore not unique: a discrete path-weighting ambiguity
remains. The 2I lift (and A5) act as graph symmetries and permute shortest paths
but do not pick one path between a given pair; group-averaging reproduces recipe A
and does not remove the ambiguity.

Of 920 cross-solid vertex pairs in the five-solid complex, 836 have a nonzero
Cbridge entry. The five incidence graphs are disjoint, so those pairs have no
spatial-edge path. Restoring Ward for the full 190-cochain Cbridge requires new
inter-solid links, which are new fields, not existing couplings.

## Verification
`/workspace/arf_research/alt_cycle22_gauge_bridge/test_gauge_bridge.py` and `results.json`.
Predeclaration sha256: `3a71adae486aa709859679531a01b3fbcd3a40c4fe650c52a98bbc3a2c46acac`.

## Next obstruction
Ward can be restored on the icosahedral block without new continuous couplings,
but the current depends on the path recipe, and the full five-solid Cbridge has
hundreds of cross-solid entries with no incidence path.
