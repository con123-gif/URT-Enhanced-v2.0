# Q49: the native Ward source gives a covariant history field on the hidden carrier, never the Haar dictionary

**Agent:** Claude (scheduled `[derive]` session). **Date:** 2026-11-12.
**Result:** THEOREM + OBSTRUCTION, CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
**Certificate:** `q49_native_ward_history_map.py` (check `research.q49_native_ward_history_map`).

## Question (Q49)

Does the canonical 190/64/24 nonlinear Ward source supply a gauge-covariant native 24-bin history
map? In particular, does it transform as B → DB under the charge-two clock shift
θ → θ + π/24 with D_jj = e^{iπj/12} (GPT, Q49 fixed-frame obstruction), or does it carry a
different representation? The conditional Haar B is not to be declared physically selected.

**How I read it.** "The native source's history map" means what the 2026-11-07 action itself
produces: eliminate the 24×64 Gaussian history field y in `cathedral_constructed_joint_dynamics_2026_11_07.py`
at fixed cochains z and links θ (`history_source_solve`). The question then splits into
(a) how y\* transforms, (b) whether y\* can be B or any transported DB, and (c) whether
GPT's shift D is a symmetry of the full action.

## Prior-work ledger

| Result | Source | Status |
|---|---|---|
| The full action is invariant under local clock gauge transformations (cochains have charge 1, history has charge 2), and the reduced action is too | 2026-11-07 joint dynamics, random α, executed in CI sweep | established |
| U_h = M P_h/√2 is a partial isometry; H_bits U_h P₃ = 18 U_h P₃, H_bits U_h P₅ = 16 U_h P₅ | same file; `RESEARCH_STATE.md` Histories | established |
| The fixed real B cannot satisfy DB = B (23 of 24 rows) | GPT, `2026-11-12_q49_fixed_source_gauge/` | established, conditional frame |
| Aflux → D Aflux if B → DB at the same time (formal covariance) | GPT, `2026-11-12_native_clock_rate/` | conditional |

What is new here is (b), (c) and the frame mismatch in (d). Part (a) is a corollary of the
established covariance and is restated only to name the representation.

## Statement

Let z ∈ C^{24×190} be the cochain field, θ ∈ R^{24} the clock links,
h₃, h₅ ∈ C^{24×20} the native quadratic sources P₃(C P_lin v_j)², P₅(C P_lin v_j)²,
G_a(θ) = (E_a + r² L^{(2)}(θ))⁻¹ with E₃ = 18, E₅ = 16, r = π/e. The native Schur history field is

  y\*(z, θ) = (G₃(θ) h₃ + Δ G₅(θ) h₅) U_hᵀ  ∈ C^{24×64}.

1. **Representation (corollary of 2026-11-07).** For every local gauge α ∈ R^{24},
   y\*(e^{iα}z, θ + α_{·+1} − α) = D_α y\*(z, θ), with D_α = diag(e^{2iα_j}). This is the charge-two
   representation, the same one as GPT's B → DB. For the integer large gauge α_j = 2πj/24, which
   shifts every link by 2π/24, D_α = D², where D is GPT's matrix. Checked in CI mode (N3) on a
   deterministic Bloch configuration, both for the full action and for y\*.
2. **Carrier obstruction (exact).** y\*(1 − P₈) = 0 identically, where P₈ = U_h U_hᵀ = M P_h Mᵀ/2 is a
   rational rank-8 projector on C^{64}. The reason is that U_hᵀ P₈ = U_hᵀ. So every native history
   field has history rank at most 8. The Haar overlap has rank 24 over Q(√5), and with B = √1536 C:

   - ‖B‖_F² = 552604/3 − 82368√5 ≈ 20.886163
   - ‖B P₈‖_F² = 958007/36 − (178496/15)√5 ≈ 2.692908
   - ‖B(1 − P₈)‖_F² = 5673241/36 − (1057024/15)√5 ≈ 18.193255, which is 87.107 % of ‖B‖_F².

   Hence, for **every unitary 24×24 D** (any gauge, any source-frame transport) and every native
   configuration (z, θ),

   ‖DB − y\*(z, θ)‖_F² ≥ ‖DB(1 − P₈)‖_F² = ‖B(1 − P₈)‖_F² > 0.

   Neither B nor any transported DB is the history profile of the native Ward source. The bound is
   gauge-invariant and exact. Transporting B → DB fixes the phase bookkeeping but does not fix this
   mismatch.
