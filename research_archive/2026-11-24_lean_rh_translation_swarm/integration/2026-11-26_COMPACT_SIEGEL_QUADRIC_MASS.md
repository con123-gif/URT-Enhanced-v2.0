# B quantitative Siegel quadric estimate: conductor orthogonality and off-place mass
26 November 2026. Direct continuation of 3b50a390 (finite orbital transport) and e3228b19 (coherent link energy). Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. Human derivation from named native measure/character and convergent-range Siegel-Weil inputs, not native replay or an independent proof of RH.

## 1. The actual finite Gaussian majorant

Let R=O_hat_E in the finite adeles, V=vol(R) in the source normalization, k=card κ, and C(1)=codifferent E 1 in the SELF-ADJOINT finite adeles with Haar mass 1. For self-adjoint b define
 I_b={u in R : ψ_f(b u v)=1 for every v in R}.
This is an open ideal: it is an additive subgroup, multiplication by elements of R preserves its condition, and it contains the open subgroup {u in R : b u in R}. Its index q_b=[R:I_b] is finite and positive by compactness of R. The character v→ψ_f(bv) determines b modulo C(1), and factors through R/I_b. For a fixed finite-index ideal I, there are at most [R:I] such characters, since the finite additive group R/I has precisely [R:I] complex characters. Hence the set of self-adjoint b with I_b=I is contained in at most q=[R:I] cosets of C(1), of total Haar mass ≤q. This is the native ideal-shell covering; it does not require disjointness of the larger covering shells.

Write
 G_b= integral_{w in R^k} ψ_f(b(Q(w)-Γ)/2) dw, Q(w)=sum_j bar(w_j)w_j.
The Γ phase has modulus one. Squaring the modulus and translating w→w+u on the compact additive group R^k yields
 |G_b|² = integral_{u in R^k} ψ_f(b Q(u)/2)
          [integral_{w in R^k} ψ_f(b ReHerm(u,w)) dw] du,
where ReHerm denotes (bar u·w+bar w·u)/2, with a possible conjugation/negative depending on the chosen translation. The source identity ψ_f_half identifies the cross-term character with ψ_f(b bar u·w) because b is self-adjoint. This is essential at dyadic places: do not cancel the integer 2 inside an integral quotient. The inner integral is V^k exactly when u∈I_b^k (conjugation preserves I_b), and is zero otherwise by character orthogonality. Consequently
 |G_b|²≤V^(2k) q_b^(-k),  |G_b|≤V^k q_b^(-k/2).
Multiplying by the shell measure ≤q_b and summing gives, whenever k≥2(μ+1),
 integral_selfAdj |G_b| db ≤ V^k sum_I [R:I]^(1-k/2)
                          ≤ V^k ζ_R(μ).
This reproduces TorusMajorant.lintegral_gauss_sum_le_idealZeta with its exact exponent. Countability and integrability follow from the finite ideal-zeta hypothesis; for q_b=1 all inequalities are valid. No use of RH or oscillation estimates at infinity.

The zeta guard is itself elementary. Finite-index ideals of R correspond to integral ideals of O_E with the same quotient index (the native under/map and quotient bijection). Hence ζ_R(s)=ζ_E(s) in the absolutely convergent region. The Euler product gives ζ_E(s)≤ζ(s)^[E:Q], since above each rational prime there are at most [E:Q] prime ideals and each norm is at least that prime. For s=u+v+4, u,v≥0, s≥4,
 log ζ(s)≤ζ(s)-1≤2^-s+integral_2^∞ t^-s dt≤2·2^-s.
If n[E:Q]≤2^v, then n log ζ_E(s)≤2^(-u-3). Since exp(a)≤1+2a for 0≤a≤1/2,
 ζ_R(s)^n≤1+2^(-u-2)≤1+2^-u.
This is a sufficient proof of the native idealZeta_intAdeles_pow_le. For Filling set n=ρ+1, use n[E:Q]≤2^(2ρ) and v=2ρ, u=n, so μ=3ρ+5 and ζ_R(μ)≤1+2^-n≤2. The actual k≥2(μ+1) follows from the native much stronger k≥1000(2ρ+2)^9. All constants are uniform in the finite places chosen later.

## 2. Exact Fourier inversion for the congruence slab

