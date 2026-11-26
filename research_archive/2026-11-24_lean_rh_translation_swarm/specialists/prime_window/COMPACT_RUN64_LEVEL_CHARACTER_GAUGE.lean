import New.Columns.TwistedHeckeType
import Mathlib.Tactic

/-!
RUN64, 26 Nov 2026 — actual level-N character and gauge supplier.
Human derivation / source matched; no native replay of this file.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; read updated
completion-first priority and legacy reduction engine, AGENTS, swarm,
queue, expansion and latest manuscript. Continuation of RUN63 6843df9f.
Peers checked: theta 11b88ad1 (chain height/gain), kernel ea889f2b
(Schur dual bound), acceleration 5a6ce275 (marked charge), integration
a31e63855 (global theta), 10d4fd45 (theta dimension), editor 1090f031
(chart). Do not duplicate marked-p or archimedean work.

Native source ledger (relative grh-compact/src):
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  norm_detCharAt_diagN_le 31-41; name_lastColDatum_mem_raises 46-74;
  chain₂_pairTranslates_eq_smul_chain 82-106; gaugeLe_Bmu_at_N 113-135.
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7
  lastRowDatum_conj_u₀ 161-165; compUpTo_pairs_eq_smul 233-255;
  detCharAt 358; pairWeilFinite_name 430-436; detCharAt_inclGL
  441-445; norm_detCharAt_diagN_anti 451-455; diagN_eq_sdiff_mul
  460-461; translateSum_eq_sum_name 479-521.
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
  charUnramifiedAt_rankTwist_of_N_mem 171-174; spaceChar_rankTwist
  178-180; atPlaces_conj_mem_mirabolic 97-101; GaugeLe.restrictToY_of_diag
  20-33; exists_indexDvd_fourierOp_pow 128-169.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
  liftKernel 40-44, translateDatum 52-53.
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
  isAdmissibleComb_name 19-39, standardData 59-60.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
  finHeisOp_mem_standardData 31-36, mem_raises_of_standardData 137-143.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  IsGoodDatum 275-279, gaugeLe_chain 324-335.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  rank bound 161, n_mono 199. New/Data/Weights.lean
  8749d68da003347685ca36817b32cafda51a3a6a w_le_two_mul_b 40-41.

1. Exact rank-normalized character, BEFORE norms.
Write P=nonInducedPlaces, S=piPlaces, n_j=rank X_j, and
D_j=diagN at P intersect S, V_j=diagN at P minus S,
T_j=D_j V_j, U_j=T_j^-1. All denote matrices on the appropriate
stage, embedded at P when acting adelically. Let chi_j be
(chainChar ϑ (j+1)).baseChange. Both rank twists in the actual
liftKernel have the SAME chi_j as their spaceChar, by the even-rank
spaceChar_rankTwist identity. Put C_j(r,g)=detCharAt chi_j r g,
A_j(g)=C_j(n_(j+1),g), B_j(k)=C_j(n_j,k).
Here A_j and B_j are characters on source and target matrices,
respectively; their numerical rank parameters are opposite the
matrix ranks. Do not confuse A_j with RUN63's abstract lift map.

Let W_j(g,k) be the actual finite Weil action and N_j[f] the
operator naming f at P on the fixed translated vacuum v_j.
NamesAtSplitLevel 430 gives exactly
 W_j(g,k) N_j[f] = A_j(g)^(-1) B_j(k) N_j[f(k^-1 Z g)].
