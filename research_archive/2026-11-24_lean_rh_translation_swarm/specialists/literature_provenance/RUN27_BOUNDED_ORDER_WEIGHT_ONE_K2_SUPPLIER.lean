import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.Counts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN27 | 25 Nov 2026 | literature provenance / lane 9
STATUS: human deduction from published theorems, source-matched to CountI.
Local arithmetic checks executed; native certificate PREPARED, NOT compiled.
No claim of RH, complete CountI, or global root dependency deletion.

RESULT: for principal hosts, weight e=1, any FIXED a>=1, the complete
all-prime, full-length contribution from characters of order <=2^a
has an unconditional polynomial bound, uniformly in the dyadic host height.
This supplies the previously missing quantitative input on this block,
not just residual vanishing. No new conjectural premise.

Let E=h.ex>=2, q=h.q1, d=h.d, N=2^(E+2)qd, and let
K_E=Q(zeta_(2^(E+2)))^+(sqrt(-q),sqrt(-d)).
As in RUN25/26 and the principal-host peer construction, q,d are distinct
odd primes congruent to 3 mod 4, Gal(K_E/Q)=C_(2^E) x C2 x C2.
Keep the actual h.chi modulus-one, h.Big t, 1<t, auxiliary prime
conditions, l notin Bchi, and every native CaseI and coefficient condition.
Fix a independently of E,q,d,t. Set b=min(a,E), F=K_b (the corresponding
subfield, not a claim that b=1 is itself an admissible native Host).
The exponent-2^a quotient is exactly Gal(F/Q); consequently every selected
character of order <=2^a factors through F, and the odd parity block has
2^(b+1) characters over a splitting coefficient ring.

For any finite set L of native CaseI primes at e=1, the quantitative
supplier is

 sum_{l in L} log(l) sum_{psi in h.X(c_l,1), ord(psi)<=2^a} Vn(O_l,1,psi)
 <= log |K_2(O_F) tensor Z[1/(6 w_F)]|
 <= C(D_b) |disc(F)|^2 (log |disc(F)|)^(D_b-1)
 <= N^(C_a),

where D_b=2^(b+2), w_F=#roots of unity in F. All selected Vlen are finite.

PROOF:
1. All odd l in CaseI at e=1 satisfy l>=5, since l-1 does not divide 2.
The character order and [F:Q] are powers of two. Apply the exact native
V=V' identification vLe under its nonzero/order/open kernel premises.
2. Apply the RUN25 cohomological argument now to F rather than K_E:
prime-to-degree inflation-restriction globally AND at each local
decomposition/inertia subgroup preserves the strict conditions in both
directions. The inverse character twist selects the psi-eigenspace of
the untwisted strict Selmer group for Q_l/Z_l(-1) over F. Integral
orthogonal character idempotents exist over each O_l for its O_l-valued
characters; absent splitting take only the selected direct summands.
Finite free extension of scalars preserves the local kernels. The
normalized length Vn cancels the ramification factor eO exactly.
3. Poitou-Tate duality identifies the strict Selmer dual with the etale
wild kernel, a subgroup of H^2(O_F[1/l], Z_l(2)); the odd-primary
Quillen-Lichtenbaum comparison identifies the latter with the l-primary
K_2 group after inverting l. Localization at l does not change the
l-primary K_2 order: residue K_1 has order l^f-1 and residue K_2 is zero.
Only the upper bound, not equality with the wild kernel, is needed.
K_2(O_F) is finite. Thus sum over distinct characters is bounded by
v_l(|K_2(O_F)|), and unique factorization aggregates ALL l in L before
any numerical bound. This includes full l-power lengths, not just rank.
4. No l>=5 divides w_F: inertia at such l in F/Q has order at most 2
(the dyadic factor unramified; q,d distinct so at most one quadratic
factor ramifies). If zeta_l lay in F then inertia would have order
divisible by l-1, impossible. Hence inverting 6 w_F loses none of the
selected primes, including those equal to q or d.
5. Emery 2014, Theorem 1.3, applies to every totally imaginary field of
fixed even degree D_b. F has conductor dividing N; the abelian
conductor-discriminant formula gives |disc(F)|<=N^D_b. For fixed a there
are only finitely many D_b<=2^(a+2). Absorb the degree-dependent constant
and logarithmic factor into a single C_a, using N>=2. This is uniform
in E,q,d,t,L and coefficient DVRs, NOT uniform in a.
6. In particular a=1 includes four odd quadratic characters with
fields Q(sqrt(-q)), Q(sqrt(-2q)), Q(sqrt(-d)), Q(sqrt(-2d)).
Using each quadratic field separately and the same restriction proof
gives the sharper bound
  65 C(2) [q^2 log(8q) + d^2 log(8d)]
