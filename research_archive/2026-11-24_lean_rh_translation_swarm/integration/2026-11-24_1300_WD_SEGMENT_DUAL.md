# Weil–Deligne duality and the segment normalization join

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed e26756e547b281cbf137eb7e0f16cccb738f3f84 (not substituted). Extends integration/2026-11-24_1200_PARDUAL_ROOT_JOIN and complements editor volume III (6871a68e493c407833de07490a9dead4463335c1). Adjacent JSON supplies exact source anchors, graph and guards. Source-matched human derivation, not kernel replay.

## The three identities
Keep E, Ω fields, E a number field, Ω an algebraic closure via the specified algebra, valuation subring A, height-one prime w and place-over h. For every finite list l of WD h, every class y and every real s, natural n (including zero), the original theorem asserts
1. (sumList l)^∨ = sumList(map dual l);
2. (y(s))^∨ = y^∨(-s);
3. (y ⊗ Sp_n)^∨ = y^∨ ⊗ Sp_n.
Here lpChar is the source tensor-class operation, not a claim that Sp_n is one-dimensional. The wrapper is a theorem, not a fresh axiom.

Represent a finite-dimensional complex WD pair by (ρ,N). Its dual acts by ρ(g)^(-T) and -N^T (linear dual, not conjugate transpose). For direct sums, the canonical evaluation pairing identifies the product of duals with the dual of the product and intertwines both actions. For tensors, (f⊗g)(v⊗w)=f(v)g(w); finite dimension makes this an isomorphism. The group action intertwines on pure tensors by multiplicativity, and the monodromy action N⊗1+1⊗M intertwines by distributing both negative dual terms. Pure tensors span; no semisimplicity is needed. Twisting by the unramified character rescales the group action and leaves monodromy unchanged. qPow(s)qPow(-s)=qPow(0)=1, so the inverse character is the negative real twist; the identity on the dual vector space intertwines both actions.

## The exact signed reversal in iso_sp_dual
On the basis e_0,...,e_(n-1), N e_j=e_(j+1) if j+1<n and zero otherwise. On a dual functional f, the source map S(f)_i=(-1)^i f(e_(n-1-i)). It is injective since the coefficients are nonzero and reversal is a bijection, and equal finite dimensions make it an isomorphism (n=0 is vacuous). The source spEig_rev gives reciprocal-reversed diagonal weights: d_(n-1-i)=d_i^(-1); therefore Sρ^∨=ρS componentwise. For i≥1, S(-N^T f)_i=(-1)^(i+1) f(e_(n-i)) = (Sf)_(i-1)=(NSf)_i. At i=0 both vanish. Hence the map intertwines N, not just Frobenius. Unsigned reversal would fail the monodromy test. This proves Sp_n^∨ ≅ Sp_n. The native proof then descends all isomorphisms to class equalities via WD.sound and WD.ind; zero rank gives the base case and list induction gives the direct-sum result. The tensor result composes the inverse dual-tensor isomorphism with the identity on y^∨ tensored with S.

## The actual guarded consumer
Let H:CuspT a ha r and SegDual Δ Δ' with GoodCusp Δ.first. The source obtains equal lengths n and dual relation between Δ'.first and Δ.first.nu(n−1). Twisting preserves cuspidality and goodness via the exact clBasic guard. H.dual and H.nu give r(Δ'.first)=(r(Δ.first)(n−1))^∨. Set a_n=(n−1)/2 as a real number (not truncated natural division). The new segment summand is
  ((r(Δ.first)(2a_n))^∨)(a_n) ⊗ Sp_n
  = (r(Δ.first)^∨)(-2a_n+a_n) ⊗ Sp_n
  = (r(Δ.first)^∨)(-a_n) ⊗ Sp_n
  = ((r(Δ.first)(a_n)) ⊗ Sp_n)^∨.
This is the ring step in summand_dual. Paired-list induction propagates it using GoodCusp for every first term. ExtDual obtains a multisegment from Pr.exh, a paired list and its IsL witness from Pr.dual, and the required goodness from goodSeg. Apply the two original extension-law instances hE, list duality and congrArg sumList. No unrestricted correspondence was inferred.

## Evidence and coverage
{"sourceBlobs":4,"anchors":33,"nodes":20,"edges":21,"monodromy":528,"diagonal":2640,"normalization":561,"negativeControls":3}
Executed locally: python rh_wd_dual_certificate.py, exact Fraction fixtures; the diagonal fixtures test arbitrary reciprocal-reversed rational weights and are not actual local-field instances or a Lean replay. Source anchors and DAG reachability checked separately through GitHub connector. The script uses assertions and is runnable without dependencies. The source declaration supplies arbitrary complex/real generality; finite tests do not prove it. Independent reviewer pending; imported axioms unresolved. No performance claim.
Failed retrieval: conventional RESUME_HERE.md names returned 404; recovered latest actual paths and handoffs via commit diffs. GitHub code search for spEig returned incomplete empty result; its original defining module remains a frontier, not guessed. Prior commit fetch transiently disconnected, retry succeeded. Full authenticated kernel export still unverified; dependencies lane 52356589 and kernel lane 0f225b8 retain retry/fixture work. Peer checkpoints read: 6871a68 (editor), c8b061b (geometry), a670dc1 (audit), 4b1807f (literature), 6a00797 (boxes), 46f0404 (math), 090ed61 (Galois), b6ac393 (structure), d22ac89 (Landau), 1073765 (prime-window), 5235658 (dependencies), 0f225b8 (kernel). No peer text overwritten. Editor reports 71 appendix entries; not a proof completion denominator.

RESUME HERE: trace the exact producer of GoodSeg and Pr.dual from ExtDual to the guarded multisegment existence and dual-pair construction; leave peer arithmetic lanes untouched. HANDOFF TO: proof editor (incorporate this chapter after ParDual), audit (independently review signed reversal and normalization), dependencies (authenticate actual closure). Project OPEN.
