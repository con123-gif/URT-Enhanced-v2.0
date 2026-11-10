# Newton's Cathedral / URT: native diagonal Ward symmetry, 15 charge sectors and an exact four-mode bridge completion

**10 November 2026 — original-source mathematical continuation; no fitting.** This is a theorem about the archived all-five-Platonic 190-cochain, 64 signed-history, 24-clock nonlinear construction, followed by an **explicitly additional** five-clock bridge completion. The physical four historical ARFs are **not derived**. The original `cathedral_constructed_joint_dynamics_2026_11_07.py` is read but not modified. No experimental ARF coefficient, third-party Yang–Mills proof or James's work is used.

## Theorem A: the original complete 190+64+24 action has an exact diagonal temporal U(1) symmetry

The archived model contains a complex 190-cochain field `z_t`, a complex 64-history field `y_t`, a temporal link angle `theta_t`, and a nonlinear hidden source from all five solids:

`v_t = vertex(z_t) in C^50`, `x_t=Plinear v_t in C^12`, `h3_t=P3[(C x_t) ⊙ (C x_t)]`, `h5_t=P5[(C x_t) ⊙ (C x_t)]`.

The two hidden projectors have rank four each (the native `4_3 ⊕ 4_5`); `Plinear` is the original all-five-solid 50-to-12 bridge, not a new 13-state reduction. Under any periodic temporal phase `lambda_t`, define

`z_t -> exp(i lambda_t) z_t`, `y_t -> exp(2i lambda_t) y_t`, `theta_t -> theta_t + lambda_(t+1) - lambda_t`.

Then `h3_t,h5_t -> exp(2i lambda_t)(h3_t,h5_t)`, exactly. Each native spatial incidence norm and the original cross-solid `Cbridge` term is invariant under the *common* phase at a fixed time. The 24-clock covariant differences `z_(t+1)-exp(i theta_t)z_t` and `y_(t+1)-exp(2i theta_t)y_t` transform by an overall phase at `t+1`. The original nonlinear source term `Re[y_t^†(h3_t+Delta h5_t)]`, its source norm, and the KMS entropy feedback are invariant. Therefore **the entire archived full action** is invariant under the diagonal local-in-time U(1). A fresh, independent numerical test on the original functions gives `S(gauge transformed)-S(original)=-4.44e-16` for generic fields and 24 unrelated phase values.

This fixes the **relative charge 2 of the hidden history field** from the square in the original source, without inserting a physical charge measurement. It does **not** derive the physical electromagnetic charge unit, spatial local gauge invariance, or the SM gauge representation.

## Theorem B: the original nonlinear source contains 15 distinct five-solid charge sectors, not one U(1)^5 charge-two section

Decompose the original 50-vertex input into its five solid-supported pieces `v=sum_s v_s`, and put `x_s=C Plinear v_s`. For either hidden projector `P_a`, the unchanged nonlinear source obeys the exact polarization identity

`h_a = sum_s P_a(x_s ⊙ x_s) + 2 sum_(s<t) P_a(x_s ⊙ x_t)`.

Under independent phases `v_s -> exp(i lambda_s) v_s`, the five diagonal terms carry charge weights `2e_s` and the ten mixed terms carry `e_s+e_t`. All **15 formal sectors** were nonzero at a generic original-source input, and their independently phased sum exactly reproduced the direct nonlinear source to `1e-12`. They are *source-charge sectors*, not 15 extra independent six-bit history vectors or proven particle species.

The original spatial bridge also locks the relative phases: its exact harmonic projection is `U0^† Cbridge U0=L5=5I-J`. Since every off-diagonal of `L5` is nonzero, a diagonal five-solid phase matrix commutes with `L5` only when all five phases agree modulo `2π`. An explicit independent-phase test changes the complete original action by `-7.535157043112584e-4` for a generic test input. Hence **the native action has the diagonal U(1), not five independently gauged U(1)s**. The four relative temporal Wilson classes of the disconnected five-solid × S¹ *topological extension* are not automatically four native gauge bosons or four physical ARFs.

## Theorem C: the previous four-channel Hodge operator is exactly an eight-edge positive weighted graph Laplacian

From all five original Hodge–Dirac traces `E_s=Tr(D_s²)/8=(6,12,12,30,30)` define `P=I5-J5/5` and the previously stated candidate relative stiffness `M=P diag(E_s) P`. Let `B` be the oriented incidence matrix of the complete graph on the five solids. Define for each unordered pair

`w_st=(E_s+E_t-18)/5`, where `18=(sum_s E_s)/5`.

All weights are **nonnegative**, with exactly two zeros (tetrahedron–cube and tetrahedron–octahedron) and eight positive weights:

`(0,0,18/5,18/5,6/5,24/5,24/5,24/5,24/5,42/5)`

in lexicographic pair order. Exact symbolic calculation gives

`M = B diag(w_st) B^T`, `spec(M)={0, 12, 30, 15−3sqrt(145)/5, 15+3sqrt(145)/5}`.

Thus the earlier Hodge compression **can** be implemented as a nonnegative pairwise relative-phase stiffness, with no fitted weights. This is a constructive mathematical result. The *choice* to use the Hodge trace compression as the physical intersolid action remains a hypothesis.

## Theorem D: exact gauge-covariant 24-clock bridge and its screening effect

If one **extends** the model to independent temporal gauge links `A_s,t`, introduce compact intersolid Stueckelberg phases `chi_st,t` with `D f_t=f_(t+1)-f_t`. The bridge curvature and compact action are

