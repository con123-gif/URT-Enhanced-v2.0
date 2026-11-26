import RHAuditPrimeDescent49
import RHStructureCofinal42
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
INTEGRATION — 26 Nov 2026 — shared replay queue 1.
HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.

ONE CONTRIBUTION: splice audit RUN49's prime-level descent into the
actual cofinal Sha consumer (structure RUN42, character RUN47), instead
of replaying the higher-twist budget of character RUN48 at this caller.
Both routes obtain |W[l^r]| <= l^(r*(h-1)) with h the base Selmer
dimension, conditional on their respective number-field premises.
This splice uses k with |SelL(l,L)| <= l^(k+1) explicitly; it does not
silently identify SelL with a differently normalized cohomology group.
The native SelL consists of virtual units with valuation divisible by
l away from l, not necessarily at l. The prime-level normalization
PrimeDescent49 is still a premise. Prefer the shorter native pCount
route for shared replay; preserve RUN48 as an alternative.

Fix the same L,l,c,E,b,k,P (E>=1), v=v_l(E), R=r2(L).
Require arbitrarily late canonical layers with the SAME Lay,
cyclotomic lift and scaled Few bound B=l^((nu-2E)*R)*P. From
sCountRank49:
  |EqHom|*l^((nu+v)*R) <= B*l^((b+v)*k+c+v).
Cancel the common positive l^((nu-2E)*R) using nu>=2E, and take
the cofinal finite-subset consumer:
  l^shaInv * l^((2E+v)*R) <= P*l^((b+v)*k+c+v).
No higher-level Kummer/twisted inflation-restriction budget on every
late D is needed, and nu>=b+v is no longer required by this caller
(sCountRank49 uses native pCount for any b+v). Do not infer that
other consumers of higher cohomology can be removed. The actual
scaled Few and uniform quantitative P/k estimates remain to be
supplied at sNum / ShaK and same-host VWin. No root obligation closed.

Sources read this run, upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474:
ClassCounting/SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
ClassCounting/SelmerOrderCounts/SelInvLe.lean 9c5062ff121f83f2062f66e5a3ed349179c1c748
ClassCounting/SelmerOrderCounts/SelLCard.lean 7c6df1894c807c8e54cb3dc9a75acf7c1d52ee9f
ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
ClassCounting/NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2.
Peer exact blobs: audit/RUN49_PRIME_DESCENT_ALL_TORSION_LEVELS.lean
f3cf9cdd1beaee34ea9f7d9a322121637675652f (4072e556); character RUN47 029599fd53244a8531d508b42b17281f693cf49e
(17b56ded); character RUN48 3b391ce31bdc9812f382d4c60fe15ee90e7bf36e (0cfcd0a6f);
structure RUN42 65c60d883c8892e751ed258ab286df3557b31c3d. Stage audit file as
RHAuditPrimeDescent49.lean and structure file as RHStructureCofinal42.lean
with existing reduction engines; do not compile two competing higher
twist alternatives merely to check this one route. Check each import
and its native axiom output separately. Original sCount remains fallback.

Selected graph before: lemmaK_of_steps -> sNum -> SFew/SCount/SSha/SLayer/STors.
Prior candidate: shaLate47 -> jointLate47 -> sCountCapped46 + per-D
higher twisted budget + scaled Few -> shaCofinal42.
New candidate: shaPrime50 -> cofinalPrime50 -> sCountRank49 ->
rank49 -> PrimeDescent49 + selInj + pCount; plus CofinalFew50,
base SelL cardinality, cancellation and shaCofinal42. Keep all
original/shared type, value, constructor, and unexpanded nodes.
Cache key: source/toolchain/L/l/c/E/b/k/P/nu/zeta/gamma/lift/D and
actual caller. Backtrack to sCount/SSha if native replay fails.
No new accepted axioms; transitive axiom evidence for this candidate pending.

