# Newton’s Cathedral / URT — Frustration as asymmetry: executable physical test

**Date:** 2026-11-17. **Tests:** executed locally, original-source mathematics reconstructed from Q101/Q124/Q125. **GitHub status:** not committed. **No observed masses or cosmological asymmetry used as inputs.**

## 1. Exact frustration order parameter

Enumerate all 8192 binary 12-outer-plus-centre states on the original 30-edge icosahedral graph with

\[E_t(s,c)=\sum_{\langle ij\rangle}s_is_j-tc\sum_i s_i.\]

At every `1<t<3` the same 60 minimizers have `c M=4`, with `30` cases `(c,M)=(+1,+4)` and `30` cases `(-1,-4)`, 8:4 majority/minority outer spins, 12 like-sign (frustrated antiferromagnetic) edges and 18 opposite-sign edges. Exactly

\[ E_{\min}(t)=-6-4t,\qquad -\partial_t E_{\min}/12=cM/12=1/3. \]

At `t=phi` and `beta=-ln Delta`, the **full 8192-state** Gibbs result is `mean(cM/12)=0.332931063386253`; the 444 sublevel projection gives `0.332931056328922`. Despite the strong even order parameter, `mean(M)=mean(c)=0` exactly by `(s,c)->(-s,-c)` symmetry.

## 2. Original six-axis history compatibility — explicit incidence

Pair the 12 icosahedral vertices into 6 antipodal axes. **Declared geometric compatibility relation:** for an antipodal pair containing one outer spin opposite to the centre, the 6-bit history selects that anti-centre vertex; for a pair with equal outer spins, either orientation is compatible. This is a concrete choice of relation, not claimed uniquely selected by the primitive URT dynamics.

Every ground state has 4 opposed antipodal pairs and 2 aligned pairs, hence `2^2=4` compatible six-bit histories. In either 30-ground A5 branch, the 64 histories have occurrence multiplicities `5 (12 histories), 3 (20 histories), 0 (32 histories)`. The two globally inverted ground states have the **same** compatible history set under this relative-to-centre rule.

Let `F` be the 30-by-64 zero-one incidence of compatibility and `G=F^T F`. **Independently exact integer charpoly** of `F F^T`:

\[
\det(xI_{30}-FF^T)=x^5(x-16)(x-1)^4(x-3)^4(x^2-16x+44)^3(x^2-8x+4)^5.
\]

Thus `rank F=25`, `Tr G=120`, `Tr G^2=1080`, `Tr G^3=12240`; `G` is a PSD **frustration-selected history transfer candidate** without a fitted coefficient. It has 32 supported history labels but only 25 nonzero transfer singular directions. **Not yet a physical history evolution law.**

For uniformly selected ground states (one central branch) and uniform compatible-history choice, the history marginal has mass `1/24` on each of 12 labels, `1/40` on each of 20, and zero on 32. Therefore

\[
H(H)=\tfrac12\ln(24\cdot40)=3.4334666422309,\quad
H(H\mid S)=\ln4=1.38629436111989,
\]

\[I(S;H)=2.0471722811111\quad\text{nats},\qquad \ln64-H(H)=0.72541644112873\ \text{nats}.\]

The compatible history rule extends to all 444 sublevel states, with exact row-choice counts `(level 0: 60x4; level 1: 120x2 and 120x8; level 2: 24x1 and 120x4)`. The resulting total binary state/history incidence count is `1944`; this happens also to equal `24*81`, but **no physical equality with the clock count or granularity is inferred from that count**. The conditional fraction of history choices outside the 32 ground-supported histories is 0 on levels 0 and 2, and `1/16` averaged over level 1. With `a=sqrt(5)-1`, `q=exp(-beta*a)`:

\[
\boxed{P_{\rm outside}(\beta)=\frac{15q}{60+240q+144q^2}}
\]

At `beta=eta_Delta`, `P_outside=0.00015074453804791` and supported fraction `0.99984925546195`. This is a **conditional thermodynamic history prediction** of the explicitly defined incidence rule, not an experimentally derived particle asymmetry.