For M a positive integer let m=M^-1 in the finite adeles and C(M)={b self-adjoint : ψ_f(M b R)=1}. It is compact open, with finite positive measure. For a self-adjoint y, the character b↦ψ_f(b y/2) on C(M) is trivial iff m y∈R. Here the character restriction to the maximal real subfield and the trace-one identity are the native ψf_half / self-duality statements in FinitePlaceDensity.enorm_integral_codifferent. Explicitly writing b'=M b reduces the equivalence to C(1); the trace-one element converts annihilation of all self-adjoint tests to the full integral-adele condition. Retain that native self-duality, not an assumption that multiplication by 2 is an integral automorphism.

For any finite positive measure λ on the vector adeles and self-adjoint α, Fubini and compact-group orthogonality therefore give
 integral_{C(M)} integral_x ψ_f(b(Q(x)-α)/2) dλ(x) db
   = vol(C(M)) λ{x:m(Q(x)-α)∈R}.
The right side is nonnegative, so taking a modulus leaves equality. The interchange is absolute since the integrand is bounded by 1 on a finite product measure. This is the actual Fourier inversion lemma.

## 3. Off-T mass bound with all Haar constants

Let T be finite conjugation-stable, R_T=prod_{w∈T}O_w, A_T=prod E_w and s_T the native skew unit δ (notation δ^-1Γ identifies skew and self-adjoint elements). Normalize local additive Haar by R_T^k mass 1, and let ν be the native skew measure with integral skew elements mass 1. Fix self-adjoint β in the finite adeles. The restricted product decomposition separates T and its complement. In the off-place region require x_off integral and m(Q(x)_off-β_off) integral. This region is independent of the local coordinates, and its pushforward measure on A_T^k is v times local Haar, for one finite v≥0. Equivalently v is the global mass of G={x integral off T, m(Q(x)-β) integral off T} intersected with x_T∈R_T^k, by local volume normalization. This set is contained in R^k, hence v is finite. For arbitrary nonnegative measurable f on A_T^k and a∈A_T self-adjoint, we obtain exactly
 integral_{x integral off T, m(Q(x)-β-adeleOfLocal(a)) in R} f(x_T) dx
   =v integral_{y:m_T(Q(y)-β_T-a) in R_T} f(y) dy.
This is the actual factorization, not an independence assumption about the rational lattice points.

Put W_M={Γ skew : m_T δ^-1 Γ∈R_T}. For each x∈R^k in G, the Γ condition
 m_T(Q(x_T)+δ^-1 Γ)∈R_T
is a translate of W_M, of ν-measure ν(W_M). Its restriction to integral skew Γ still has full measure ν(W_M): indeed m=M^-1, so δ^-1 W_M is contained in M R_T, and the center -δ Q(x_T) is integral (native δ integral-unit conditions). Define α(Γ)=β-adeleOfLocal(δ^-1 Γ+β_T), so α_off=β_off and α_T=-δ^-1Γ. Integrate over integral skew Γ and x∈R^k; Tonelli and the preceding observation give
 v ν(W_M) ≤ integral_{Γ integral skew} vol{x∈R^k : m(Q(x)-α(Γ))∈R} dν.
For each Γ apply §2 with λ=Haar restricted to R^k, and bound the resulting finite Fourier integral over C(M) by the full absolute integral over self-adjoint b. Section 1 is uniform in α(Γ), and the integral skew domain has measure 1. Hence
 vol(C(M)) v ν(W_M) ≤ ζ_R(μ) V^k.                   (F)
This is precisely the quantitative mass_near_quadric_off_places_le factor, including the codifferent and skew-volume normalization. No factors depending on M or |T| remain.

## 4. Actual one-vector Siegel identity from classical convergent-range input

The deep external/native theorem here is Lib/SiegelWeil/Formula/SiegelWeilFormula.siegel_weil: for a split hermitian source of rank 2p and target rank k>2p, the mean of the theta series equals quotient mass times the sum of Lagrangian zero terms, absolutely summably in the operator norms. Use p=1, k≥3. This is a standard convergent-range Siegel-Weil input (the compact OneVector file explicitly cites Weil, Acta Math. 113 (1965), theorem 5, for one vector); we use its exact native statement and do not claim to have independently reconstructed the general theorem.

For the one-vector coefficient take the Gaussian exp(-sum_v Q_v(x)) at infinity and the actual nonnegative K-invariant compact locally constant finite test n(x). Average its theta series against the additive character ψ(-bβ/2) on the compact quotient of self-adjoint adeles by the real subfield. The native fundamental domain is Ω×C(1), with product measure of total mass |disc E|^-1/4 (the discriminant identity and codifferent normalization in OneVector). Orthogonality eliminates every rational x with Q(x)≠β. The Gaussian on surviving vectors is exp(-sum_v β_v). Dividing by quotient volume and this Gaussian leaves exactly the class sum of the finite test over vectors Q(x)=β. The K-invariance converts the target quotient integral to the same class sum and its total mass factor; native integral_quotMeasure_eq_classSum applies.

