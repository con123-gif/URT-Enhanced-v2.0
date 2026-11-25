import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.BchiFacts
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.CountI
import RUN36_INERTIA_SEPARATED_SINGLETON
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
AUDIT lane 10, 25 Nov 2026: the exceptional inertia-sign set in Galois
RUN36 is EMPTY on every actual native CaseI host, not just large q,d.
Status: exact human proof/source matched; Lean overlay PREPARED, not compiled.
RH OPEN. One contribution, no newly kernel-closed root obligation.

Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4, latest branch
read including mandatory engine and shared frontier. SWARM 4b77b161...,
HANDOFF bbc46df7..., AGENTS 8db0201..., RESEARCH_STATE and protocol/log
openings read. Peers a7ba9251 (dyadic aggregate), 2a39654b (K2 bound),
42529776 (CountQ dual), e9256be1 (Galois target), 9f9a5e0e (odd PT).
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

SOURCE LEDGER (all native paths relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
PrimeSetBoundDataOfPrimitiveChar.lean 52224122dd8f9deefef473151d716984f3e1f1ff
  PrimePair: q % 8 = 3, d % 16 = 7.
HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean
  1feb420e376868ca41d85fb09bc4f8c7ee66778e
  Host.pair, Host.host_q1_mod_four_eq_three, Host.d_mod, Host.mem_X.
HeightAndVanishing/HostIndex.lean ccc755aa50d8c7e732d74d5d6bd211f7d903c419
  hostIndex: prime divisors of N are 2, primes of q, q1, d.
HeightAndVanishing/BchiFacts.lean c96defe3b3c64107975bbc8a056d2d39cca9bfea
  for odd l outside Bchi, l does not divide q.
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
  GD.ine, GD.gen, CountI; GdOfHost.lean 8ab8e7e79a09e2d7f00292d525733fac8badfae2
  gdOfHost supplies these for every psi in the same actual h.X.
HeightAndVanishing/Cases.lean eaa06b3c40b9fd0ba585e0ee18ae3e551be465ba
  CaseI uses l outside Bchi and l-1 not dividing 2e.
HeightAndVanishing/HostComp.lean 2d9c083608be97d265cfd899214f7a4adf392ba2
  comp l psi = 1 if l does not divide N.
HeightAndVanishing/CompIne.lean 1fccdb32c84268d3197dc522ff99eaa6cee1f3e7
  local component on inertia.
UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674
  countI uses GD of every host character and per-kernel CorGK.
Peer e9256be152448d8555cdcd1fa526afbca09c6f3e
  specialists/galois_representations/RUN36_INERTIA_SEPARATED_SINGLETON.lean
  blob 5c2d724d425b09d8ab5b870081e045052a4b6421:
  same_sign_excludes_inverse, fourth_power_excludes_inverse, singleton_block_budget.

EDITOR BLOCK: RUN36 identified possible inverse collisions at
  E_e={l in {q1,d}: l-1 | 4e, l-1 does NOT divide 2e}.
But native Host.pair forces q1=3 mod 8 and d=7 mod 16, hence both
3 mod 4 (already native named theorems). For l=3 mod 4 write
l-1=2u with u odd. If l-1 divides 4e then u divides 2e; since
gcd(u,2)=1, u divides e, hence l-1 divides 2e, contradiction.
Thus E_e=empty at EVERY e and EVERY native host; no size restriction
q1,d>4e+1 and no principal-only assumption needed for this step.
For any actual odd CaseI l, if l divides h.N, hostIndex and bchiFacts
force l=q1 or d, so l-1 cannot divide 4e. On inertia choose the same
generator s as RUN36. a(s)^2=b(s)^2=cyc(s)^(2e), and a(s)^4 !=1.
The inverse alternative ab=1 is impossible by the fourth-power lemma.
If l does not divide N, comp l psi=comp l psi'=1, so the same-sign
lemma excludes inversion using GD.gen. In either case the trace
factorization gives a=b. Retain residual-root injectivity, restriction
to G_K, common residue field and trace transport needed to infer
psi=psi' from a=b; these have not been native-verified. Do NOT assume
the whole strengthened OneCharU_res35 supplier.

Conditional improvement at the actual peer singleton_block_budget:
take S=h.X c e in ONE block for all l, not two. Once the existing hsep
transport is proved, obtain sum_psi Vn <= 2 v_l(NN) at every eligible l.
The two-reference-prime patch then gives
  sum_l log(l) sum_psi Vn <= 2 log B
without any E_e-primary part, even when q1 or d <=4e+1. NN and B are
the same integers as RUN36; distinct reference-prime and coefficient
prime guards remain. The original CountI target is polynomial and
this is a constant-loss simplification, not a proof of CountI.

Original selected graph retained: CountI <- CorGK <- PropGK <-
NumberU3U_s, OneCharU_s, orbit budget. Peer candidate: residual trace
-> two local-sign blocks or one -> singleton_block_budget -> patched B.
New candidate: Host.pair + hostIndex + bchiFacts + CaseI -> E_e empty ->
one block + same residual trace/transport -> singleton_block_budget.
No global edge deletion or axiom promotion. Cache context:
pin, toolchain, h,N,q1,d,e,t,l,c,Omega,K,s,psi,psi', residue field,
same reference primes and witness integer. No URT ranking used.

Executed local Python exact regression (no actual field simulation):
from math import isqrt
P=[p for p in range(3,1000,2) if all(p%d for d in range(2,isqrt(p)+1))]
n=0; exceptions=[]
for l in P:
 for e in range(1,1001):
  if l%4==3:
   assert not (4*e%(l-1)==0 and 2*e%(l-1)!=0)
   n+=1
  elif 4*e%(l-1)==0 and 2*e%(l-1)!=0:
   exceptions.append((l,e))
print(n,len(exceptions),exceptions[0])
Actual output: 87000 1493 (5, 1).
Negative control l=5,e=1 really is exceptional for a generic host,
but is inadmissible as q1 or d. The finite regression is only a
guard; the divisibility proof covers all e,l. Earlier peer controls
are not errors as generic algebra, only outside native host domain.

Local command -v lean and lake returned no paths. Re-read actual
CI status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717, returncode 0; runs
45577239749/45576756833 verified baseline only. New overlay not
compiled or queued; no axiom result claimed. Preserve pending edges
and previous failures. Need actual caller hsep native check.

RESUME HERE: Galois/kernel compile RUN34-36 and this overlay with
existing warmed runner, then instantiate singleton_block_budget on
the entire h.X using the common-residue trace transport and the two
native inertia branches below. Drop E_e-primary surcharge only after
the actual caller check. Continue strengthened OneCharU and
NumberU3U suppliers, other CountI/II/V/Vs and same-host geometry
obligations; do not count this as RH closure.
HANDOFF TO Galois, integration, kernel, human editor.
Verdict: AGREE with generic inversion controls; DISAGREE that
native generator primes can lie in E_e; PARTIAL (human local theorem).
-/

open UpperTheory.V UpperTheory.V.HV
namespace RHAudit37

theorem two_cancel_of_mod_four_three (l e : ℕ) (hl : l % 4 = 3)
    (h4 : l - 1 ∣ 4 * e) : l - 1 ∣ 2 * e := by
  obtain ⟨k, hk⟩ := h4
  have hn : (l - 1) % 4 = 2 := by omega
  have hmod : ((l - 1) * k) % 4 = 0 := by rw [← hk]; omega
  have hm : ((l - 1) * k) % 4 = (2 * (k % 4)) % 4 := by
    rw [Nat.mul_mod, hn]
  rw [hm] at hmod
  have hke : k = 2 * (k / 2) := by omega
  refine ⟨k / 2, ?_⟩
  have hdouble : 2 * (2 * e) = 2 * ((l - 1) * (k / 2)) := by
    calc
      2 * (2 * e) = 4 * e := by ring
      _ = (l - 1) * k := hk
      _ = 2 * ((l - 1) * (k / 2)) := by
        conv_lhs => rw [hke]
        ring
  omega

theorem native_generator_not_exception (h : Host) (l e : ℕ)
    (hl : l = h.q1 ∨ l = h.d) (hgen : ¬ l - 1 ∣ 2 * e) :
    ¬ l - 1 ∣ 4 * e := by
  have hm : l % 4 = 3 := by
    rcases hl with rfl | rfl
    · exact h.host_q1_mod_four_eq_three
    · exact h.d_mod
  exact fun hd => hgen (two_cancel_of_mod_four_three l e hm hd)

theorem native_caseI_ramified_not_exception (h : Host) (t l e : ℕ)
    (hBig : h.Big t) (hp : l.Prime) (hl2 : l ≠ 2)
    (hI : h.CaseI l e) (hN : l ∣ h.N) :
    ¬ l - 1 ∣ 4 * e := by
  obtain ⟨_, _, _, _, _, hNp, _, _, _, _⟩ := hostIndex h
  have hq : ¬ l ∣ h.q :=
    ((bchiFacts h t hBig).2.2.2.2 l hp hl2 hI.1).2.2.1
  have hl : l = h.q1 ∨ l = h.d := by
    rcases (hNp l hp).mp hN with h2 | hq' | hq1 | hd
    · exact (hl2 h2).elim
    · exact (hq hq').elim
    · exact Or.inl hq1
    · exact Or.inr hd
  exact native_generator_not_exception h l e hl hI.2

/-- Inertia transport assumptions remain explicit; the host arithmetic
discharges the old two-block split for every actual CaseI prime. -/
theorem native_caseI_residual_injective {G k : Type*} [Group G] [Field k]
    (h : Host) (t l e : ℕ) (hBig : h.Big t) (hp : l.Prime)
    (hl2 : l ≠ 2) (hI : h.CaseI l e)
    (a b : G →* kˣ) (s : G)
    (ht : ∀ g, (a g : k) + ((a g : k)⁻¹) =
      (b g : k) + ((b g : k)⁻¹))
    (hs : a s ^ 2 = b s ^ 2) (h2 : a s ^ 2 ≠ 1)
    (h_unram : ¬ l ∣ h.N → a s = b s)
    (h_ord : (¬ l - 1 ∣ 4 * e) → a s ^ 4 ≠ 1) : a = b := by
  by_cases hN : l ∣ h.N
  · have h4 := native_caseI_ramified_not_exception h t l e hBig hp hl2 hI hN
    exact RHGalois36.fourth_power_excludes_inverse a b s ht hs (h_ord h4)
  · exact RHGalois36.same_sign_excludes_inverse a b s ht (h_unram hN) h2

end RHAudit37

rh_scan UpperTheory.V.U3.countI limit 2000
rh_scan RHAudit37.native_caseI_residual_injective limit 2000
#print axioms RHAudit37.two_cancel_of_mod_four_three
#print axioms RHAudit37.native_caseI_ramified_not_exception
#print axioms RHAudit37.native_caseI_residual_injective
rh_prune RHAudit37.native_caseI_residual_injective as RHAudit37Pruned
