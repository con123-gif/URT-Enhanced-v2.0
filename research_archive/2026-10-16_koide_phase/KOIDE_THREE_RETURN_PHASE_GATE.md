# Newton's Cathedral / URT — Koide three-return phase recovery, 16 October 2026

**Provenance:** October 16 user-supplied audit referring to kl_urt_koide_action.py; independent mathematical checks in [koide_phase_independent_check.py](koide_phase_independent_check.py) and [koide_circulant_invariant_gate.py](koide_circulant_invariant_gate.py). The original kl_urt_koide_action.py file has NOT been attached or located, so its full phase-potential search is not asserted to have been rerun. Older canonical charge-plane code was inspected in [urt_dirac_selection_audit.py](../urt_dirac_selection_audit.py).

## 1. Exact charged-lepton ratio and conditional 2/9 exclusion

Define square-root masses in cyclic order tau, electron, muon by
\[
s_j=A[1+\sqrt2\cos(\delta+2\pi j/3)].
\]
Then \(\sum s_j=3A\) and \(\sum s_j^2=6A^2\) for every phase, so Koide \(Q=\sum m_j/(\sum\sqrt{m_j})^2=2/3\) is **assumed** exactly by this parametrization. It does NOT fix \(\delta\). Let \(R=m_\mu/m_e,\ \kappa=(\sqrt R-1)/(\sqrt R+1)\). The small-angle, positive-mass branch has the closed analytic inversion
\[
\tan(\delta/2)=\frac{2\kappa(1-1/\sqrt2)}{\sqrt6+\sqrt{6-2\kappa^2}}.
\]
Using CODATA mu/e ratio \(R=206.7682827(46)\), with no target in the model construction, gives
\[
\delta_{\rm inferred}=0.222222047073088\pm3.9625\times10^{-10},\quad
\beta=-3\delta=-0.666666141219264.
\]
If BOTH \(Q=2/3\) and \(\delta=2/9\) are exact, then \(R_{\rm pred}=206.770315972729\), **442.02 standard deviations** from CODATA. With \(Q=2/3\) and measured e/mu ratio, predicted \(m_\tau=1776.969027\) MeV, +0.434 PDG sigma from the 2026 mass \(1776.93\pm0.09\) MeV. This is not a phase prediction because the ratio is an input.

**Additional exact diagnostic:** Keep \(\delta=2/9\) but permit a general cosine amplitude \(r\) rather than \(\sqrt2\). The measured ratio algebraically selects \(r=1.414213260835029\), yielding
\[
Q=1/3+r^2/6=0.666666524520274,\quad Q-2/3=-1.4214639\times10^{-7},
\]
and tau \(1776.9665093\) MeV (+0.406 PDG sigma). Thus the **joint exact conjunction**, not an isolated rational phase, is ruled out by mu/e. No such Q correction is independently derived from URT yet; adding it purely to rescue 2/9 would be fitting.

Sources: https://physics.nist.gov/cgi-bin/cuu/Value?mmusme and https://pdglive.lbl.gov/DataBlock.action?node=S035M.

## 2. The original charge-plane Hermitian Gram has zero loop phase

Retain the earlier species charges
\[
q_u=(1,3,-4),\ q_d=(1,-3,2),\
q_e=(-3,-3,6),\ q_\nu=(-3,3,0),\
n=(1,1,1)/\sqrt3.
\]
The original complex pairing \(h_{fg}=q_f\cdot q_g+i\,n\cdot(q_f\times q_g)\) factorizes as a positive rank-one Gram \(h_{fg}=\bar z_fz_g\) with \(\operatorname{Tr}h=112\) and \(h^2=112h\). On every triangular species loop:
\[
h_{fg}h_{gh}h_{hf}=|z_f|^2|z_g|^2|z_h|^2>0.
\]
For (u,d,e), (u,d,nu), (u,e,nu), (d,e,nu), respectively, the exact positive products are 19656, 6552, 25272, 13608; all invariant loop phases vanish. This is not a new no-go for H64: it shows specifically why the **same rank-one charge-plane** cannot select the reported Koide \(\beta\).