since absolute discriminants are q,8q,d,8d. No factor depending on E.
The whole weight-one principal-host CountI contribution is therefore
bounded for any fixed upper bound on E. For unbounded E this only
removes the fixed-order block from the unresolved quantitative frontier.

EXTERNAL ASSUMPTION LEDGER:
- Vincent Emery, Torsion homology of arithmetic lattices and K_2 of
  imaginary fields, Math. Z. 277 (2014), 1155-1164,
  DOI https://doi.org/10.1007/s00209-014-1298-2 .
  Author version https://arxiv.org/pdf/1303.6132 , v2, p.2 Theorem 1.3
  (page visually inspected), proof sections 5-6. Published theorem,
  not a conjecture, not an axiom supplied by this Lean file. Constant
  depends on degree; small-prime exclusions explicitly handled above.
  Quadratic e=1 bound also restated in Emery 2024 equation (1.2),
  https://doi.org/10.1007/s00229-024-01598-4 .
- Classical inflation-restriction, local restriction, Poitou-Tate,
  Quillen-Lichtenbaum, finite K_2, Quillen localization,
  conductor-discriminant. See RUN25 proof and literature ledger.
  These are human external inputs, not asserted to be the actual
  dependencies of upstream proof terms. No RH/GRH or Vandiver assumed.
- Counts.CountI and CorG are proposition definitions, not proved
  assertions simply by being named. LinkedUnlE theorem has a proof
  body conditional on hH,hK,hKa,h3; vLe has a proof body. Do not
  classify the entire transitive closure from source names.
- Existing native CI artifacts independently fetched:
  45577239749 status pass 98.87s, conditional root only, axioms
  propext, Classical.choice, Quot.sound; 45576756833 status pass
  77.94s, rh_of_right scan visited 2000, pending 324. These certify
  earlier engine runs ONLY. No new native output or axiom audit here.

SOURCE / GRAPH:
Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Paths below relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/.
Pinned blob -> upstream a85077714ca7b298f69e48798497519ed5326a89 (25 Nov 09:29:19 UTC):
 HeightAndVanishing/Counts.lean
  0d9f87aacf2d53abe43d894c1d822f071599ee57 -> 0e0b736b7cc66f0516efeeb9583e8b46d3e425da
 HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean
  1feb420e376868ca41d85fb09bc4f8c7ee66778e -> 41ea99614c52f8920cdb5479198a1fadae8290f3
 CharacterLevelBounds/VLe.lean
  fe84b4080a340b9859c432e1e393bec5f75292bd -> 25b33306bfb1139d55a3d47eab0e0e4b28c746c1
 CharacterLevelBounds/ShaFamMono.lean
  f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e -> 4d0e3e330db74ef0aaaceb7086c8cd2740a568fa
 GaloisLibrary/SelmerTransport/ConjStableShaFam.lean
  578402a7b2aea9f24d31473aab4486dd43055fb2 -> 8106d4fbd95a9cee740901b60485e16814dba220
 ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean
  01ff1f8cd56f56488e044a35443a8eda3d5d0e3e -> 5e011319fe06f19583df55677bf0905c170e11e9
All six pinned blobs retrieved and matched; upstream changes kept
separate, no assumption of equivalent elaborated dependencies.
Original local source path:
 count_i_of_printed_bound_k_kato_automorphy
 -> U3.countI, U3.corGK, propGK_of_numberU3U_of_oneCharU
 -> numberU3U and oneCharU; latter uses Alg.M.main_holds and
 other suppliers. Shared root/frontier evidence from mission and
 peers retained; independent elaborated root reachability not checked.
Reduced local alternative:
 principal CountI, e=1 -> exact disjoint character partition
 -> low-order branch: vLe + restriction + K_2 + Emery bound
 -> high-order branch: OPEN, full length and uniform bound
 other e, CountII/V/Vs, 2-primary/minus, TopG, geometry, prime window OPEN.
No other use of any original theorem removed. No global graph deletion.
Cache key must include pin, principal host, e=1, fixed a, E,q,d,
prime, coefficient ring, local conditions and caller. Do not reuse
C_a as uniform in a. Backtrack to native cotangent route if higher
order or weight needs growing a. No URT assumption/benchmark.

CONTINUITY: latest mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0
including mandatory engine; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION_15_LANES, continuity, research-state excerpts read. Prior
RUN25 K-theory parity, RUN26 real field/Vandiver, peer RUN27 Galois
4cd96476797a3fa9963861498fd53a2a7489cab5 determinant cancellation and
recent peer commit list inspected. This is a distinct literature
supplier, not repeating determinant proof. No physics.