On the Siegel-Weil side the rational Lagrangian lines of the split plane are the distinguished opposite line and the graphs D'(a), a in the maximal real subfield, with slopes parametrized by a (native hermitian isotropy gives the slope self-adjoint, via the skew factor). The opposite line contributes zero to this positive β coefficient, since its zero term is supported on the zero source vector. The graph-line contributions are translates of the product of the real Gaussian Fourier integrals and the finite Fourier integral
 F(b)=integral_x n(x) ψ_f(b(Q(x)-β)/2) dx.
This follows from the actual rank-one Weil shear formula; the graph-line coordinate shift adds the rational slope to b. Unfold the sum over these translations of Ω×C(1) to all self-adjoint adeles. The absolute zero-term summability of the convergent-range theorem and compactness of the parameter domain justify interchanging the sum and integral (as in native OneVector hP). The real integral at each v is
 integral_R exp(2π i β_v t) [π/(1+2π i t)]^k dt
   =π^k β_v^(k-1) exp(-β_v)/(k-1)!.
Indeed the Fourier transform of 1_{x≥0} x^(k-1) exp(-x)/(k-1)! is (1+2π i t)^(-k), by the elementary Laplace integral; both functions are integrable for k≥2, so Fourier inversion applies. Cancel the Gaussian, with the same normalizing |disc E|^1/4. Thus the weighted class-sum count is
 C_β integral_selfAdj F(b) db,
 C_β=#Classes |disc E|^(1/4) prod_v [π^k β_v^(k-1)/(k-1)!].
Here use the exact native class-sum measure convention (classSum of 1). This reconstructs the one-vector specialization from the stated classical theorem, orthogonality, Weil shear, and the native class-sum/fundamental-domain normalizations. It is not a substitute for a proof of Siegel-Weil in general or of the native Weil representation construction. The native compact test ensures all these applications are in the convergent range; positivity alone is not a sufficient hypothesis.

## 5. Finish the actual quantitative local Siegel bound

Fix the exact finite list s of rational orbit points, with nonnegative weights c_z, and t∈E with |Φ_v(t)|>N at every archimedean place. Set β=(t bar t-N²)/N, totally positive, t_T=evalPlaces T t, π=the actual piBar at T with π barπ=N. Let Ψ be the nonnegative locally constant compact step minorant from the previous finite-system derivation, invariant under the native integral stabilizer H∩C. At each point tailVector(π,t_T,x_z) it is at least c_z. Use the finite test
 n(x)=1_{x integral off T} Ψ(tailVector(π,t_T,x_T)).
The native tailVector linear coordinates show this test has compact support: the T-vector x_T is in a compact projection of supp Ψ and the off-T part is integral. The same native tail-vector covariance and the column-level identity give K-invariance. The exact norm equation Q(x_z)=β follows from N Q(x_z)=t bar t-N². Thus the weighted sum S=sum_{z∈s}c_z is at most the full one-vector class-sum count C_β ∫F. If S=0 the desired assertion is automatic. Otherwise that count is positive and the native one-vector formula supplies integrability of F (nonzero integral); it also follows by its absolutely convergent unfolding. No sign claim about F pointwise.

Choose r0=(1+b^-6)/(1+2^-n)>1 by 2^-ρ≤b^-6. The compact open subgroups C(M), directed by divisibility of positive integers M, exhaust the self-adjoint finite adeles. For τ close to t_T put
 a(τ)=τ barτ/N-N-β_T,
which tends to zero at t_T. Dominated convergence with dominator |F| gives
 ∫_{C(M)} F(b) ψ_f(-b adeleOfLocal(a(τ))/2) db → ∫F
as M increases divisibly and τ→t_T jointly. Character continuity and exhaustion supply pointwise convergence, and the majorant is fixed. Therefore for all sufficiently large divisible M and all τ in a common neighborhood of t_T,
 S ≤ r0 C_β |∫_{C(M)} F(b) ψ_f(-b adeleOfLocal(a(τ))/2) db|.