The normalization is detCharAt chi r g = product_w chi_w(det g_w)
|det g_w|_w^(-r/2). For integral invertible g, det is a local unit,
the absolute-value factor is one, and the native character is
unramified at N: the twist's level is prime to N, neither chosen
prime lies over N, and the tame part is trivial there. Thus A_j
and B_j are 1 on the respective integral groups, not merely of
norm 1. Rank monotonicity on T follows directly: at each w
the ratio for r' >= r is N^((r'-r)/2), whose embedded norm is
N^(-(r'-r)/2) <= 1 (square to avoid a choice of square root).
So ||C_j(r',T)||/||C_j(r,T)|| <= 1. The ratio is independent
of chi_j; no lower bound for a character value is needed.
For D_j,V_j,T_j separately the native weight identity
hasWeight_liftChar.norm_padic_eq_prod, applied to the supported
unitary element with conjugate inverse component, gives the
rank-zero norm bounded by N^(2fb): each of the f embeddings
contributes either 1 or N to a weight bounded by 2b (or its
inverse, which also obeys that upper bound). The norm of the
rank factor is <=1 for any nonnegative rank. This is exactly
norm_detCharAt_diagN_le 31-41 with i=j+1<=2m; retain that
weight identity as an upstream character-construction input.

2. Actual paired-chain scalar and LiftLaw.
Set L_j[f] = lift of W_j(D_j,D_(j+1)) N_j[f].
Use R_j for the unshifted smooth right action and
rho_j(g)=R_j(D_j g D_j^-1). Let b_y,c_y,e_row be the native
last-column, character and last-row residue functions. For
integral a,b, conjugation by the shifts reduces equivariance to
W_j(a,b), whose characters are exactly one by section 1.
This gives the integral rule of LiftLaw.

For the diagonal rule, U_(j+1)^-1 Z U_j sends the last-row
condition to the last-column condition (block multiplication:
last column divided by N, last row multiplied by N, bottom-right
unchanged; the congruence imposes exactly the missing integrality).
The diagonal shifts commute, so the named-row datum transformed by
W_j(U_j,U_(j+1)) equals the named-column datum times
 gamma_j = A_j(U_j)^(-1) B_j(U_(j+1))
         = C_j(n_(j+1),T_j)/C_j(n_j,T_(j+1)).
Lift equivariance gives rho_(j+1)(U_(j+1)) L_j[e_row] phi
= gamma_j L_j[b_e] rho_j(U_j) phi. Since T_j and T_(j+1)
have the SAME determinant at every w, section 1 proves
 ||gamma_j||_N <= 1 EXACTLY; bounding numerator and inverse
separately would destroy the required budget.

The translateSum_eq_sum_name identity is applicable with both
split-level systems P,S, on the SAME pair of projected data.
For clarity, evaluate its two tensor factors at matrices Z,R.
At w in P intersect S, the unscaled entries are integral;
the last column of Z may have denominator N, and exactly one
y is NZ_col mod N. The remaining character is the phase at
the dot product R_row * NZ_col. At w in P minus S the
roles of translation and character are interchanged by the
conjugate place: R_row may have denominator N, and the unique
residue is NR_row mod N; the phase uses NR_row * Z_col.
The right side has the unique z=(Z D)_col mod N and character
of (V R)_row dot z. At each place these two products agree
modulo N, and outside the stated integrality support both
sides vanish. The idempotent supports partition the same
conjugate pairs; the native psiN is psi0(-residueOverN),
so congruence modulo N preserves the phase, including the
minus sign. This proves the scalar evaluation identity;
separating point evaluations on the finite function tensor
span give the tensor identity. The finite name/Schrodinger
and projection identities in lines 487-495 are retained.

For j=2i the two unshifted named factors are
 N_j[b_y(Z D_j)] =
  A_j(D_j) W_j(1,D_(j+1)^-1) W_j(D_j,D_(j+1)) N_j[b_y],
 N_(j+1)[c_y(V_(j+2) Z)] =
  B_(j+1)(V_(j+2)) W_(j+1)(D_(j+1)^-1,U_(j+2))
   W_(j+1)(D_(j+1),D_(j+2)) N_(j+1)[c_y].
These identities follow from the character law in section 1;
the middle R_(j+1)(D_(j+1)^-1) cancels by lift equivariance,
and the final R_(j+2)(U_(j+2)) equals the shifted rho action
because the diagonals commute. Thus the actual paired scalar is
 d_i = A_(2i)(D_(2i)) B_(2i+1)(V_(2i+2)).
Its norm is <=N^(4fb). Apply RUN63's proved abstract transfer
with SAME ramified phi and same witnesses. Its scalar is
 t = product_(i<q) [ d_i o_i product_(l<2i+2) gamma_l ],
 q=varrho+1, m=2q, o_i=number of nonzero residue vectors at
every component. Each o_i is an integer, hence ||o_i||<=1.
Since ||gamma_l||<=1, ||t||<=N^(4fb q)=N^(2mfb).
The scalar depends on D,ϑ and the named characters alone,
not on v_j or phi. This supplies the native common existential
and its universal scope in chain₂_pairTranslates_eq_smul_chain.
No inverse of o_i, no choice of t per datum, no extra m^2
loss from the repeated gamma factors.

3. Actual last-column datum gauge supplier.
At N let O be the p-adic valuation ring pulled back to C.
Use the integral a in O_K selected in TwistedHeckeType 50-55:
q(a)=0 at the induced prime and q(star a*d) !=0. Equivalently
one can take a by CRT at the two distinct split primes of K
above N, zero at the induced one and one at the other; the
infinite-place embeddings in the CM type are Gal(E/K), so
the conjugate residue of a vanishes at every w in P, and
star a is a unit under iota_N. N is prime to d by N_modEq_one.
In particular ||iota(star a*d)||=1. Keep the actual CM-type
and distinct-prime hypotheses, not CRT at a nonsplit prime.

Take the squarefree modulus M=product_(w in P) w, conjugate
disjoint. Its residue ring R is product F_N. For H=matrix
coordinate set of size h=n_j n_(j+1), the last-column
indicator f on R^H is 0/1. Fourier inversion for the
primitive character psi' of R says
 f(Z)=1/|R|^h sum_(u,v in R^H)
       f(u) psi'(-u dot v) psi'(Z dot v).
This follows from the sum over v: it is |R|^h when Z=u
and zero otherwise (translate by a vector with nontrivial
character in any nonzero component). Every coefficient after
multiplying by |R|^h is an algebraic integer, and the native
larger denominator L=absNorm((N))^h=N^(2fh) is a multiple
of |R|^h since #P<=f. Naming each character is a Heisenberg
translate of the SAME projected vacuum at M (name_char_eq_
translate_projOn, NameModulus.lean 182-187, blob
f382771e76b0624e7b10d523ce9d854737be00ec). The lift of its
translation is supported on bar P and is integral after
multiplication by a because a lies in every prime in bar P;
only a single power N occurs in its denominator. This is
the direct specialization of isAdmissibleComb_name with q=1,
g=N, d=star a, and no archimedean size condition. The
projection of translateDatum x onto P is either zero or a
unit-phase translate of the integral vacuum with translation
supported off P union bar P (Space.projOn_finHeisOp on the
integral vacuum, exact box condition in native 65-68).
That support is disjoint from all primes above N, so it is
standardData at a. Adding the character translations
preserves standardData, by the Heisenberg composition law
and the valuation-ring unit phase. Therefore
 L * N_j[b_e](translateDatum x j) belongs to standardData(a)
for EVERY x, without assuming x itself integral at N.

Apply mem_raises_of_standardData with c=star piG, delta=a.
Its cost is (||iota(c)||/||iota(star a*d)||)^boxes <=1,
because piG is integral and the denominator is a unit.
After division by L the cost is <=N^(2fh)<=N^(fb):
n_j,n_(j+1)<=n_m and 2 n_m^2<=b by the actual magnitude
guard (native 73-74; n_m<=exp(5.5 log x+12), b=exp(logB),
scale guard logB dominating 11 log x+24+log 2).
This proves name_lastColDatum_mem_raises with all x,j<m,
subject to the native CM jet standardData theorem and named
projection/character identities. No archimedean bound on
the number of Fourier terms, no pointwise prime cancellation.

4. The actual chain caller, rather than a new sufficient budget.
Let t_j = W_j(D_j,D_(j+1)) composed with N_j[b_e].
For a,b in the actual column levels, their conjugates under
D_j,D_(j+1) lie in the integral mirabolic groups (RUN63).
At P the transformed function is b_e(B Z A), where A fixes
e modulo N and B^-1 fixes e modulo N. Integral invertibility
preserves the support in both directions and
 B Z A e=e iff Z e=e (mod N).
The supported character factors of A and B are one.
The pairWeil_name_of_mem identity handles the other finite
components using the same vacuum and levelOf_le_Kf; it
therefore proves the required commutation on the actual
translated data, NOT commutation on every arbitrary datum
without the level hypotheses. Under W_j(D_j,D_(j+1)), the
unshifted raises(1,1) bound becomes raises(D_j,D_(j+1))
by the definition of the gauge and lift equivariance:
replace the two evaluation arguments by their right shifts.
This is the native use of Kernel.ω_ω in 120.

For H:IsGoodDatum, r:ramifiedColumns and F^q phi integral
at D_0, use H.gaugeLe_chain with these commuting t_j.
Twist level prime to N (H and actual twist data), so
the coefficients of H are integral. Finite ultrametric
sums and m stages give cost N^(mfb). The exact H.chain_at_N
uses the SAME t from section 2 for every supported x.
Multiply by ||t||<=N^(2mfb) and restrict to Y via
GaugeLe.restrictToY_of_diag (retained branching map and
diagonal weights). This gives
 GaugeLe 1 N^(3mfb) (Bmu ϑ Ψ phi).
Together with RUN63's scalar consumer beta<1-4mfb,
this gives integrality of N^(-beta)Bmu on the Fourier
pullback lattice. The index supplier's remaining full
class-wise gauge transport, LiftCharacters 136-150, is
NOT replaced here. Need connect it before declaring the
entire p=N branch of exists_indexDvd_Bmu_divisible closed.

Local graph (source, not elaborated): rankTwist/unramified/weight
+ pairWeil name -> gamma ratio and d_i -> common t via RUN63
-> chain_at_N; residue Fourier + projected standardData +
jet raises -> commuting modified chain -> gaugeLe_Bmu_at_N
-> level-N integral consumer -> short_forms. Other branch:
integralAbove reps + shifted class gauge -> Fourier index
-> SAME integral consumer. Keep unresolved named finite Weil
and CM jet inputs, full class transport, other A norm and B/C
suppliers. No deletion from global graph. Cache key includes
source pin, D,ϑ,N, P,S, ranks, same embedding and translated
data. No URT experiment, no synthetic tests.

Execution: lean/lake/elan absent from PATH (actual shell).
Native rh_scan/prune/reduce/auto/frontier not run on compact.
Existing old-pin CI is not evidence for the replacements.
Compact actual CI receipt reread from state branch:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804; run 45803534769,
all_requested_checks_ok=false, module_1_build returncode 124
after 2700.11s, six other original theorem checks with the
three standard axioms, full_RH_replay=false. No fresh native
PASS. Small scalar certificate below and exact native checks
prepared (unexecuted) for shared compact runner.

RESUME HERE: integrate common scalar/gauge argument into A
with RUN63 and peer jet/finite-Weil results. Next discharge
the exact class-wise shifted gauge transport in LiftCharacters
136-150 using exists_mul_mem_integralAbove and the actual
localLevel gauge identity; prove that the SAME determinant
pullback supplies the needed lattice, audit orientation of
D,V,U and all character phases. HANDOFF TO theta, integration,
editor, kernel, independent audit. Human reconstruction incomplete.
-/

namespace CompactPrimeRun64

theorem scalar_pair_budget (a b o g R : ℝ)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (ho : 0 ≤ o) (hg : 0 ≤ g)
    (hR : 0 ≤ R) (haR : a ≤ R) (hbR : b ≤ R)
    (ho1 : o ≤ 1) (hg1 : g ≤ 1) :
    a*b*o*g ≤ R^2 := by
  have h1 : a*b ≤ R*R := mul_le_mul haR hbR hb hR
  have h2 : o*g ≤ 1*1 := mul_le_mul ho1 hg1 hg (by norm_num)
  calc
    a*b*o*g = (a*b)*(o*g) := by ring
    _ ≤ (R*R)*(1*1) := mul_le_mul h1 h2 (mul_nonneg ho hg) (mul_nonneg hR hR)
    _ = R^2 := by ring

theorem total_exponent (m q f b : ℝ) (h : m = 2*q) :
    4*f*b*q + m*f*b = 3*m*f*b := by rw [h]; ring

#print axioms scalar_pair_budget
#print axioms total_exponent
end CompactPrimeRun64

#check IsSplitLevel.pairWeilFinite_name
#check IsSplitLevel.detCharAt_inclGL
#check IsSplitLevel.norm_detCharAt_diagN_anti
#check IsSplitLevel.translateSum_eq_sum_name
#check Data.norm_detCharAt_diagN_le
#check Data.name_lastColDatum_mem_raises
#check Data.chain₂_pairTranslates_eq_smul_chain
#check Data.gaugeLe_Bmu_at_N
#print axioms Data.name_lastColDatum_mem_raises
#print axioms Data.chain₂_pairTranslates_eq_smul_chain
#print axioms Data.gaugeLe_Bmu_at_N