EXECUTED CHECK (Python 3, local, exact integer arithmetic):
from math import gcd,lcm,isqrt
n=0; blocks=0
for E in range(2,9):
 for a in range(1,E+3):
  b=min(a,E); cnt=0
  for j in range(2**E):
   for u in range(2):
    for v in range(2):
     order=lcm(2**E//gcd(j,2**E),2 if u or v else 1)
     assert (order<=2**a)==(j%(2**(E-b))==0)
     n+=1
     if (u+v)%2 and order<=2**a: cnt+=1
  assert cnt==2**(b+1);blocks+=1
primes=[p for p in range(3,200,2) if all(p%d for d in range(2,isqrt(p)+1))]
qchecks=0
for q in primes:
 if q%4!=3:continue
 for m,D in [(-q,q),(-2*q,8*q)]:
  assert abs(m if m%4==1 else 4*m)==D
  assert (16*q)%D==0
  qchecks+=1
for p in primes: assert ((2%(p-1))!=0)==(p>=5)
print(n,blocks,qchecks,len(primes))
Actual exit 0, 18400 49 48 45. Tests check character factorization,
parity, discriminants and numerical CaseI exclusion only, NOT class
groups, K-theory, or RH. Neither lean nor lake found locally.

NATIVE CERTIFICATE BELOW: exact split of native weighted sum, conditional
bridge retaining finiteness, and reducer commands. Requires pinned upstream
olean environment + prior engine modules on LEAN_PATH. Not compiled or queued;
no PASS for these declarations, no new axiom evidence. External K-theory
supplier remains a human proof, not hidden in an axiom declaration.
RESUME HERE: audit whether a uniform degree-dependent Emery constant and
conductor exponent can be improved via a per-character homology projection,
or prove high-order and higher-weight bounds using actual native cotangent
supplier; do not apply fixed-degree estimate with a growing a. Compile the
actual native bridge and inspect kernel axiom output before marking native.
HANDOFF TO: integration, Galois, formal audit, kernel extractor.
-/

noncomputable section
open UpperTheory.V.HV
open scoped BigOperators

namespace RHLiteratureRun27
variable (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]

def block (h : Host) (c : ∀ l : Nat.Primes, Coef l)
    (Ls : Finset Nat.Primes) (a : ℕ) (lo : Bool) : ℝ := by
  classical
  exact ∑ l ∈ Ls, Real.log (l : ℕ) * ∑ ψ ∈ h.X (c l) 1,
    if orderOf ψ ≤ 2^a then (if lo then Vn Ω (c l) 1 ψ else 0)
    else (if lo then 0 else Vn Ω (c l) 1 ψ)

theorem block_split (h : Host) (c : ∀ l : Nat.Primes, Coef l)
    (Ls : Finset Nat.Primes) (a : ℕ) :
    block Ω h c Ls a true + block Ω h c Ls a false =
      ∑ l ∈ Ls, Real.log (l : ℕ) * ∑ ψ ∈ h.X (c l) 1, Vn Ω (c l) 1 ψ := by
  classical
  unfold block
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro l hl
  rw [← mul_add, ← Finset.sum_add_distrib]
  congr 1
  apply Finset.sum_congr rfl
  intro ψ hψ
  by_cases hp : orderOf ψ ≤ 2^a <;> simp [hp]

theorem bounded_order_bridge (h : Host) (c : ∀ l : Nat.Primes, Coef l)
    (Ls : Finset Nat.Primes) (a : ℕ) (B₀ B₁ B : ℝ)
    (hlo : ∀ l ∈ Ls, ∀ ψ ∈ h.X (c l) 1, orderOf ψ ≤ 2^a → Vlen Ω (c l) 1 ψ ≠ ⊤)
    (hhi : ∀ l ∈ Ls, ∀ ψ ∈ h.X (c l) 1, 2^a < orderOf ψ → Vlen Ω (c l) 1 ψ ≠ ⊤)
    (h0 : block Ω h c Ls a true ≤ B₀)
    (h1 : block Ω h c Ls a false ≤ B₁)
    (hs : B₀+B₁ ≤ B) :
    (∀ l ∈ Ls, ∀ ψ ∈ h.X (c l) 1, Vlen Ω (c l) 1 ψ ≠ ⊤) ∧
    (∑ l ∈ Ls, Real.log (l : ℕ) * ∑ ψ ∈ h.X (c l) 1, Vn Ω (c l) 1 ψ) ≤ B := by
  constructor
  · intro l hl ψ hp
    by_cases hle : orderOf ψ ≤ 2^a
    · exact hlo l hl ψ hp hle
    · exact hhi l hl ψ hp (lt_of_not_ge hle)
  · rw [← block_split Ω h c Ls a]
    exact (add_le_add h0 h1).trans hs

end RHLiteratureRun27

#print axioms RHLiteratureRun27.block_split
#print axioms RHLiteratureRun27.bounded_order_bridge
rh_scan RHLiteratureRun27.bounded_order_bridge limit 2000
rh_prune RHLiteratureRun27.bounded_order_bridge as RHLiteratureRun27.bounded_order_bridge_pruned