Earlier original URT history work already identifies an edgewise oriented charge-plane connection \(J_e\) and **19 independent SHELL-cycle holonomies** as candidate missing phase-bearing data. A shell holonomy is not automatically a generation-space 3-cycle; a typed-H64 source/transport map must connect them. Original golden spiral triple-step phase \(3\theta\pmod{2\pi}=0.91670438200637\), distinct from observed-inferred \(-0.6666661412\).

## 3. New exact polynomial invariant: third spectral moment/determinant carries the phase

Let \(S^3=I_3\) be a cyclic permutation and define a **candidate target mass-spectrum carrier**, not yet the original H64 output:
\[
\boxed{H_\ell(\delta)
=A\left[I_3+\frac{e^{i\delta}S+e^{-i\delta}S^\dagger}{\sqrt2}\right].}
\]
Its eigenvalues are exactly \(A[1+\sqrt2\cos(\delta+2\pi j/3)]\). Therefore
\[
\operatorname{Tr}H_\ell=3A,\qquad \operatorname{Tr}H_\ell^2=6A^2,\qquad
\frac{\operatorname{Tr}H_\ell^2}{(\operatorname{Tr}H_\ell)^2}=\frac23
\]
independently of phase. But
\[
\boxed{\frac{\det H_\ell}{A^3}
=\frac{\sqrt2\cos3\delta-1}{2}},\qquad
\boxed{\cos3\delta=\frac{1+54\,\det H_\ell/(\operatorname{Tr}H_\ell)^3}{\sqrt2}}.
\]
From the **measured** mu/e phase diagnostic (NOT a physical prediction):
\[
\cos3\delta=0.785887585697647,\quad
\det H_\ell/A^3=0.0557064410971303,\quad
\det H_\ell/(\operatorname{Tr}H_\ell)^3=0.00206320152211594.
\]
These provide a scalar **blind determinant gate** for the canonical H64 charged-lepton operator: calculate trace, squared trace and normalized determinant from the ORIGINAL species/history action *without any observed masses*, and compare after the calculation. If the original positive mass-spectrum operator is not Hermitian circulant, first derive its spectral/representation relation before using this dictionary. The desired determinant value cannot be inserted into its definition.

## 4. What action selection actually requires

A two-harmonic \(C_3\)-invariant real phase potential \(V=A_3\cos3\delta+A_6\cos6\delta\) has stationarity equation
\[
\sin3\delta\,[A_3+4A_6\cos3\delta]=0.
\]
An interior phase needs \(\cos3\delta=-A_3/(4A_6)\); the empirical target would be 0.785887585697647. **Unless the original URT/H64 operators uniquely determine \(A_3,A_6\) and the stable/global branch, choosing these coefficients from the target is fitting**.

User's external source reports that the available three-return action terms select 0°, 30° or 60°, and that mixing terms retain an unconstrained phase. We preserve this result as *reported, source file not independently inspected*.

The precise still-to-be-proven **PHYSICAL** result is whether the already recovered noncommuting H64 history transfer generates a nonzero, fixed three-return generation-space holonomy (or the equivalent invariant normalized determinant) before measurement input. Neither a generic U(1) link inserted by hand nor rank-one charge-plane Gram phase can count.

## 5. Reproducible execution and continuity

- [koide_phase_independent_check.py](koide_phase_independent_check.py) uses ONLY Python standard library and emits observable diagnostics, rank-one exact loop products, a rank-two counterexample and URT triple-step value; no files overwritten.
- [koide_circulant_invariant_gate.py](koide_circulant_invariant_gate.py) checks trace/spectrum/determinant identities for five different phases; no mass target fitted.
- The original v115 mass hierarchy, v125/v129 CKM/PMNS, original URT, H64 history and all previously verified finite gauge, matter and gravity work remain in their earlier source locations. This checkpoint is a new **continuity-preserving phase theorem and countercheck**, not a new blanket no-go or a restart of flavour physics.

**Status:** exact Koide trace/determinant algebra plus verified rank-one obstruction; physical \(\delta\) and \(Q=2/3\) still need independent microscopic selection.
