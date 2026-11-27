import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN77 — separate the projector scale from the two actual count guards
27 November 2026. SOURCE-MATCHED human conditional replacement, independent
audit of kernel RUN51, scalar Lean certificates PREPARED, not compiled.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
HEAD observed unchanged. Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained; latest observed HEAD
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc; no migration.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission a69122b6ad568910a45d2bc13961ab9da4855143, including mandatory
engine, read; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES
and continuity checked. Manuscript 619ae01be98c32e053eef1c8bcd44ccddd0664e7.
Continue RUN76 d12d3e65. Latest peer fced7763 (kernel RUN51) already
reduces the multinomial scalar, 19a5089a audits the actual marked orbit,
and kernel RUN50 blob a9ccecea43549583b056afe79b9271e58eb92a3b supplies
one determinant. Do not rediscover them. RUN57 60c7643e and RUN58 give
the actual count proofs. This run checks whether the old size guard
can genuinely be dropped in BOTH count arguments and the full local
HasType assembly, not merely at the projector.

Sources relative to grh-compact/src:
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  lines 49–115 finrank_excessCond_le_volume, 131–145 shift, 163–166
  HeckeSizes, 173–203 index_mul_finrank_excessCond_le, 210–233
  sum_finrank_deepForms_le.
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
  sum_deepIndicator, exists_le_weight_of_mem_deepForms (21–92).
New/TwistedHecke/ClassMeans.lean b0cc77bf52f463d3c62d755b43030f964d32f8cf
  exists_invariant_diagonal_form, exists_mean.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  exists_projector (153–208), hasType_twisted_hecke (217–261).
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547.

## 1. Exact weaker local theorem

Retain the same native T, O, residue field, parity, n,k,N=2ell, r,
class representatives, f, Y and hY of hasType_twisted_hecke. Here write
F0=o0*N for the scalar exponent parameter, P=p^o0, and
E_old=N*(k+k^2)*F0, E_new=N*(k+k^2-2)*(F0-1), c'=2*E_new+2.
By the actual T and k>=2 we have F0>=1.

Replace the seventh HeckeSizes conjunct 6*(2*E_old+2)+2 <= y by
    6*c'+2 <= y.
Keep the other conjuncts except the last z guard, which can be
weakened to
    Z_exact := N*n/(2*k) * (2*r/P + (k-2*r)/P^(2*r)) <= z.
All the quotients here are real, including k-2*r (nonnegative by
2r<=k). The output is the SAME original HasType at truncation m,
with coefficient (z+kappa*m+y) times card X*card I.
This is a mathematical local replacement under the retained
native representation, root, count and pairing foundations; the
existing native HeckeSizes type is not changed.

## 2. First count: no old projector guard is used

Inspect the actual finrank_excessCond_le_volume statement: its
inputs are CharP, the adjacent root, n and h. There is NO HeckeSizes
or scalar normalization input. Its finite-field packing/root
argument (RUN58) is unaffected by p-adic scale. Keep that theorem
and all its foundations. Put h=y, M=choose(n+k-1,k-1).
Use the actual shift sigma in the zero cone with exceptional root
<=-1 and coordinates in [0,P^(3r)]. The shorter shift
tau=(y+N*(k+1))*sigma is sufficient for this very volume theorem
(its slab upper endpoint is n+k+1). Thus for each letter s,
    D_s = n+k+1+sum_b tau(b,s)
        <= n+k+1+(y+N*(k+1))*k*P^(3r)
        <= n+n/y.
Only the existing slab guard
(y+N*(k+1))*k*P^(3r)+k+2 <= n/y is used. It implies n>0.
Translation preserves volume; after translating into the zero
cone, multiply by the parahoric and Levi indices, bounded by
the full flag number. The exact cyclic flag identity of RUN57
cancels the entire flag number, including its q dependence.
Each slab of width 1 has volume <= D_s^(k-1)/(k-1)! by integration
of the simplex slices. Since M>=n^(k-1)/(k-1)!,
    index(parahoric)*dim excessCond(y)
      <= M^N*(1+1/y)^(N*(k-1))
      <= M^N*exp(N*(k-1)/y)
      <= M^N*(1+kappa).
Last inequality: t=N*(k-1)/y<=kappa/2<=1/2 by the retained
2*(N+2)*k/y<=kappa<=1. On [0,1/2], exp(t)<=1+2t by convexity
and exp(1/2)<2. This proof uses neither old nor new projector
guard, nor the z guard, nor a native compiled replacement of
HeckeSizes. The shorter shift and volume proof are prior RUN57;
new result is precise independence from the old size conjunct.

## 3. Second count: the last guard itself can be weakened

