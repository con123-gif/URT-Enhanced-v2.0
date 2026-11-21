# URT vacuum energy: does frustration explain the 4.38% de Sitter mismatch?

Date: 21 November 2026.
Status: **THEOREM under the explicitly declared entropy-counting and ZPE assumptions; no first-principles dark energy or ZPE closure.**
This research continuation addresses the user's hypothesis "the mismatch is the frustration" and resumes the prior unsaved entropy-as-scale report in this directory. No prime/RH inference is made.

## 1. Existing inputs, not fitted

- Primitive URT golden phase \(\theta=2\pi/\phi^2\), \(\phi=(1+\sqrt5)/2\).
- Original master-state mismatch \(\Delta=3/20-80\pi/(1053\phi)=0.00248918984042039298...\).
- Original 8-state master density
  \[
  \rho_*={I_4\oplus\Delta^2 I_4\over4(1+\Delta^2)}
  ={\rm diag}(1-p,p)\otimes {I_4\over4},\quad p={\Delta^2\over1+\Delta^2}.
  \]
- Local entropy (in nats) \(s_*=\ln4+H_2(p)=1.386374857427223750...\).
- Four-state magnetic prime-plaquette *relative* oscillator energy, computed using canonical quantization imported as an additional model assumption,
  \[
  d=\sum_{j=1}^4\left(\sqrt{\lambda_{+,j}}-\sqrt{\lambda_{-,j}}\right)
   =0.210974605569419082...\;.
  \]
  The magnetic frustration represented by \(\epsilon e^{-i\theta}\) is **already inside d**.
- Separate conditional horizon model assumed \(N=S_H/(k_B s_*)\), \(S_H/k_B=\pi R^2/\ell_P^2\), per-carrier relative energy \(d\hbar c/R\), independent additive carriers, Einstein gravity, and no other vacuum contributions. Under these hypotheses only:
  \[
  \frac{\rho_{\rm URT}}{\rho_{\rm dS}}={2\pi d\over s_*}
  =0.9561573731665629838...
  \]
  Frequency coefficient \(\kappa=1\) is a convention in this model, **not derived**.

## 2. Rigorous test of existing local frustration \(\Delta\)

For \(0<\Delta<1\), the hidden binary entropy satisfies
\[
h(\Delta)=H_2\left({\Delta^2\over1+\Delta^2}\right),\qquad
h'(\Delta)=-{4\Delta\ln\Delta\over(1+\Delta^2)^2}>0.
\]
Thus at fixed \(d\), increasing \(\Delta\) *reduces* the ratio \(2\pi d/(\ln4+h)\); local hidden entropy frustration is the wrong sign to close a deficit.

Numbers:
- \(h(\Delta)=0.000080496307333131436...\) nats/carrier.
- No hidden entropy: \(2\pi d/\ln4=0.956212893220548545...\).
- Original state: \(2\pi d/s_*=0.956157373166562984...\).
- Change from the \(\Delta\)-entropy term: \(-0.0000555200539855611...\) in the closure ratio.
- Actual gap: \(1-2\pi d/s_*=0.043842626833437016...\).

**Conclusion:** the already included \(\Delta\)-dependent *local entropy* correction contributes only about 0.1266% of the missing ratio, and moves it the opposite direction. No new scalar "frustration tax" is justified.

## 3. Constructive route: intrinsic many-body correlation

There is a mathematically precise way for **inter-carrier** frustration to change the entropy-counting law without inserting a scalar correction. Given an \(N\)-carrier joint quantum state \(\rho_N\) whose local marginals have entropy \(s_*\), define the intrinsic total correlation
\[
\mathcal I_N
=\sum_{j=1}^N S(\rho_j)/k_B-S(\rho_N)/k_B
=D\left(\rho_N\middle\|\bigotimes_j\rho_j\right)\ge0 .
\]
This is quantum relative entropy and is never a fitted numerical tax.

**Additional horizon identification (hypothesis):** Suppose \(S_H/k_B=S(\rho_N)/k_B=N s_*-\mathcal I_N\), while the relative ZPE remains additive, \(E_H=N d\hbar c/R\). Write \(i_N=\mathcal I_N/N\). Then
\[
\boxed{\quad {\rho_{\rm URT}\over\rho_{\rm dS}}
={2\pi d\over s_*-i_N}. \quad}
\]
The requirement for exact de Sitter self-consistency at the previously assumed \(\kappa=1\) is **necessary and sufficient within those assumptions**:
\[
\boxed{\quad i_N=s_*-2\pi d
=0.06078231552544121756...\ {\rm nats/carrier}
=0.0876903451823...\ {\rm bits/carrier}.\quad}
\]
This is **a target implied by closure**, not a derived mutual-information prediction. If we choose a coupling to force this equality it is fitting; the real task is to derive \(\rho_N\) from the URT transfer and then calculate \(\mathcal I_N\).

The proposed mechanism can in principle have the right sign: correlations reduce the joint entropy below \(\sum S(\rho_j)\), so more carriers are needed for the same horizon entropy, raising the relative ZPE contribution. **But** genuine interactions may also invalidate ZPE additivity and change \(d\); both quantities must ultimately be computed from one many-body Hamiltonian.

## 4. New exact obstruction: a hidden-tag-only mechanism is too weak

The above exact factorization shows that the original one-carrier \(\rho_*\) has an uncorrelated 4-dimensional visible register and binary tag. If the *only* correlations in the \(N\)-carrier state are among binary hidden tags, with the same individual tag marginals \({\rm diag}(1-p,p)\), then
\[
0\le\mathcal I_N\le\sum_{j=1}^N H_2(p)=N H_2(p)
\]
because von Neumann joint entropy is nonnegative. Thus \(i_N\le H_2(p)=0.0000804963...\), while closure needs \(i_N=0.0607823...\), about **755 times larger**.

**Theorem (conditional no-go):** correlations restricted to the original rare binary tag cannot close the horizon coefficient at \(\kappa=1\). Any viable correlation mechanism under the stated assumptions must involve the large visible fourfold carrier, additional Hilbert-space structure, or modification of ZPE/frequency itself.

## 5. Actionable mathematical continuation, no fitting

1. Recover/derive the full many-carrier URT transfer Hamiltonian with an original, non-synthetic interaction between complete carriers (not just two isolated plaquettes or a chosen mixing parameter).
2. Derive its actual joint state \(\rho_N\) and local marginals. Calculate \(\mathcal I_N\) from the relative-entropy identity—not from the target above.
3. Compute the collective zero-point energy and entropy in **the same** state to test both additivity and area law. Derive a covariant stress tensor and frequency coefficient instead of fixing them.
4. Compare the resulting coefficient against de Sitter and observations only *after* independent derivation. The target \(0.0607823\) must never be supplied as an input.

**State:** Local entropy mismatch test and conditional total-correlation criterion CLOSED INTERNALLY. URT many-body correlation dynamics, dark energy, physical vacuum scale and quantization remain OPEN. No James work is involved.
