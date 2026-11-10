# Block 8 — coupled cycles 20–21 and alt 31–33 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Coupled cycle 20 — effective reduction of the condensed phase
Classification: PROVED for the pairing-dominated ratio list. The global
claim that every observable ratio is independent of the residual 2-plane
is FALSIFIED. Pipeline not run. No ARF.

In the condensed phase y_even > y_c,even ≈ 0.006011,
y_odd < y_c,odd ≈ 2.405, one has h5 = v_* ≠ 0 and h3 = 0. yo appears
in the action only as the coefficient of h3, so every on-shell
functional of (K, Δ, h5) is independent of yo. Confirmed on the grid
{0.1, 1, 2} × {0, 1, 2}: Ω and BdG spectrum spreads across yo are
exactly 0; the inversion tadpole stays below 3×10^{-7}; the mixed
Hessian is at most 5×10^{-11}.

Observables that still depend on yo are those that displace h3:
m_odd² = 2 c_odd + yo² κ_vac with κ_vac = −9.014×10^{-7}
(versus κ_origin = −2 χ_odd = −0.076866). The even condensate
suppresses the odd pairing response by ~8.5×10^4. At yo = 2 the
relative shift of m_odd² is 8×10^{-6}.

Pairing gaps scale as ye² (r_* / ye = N/(4 c_even) exactly). Ratios
that mix them with a ye-independent energy therefore depend on ye:
m_odd / E_pair, and on H13 the extra unpaired Hodge mode E = 13
(K v = 13 v, Δ v = 0) over E_pair. The ico Laplacian has no analogue
of that mode.

Parameter-free pairing-dominated ratios, independent of yo exactly and
of the overall ye scale in the large-vev limit:

1. 0 : √(2/15) : √(1/6) : √(3/10) = 0 : 2 : √5 : 3
   (multiplicities 1, 3, 6, 2; measured max rel. error 3.5×10^{-8}).
2. r_* / ye = N/(4 c_even) = 8.558345504799715×10^5.
3. Ω_* / r_*^2 → −c_even = −1.3555131567782033×10^{-6}.
4. Ω_* / ye² → −N²/(16 c_even) = −9.928493770202099×10^5.
5. Even radial curvature = 2 c_even.

Leading Laplacian correction: the 6 splits into two triplets
    E_{6,±}(g) = g √(1/6) ± √5 + O(1/g),
so the absolute split is 2√5 (relative error ≤ 3×10^{-12} on H13 for
g ≥ 10³, including the physical g_*). Centroids obey E = g σ + β/g
with constant term consistent with 0. At the physical H13 vacuum the
grouped spectrum is 0 (×1), 13 (×1), 3.125066×10^5 (×3),
3.493908×10^5 (×3), 3.493952×10^5 (×3), 4.687599×10^5 (×2).

## Coupled cycle 21 — standalone verification of condensation
Classification: PROVED. A numpy-only script with no other-cycle imports
reproduces χ, y_c, the finite vev, the A4 stabilizer and the 2 : √5 : 3
singular-value ratios of cycles 18/19 inside the predeclared tolerances.
On H13, χ and y_c match cycle 18 to all reported digits; r_* matches
N/(4 c_even) at 10^{-16} and cycle 19 at 0.100% (cycle 19’s own scan
offset from the analytic value). Frame sha256 values match the cycle-11
archives. The script lives at
`coupled_cycle21_independent_verification/test_verify_condensation.py`.

## Alt-route integration (cycles 31–33)
These routes were not duplicated. Numbers below are from the finished
reports and the LEDGER_ALT frontier update. No Yukawa ray was derived,
so the one-loop / EM / ARF pipeline was not run.

### alt31 — spontaneous flux (PROVED on H1–H3; unique pattern CONDITIONAL on κ)
The London instability of alt29 is a genuine instability of the
condensed A4 phase. Primary A lives on the 30 icosahedral edges.
The Maxwell coefficient κ is not uniquely derived (κ = 0 is the
fermion-only alt29 action; κ = 1 is the Hodge unit identification).

