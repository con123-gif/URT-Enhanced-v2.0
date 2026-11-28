# Spectral filling reduction — interactive source-matched human derivation
28 November 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude for the original proof; Cornelius Lytollis / ChatGPT for this alternative presentation. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. Status: HUMAN DERIVATION from the existing sharp moment suppliers, not a new native replay, B3 closure, independent RH proof, or originality claim. Do not substitute this for accepted native evidence without exact caller audit.

## Sources and precise target
- [Moments.lean, lines 298–345](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/Moments.lean#L298-L345), blob ec2cb964ede0d5eeae41a077dc6dbfface9c0444, Fits.exists_translate_finrank_comap_le.
- Same file: re_trace_besselS_le (40–43), energy_fixingSet_le (105–107), energy_compl_besselS_le (189–191), sum_le_of_positive_type (226–229), sum_norm_amplitudeSum_le (262–264).
- [FillingTheorem.lean](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/FillingTheorem.lean), blob 801448ae9b895babd0d69dc4f7967d86eb006e76; retain ramifyingOp_finrank_comap_and_short and native scale guards.
- Setup.lean mainEnergy = columnDim²/(besselDegree * mass); SchurTest.lean energy definition; OneDeterminant.lean finrank_sub_le_re_inner_dyadSum is the existing terminal rank lemma. The original source already describes a tight-frame interpretation. This proposal replaces its terminal rank conversion, not the arithmetic estimates.

## 1. Three native inputs, no new arithmetic premise
Let v=columnDim>0, e=b^-4, and let T be the normalized map P=t•Q of Moments.lean (t chosen to make the matrix entries in hu exactly amplitudeSum/unipCovolume). Write U_s=ρ(s), T_s=U_s T, and R=ρ(piTensorElem g) the orthogonal central projection with commuting factor projections R_i (i=0,1). Let d=rank R and D0=|G|*besselDegree*mass. Source hypothesis hD is d≤D0. Work in finite dimensional complex Hilbert spaces.
 
(i) ||T* T-I||_1≤e v, where ||·||_1 is trace norm: amplitudeSum_besselS_one supplies the identity part and sum_norm_amplitudeSum_le with identity central idempotent supplies the sum of Euclidean column norms of the error (the trace norm of a sum of rank-one columns is at most that sum). This is the bound used at lines 320–327; the matrix is self-adjoint so row and column norms agree.

(ii) tr[T*(I-R)T]≤4e v. Each complementary central projection has trace contribution ≤2e v by re_trace_besselS_le and sum_norm_amplitudeSum_le, exactly hb' at lines 317–318; the diagonal trace is bounded by the sum of Euclidean row norms. Since R=R_0 R_1, I-R≤(I-R_0)+(I-R_1). No independent choice of projectors. R commutes with each U_s.

(iii) Define Θ(s)=||T* U_s T||_HS². By hu this is the normalized amplitude energy over {s}, with the original coordinate identification. Its sums over Ω are the native energy over Ω. It is nonnegative and positive type: with K=TT*, let u_s=U_s K U_s*, then tr(u_a* u_b)=Θ(a^-1 b). Apply sum_le_of_positive_type with empty fixer set to obtain Σ_s Θ(s)≤(1+9e)v²/(besselDegree*mass). Thus for M=E_s U_s K U_s*, tr(M²)=E_s Θ(s)≤(1+9e)v²/D0. This is exactly the same sharp moment supplier used at lines 328–337; it retains the hard fixing-set/sieve and complement estimates. No assumption of equidistribution or irreducibility.

## 2. Spectral clipping and rank certificate
Let K_c=min(K,I) by spectral calculus. It satisfies 0≤K_c≤K, K_c≤I and range(K_c)=range(T). If the eigenvalues of T*T are μ_j≥0 (including all v zero eigenvalues), tr K_c=Σ_j min(μ_j,1)≥v-||T*T-I||_1≥(1-e)v. Put
    C=E_s R U_s K_c U_s* R,
as an operator on W=range R. Then 0≤C≤RMR on W, and
    tr C = tr K_c - tr[(I-R)K_c] ≥ (1-5e)v.
Here centrality of R removes dependence on s, and 0≤K_c≤K bounds the lost trace by input (ii). In particular d>0 and d≥(1-5e)v, since C≤I_W. This avoids dividing by zero in the proof of spread.

Trace of square is monotone on positive operators in finite dimensions: 0≤A≤B implies tr B²-tr A²=tr[(B-A)(B+A)]≥0. Also ||RMR||_HS≤||M||_HS. Hence tr C²≤(1+9e)v²/D0≤(1+9e)v²/d.
Writing a=v/d>0 gives
    tr(C-aI_W)² ≤ (1+9e)v²/d - 2a(1-5e)v + d a² = 19e v²/d.

Let P_s be the orthogonal projector in W onto range(R U_s T). The positive contraction R U_s K_c U_s*R has range contained in that subspace, so is ≤P_s. For Qbar=E_s P_s we have Qbar≥C.
For each eigenvalue x≥0 of C,
    (a/2-x)_+ ≤ (x-a)²/(2a)
(the difference when x≤a/2 is x²/(2a); otherwise trivial).
Therefore tr[(a/2 I-C)_+]≤(19/2)e v.
For any orthogonal projector J of rank r in W,
    tr(J Qbar)≥tr(J C)≥ar/2-(19/2)e v.
In fact the same spectral deficit bound holds for Qbar, by the variational identity tr X_+=max_{0≤J≤I}tr(JX), since Qbar≥C. The identity follows by diagonalizing X; no operator-monotonicity of the positive-part map is required.

Given a subspace F of W let J project onto F^perp, r=d-dim F. For each s, tr(JP_s)≤rank(JP_s)=rank(J R U_s T): the trace is the squared HS norm of JP_s and its singular values are ≤1. Some s attains at least the mean, so
    rank(J R U_s T) ≥ v/2*(r/d-19e).
Rank-nullity gives dim preimage(F)≤v/2*(1+dim F/d+19e).
This is the exact original Fits spread bound, with 19/2, not a weaker asymptotic. The nonzero normalization t does not change ranges. Keep the native coordinate/ramifying transport in FillingTheorem.lean (its rank loss is at most #univ*v/(N-1)); use the original native arithmetic inequality to recover b^-2 for the actual projected ramified maps. Do not assume this error is zero.

## 3. Possible simplification of the subsequent greedy selection
For native ramified spread with η=b^-2 the deficit recurrence is r_next≤(1-v/(2d))r+ηv when selecting a new translate while r>4ηd. The preceding d≥(1-5e)v gives 0<v/(2d)<1 at native b≥1000. Thus, until reaching the target, r_j≤2ηd+(1-v/(2d))^j(1-2η)d. In particular j=ceil[(2d/v) log((1-2η)/(2η))] suffices by 1-u≤exp(-u). Total selected cost ≤2d log((1-2η)/(2η))+v, bounded by the original 5d log(1+b²) with ample slack (native b≥1000 and v≤d/(1-5e)<2d). This is an optional simpler terminal counting argument, conditional on the same native spread. No improvement of the main RH asymptotic is claimed.

## 4. What changed and what did not
The original sharp arithmetic estimates give an averaged projection spectral deficit certificate of exactly (19/2)b^-4 v, not an assumed new spectral bound. This packages the terminal rank argument and yields a global spectral diagnostic. All B3 estimates (sharp fixing-set moment, complement energy, central trace and original mass bound), B4 transport, and A/C remain. The original proof already uses a second moment/tight-frame idea; this is an alternate finite-dimensional argument and stronger operator formulation, not a claim of novel arithmetic. It may or may not be shorter in Lean given matrix functional calculus.
 
A possible next attack is to use M commuting with ρ(G) and R to decompose into representation multiplicity blocks, and obtain input (iii) directly by an arithmetic estimate on those blocks, bypassing individual geometric energy configurations. Schur's lemma alone does NOT force M scalar when multiple irreducible types or multiplicity spaces occur. No such bypass is proved.

RESUME HERE: independently audit inputs (i)–(iii) against the original normalized amplitude and two central factors, then prepare the exact original Fits statement bridge using spectral clipping, if it is simpler than the existing dyad proof. Retain accepted B2/B3 receipts and all arithmetic suppliers; do not restart expensive builds or claim root closure. For a substantive B3 reduction, target the sharp energy input (iii) itself, not a repeat proof of this terminal rank conversion. HANDOFF to integration / positivity / URT / kernel.
