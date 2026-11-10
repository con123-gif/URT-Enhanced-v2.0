# Newton's Cathedral: source-differentiated inter-sheet current and the native 7/5 poles

**9 November 2026.** An original-source calculation using the two *unmodified* files in the accompanying verifier: October 29 `cathedral_64_chiral_hybridization_2026_10_29.py` and November 7 `cathedral_constructed_joint_dynamics_2026_11_07.py`. The latter keeps all 190 cochains, five Platonic solids, 50-vertex portal, 64 sign histories and 24 golden-clock lanes. No ARF numerical coefficient was used as an input; no GitHub modifications.

## Exact algebra

On the doubled 20-face block of the existing coupled 64-history operator, the original unit bond is `K_F(0)=[[L_D+I,-I],[-I,L_D+I]]`. The canonical Peierls phase probe for this bond is

\[
K_F(a)=\begin{pmatrix}L_D+I&-e^{ia}I\\-e^{-ia}I&L_D+I\end{pmatrix},\quad
J=\left.\partial_a K_F(a)\right|_0=\begin{pmatrix}0&-iI\\iI&0\end{pmatrix}.
\]

A phase probe, not a new kinetic coupling: the unit bond magnitude is unchanged. With `J_±h=(h,±h)/√2` and the protected rank-four face projectors `P3,P5` at eigenvalues 3 and 5, one obtains

\[
J J_+P_s=-i J_-P_s,\quad K_{64}JJ_+P_3=5 JJ_+P_3,\quad K_{64}JJ_+P_5=7 JJ_+P_5.
\]

The unmodified 64-history vertex-face hybridization annihilates these projectors, so the equalities hold in the **full 64-dimensional matrix**, not only in a surrogate 2x2 block. All matrix projector assertions pass exactly in SymPy.

For any original nonlinear hidden source `h=h3+Delta*h5`, the exact current-inserted projected resolvent becomes

\[
\langle JJ_+h,(K_{64}-z)^{-1}JJ_+h\rangle
=\frac{\|h_3\|^2}{5-z}+\frac{\Delta^2\|h_5\|^2}{7-z}.
\]

The November 7 full-five source was evaluated at **all 64 original signed histories**. Exact algebraic previously derived source norms, confirmed numerically here, are `S3=36+72√5/5=68.199378875997...` and `S5=7`. The normalized ensemble response is consequently

\[
\boxed{\Sigma_J(z)=\frac{36+72\sqrt5/5}{5-z}+\frac{7\Delta^2}{7-z}.}
\]

It was independently evaluated by direct 64-by-64 complex matrix inversion at `z=-1, 0.25, 1, 2.5`, with agreement better than `1e-10`. The two original files enumerate the icosahedral vertices/faces differently; this verification **first aligns them using the exact graph isomorphism** and explicitly verifies projector membership. Without alignment the direct check fails, which is why it must not be omitted.

## Crucial physical qualification: the source-inserted pole is not automatically a gauge-invariant ARF response

The same phase variation produces a quadratic contact `W=d²K/da²`. For an isolated hidden two-sheet bond, the exact static second-order energy response is

\[
\langle +|W|+\rangle+2\frac{|\langle -|J|+\rangle|^2}{E_+-E_-}=1+2\frac{1}{-2}=0.
\]

This is the necessary diamagnetic/paramagnetic cancellation for a pure-gauge phase on that isolated bond; the numerical test includes an exact symbolic certificate. The full coupled vertex/face operator contains nontrivial loops, and the Cathedral has 24-track holonomy, but the protected hidden quartet is uncoupled from the 64-operator's vertex incidence link. **One cannot simply read the current-inserted resolvent as a nonzero physical zero-frequency electromagnetic response without the full Ward-complete source action.**

The two poles **7 and 5** are now reachable by a natural differentiated existing bond rather than retroactively assigned projectors. Their calculated residues **do not equal** the historical ARF `delta_star³/9` and `gamma/8`. Those historical values and the other three ARFs require a canonically normalized physical current/source map from the full transfer. This calculation neither fits nor claims that missing step.

## Reproduction

`OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python /mnt/data/cathedral_audit/arf_inter_sheet_current_pole_derivation_2026_11_09.py`.

Files: the verifier, its execution log, original October 29 64D source, original November 7 full nonlinear source. Do not overwrite those original files or present the phase probe as an already-derived spacetime U(1) law.