## 3. Native URT H64 action on the history support

Reconstruct the original `U_h=(M P_h)/sqrt2` from the six antipodal axis bits and original 20 icosahedral faces; verify `U_h^T U_h=P_h`. Complementing all six history bits gives

\[ C_{64}U_h=U_h(P_5-P_3).\]

Native pair-flip `H_bits=15I-sum_{i<j}X_i X_j` acts with energies 18 (hidden P3) and 16 (hidden P5), preserves bit complement and has 240 edges crossing the 32-ground-supported/32-unsupported history boundary. The projector onto the support is **not invariant** under H_bits alone. The full Gram `G` commutes exactly with bit complement but not with `H_bits` (Frobenius commutator norm `210.14280858501917`). This is a specific mathematical mechanism for nontrivial frustration/URT interplay, not automatic preservation of a selected subset.

The original signed hidden `W` yields `chi=iW/sqrt15` and the two conditional maximally coherent hidden states

\[\rho_\pm=(P_3+\Delta^2P_5\pm\Delta\chi)/(4(1+\Delta^2)),\qquad (P_5-P_3)\rho_\pm(P_5-P_3)=\rho_\mp.\]

Their chiral expectation is `Tr(rho± chi)=±0.0049783488346625`, equal thermal diagonal occupations and equal hidden energy. Their equal mixture is the original `rho_star`; the entropy difference is `H_2(p5)=8.0496307333079e-5 nats`. Existence of these states is exact algebra; **their dynamical preparation or physical baryon interpretation is NOT established**.

## 4. Does the native charged transport turn geometric asymmetry into baryon-number excess?

**Actual test:** reconstruct all 1032 Q124 original local SU(2) charge intertwiners `U16_xy` (and the 3-generation-plus-conjugate Q96 lift). The 12 quark states in each Q16 carry physical baryon label `1/3` and the 4 leptonic states label `0`, so `B16=diag((1/3)*6,0*2,(1/3)*6,0*2)`, while `B96=diag(B16×3,-B16×3)`.

All 1032 links satisfy `[U16_xy,B16]=0` **exactly from their block form**; numerical maximum commutator is 0 and max native local electric-charge Ward residual `6.03e-16`. `Tr B96=0`, `Tr B96^2=8`. Original Q125 coherent hopping has `Hch_xy=i J_xy U96_xy`, so `[Hch,B96]=0`. The Q124 conditional Kraus transitions also commute with B96. Hence starting from zero net baryon number, **these particular charged transitions cannot generate it**. The same blockwise conservation holds if we merely change the scalar source amplitude to the candidate centre-graded Jg.

Original Q101/Q125 squared hidden source also satisfies `f(-s)=f(s)` and the native J0 remains invariant under full 13-spin reversal. The two global-inversion ground branches need not be physically matter/antimatter: in the existing Q96 representation, conjugate charged sectors are separate. The full physical mechanism must identify or transport the *geometric branch asymmetry* into actual baryon-number-changing dynamics (for example, a properly derived anomalous gauge/topological process). This does **not** deny the exact geometric frustration imbalance and does **not** require a separate mechanism to create it.

## Evidence and reproduction

- `cathedral_frustration_asymmetry_physical_test_2026_11_17.py`: 8192-state enumeration, Gibbs expectation, original Q101 parity, all 1032 original Q124 charge and B Ward checks. Exits 0.
- `cathedral_urt_parity_history_test_2026_11_17.py`: all six-bit native history incidence, complete 444 conditional compatibility, exact SymPy Gram polynomial, entropy, H_bits/KMS chiral parity tests. Exits 0.
- Logs: files of the same names ending `.log`.

Original repository source provenance: [Q101](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py), [Q124](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/research_archive/2026-11-14_q124_charged_barrier_extension/Q124_NATIVE_CHARGED_BARRIER.py), [Q125](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py).

**Status:** exact finite original-model identities and exact integer spectra; stated history compatibility is a declared geometric rule; physical baryon interpretation is not yet demonstrated. No GitHub changes made.