`C_st,t = A_t,t - A_s,t - D chi_st,t`, `S_bridge=sum_(st,t) w_st[1-cos(C_st,t)]`.

Under `A_s,t -> A_s,t+D lambda_s,t` and `chi_st,t -> chi_st,t+lambda_t,t-lambda_s,t`, each `C_st,t` is exactly invariant. In matrix notation `C=[B^T⊗I24, -I10⊗D]`, `G=[I5⊗D; B^T⊗I24]`, so `C G=0` **over the integers**. The nonlinear current and full second-variation contact obey `G^T J=0` and `H G=0`; both were verified for generic nonzero background fields.

In the quadratic, zero-winding sector, minimizing over the **dynamical** `chi` phases removes every nonconstant temporal component of `B^T A`. The resulting exact Schur complement is

`H_eff = M ⊗ P0`, `P0=J24/24`.

Therefore the bridge stiffness acts on **four relative harmonic Wilson modes only**. All 23 nonzero clock frequencies are screened by the compensating link phases. The full weighted curvature map has rank `8×23+4=188`. The unscreened `M⊗I24` kernel used in the earlier four-scalar-resolvent candidate is the **fixed-chi (unitary-gauge) Hessian**, not the response obtained after eliminating unconstrained compensators. A physical action must decide whether these phases propagate, are constrained, or are integrated out.

As an explicitly *mathematical scalar-probe comparison only*, retaining the previous 64-history K and charge-two twisted clock but replacing `M⊗I24` by `M⊗P0` changes the four normalized Green traces:

| Mode | Previous fixed-chi scalar trace | Bridge-screened scalar trace |
|---|---:|---:|
| 1 | 0.0411938462293092 | 0.2410788936811490 |
| 2 | 0.0347493766303374 | 0.2408112265620702 |
| 3 | 0.0254369543074355 | 0.2404219746031651 |
| 4 | 0.0211836101730676 | 0.2402438804725604 |

**Neither table column is a physical gauge susceptibility**: the charged-clock kinetic operator belongs to charged matter, whereas the bridge Hessian belongs to temporal gauge/Stueckelberg variables. Combining their spectra as a scalar probe is a conditional algebraic comparison, not a source-preserving physical identification. The dramatic change demonstrates why the four earlier candidate numbers must not be declared four ARFs.

## Theorem E: typed native 64-history charged-clock matter and all Ward contacts

A separate, explicitly constructed charged-matter action uses the original history Laplacian `K64=15I−sum_(i<j) X_i X_j` with exact spectrum `0(2),10(12),16(30),18(20)`, the native 24-clock, original `r=π/e`, and original charge-two link phase `q=2`:

`S_matter = sum_(s,t) [psi_s,t^† K64 psi_s,t + r² || exp(i q A_s,t) psi_s,t+1 − psi_s,t ||²]`.

It is invariant under `A->A+D lambda`, `psi_s,t->exp(-i q lambda_s,t)psi_s,t`. Define `z_s,t=psi_s,t^† exp(i q A_s,t)psi_s,t+1`, `J_s,t=2q r² Im z_s,t`, and the exact Euler–Lagrange vector `E_s,t=δS/δpsi_s,t^*`. The local Ward identity and second derivative (diamagnetic/contact term) are

`D^T J + 2q Im(E^† psi)=0`, `∂²S/∂A_s,t²=2q² r² Re z_s,t`.

The full `5×24×64` action's gauge variation was zero to floating-point precision; the local Ward residual was `2.33e-15`, and independent finite differences agreed with the analytic current and contact. A fixed neutral history source **cannot** be inserted linearly as a charged matter source: its source section must transform with charge two or be dressed with a Wilson line. The native squared geometric source does transform correctly under the diagonal U(1), as established in Theorem A; extending it to independent U(1)^5 requires the 15-sector dressing of Theorem B.

This construction does **not** silently equate `psi` with the Standard Model fermions or with the historical ARF mass-pole observable. The native `H13⊕H51` generation carrier and complete charged spatial 190-cochain gauge current remain to be incorporated into a uniquely selected source action.

## Falsification and next exact proof obligation

**Proved:** native diagonal U(1) charge-two covariance of the complete original nonlinear action; the 15 charge-weight decomposition; exact failure of independent five-solid phases in the original action; nonnegative eight-edge Hodge bridge; exact compensator Ward identities and 23-frequency screening; fully typed 64×24 charged-matter Wilson current and contact.

**Not proved:** independent U(1)^5 as a symmetry of the original model, a unique dynamical selection of the Hodge bridge/compensator action, a physical electromagnetic normalization, or the four historical rail/EM/mass ARFs. The previous claim that the four Hodge eigenvalues were *automatically* four native physical gauge modes is **not supported**. The exact next obligation is to derive the intersolid charged bridge sections and the fermion `H13⊕H51` current representation from the original URT recursion, preserving the native diagonal Ward identity and specifying which source-to-pole residues define the four physical ARFs. No target values should be inserted.

## Reproduce

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_ORIGINAL_190X64_DIAGONAL_CHARGE_AND_FIVE_SOLID_SECTORS_2026_11_10.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_FIVE_SOLID_STUECKELBERG_WARD_SCREENING_2026_11_10.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_NATIVE_64X24_CHARGED_MATTER_WARD_2026_11_10.py
```

The first script reads the unmodified original 2026-11-07 construction in `cathedral_audit/` in the same archive environment; the other two are standalone. All computations are original and parameter-free within their **explicitly declared candidate action choices**. No previous repository file is overwritten.