Read mission fb152e28 including 26 Nov acceleration sprint, SWARM,
HANDOFF, AGENTS, state/log/protocol/continuity openings, latest 35
commit index; relevant peer full sources read. Checked real published
status JSON for 45577239749 (b1c96f58), 45576756833 (7da35494),
45670987597 (0669c532): returncode 0; historical conditional roots
and engines only. Orchestrator 45768044722 successful, newer
45770483322 cancelled, 45770605854 in progress at read; none proves
this splice. Local command -v lean/lake/elan returned no paths.
Executed 21 V8 source identity/interface checks, including exact
copy of cancellation and removal of the specific late D premise.
No new numerical regression or native replay; no claimed PASS.
Shared replay owner: kernel lane, using existing registry job mechanism
(avoid duplicate builds); supply exact staging hashes and inspect actual CI.

Ready/blocked ledger for acceleration sprint:
- Queue 1: this direct caller replacement READY FOR REPLAY, blocked
  mathematically by PrimeDescent49, scaled primary Few, uniform P/k
  and native SLayer/ClInj verification. Do not count old higher twist
  as an independent mandatory leaf on this candidate.
- Queue 2: CountQ aggregation/parity peer 4d38e39e,d843aa72,7f45ab3c
  pending shared conjugation audit; CountPAlt quantitative supplier open.
- Queue 3: geometry 2ecd1489,f95e6528,9394212d pending identical
  lattice and unnormalized measure supplier; ASK-MAIN joint loss open.
- Queue 4: exceptional-scale transfer 3aadcd5e human conditional,
  no actual native same-family exceptional measure bound yet.
- Canonical G and conditional half-strip adapter retained.
New unconditional root-reachable discharges: 0. New native caller
substitutions verified: 0. Complete authenticated frontier unavailable;
no completion percentage or speed claim.

RESUME HERE: kernel lane replay sCountRank49 and this cofinal splice
in the single shared batch, record actual jobs and axiom/role scans;
math/audit prove PrimeDescent49 in native SelInvLe helpers, retain
scaled Few and uniform P/k. Integration only then substitutes in sNum,
rather than further scalar bound refinements.
HANDOFF TO: kernel, audit, math, character, prime, editor.
-/

noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain
open Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.LDataCardLeFinrank UpperTheory.V.ZK UpperTheory.V.KL UpperTheory.V.ZK.Ct

namespace RHIntegration50

theorem cancel_late50 (l ν d v R C P M c : ℕ) (hl : 0 < l)
    (hd : d ≤ ν)
    (h : C * (l ^ (ν+v)) ^ R ≤
      ((l ^ (ν-d)) ^ R * P) * M * l ^ (c+v)) :
    C * (l ^ (d+v)) ^ R ≤ P * M * l ^ (c+v) := by
  have he : ν+v = (ν-d)+(d+v) := by omega
  have heq : (l ^ (ν+v)) ^ R = (l ^ (ν-d)) ^ R * (l ^ (d+v)) ^ R := by
    rw [he, pow_add, mul_pow]
  rw [heq] at h
  have hP : 0 < (l ^ (ν-d)) ^ R := pow_pos (pow_pos hl _) _
  apply le_of_mul_le_mul_left _ hP
  calc _ = C * ((l ^ (ν-d)) ^ R * (l ^ (d+v)) ^ R) := by ring
    _ ≤ _ := h
    _ = _ := by ring

def CofinalFew50 (L : Type) [Field L] [NumberField L]
    (l c E b P : ℕ) [Fact l.Prime] : Prop :=
  ∀ N : ℕ, ∃ ν : ℕ, N ≤ ν ∧ 2*E ≤ ν ∧
    ∃ (ζ : (𝓞 (Kum.Fn L (AlgebraicClosure L) l ν))ˣ)
      (γ : Kum.Fn L (AlgebraicClosure L) l ν ≃ₐ[L] Kum.Fn L (AlgebraicClosure L) l ν),
      Lay l c ν ζ γ ∧ ∃ g : G L (AlgebraicClosure L),
      IsLift γ.toRingEquiv g.toRingEquiv ∧
      ((Kum.cycR L (AlgebraicClosure L) l ν g : (ZMod (l ^ ν))ˣ) : ZMod (l ^ ν)) =
        1 + (l : ZMod (l ^ ν)) ^ c ∧
      Few γ ((1+l^c)^E) (l^b) (l^ν)
        ((l^(ν-2*E))^nrComplexPlaces L * P)

