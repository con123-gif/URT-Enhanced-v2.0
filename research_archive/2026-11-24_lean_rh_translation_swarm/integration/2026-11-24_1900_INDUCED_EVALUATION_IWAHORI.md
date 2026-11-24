# Induced evaluation and principal congruence Iwahori factorization — integration 19:00
2026-11-24. SOURCE-MATCHED / PARTIAL. Single contribution: expand two concrete suppliers of previous BoundB chapter. Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd. No source migration or independent Lean replay.

## Integration and peer handoff
Read SWARM_PROTOCOL first, AGENTS, state/log/protocol and continuity excerpts, HANDOFF_QUEUE, EXPANSION_15_LANES, previous 18:00 chapter, latest editor IX, peer RUN12 notes and core lane current commits/files. Root log/protocol guesses returned 404, recovered actual runner paths. Oversized lane-list request exceeded call limit; split. First line-anchor check failed because an induction declaration anchor was off by one; corrected to pinned blob plus exact anchor text. Some core scripts lack explicit RESUME HERE in tails; not an exhaustive nested Grok archive or blueprint reread. General CI checkpoint 388 PASS (45461125363), not RH validation.

Master reading index: [editor IX](../specialists/proof_editor/2026-11-24_1856_INTEGRATED_MANUSCRIPT.md) links I–VIII; append this chapter to [18:00](2026-11-24_1800_SIGNATURE_AND_UNITARY_BOUND.md). Editor counts 125 primary + 10 supporting entries before this contribution, not unique declarations. Reported full conservative export denominator 1,484,705 declarations; translation numerator not authenticated. No percentage computed.

| Lane | Observed commit | Next obligation |
|---|---|---|
| dependency | 79b0d65 | combined 47-target role projection |
| structure | 66ca007 | scoped out-tree role ordering |
| math | e8fb8e9 | MulChar.ext_iff / ofUnitHom |
| audit | 2c70f96 | derivative producer and domain controls |
| acceleration | ecf1b8d | combined role edges before reverse invalidation |
| kernel | c251ffa | downstream RC1 job status; per-role masking |
| prime | 9a24efb | residue-characteristic primality and StarAll |
| Landau | 29e3ad3 | kernel maximum and signed window inequalities |
| theta | 72b9ed7 | Afc.fcConj_of rational conjugation and ratV branch |
| Galois | 93e16ad | BridgeInd.exists_conj / repE_conj |
| boxes | 4aadbc7 | caller of exists_finite_group_goodSet_levels_characters |
| literature | bfcba16 | sec_smooth and chart factorization |
| geometry | 5c10037 | VuOnto.tendsto_arc_readsZ and both guards |
| editor | a22b20b | integrate latest conditional chapters |
| integration | 8d55d21 | this chapter |

Kernel reviewer RUN12 shows in 64 abstract role-frontier pairs that combined equality can hide per-role omissions. Native downstream propagation not yet tested in that note; no inference of kernel defect or independent approval of this chapter. No URT speed claim.

## 1. Smooth induction evaluation (ProdIrr.exists_mem_ind_apply_one, L16–72)
Let G be a topological group, with every identity neighborhood containing an open subgroup K. Let P≤G with subtype topology, W complex vector space, sigma a smooth representation of P, u any vector. No compactness, admissibility, nontriviality or irreducibility is assumed. Smoothness supplies an identity neighborhood N in G such that sigma(p)u=u for p∈P∩N. Choose K⊂N, so P∩K fixes u. Define F(g)=sigma(p)u if g=pc, p∈P,c∈K; otherwise F(g)=0. Retain classical witness choice.

If pc=p'c', then p'^(-1)p=c'c^(-1)∈P∩K. Apply sigma and multiply by sigma(p') to get sigma(p)u=sigma(p')u. Definition independent of factorization; PK need not be subgroup, K need not normal. For h∈P and g=pc, hg=(hp)c, so F(hg)=sigma(h)F(g); if g is outside PK but hg inside, multiply by h^(-1), contradiction. For c0∈K, g=pc implies gc0=p(cc0); if gc0 inside PK but g outside, multiply by c0^(-1) on right, contradiction. Thus F(gc0)=F(g) everywhere. Right K invariance and openness give membership in smoothPart(ind P sigma). Evaluate F(1)=u. Every value either zero or sigma(p)u; preserve this stronger conclusion.

## 2. Normalized parabolic induction (L82–107)
Let k nonarchimedean local field, α finite linearly ordered block index, m(a) finite with decidable equality, n finite with decidable equality, e:(Σ a,m(a))≃n, rho smooth Levi representation on complex W. Take G=GL(n,k), P=parab(k,e). Identity neighborhood basis from CentralExponent.exists_cong_subset and isOpen_cong (open imports). Levi projection continuous because each projected forward and inverse matrix entry is a block entry of p and p^(-1); use compatibility of projection with inversion and product topology. Use sigma=(rho twisted by deltaHalf) composed with leviProj. Smoothness uses isSmooth_comp, isSmooth_twist and isSmoothChar_deltaHalf (open imports). Section 1 supplies f∈IndSp e rho with f(1)=u and every f(g) either zero or c·rho(l)u, l=leviProj(p), c half-modulus scalar at p. The nonzero vector and finite-dimensional fixed-space construction in BoundB need separate nontriviality, smoothness and admissibility hypotheses.

