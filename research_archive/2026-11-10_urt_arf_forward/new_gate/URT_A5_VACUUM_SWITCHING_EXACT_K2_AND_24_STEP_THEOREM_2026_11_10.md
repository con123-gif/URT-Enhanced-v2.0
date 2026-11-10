# Native URT hidden-4₅ A5 vacuum switching: exact second cumulant and 24-step variance

**10 November 2026. Status: new conditional source-level theorem, independently executed exact rational checks. NOT a physical ARF derivation.**

## Hypotheses and source provenance

Use the original five-Platonic 190-cochain nonlinear source, its archived exactly equivalent eight-harmonic icosahedral pullback, the native 64 six-bit URT histories and Q shift, and the hidden P5 rank-four projection. The original exact source code is `forward/URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py` and the five A4 singlets are in `new_gate/URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py`. The already established source autocorrelation of the hidden 4₅ vector s(h) is

`C5(d)=E[s(h0)·s(hd)]=(7, 7/40, -61/120, -1/24, -1/6, 0)` for d=0,…,5, and zero thereafter. These are original exact Q(sqrt5) source values, not physical pole residues.

The five oriented unit A4 singlets v_i form an A5-equivariant regular simplex in the hidden four-dimensional real space: Σ_i v_i=0, and (1/5)Σ_i v_i v_iᵀ=I₄/4. Set g_i(h)=v_i·s(h).

**New explicit conditional dynamical hypothesis:** independently of the URT history, the vacuum label i follows the A5-equivariant stochastic matrix `P_t=(1-t)I₅+(t/5)J₅`, with `0≤t≤5/4`. At t=0 it is a uniformly chosen frozen vacuum; at t=1 the vacuum is independently resampled uniformly at every time; at t=5/4 the chain has zero self-transition and uniform jumps to the other four vacua. All t>0 in this interval give irreducible mixing chains. **This is the complete A5-equivariant 5-state Markov family:** A5 acts 2-transitively on the five tetrahedral vacua, so a commuting transition matrix has one common diagonal and one common off-diagonal entry; stochasticity leaves exactly one free parameter. Positivity restricts it to 0≤t≤5/4. This family is NOT selected by the primitive π/φ/e recursion, the 24-clock, or the charged H13⊕H51 action.

## Theorem — exact source variance rate for every switching rate

Let `u=1-t`. The stationary centered additive source S_n=Σ_(k=0)^(n-1) g_(i_k)(h_k) has

`C(d)=E[g_(i0)(h0)g_(id)(hd)]=u^d C5(d)/4`.

Proof: `P_t^d=J/5+u^d(I-J/5)`. The J term vanishes **pointwise** because Σ_i g_i(h)=0. The remaining term is `u^d(1/5)Σ_i E[g_i(h0)g_i(hd)]`. The regular-simplex tight-frame identity makes this `u^d C5(d)/4`. The original Q chronology supplies the exact lag truncation.

Thus, with no fitting,

`K2(t)=lim_(n→∞) Var(S_n)/n = 7/4 + (7/80)u - (61/240)u² - (1/48)u³ - (1/12)u⁴`.

Exact special cases:

- Frozen uniformly selected vacuum `t=0`: `K2=71/48`, reproducing the archived five-vacuum quenched average.
- Independent uniform vacuum resampling `t=1`: `K2=7/4`.
- Half-mixing `t=1/2`: `K2=3307/1920`.\n- No self-transition `t=5/4`: `K2=1315/768`.

These **different exact answers** are all A5-invariant and use the same primitive history Q and native source. Therefore A5 invariance, Haar history, and the hidden source alone do not select a unique effective quadratic response. This is a precise nonuniqueness certificate; it does not falsify the Cathedral construction. A physically selected vacuum-transition law is still required.

For any finite open window of n histories,

`Var(S_n)=n*(7/4)+2 Σ_(d=1)^min(4,n−1) (n-d) u^d C5(d)/4`.

In particular, for 24 consecutive URT history steps,

`Var(S_24)=42+(161/80)u-(671/120)u²-(7/16)u³-(5/3)u⁴`.

Its values are `2179/60` (frozen), `79583/1920` (half-mixing), and `42` (iid). **This is an open 24-step history window, not a derivation of the cyclic 24-clock gauge response or holonomy.**

## Fourth-cumulant formula for independently resampled A5 vacua

For t=1, conditional on the entire URT history, the five-vacuum draws are independent and each scalar source has conditional mean zero. Define `m2(h)=(1/5)Σ_i g_i(h)^2=||s(h)||²/4` and `m4(h)=(1/5)Σ_i g_i(h)^4`. Direct conditional moment expansion gives the exact long-time fourth-cumulant rate

`K4_iid = E[m4] - 3(E[m2])² + 6 Σ_(d=1)^5 (E[m2(h0)m2(hd)]-(E[m2])²)`.

The finite sum follows from Q⁶=Haar for functions of six-bit history. This formula is *not* the previously derived fixed-vacuum quenched K4, nor the n²-growing frozen-vacuum mixture K4. The committed `--native` mode computes this exact quantity in Q(sqrt5) from the original five A4 source vectors, with pointwise simplex and lag crosschecks. **That native mode has not yet been executed in this run, so no numerical native K4 value is claimed.**

## Executable evidence

`python URT_A5_MARKOV_VACUUM_K2_THEOREM_2026_11_10.py`

**PASS locally:** 64 exact Q⁶=Haar checks; all exact source-lag polynomial coefficients; four exact K2 values; three open 24-step variances. An independent exact 320-state product Markov calculation, using a deliberately different six-bit zero-sum source with nonzero lag-one covariance, checked all n=1,…,9 and t=0,1/2,1,5/4. An independent fourth-moment 320-state tilted-transfer check at t=1 reproduced K4=224 for this *synthetic verification source* at n=1,…,8. **224 is not a native Cathedral physical prediction**.

`python URT_A5_MARKOV_VACUUM_K2_THEOREM_2026_11_10.py --native`

**NOT EXECUTED here:** requires original archived exact source in the same folder. It fails if missing and, when run, checks the five A4 singlet simplex, pointwise cancellation, all native lag coefficients and native resampled K4.

## Source/observable typing and precise next mathematical gate

**Proved:** the conditional A5-vacuum switching K2 polynomial, the exact open-24-step variance, and the iid-switching K4 identity. **Verified locally:** rational algebra and independent 320-state Markov tests. **Assumed, not derived:** P_t, independence from the URT history, and selection of a particular t. **Not proved:** an A5-compatible dynamical vacuum selector from the full 190-cochain/64-history/24-clock/H13⊕H51 action, a physical Maxwell photon projector, Ward-complete source-to-observable pole normalization, or any of the four historical ARFs.

**Next unsolved mathematical step:** derive the vacuum-label transition operator (or prove the vacuum is fixed) from the original gauge-covariant 24-clock charged H13⊕H51 action with all first/second Ward contacts, rather than choosing t. Then compute the selected physical pole observable and compare its source normalization to the historical ARFs, with no fitted coefficients.

No unrelated repository files or third-party Yang–Mills work were changed.