The actual DeepFormCost theorem requires only 2r<=k and 2r<N,
besides T, characteristic p and all-translates deepForms
membership. Derive 2r<N without any projector scale:
the retained slab guard, y>=1 and k>=2 give P^(3r)<=n;
the degree guard N*n*k*(ell+2)+n+k<P^ell gives n<P^ell.
P>1 implies 3r<ell and N=2ell. No y lower bound from the
projector occurs in this implication.

For each depth d restrict to the monomial coefficients of cost
C(beta)>=d. Injectivity is EXACTLY the deepForms weight-detection
theorem, not inferred from average depth. Thus for every natural
cutoff M0, summing dimensions before bounding gives
    sum_{d<M0} dim V_d <= sum_beta min(M0,1+floor C(beta))
                     <= M^N*(1+mean C).
Symmetry of the k row entries at fixed per-letter degree n
gives mean n/k. Alternating parity means each row is deep
in exactly N/2 letters. Sum the weights 1/P on the first 2r
rows and P^(-2r) on the remaining k-2r rows. Hence mean C is
EXACTLY Z_exact, not the larger native upper bound.
Both sides nonnegative, M0=0 allowed. The weakened z guard
therefore suffices. Retain the actual rational-function
interpolation/vanishing input of DeepFormCost; no new proof of
it in this run. The earlier RUN57 computed this exact mean,
but kept the old guard. This is its actual logical deletion.

## 4. Independent audit of RUN51 scale and exact consumption

The new common p-power must be built INSIDE the invariant
diagonal form (not divided out of an arbitrary mean). For each
degree d0<p^F0, Legendre's factorial differences cancel to
floor(sum of s remainders / p^j), j=1..F0-1. Each is <=s-1.
The p-free factor of the multinomial is a unit in the native
valuation ring, so q_alpha = p^((s-1)*(F0-1))/multinomial(alpha)
is integral. Transposition of contingency tables gives the
same coefficient equality at this scale. High-degree q is
zero; cross-degree coefficients vanish. This is agreement with
RUN51, not a new scale discovery. The invariant trace on the
generated selected-weight module uses the SAME support module
and trace covariance, irrespective of this normalization.
Its selected monomial trace cancels the multinomial exactly.
The letter factor with s=k and mean factor with s=k^2 combine
to E_new, preserving the original two strict threshold fields
and transpose identity. No unit inverse of the diagonal B
is needed. Retain the native Frobenius coefficients and all
Levi/transpose covariance and finite-field density premises.