theorem cofinalPrime50 (hNorm : RHAudit49.PrimeDescent49)
    (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c E b k P : ℕ) [Fact l.Prime] (hE : 1 ≤ E)
    (hBase : Nat.card (SelL l L) ≤ l^(k+1))
    (hFew : CofinalFew50 L l c E b P) :
    PositivityTheory.QuaternionShaBounds.CofinalBound42 L (AlgebraicClosure L) l c E
      (P * l^((b+E.factorization l)*k+c+E.factorization l) /
        (l^(2*E+E.factorization l))^nrComplexPlaces L) := by
  intro N
  obtain ⟨ν,hν,hνd,ζ,γ,hLay,g,hLift,hCyc,hF⟩ := hFew N
  have hl : l.Prime := Fact.out
  have hCount := UpperTheory.V.ZK.sCountRank49 hNorm L _ hTC l c ν E b
    ((l^(ν-2*E))^nrComplexPlaces L * P) k ζ γ hLay hE hF hBase
  have hCount' : Nat.card (EqHom γ ((1+l^c)^E) (l^ν)) *
      (l^(ν+E.factorization l))^nrComplexPlaces L ≤
      ((l^(ν-2*E))^nrComplexPlaces L * P) *
        l^((b+E.factorization l)*k) * l^(c+E.factorization l) := by
    simpa only [pow_add, mul_assoc] using hCount.2
  have hCancel := cancel_late50 l ν (2*E) (E.factorization l) (nrComplexPlaces L)
    (Nat.card (EqHom γ ((1+l^c)^E) (l^ν))) P
    (l^((b+E.factorization l)*k)) c hl.pos hνd hCount'
  refine ⟨ν,hν,γ,g,hLift,hCyc,hCount.1,?_⟩
  apply (Nat.le_div_iff_mul_le (pow_pos (pow_pos hl.pos _) _)).2
  simpa only [pow_add, mul_assoc] using hCancel

theorem shaPrime50 (hNorm : RHAudit49.PrimeDescent49)
    (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c E b k P : ℕ) [Fact l.Prime] (hTop : TopRoot l c L) (hE : 1 ≤ E)
    (hBase : Nat.card (SelL l L) ≤ l^(k+1))
    (hFew : CofinalFew50 L l c E b P) :
    ∃ s : ℕ, shaInv L l E = s ∧
      l^s * (l^(2*E+E.factorization l))^nrComplexPlaces L ≤
        P * l^((b+E.factorization l)*k+c+E.factorization l) := by
  have hl : l.Prime := Fact.out
  have hCof := cofinalPrime50 hNorm L hTC l c E b k P hE hBase hFew
  obtain ⟨s,hs,hBound⟩ := PositivityTheory.QuaternionShaBounds.shaCofinal42
    PositivityTheory.QuaternionShaBounds.ClInj_holds L l c E _ hTop hE hCof
  exact ⟨s,hs,(Nat.le_div_iff_mul_le (pow_pos (pow_pos hl.pos _) _)).1 hBound⟩

example (hNorm : RHAudit49.PrimeDescent49)
    (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c E b k P : ℕ) [Fact l.Prime] (hTop : TopRoot l c L) (hE : 1 ≤ E)
    (hBase : Nat.card (SelL l L) ≤ l^(k+1))
    (hFew : CofinalFew50 L l c E b P) :
    ∃ s : ℕ, shaInv L l E = s ∧
      l^s * (l^(2*E+E.factorization l))^nrComplexPlaces L ≤
        P * l^((b+E.factorization l)*k+c+E.factorization l) := by
  first
  | (rh_reduce 2 using [shaPrime50]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact shaPrime50 hNorm L hTC l c E b k P hTop hE hBase hFew

end RHIntegration50

rh_scan UpperTheory.V.ZK.sCountRank49 limit 2000
rh_scan RHIntegration50.cofinalPrime50 limit 2000
rh_scan RHIntegration50.shaPrime50 limit 2000
rh_prune RHIntegration50.cofinalPrime50 as RHIntegrationCofinalPrimePruned50
rh_prune RHIntegration50.shaPrime50 as RHIntegrationShaPrimePruned50
#print axioms RHIntegration50.cancel_late50
#print axioms RHIntegration50.cofinalPrime50
#print axioms RHIntegration50.shaPrime50
