import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
RUN60 — cyclic flag-volume and excess-dimension argument at actual A caller.
26 November 2026. Human source-matched derivation conditional on native root
lemma; independent audit and compact native replacement verification pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, completion first.
Read protocol, handoff, expansion, AGENTS, current manuscript and peer commits
through 6328abd9 (C reciprocity), editor c2c5b63c, A uniform assembly
452515bd and own RUN59 3347d944. Do not repeat deep-form cost or projector.

Source ledger (relative to grh-compact/src; exact bodies retrieved):
New/TwistedHecke/InterlacingCone.lean 23d3fd2c39ef5ee3c3ce7e908436b86cff7e2676
  det_interlacing_indicator, volume_inter_slab_eq_signed_sum,
  prod_mul_volume_inter_slab.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  index_borel_le, finrank_excessCond_le_volume,
  excessWeight_dotProduct_permStep, exists_mem_excessCone_mem_Icc,
  index_mul_finrank_excessCond_le.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  polyAction_X, excessWeight, excessCond, p_dvd_letterMatrix_of_mem_parahoric.
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
  root_lemma (retained explicit native input).
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  hasType_twisted_hecke, actual consumer.

1. Exact cyclic cone volume (unconditional real linear algebra).

Index letters cyclically, N>0, P>1, q=P^N, k variables per letter,
epsilon_j=+1 for even v(j), -1 otherwise (the volume identity itself
does not need alternating signs). For sigma=(sigma_j) in S_k^N let
L_sigma(nu)_(b,j)=epsilon_j(P nu_(b,j+1)-nu_(sigma_j(b),j)).
Write Sigma(D) for the native slab of nonnegative beta and degree
sum in [D_j-1,D_j] at each j. Let Omega be the cone for which
L_id nu in Omega iff nu in the native pieriCone.
Each L_sigma is invertible: a zero output gives successive nu
vectors of equal norms after multiplying by P, hence zero after
a full cycle. More precisely elimination of the first N-1 vectors
in P nu_(j+1)-A_j nu_j gives absolute determinant
    |det L_sigma| = |det(q I-A_(N-1)...A_0)|
                   = q^k Delta(sigma_cyc),
    Delta(tau)=prod_(cycles C of tau)(1-q^(-|C|)).
Indeed use the first N-1 output vectors and nu_0 as coordinates,
whose determinant has modulus P^(k(N-1)); the last output's
coefficient in nu_0 is P^(-(N-1))(q I-A_(N-1)...A_0).
The sign multiplications and cyclic ordering affect no absolute
determinant. The last formula is the characteristic polynomial
X^length-1 of each permutation cycle. All Delta>0.

For fixed nu with degree sums of L_id nu in the stipulated intervals,
the determinant expansion of the k-by-k indicator matrix at j, whose
entry (b,c) is 1 if epsilon_j(P nu_(b,j+1)-nu_(c,j))>0, counts the
allowed local bijections with sign. The product of these determinants
is the sum over sigma with L_sigma nu strictly positive of
sgn(sigma_cyc). Simultaneously sort each vector nu_j decreasingly.
The row/column signs from sorting cancel in the product around the
cycle. For decreasing vectors x,y the indicator matrix 1_(y_c<x_b)
has rows consisting of terminal strings of ones. Its determinant is
zero unless the starting positions are exactly 1,...,k in order
(zero row or repeated rows otherwise), when it is 1. Thus it is 1
exactly for x_1>y_1>=x_2>...>=x_k>y_k, and zero otherwise.
For epsilon_j positive use x=P nu_(j+1), y=nu_j; for negative
transpose the matrix and use x=nu_j, y=P nu_(j+1).
The product is therefore the indicator of the sorted interlacing
conditions: positivity of L_id on the sorted nu plus pieriCone.
Away from the finitely many coordinate-equality hyperplanes, there
is exactly one sorting permutation per letter. These walls and
the zero output-coordinate walls are Lebesgue null, since L_sigma
is invertible. (The native argument can keep weak inequalities
exactly.) Degree sums are unchanged by every letter permutation.