At the actual ElementaryDivisors caller take c' for both
depth factorizations and the projector. The new guard implies
2*c' <= y-(4*c'+2). Since w^2=p, the pairing scalar is
a=p^E_new=w^(c'-2), and aw=w^(c'-1).
The projector error modulo w^c' implies the needed error
modulo aw. Conversely dividing the EXACT equality
Qu-Mv=aw F by its nonzero common factor in the ideal sense
gives w|F in each of the required residual coordinates
when the left side is in (w^c'). No division in the residue
field. Keep the all-translates condition on F. This audits
the actual exponent and the lower threshold in RUN51.

Let n0=card X*card I, with I identified using the actual J and
H factors. First count bounds the residue dimension in
of_pairing by (1+kappa)*n0 (the coset and H factors are the
same as in the native caller). Hence its exceptional count
l<=kappa*n0. The two depth determinants each have w-power
budget <=(1+z)*n0 by the second count; w^2=p converts their
COMBINED cost to (1+z)*n0 in p-exponents. The pairing adds
E_new*n0 + m*l. As E_new+1<=y from the NEW guard, the total
is <=(z+kappa*m+y)*n0. No change to image f, Y, the module,
the actual quantifier on m, or the mapping of IndexDvd witnesses.
The determinant and count arguments are human substitutions,
not proof that the existing Lean declaration automatically
accepts a new HeckeSizes type. The marked prime caller already
supplies the stronger original conditions; no new global
gain/loss or prime-window inequality is claimed.

Original local graph: full HeckeSizes -> both Counting lemmas
and projector -> of_pairing + depth factorization -> HasType
-> Columns.hasType_markOperator -> LocalStatement -> short_forms.
Candidate human graph: slab/flag-only guard -> excess count;
2r<=k,2r<N and exact mean -> depth count; new scalar guard
-> projector/pairing; same output. The old scalar guard has
no surviving use in this local human replacement. Original
native graph and axiom evidence untouched. No global retirement.
Context key includes pin, T,O,W,p,k,N,n,r,ell,y,kappa,z, all
class mean cutoff/supports, same class reps/J/f/Y, and both
depth matrices, c', residual witnesses. Do not cache a proof
across changed contexts.

## 5. Executed exact strictness check, not synthetic RH data

The following generic parameter check only distinguishes the two
abstract sets of guards, NOT an instance of the actual marked data
or a test of RH. Python 3 stdlib executed locally:
    from fractions import Fraction as F
    k,r,N,L,p,d=2,1,60,30,5,1
    P=p**d; f=d*N
    old=N*(k+k*k)*f; new=N*(k+k*k-2)*(f-1)
    y=6*(2*new+2)+2
    n=y*((y+N*(k+1))*k*P**(3*r)+k+2)
    kap=F(2*(N+2)*k,y)
    z=F(N*n,2*k)*(F(2*r,P)+F(k-2*r,P**(2*r)))
    assert 0<r and 2*r<=k and kap<=1 and y>=1 and 2*L==N
    assert N*n*k*(L+2)+n+k<P**L
    assert 6*(2*new+2)+2<=y<6*(2*old+2)+2
    assert (y+N*(k+1))*k*P**(3*r)+k+2<=F(n,y)
    assert z<=N*n*(F(1,P**(2*r))+F(r*r,k*P))
Output (exit 0): n=7227038798736, y=169934, old_guard=259214,
new_guard=169934, kappa=124/84967, z=43362232792416.
Here exact z is STRICTLY below the original coarse guard, since
k=2,r=1 and P=5 make the omitted 1/P^2 term positive.
This establishes strict weakening at the scalar interface;
no finite diagnostic replaces the mathematical argument.

Local command -v lean/lake/elan returned none. No native
rh_scan/prune/reduce/auto/frontier or new Lean execution.
Re-read actual CI run 45803534769, state branch
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named B/C checks
only propext, Classical.choice, Quot.sound; A module build timeout
124 at 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
Old native engine passes do not certify these compact replacements.
No new native PASS or global axiom claim. All unresolved A/B/C
and prime-window obligations retained. No URT.

RESUME HERE: integration/editor and independent audit attach this
precise weaker guard split to RUN51 and RUN57 at the actual local
HasType caller. Do not reopen its original count constants unless
a discrepancy is found. Keep the stronger original guard for the
main argument until independent replay. Next prime task: actual
chosen-level/standard-data residual foundation from manuscript,
or a direct prime-window estimate that genuinely closes a leaf.
HANDOFF TO kernel, theta, integration, editor, formal audit.
-/

namespace CompactPrimeRun77

theorem slab_endpoint (n y k N P3 T : ℝ) (hy : 0 < y)
    (ht : T ≤ (y+N*(k+1))*k*P3)
    (hs : (y+N*(k+1))*k*P3+k+2 ≤ n/y) :
    n+k+1+T ≤ n+n/y := by linarith

theorem cone_exp_argument (N k y kap : ℝ)
    (hN : 0 ≤ N) (hk : 0 ≤ k) (hy : 0 < y)
    (h : 2*(N+2)*k/y ≤ kap) :
    N*(k-1)/y ≤ kap/2 := by
  apply (le_div_iff₀ (by norm_num : (0:ℝ)<2)).2
  have h' : N*(k-1) ≤ (N+2)*k := by nlinarith
  calc
    (N*(k-1)/y)*2 ≤ ((N+2)*k/y)*2 :=
      mul_le_mul_of_nonneg_right (div_le_div_of_nonneg_right h' hy.le) (by norm_num)
    _ = 2*(N+2)*k/y := by ring
    _ ≤ kap := h

theorem new_guard_consumption (e y : ℝ) (he : 0 ≤ e)
    (h : 6*(2*e+2)+2 ≤ y) :
    2*(2*e+2) ≤ y-(4*(2*e+2)+2) ∧ e+1 ≤ y := by
  constructor <;> linarith

theorem exact_combined_cost (z kap m y e n l : ℝ)
    (hm : 0 ≤ m) (hn : 0 ≤ n)
    (hl : l ≤ kap*n) (he : e+1 ≤ y) :
    (1+z)*n+e*n+m*l ≤ (z+kap*m+y)*n := by
  have h1 := mul_le_mul_of_nonneg_left hl hm
  have h2 := mul_le_mul_of_nonneg_right he hn
  nlinarith

#print axioms slab_endpoint
#print axioms cone_exp_argument
#print axioms new_guard_consumption
#print axioms exact_combined_cost
end CompactPrimeRun77

#check TwistingData.finrank_excessCond_le_volume
#check TwistingData.exists_le_weight_of_mem_deepForms
#check TwistingData.index_mul_finrank_excessCond_le
#check TwistingData.sum_finrank_deepForms_le
#check TwistingData.hasType_twisted_hecke
#check Columns.hasType_markOperator
#print axioms TwistingData.hasType_twisted_hecke