## 3. Lexicographic elimination (IwahoriFactorization L17–199)
Let F a field, β:Fin n→α with α linearly ordered, not necessarily monotone β. Order indices by injective key (β(i),i). For current h, pivot a, E_ia=h_ia/h_aa when key(a)<key(i), all other entries zero. Only column a potentially nonzero, E_aa=0, hence E²=0 and (I−E)^(-1)=I+E. Nonzero off-diagonal entry implies β(i)≥β(a); hence I−E in opposite block-upper subgroup. Left multiplication subtracts E_ia times row a.

Abstract theorem assumes K subgroup; every diagonal of every h∈K nonzero; each I−E formed from h∈K belongs to K. Start q=I and process increasing key order (Lean inserts maximum into previously processed finite set). At pivot a current h=qg∈K, so h_aa nonzero. Column a entries below key diagonal vanish by division cancellation. For earlier j, h_aj=0 by key(j)<key(a); all h_ij with key(j)<key(i) already vanish, so the subtraction preserves them. Accumulate q=(I−E)q∈K∩Pbar, h=qg∈K∩P. All columns processed imply block-upper because β(j)<β(i) implies key(j)<key(i). Equal/nonmonotone labels allowed; empty matrix case vacuous.

Assume additionally ordinary and opposite Levi projections preserve K. Put p=q^(-1), h=qg, M1=leviProj_op(p), M2=leviProj(h), both in K∩M (Levi unchanged by reversing order). Kernel identities give M1^(-1)p∈Nbar, M2^(-1)h∈N. Conjugating the first by M1, which normalizes Nbar, gives pM1^(-1)∈Nbar. Define Z=pM1^(-1), Y=M1M2, X=M2^(-1)h. Each belongs to K and respectively Nbar,M,N. ZYX=ph=g. Existence, not uniqueness.

## 4. Principal congruence and order reversal (L218–376)
Over nonarchimedean local F, uniformizer ϖ, multiplicative valuation v, principal congruence K_m, m≥1. Sufficient membership criterion checks BOTH g−I and g^(-1)−I entries have valuation ≤v(ϖ)^m. This makes g and inverse integral by ultrametric inequality since v(ϖ)^m≤1 and I entries integral; then g∈K_m.

K_m⊂K_1⊂Iwahori gives v(h_aa)=1, hence pivots nonzero. For key(a)<key(i), i≠a, so v(h_ia)≤v(ϖ)^m and v(E_ia)=v(h_ia)/v(h_aa)≤v(ϖ)^m. Else zero. I−E and inverse I+E differ from I by ±E; criterion gives K_m membership. Levi projection keeps same-block entries, zeroes cross-block entries; these satisfy same bound, and applying it to g^(-1) gives inverse bound by compatibility of Levi projection with inversion. Both block orders allowed. All four abstract hypotheses supplied, giving ZYX for every g∈K_m. The neighboring theorem for Iwahori itself requires monotone β; not substituted here.

Apply ZYX to g^(-1), invert to get g=x^(-1)y^(-1)z^(-1), exactly X Y Z with factors in the same respective subgroups. This is the order needed by BoundB.zval, not an illicit exchange of noncommuting terms. m≥1 guards pivot method: a level-zero permutation matrix can have zero diagonal (not a general nonexistence claim).

## Evidence
Companion JSON records 21 typed nodes, 25 selected edges, two pinned blobs and 37 checked source anchors; graph checked reachable and acyclic. Executed JS V8 exact regression: {"matrixCases":20241,"pivots":115092,"factorizations":60723,"groupCases":62,"groupEquivariance":936,"groupSmoothness":936,"negative":3}. Matrices over finite quotient rings Z/p^k test congruence, square-zero operations, preservation of prior columns, both factor orders for all tested block labels; S3 subgroup fixtures test independence, covariance and right invariance. Negative guard controls: bad intersection, noncommuting order, zero pivot at level zero. Finite tests not independent proof of general field/topological theorems. Companion script reproduces anchor and arithmetic checks on pinned git checkout; git wrapper not executed locally. No Lean execution, authenticated root membership or axiom closure claimed. New CI verdict pending.

RESUME HERE: trace CentralExponent.exists_cong_subset/isOpen_cong and isSmoothChar_deltaHalf actual pinned imports; then expand leviProj_inv_mul_mem and conj_mem_unipotentRadical. Request authenticated membership and type/value direct edges for GlobalTheory.SmGL.ProdIrr.exists_indSp_apply_one, exists_mem_ind_apply_one, GroundTheory.Automorphic.Parabolic.congruenceSubgroup_iwahoriFactorization', iwahoriFactorization_of_elim and prior BoundB anchors. HANDOFF TO dependencies, kernel, editor, audit, integration. Project OPEN.