Integrate that indicator identity. The sorted side is a sum of
(k!)^N changes of variables, each with factor
1/(q^k Delta(id)), times vol(Omega intersect Sigma). The signed
side uses changes of variables L_sigma, each giving
sgn(sigma_cyc)/(q^k Delta(sigma_cyc)) times vol(Sigma). Each cyclic
product has exactly (k!)^(N-1) preimages. All domains are bounded
linear preimages of the bounded slab, so the integrals are finite.
Consequently the actual signed-sum lemma holds:
    vol(Omega intersect Sigma)
      = Delta(id)/k! * sum_tau sgn(tau)/Delta(tau) * vol(Sigma).
This is not an estimate of the individual signed summands.

To evaluate the signed coefficient, one may use the native one-letter
comparison directly: for N=1, epsilon=+1, step q, the corresponding
cone beta satisfies beta_b>=q beta_(b+1), beta_last>=0.
Let d_b=(q^(b+1)-1)/(q-1), b=0,...,k-1, and beta_k=0.
Set F(beta)_b=d_b(beta_b-q beta_(b+1)). This triangular linear
map has determinant prod_b d_b. Since d_b-q d_(b-1)=1
(with d_(-1)=0), it preserves the total degree sum. Its inverse
maps the nonnegative orthant onto the cone by backwards substitution,
and thus maps the slab onto the cone-slab intersection. The signed
coefficient depends ONLY on k,q; evaluating it by this N=1 change
of variables (e.g. slab D=1 of positive finite volume) yields exactly
    prod_b d_b * vol(Omega intersect Sigma(D))=vol(Sigma(D)).
This proves the two actual volume lemmas without an asymptotic error,
independent of the arithmetic root lemma and without a new URT premise.

2. Exact Frobenius amplification and the native flag injection.

Use the actual characteristic-p residue representation of W, the
Levi L for blocks r,k-r, r=a'=a+1, and its lower-Iwahori intersection
J. Choose right coset reps R of J in L, including 1. Write E for
excessCond n a a' 0 h. Let m=q^t, t positive. The coefficient
embedding of the residue field satisfies iota_s(x)^m=iota_s(x)
by the cyclic Frobenius congruence in characteristic p. Hence
substitution X -> X^m commutes with every polyAction g (coefficients
of F are not raised to m). For each vector u of residues in [0,m)
at the kN variables, pad it at coordinate a of each letter by
m(k-floor(sum_b u_(b,j)/m)), obtaining gamma(u). It is nonnegative,
gamma(u)=u mod m, with total degree per letter in [km,(k+1)m).
Define the linear map from E^(m^(kN)) to polynomials by
    (F_u) -> pF = sum_u X^gamma(u) F_u(X^m).
Disjoint monomial residues modulo m prove injectivity.
Take the coefficients of each g pF, g in R, at exponents alpha
such that alpha/m is in the padded excess cone intersect slab,
D=n+k+1. This is a linear map to a space of dimension
|R| times the number of such grid points.

If F is nonzero, choose a nonzero monomial of minimal weight
w(alpha)=sum_j epsilon_j sum_b b alpha_(b,j) among these translates
BEFORE restricting to the grid, and let g0 be its frame.
Every translate by L of g0 pF has weight at least w(alpha):
write the new frame as h g with h in J and g in R. Mod p a
lower-triangular h acts at even letters by a lower triangular
matrix and at odd letters by its inverse transpose (upper
triangular); both substitutions weakly increase the variable
weight epsilon_j b. This uses exactly the actual
p_dvd_letterMatrix_of_mem_parahoric and no norm estimate.
In characteristic p, w_native^2=p=0 implies w_native=0 in K.
Thus the native root_lemma at l=0, using the weight difference
1 in [0.4,1.6] and the nonzero selected coefficient, gives
excess <=0 for every adjacent root within either Levi block.
It does NOT give the bound at the crossing root.