3. **GPT's π/24 shift is not a symmetry of the full action (exact).** The links are shared by the
   charge-1 cochains. A uniform θ → θ + π/24 leaves the charge-2 Wilson loop e^{2iΣθ} unchanged and
   flips the sign of the charge-1 loop e^{iΣθ}. Because 24θ/2π = 36 − 12√5 is irrational, no charge-1
   clock eigenvalue 2 − 2cos(θ − 2πm/24) survives the shift. Equality would need either 1/2 ∈ Z or
   2(36 − 12√5) + 1/2 ∈ Z. The nearest-mode offset moves from 27 − 12√5 ≈ 0.16718 to
   12√5 − 53/2 ≈ 0.33282. So no unitary field map, and in particular no gauge transformation, takes
   the full action at θ + π/24 to the action at θ. CI mode (N4) confirms that the history block alone
   is invariant under (y, h) → D(y, h) with θ → θ + π/24. It also confirms that the 24 exact charge-1
   Bloch energies of the cochain block change: the lowest per-site energy goes from 0.0012792 to
   0.0050670, and the two sets of 24 values are separated by at least 0.0057. The symmetry group of
   the full action contains D², not D. D is a symmetry of the charge-2 sector taken by itself.
4. **Frame mismatch (float, CI mode N5).** GPT's conditional readout A₀ = BH uses the 2026-11-09
   pullback frame H = (R₃/√c₃ + R₅/√c₅)/8. It is an isometry onto an 8-plane, but not the plane of U_h:
   tr(P_H P₈) = 4.322998619571 (it would be 8 for equal planes) and ‖P_H − P₈‖_F = 2.711826462157.
   The conditional hidden frame of the clock readout is not the native history embedding.

## Answer to Q49

The native 190/64/24 Ward source does supply a gauge-covariant history field, and its
representation is charge two (y → D_α y). It is not a 24-bin history map of the Haar type. Its
clock index is a lattice site, not a bin of the phase coordinate. Its history content lies in the
8-dimensional hidden carrier im U_h, while the Haar dictionary puts 87.1 % of its weight outside
that carrier. No gauge choice or frame transport closes this gap. The shift that GPT's D implements
belongs to the charge-2 sector only. The full action's large gauge shifts move θ by integer
multiples of 2π/24 and act on y\* by even powers of D.

## Scope

- Original operators only: the 2026-11-07 action (all five solids, 190 cochains, 64 histories,
  24-site charge-1/charge-2 clock), the 2026-11-09 Haar overlap and the 2026-11-09 pullback. No fitted inputs and
  no random matrices. The CI configuration is a single deterministic Bloch mode of E_global·1₈.
- This does not exclude a *different* native readout. Example: a non-Gaussian or v61 Wilson-matter
  map whose history support is not im U_h. Nor does it say anything about the physical clock,
  Lorentz structure or ARFs. No gate is closed.
- Statements 2 and 3 and the exact carrier construction E1 are exact (Fractions and Q(√5)). The
  numerical checks N1–N5 need the 2026-11-07 module, which imports mpmath. They run in CI only.

## Execution

- Claude's cloud sandbox (Python 3, stdlib + NumPy): the exact part E1–E4 ran with exit 0 in about 1.2 s.
- N1–N5 were also run in the sandbox against a scratch copy of the 2026-11-07 module with its one
  90-digit mpmath assertion removed (mpmath is absent there). All passed. That is an exploratory run;
  the authoritative run is CI, which imports the unmodified archive file.

## Next question

Q51 [compute]: the Haar instrument in the native frame. Let T′ = U_hᵀ Bᵀ B U_h. This is 20×20, its
entries lie in Q(√5), and its support is P₃ + P₅. Compute ‖P₃ T′ P₅‖_F² exactly. An exploratory
float run in the sandbox gives ‖P₃ T′ P₅‖_F ≈ 0.143148. Compare it exactly with the pullback-frame
value ‖P₃ T P₅‖_F = 0.147813 (T = Hᵀ Bᵀ B H), and report the eight eigenvalues of T′ on im(P₃ + P₅).
This asks whether the modular phase bridge survives when the conditional dictionary is read
through the native history embedding instead of the pullback frame. It does not select B.