The strict slack r0>1 makes this uniform assertion valid even if S equals the full count. Apply §2 and §3: the right side is
 r0 C_β vol(C(M)) v ∫_{y:m_T(Q(y)-(τ barτ/N-N))∈R_T}
                         Ψ(tailVector(π,t_T,y)) dy.
Since Ψ is invariant under some small additive lattice and tailVector is linear in τ,y, shrink the τ-neighborhood so Ψ(tailVector(π,t_T,y))=Ψ(tailVector(π,τ,y)) for ALL y. This is the exact uniform translation needed in FiniteSystem, not mere pointwise continuity.

Take L any sufficiently small compact open additive neighborhood of zero with t_T+L contained in that neighborhood. Integrate the above inequality in τ∈t_T+L, obtaining S vol(L) on the left. Use the native quadric disintegration of StandardLevel: tailVector has h(e,e)=Q(y)-τbarτ/N and h(z,e)=τ, and its linear change of coordinates has the modulus md(π). For any c exceeding
 I_L=∫_{quadric h(e,e)=-N} 1_{h(z,e)-t_T∈L} Ψ(e) d floorQuadric(e),
upper semicontinuity of the fibre integral at -N gives, for sufficiently small self-adjoint slabs U,
 ∫∫_{Q(y)-τbarτ/N+N∈U} 1_{τ∈t_T+L} Ψ(tailVector(π,τ,y)) dy dτ
 ≤md(π) ν{Γ:δ^-1Γ∈U} c.
This is exactly HyperbolicBasis.eventually_mass_near_quadric_le, with its native disintegration Jacobian and compact continuous test 1_{h(z,e)-t_T∈L}Ψ. The source supplies the continuous fibre disintegration; the inequality follows by taking a neighborhood where the fibre integral is ≤c and integrating over U. It is not an estimate using an arbitrary Euclidean measure on the quadric.

For each L,c choose M divisible enough that U=M R_T∩selfAdj lies in that neighborhood; this is possible since the congruence lattices are cofinal at zero in A_T. The integrated congruence condition above is precisely this slab U, and its skew measure is ν(W_M). By (F),
 S vol(L) ≤ r0 C_β md(π) ζ_R(μ) V^k c.
Let c decrease to I_L (if I_L infinite, desired bound is immediate) and use Ψ≤f. Since ζ_R(μ)≤1+2^-n, r0 ζ_R(μ)≤1+b^-6. Finally the native product formula for π barπ=N, with N^-1 integral off T, gives md(π)=N^-f. Then
 C_β md(π) V^k
 = #Classes |disc E|^(1/4) (π_math^k / [(k-1)! N^k])^f V^k
       * prod_v (|Φ_v(t)|²-N²)^(k-1)
 = #Classes siegelConst G_t.
Here π_math is the circle constant, not the finite idele. Thus we have the actual quantitative statement
 S vol(L) ≤ (1+b^-6) #Classes siegelConst G_t
     ∫_{quadric} 1_{h(z,e)-t_T∈L} f(e) d floorQuadric.
No unknown local mass constant remains. The choice M is after L,c; uniformity of the preceding neighborhood permits this order, so no circular choice. The argument covers the source clopen small-set version whenever integrals and the nonnegative minorant are defined; compact open L suffices for the exact packet caller.

## Status

This fills the finite Gaussian, ideal-zeta, Fourier slab and off-T factor arguments and connects them to the quantitative Siegel bound in the coherent link consumer, using the actual convergent-range Siegel-Weil and fibre disintegration inputs. The general Siegel-Weil formula, native character/self-duality, Weil shear and continuous disintegration are retained as mathematical prerequisites. They are not proved by the scalar cancellations above; exact literature matching is required if treating them as externally cited standard theorems. Other B primitives (real band limits, amplitude absolute convergence, gauge compactness, crude pair weights) remain open in the human reconstruction. No whole-proof completion, new kernel PASS, or claimed reduction of the original theorem's foundational axioms.

Source ledger at compact pin: Lib/SiegelWeil/Mass/TorusMajorant.lean 9228ab231ce49ed76c8548f2f06c74138e638b15; Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271; Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff; Lib/SiegelWeil/Formula/SiegelWeilFormula.lean 4277ff0a84d10e7e1f73516d9ff76505072899ea; New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4; FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727. RESUME: integrate with 3b50a390 and e3228b19, independently audit exact source normalization of one-vector coefficient, then derive real-place norm_floorForm_le / hasBandLimits_of_isCutBessel and crude pair weight. Do not optimize the already closed scalar constants.