For the crossing root, the nonzero coefficient of g0 pF must
come from at least one summand with exponent alpha=m delta+e,
where delta is in g0 F_u and e is in g0 X^gamma(u).
Homogeneity of the linear action gives sum_b e_(b,j) between
km and (k+1)m in every letter. By the defining E condition
excess(delta)<=h at the crossing. The positive excess coefficient
at any variable is at most 1, so the native crude estimate
excess(e)/m<=N(k+1) is valid. Thus alpha/m lies in
excessCone(r,h+N(k+1)) intersect slab(k,D).
Its selected coefficient is a nonzero coordinate of the map.
This proves injectivity of the coefficient map, not merely a
dimension estimate for one chosen vector. Divide the resulting
dimension inequality by m^(kN), let t->infinity. The bounded
closed convex polytope has null boundary (if lower dimensional,
the whole polytope is null), so its regular grid Riemann sums
converge to its Lebesgue volume. We obtain the exact native
finrank_excessCond_le_volume:
    dim E <= [L:J] vol(excessCone(r,h+N(k+1)) intersect slab(k,D)).
No finite regression or assertion of an RH-scale limit from samples.
The root lemma remains a required deep input to this argument.

3. Shift into the zero cone without losing the native size guard.

For nu define A_s=nu_(b,s)-nu_(b',s). The difference between the
root and opposite coordinates of beta=L_id nu is A_s-P A_(s+1),
for either parity. The positive excess weight at the distinguished
letter i is 1 (rather than 1/q), so the defining cyclic geometric
sum telescopes:
    excess_i(beta)=(1-1/q)(beta_(rootVar(b,b',i))-A_i).
This is the actual excessWeight_dotProduct_permStep identity.
In particular excessCone(r,0) is the Omega used in section 1.

Construct sigma=L_id nu with u_b=2 P^(2(r-1-b)) for b<r and
u_b=0 otherwise; nu_(b,j)=u_b on even letters and P u_b on odd.
Alternating parity gives sigma_even=(P^2-1)u, sigma_odd=0.
The recurrence u_b=P^2 u_(b+1)+2 1_(b+1=r) gives nonpositive
excess for all other adjacent roots, and at the crossing gives
-2(1-1/q) at even letters and at most -2P(1-1/q) at odd letters.
Both <=-1 since q>=P>=5. Also 0<=sigma_(b,j)<=P^(3r)
using r>=1 and 2 P^(2r)<=P^(3r). This proves the native
exists_mem_excessCone_mem_Icc. No random cone approximation.

Let H=h+N(k+1), positive at HeckeSizes, and translate by H sigma.
The original proof uses a slightly larger shift; H suffices
exactly because crossing slack is H. Translation preserves volume
and puts the padded cone inside the zero cone, while changing the
slab upper degree to D_j=n+k+1+H sum_b sigma_(b,j).
The original HeckeSizes guard
    H*k*P^(3r)+k+2 <= n/h
gives D_j<=n(1+1/h), with no new premise or changed parameters.

4. Integrate at the exact elementary-divisor consumer.

Over F_q, reduction GL_k(W)->GL_k(F_q) is onto (lift entries,
determinant is a unit); likewise the block diagonal Levi reduction
is onto. Its kernel lies in the appropriate parahoric. The index
[GL_k(W):parahoric]*[L:J] is at most the full flag count
prod_(b=0..k-1) d_b: block flags refined by flags inside each
block give full flags, or use the native inclusions and subgroup
index product. The full flag count follows by successive choice
of one-dimensional subspaces in quotients: (q^j-1)/(q-1) choices.
This also gives the native index_borel_le. Combine the exact
volume cancellation from section 1 with section 2 and translation:
    [GL:parahoric] dim E <= vol(slab(k,D_j)).
For D_j>=0 each single-letter slab has volume
(D_j^k-max(D_j-1,0)^k)/k!, at most D_j^(k-1)/(k-1)!
by integrating the derivative over an interval of length <=1.
The formula for simplex volume follows by iterated integration.
Thus the product slab bound is
    <= (n^(k-1)/(k-1)!)^N (1+1/h)^(N(k-1)).
By the original size guard, s=N(k-1)/h<=kappa/2<=1/2.
Using (1+1/h)^a<=exp(a/h) and exp(s)<=1/(1-s)<=1+2s
for 0<=s<=1/2 (power series comparison), this is at most
    (1+kappa) binom(n+k-1,k-1)^N,
using the exact product formula for the binomial coefficient.
This is the native index_mul_finrank_excessCond_le, with the same
r,n,N,h,kappa,z, not an altered type theorem.

Actual caller hasType_twisted_hecke uses U = this bound together
with U' = sum_finrank_deepForms_le from RUN59, plus exists_projector
(theta lane) and the two exists_depth_factorization witnesses.
Its pairing gives the residual count L and combines
m*L+|X||H_tensor|*(m*U+U') in its final linear combination.
This checkpoint supplies the flag-count branch, conditional on the
root lemma. It does not replace the root lemma, pairing, depth
factorizations, stage support or original witnesses. Do not claim
the entire Hecke type established from these two dimension bounds.
The dimension estimates feed the same native marked operator,
uniform index assembly 452515bd and eventual Theorem A local module.
Original graph edges retained: root_lemma -> amplification ->
excessCone bound -> flag-volume -> U -> hasType_twisted_hecke.
Reduced human graph groups real cone proof, shift and index algebra
into the explicit derivations above; root_lemma is still OPEN for
human audit. Original/reduced graph exports and axioms untouched.
No globally retired node. No separate prime hypothesis introduced.

Verification: actual shared state compute/rh-compact-primitives-replay-20261126/
status.json and outputs/targeted_results.json retrieved this run;
CI 45803534769 task status error, returncode 1, six native checks
with standard axioms, A JetExponentBound timeout 124 at 2700.11s.
Not a native verdict on this branch. Local lean/lake absent.
Old rh_scan/prune/reduce/auto/frontier engines belong to original
pin/toolchain, not run on this compact proof. Prepared targeted
probes and elementary margin certificate below; no new PASS,
synthetic benchmark, or unsupported deletion of premises.
Use shared compact runner, exact caller and axiom export.

RESUME HERE: independently audit section 2's least-weight root
lemma bridge, then reconstruct RootLemma.root_lemma (or a proved
characteristic-p specialization with all-frame premise) and both
exists_depth_factorization / of_pairing at hasType_twisted_hecke.
Merge the unconditional cone-volume proof and conditional flag
dimension into A immediately, retaining exact native hypotheses.
HANDOFF TO theta, integration, audit, kernel. Full human RH proof
remains incomplete.
-/

namespace AccelerationRun60

theorem shift_degree_guard (n h H k D S B : ℝ)
    (hh : 0 < h) (hH : 0 ≤ H) (hS : S ≤ k * B)
    (hD : D ≤ n + k + 1) (hbig : H * (k * B) + k + 2 ≤ n / h) :
    D + H * S ≤ n + n / h := by
  have hm := mul_le_mul_of_nonneg_left hS hH
  linarith

theorem crossing_margin (q : ℝ) (hq : 5 ≤ q) :
    -2 * (1 - 1/q) ≤ -1 := by
  have hpos : 0 < q := by linarith
  have h : 1/q ≤ 1/2 := (div_le_iff₀ hpos).2 (by linarith)
  linarith

end AccelerationRun60

#check det_interlacing_indicator
#check volume_inter_slab_eq_signed_sum
#check prod_mul_volume_inter_slab
#check TwistingData.root_lemma
#check TwistingData.finrank_excessCond_le_volume
#check TwistingData.excessWeight_dotProduct_permStep
#check TwistingData.exists_mem_excessCone_mem_Icc
#check TwistingData.index_mul_finrank_excessCond_le
#check TwistingData.hasType_twisted_hecke
#print axioms AccelerationRun60.shift_degree_guard
#print axioms AccelerationRun60.crossing_margin
#print axioms volume_inter_slab_eq_signed_sum
#print axioms prod_mul_volume_inter_slab
#print axioms TwistingData.root_lemma
#print axioms TwistingData.finrank_excessCond_le_volume
#print axioms TwistingData.index_mul_finrank_excessCond_le
#print axioms TwistingData.hasType_twisted_hecke