At κ = 0 the minimiser is the all-π connection (every face holonomy
−1) at T = η and T = 0. The unpaired mode is lifted to E = 10
(K[π] v0 = 10 v0). Fermion gain: −5.000 at T = 0 and −1.880 at T = η.
The domain (ℝ/2πℤ)^{30} is compact, so the minimum is finite without
new parameters. Combined (Δ, A) stabilizer remains A4; the flux
pattern itself is A5-invariant. Time reversal is not broken and no
handedness is picked. Absolute Ω = c_even r² + F(r, A) keeps
r_* = 8.61261×10^5 (relative shift 0).

At κ = 1 the Maxwell cost of all-π (40 compact, or 10π² noncompact)
overwhelms the O(1) fermion gain. Gradient deformations A = dλ cost
no Maxwell and lift the unpaired mode at zero flux, so A = 0 is not
in general restored. The qualitative vacuum — all-π flux versus a
zero-flux phase winding — is conditional on the underived κ.
Pred sha256: `ca3dc438de76083657f7edd0b4e7b22362122047aa4182a27d69647b444d6eb3`.

### alt32 — spectrum of the spontaneous-A vacuum (PROVED, H1–H3)
In the κ = 0 vacuum the unpaired mode is lifted to E = 10 and the
pairing spectrum remains 3 ⊕ 6 ⊕ 2 (ratios 2 : √5 : 3, with the known
Laplacian 3⊕3 split of the 6). Not three nondegenerate charged
singlets. The unique |\Phi| is π, which matches the predeclared U(1)
quantum π as an identity and does not match 2π/φ² (rel 0.309), γ
(rel 253) or δ* (rel 20.3). The two discrete κ choices disagree
(κ = 1 seed minimum is A = 0). C_mass and R_mass were not compared.
Pred sha256: `5a953fcfa10fe4b61f5697125390893847acb3e4c788241fac6393d8df6b98fc`.

### alt33 — 2I spinor lift (PROVED, H1–H3)
Primary carrier: vertex12 ⊗ 2 (dimension 24, no 2I-singlet); the extra
H13 singlet ⊗ 2 is a decoupled spectator. The spin connection gaps
K_spin (λ_min = 0.746746 = 2 cos(π/10) related face holonomy
2 cos(π/10)). Pairing Δ ⊗ ε on K ⊗ I_2 still sees the two-dimensional
kernel of the scalar theory — it is the spin connection, not the
pairing, that removes the zero. The even channel still condenses
(χ = 0.076728 ≈ 2 χ_spatial, y_c = 0.004203, r_* = 1.73493×10^6,
nuclear norm twice the spatial value). After condensation the unpaired
zero is absent (E_min equals the K_spin gap). The spectrum is
2 ⊕ 6 ⊕ 12 ⊕ 4 — the spatial 0 ⊕ 3 ⊕ 6 ⊕ 2 tensored with the spin 2 —
not three distinct levels.
Pred sha256: `5a4062431318f8721cea277d629ddc867876297230efa45d05e6e7843913a11a`.

## Next question
The residual 2-plane is irrelevant for pairing-dominated ratios
(0 : 2 : √5 : 3 and the Ω/vev relations, with a 2√5 Laplacian split
of the 6) but remains physically present: it sets the overall pairing
scale relative to tree and Hodge energies, and yo still enters the
odd hidden curvature. Spontaneous all-π flux (when κ = 0) lifts the
unpaired mode to 10 without breaking A4 or picking a handedness;
the spinor lift removes the zero by the spin connection and doubles
the multiplets to 2 ⊕ 6 ⊕ 12 ⊕ 4. Neither route produces three
nondegenerate charged singlets, and κ is not uniquely derived. A
later cycle should proceed only if a new derived principle is proposed.

No ARF was derived in this block.
