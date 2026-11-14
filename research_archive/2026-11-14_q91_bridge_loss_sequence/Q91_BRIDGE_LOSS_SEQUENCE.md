# Q91: the bridge's loss forms are not in the K_c family, and no weighting of the variance-loss sequence carries c (ACTIVE PROBLEM A, attempt A3 coefficient)

Date: 2026-11-14 (Claude, scheduled session). Gate A.
Status: **OBSTRUCTION (scoped) + THEOREM.** Everything is exact, over Q or over K = Q(√2, √3). No floats in the
certificate, nothing fitted. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **c is not derived.** Gate A stays
open.
Certificate: `Q91_BRIDGE_LOSS_SEQUENCE.py` (check `research.q91_bridge_loss_sequence`). Executed in Claude's cloud
sandbox: exit 0, 710 checks, about 20 s wall (most of it re-running the Q82 certificate for the quartet projectors).

## Task and reading
Q86 showed H_bits = 60·Reynolds[Qᵀ(I − QᵀQ)Q] = 60·d₁, the second term of the URT variance-loss sequence
d_n = G_n − G_{n+1}, G_n = Reynolds[(Qⁿ)ᵀQⁿ]. So K_c = H + c·Abar₁ = 60·d₁ + c·Reynolds[(I − Q)ᵀ(I − Q)], and c is
the weight of the one-step Dirichlet form against the second-step loss. Q91 asks whether the selected Q72
uniform-marginal bridge B_{D₀} fixes that weight: compute its loss sequence d_n^B and decide whether one quadratic form
of B reproduces H + c·Abar₁ on the quartet isotypic V for a single c.

Reading adopted (no one to ask):
- "Quadratic form of B" means the Reynolds averages, pulled back through D₀ as in Q86, of d_n^B (n = 0…3) and of the
  bridge Dirichlet form Abar^B = Reynolds[(I − B)ᵀ(I − B)].
- "Reproduces H + c·Abar₁ on V" means F|_V ∈ span{P_V, H|_V, Abar₁|_V}. If so, c is read off as the ratio of the
  Abar₁ and H coefficients.
- V = E₂ + E₃ + E₄ is the A5 quartet isotypic of the 64 histories, with E_k from Q82. The quartet occurs once in
  Walsh 2, twice in Walsh 3 and once in Walsh 4.
- Part 3 also asks the same question for every real weighting of Q's own loss sequence. That is the natural
  generalisation once the bridge fails.

## Part 1: the bridge is exact in Q(√2, √3)
On D₀ = (0,2,4,6,10,9), each URT block [[a,b],[c,d]] of S_{D₀} has cross ratio ad/bc ∈ {1/3, 2/9, 1/9, 4/9}. The Q72
bridge block is [[t,1−t],[1−t,t]], with t/(1−t) = √(ad/bc). This gives:

| ad/bc | t | blocks |
|---|---|---|
| 1/3 | (√3 − 1)/2 | 4 |
| 2/9 | (3√2 − 2)/7 | 16 |
| 1/9 | 1/4 | 8 |
| 4/9 | 2/5 | 4 |

Each value is checked exactly: t²·bc = (1 − t)²·ad, and 0 < t < 1/2. B is doubly stochastic and supported on the URT
graph. These match Q87C's condition 0 < t_x < 1/2. The certificate then computes everything over K, with basis
1, √2, √3, √6. An element of K is zero only if all four rational coordinates are zero, so "≠ 0" is exact.

## Part 2 (OBSTRUCTION): no bridge form is in the K_c family on V
Take F ∈ {d₀^B, d₁^B, d₂^B, d₃^B, Abar^B}, all exactly on D₀.

(a) **Walsh-2/4 coupling.**
- E₃FE₂ = E₃FE₄ = 0 for every F. This is central-inversion parity, as Q85 found.
- E₂FE₄ ≠ 0 for every F. Its exact Frobenius norm is nonzero in K. For Abar^B its square is about 8×10⁻⁶,
  against about 7 for the Walsh-2 block: small, but exactly nonzero.
- Every element of span{P_V, H, Abar₁} is Walsh-block-diagonal on V. The certificate checks E₂·Abar₁·E₄ = 0 and
  E₂HE₄ = 0.
- So **no bridge form is in the K_c family on V.** The bridge mixes the P5 quartet (Walsh 2) with the dark quartet
  (Walsh 4). H and Abar₁ never do this.

(b) **Even after pinching**, the forms fail. Drop the Walsh-2/4 coupling and keep only the Walsh-block-diagonal part.
- The Walsh-2 and Walsh-4 scalars f₂, f₄ fix the only possible Abar₁ coefficient: γ = (f₂ − f₄)/(a₂ − a₄), with
  a₂ − a₄ = 4/3 − 3/2.
- The Walsh-3 residual R_F = E₃FE₃ − γ·E₃Abar₁E₃ − s·E₃ is then nonzero for every F.

The same test accepts the two Q-forms that should pass. Q's d₁ = H/60 passes with γ = 0, and Abar₁ passes with γ = 1.
So the test can pass, and the bridge forms fail it.

(c) Q86's identity H = 60·d₁ **does not transfer to the bridge**. On the Walsh-2 quartet, 60·d₁^B ≠ 16 = H. Its exact
value is in the certificate output; it is about 14.49, against about 16.66 on Walsh 4.

(d) **The parity history is not one-step-dead under the bridge.**
- Under Q, w₆₃ loses its whole norm in step 0 and nothing afterwards (Q86).
- Under B, ‖Bw₆₃‖²/64 = (1/32)Σ_x(1 − 2t_x)² = 57073/19600 − (66/49)√2 − √3/2 ≈ 0.141.
- w₆₃ loses norm at every step n = 0…3. Each d_n^B is positive semidefinite because B is a contraction, and each
  loss is exactly nonzero.
- So the bridge spreads w₆₃'s energy over the whole sequence. The clean "c = parity mass" picture of Q85/Q86 is
  specific to Q.

Overlap with earlier work: Q85 already used the Q72 bridge Dirichlet form in place of Q and found that it loses
(4,2,2,0). Part 2 is new in three ways. It is exact, in K. It finds the Walsh-2/4 coupling. And it tests the whole
loss sequence d_n^B against the K_c span, not just the weights.

## Part 3 (THEOREM): Q's variance-loss sequence never carries c
Exact rational arithmetic on all 8 orbit-1 classes. Let T_X be the traceless part of E₃XE₃, the Walsh-3 quartet block,
which is 2×2 in multiplicity.

- T_{d_n} = 0 for n = 0, 1, 4, 5.
- T_{d₂} and T_{d₃} are nonzero, but **⟨T_{d_n}, T_{Abar₁}⟩ = 0 for every n.**
- T_{Abar₁} ≠ 0. It is the 27/20 against 33/20 split of Q82.
- d_n = 0 for n ≥ 6, because Q⁶ = J/64.

**Theorem.** Take any real weights λ_n and F = Σ_n λ_n d_n. This includes every discounted or generating-function
weighting, since the sum is finite. If F|_V ∈ span{P_V, H, Abar₁}, then its Abar₁ coefficient is 0, so c = 0.

Proof: every d_n is Walsh-diagonal on orbit 1 (Q86). So membership forces T_F = γ·T_{Abar₁}. Take the inner product of
both sides with T_{Abar₁}: γ·‖T_{Abar₁}‖² = Σλ_n⟨T_{d_n}, T_{Abar₁}⟩ = 0, so γ = 0. ∎

Where c lives instead: Abar₁ = I + G₁ − O exactly, with O = Reynolds[Q + Qᵀ], the one-step overlap
(autocorrelation) form. This is checked as an integer identity on all 8 classes. I and G₁ = I − d₀ are scalar on
Walsh 3, so T_{Abar₁} = −T_O. **The direction c multiplies on V, the Walsh-3 split of the P3 poles, is carried only by
the overlap ⟨f, Qf⟩.** No norm-loss (Gram) form carries it, with any weighting. A native principle for c therefore has
to weigh the two-time overlap ⟨f, Qf⟩ against the variance loss ‖Qf‖² − ‖Q²f‖². A principle built only from norms
‖Qⁿf‖² gives c = 0.

## What this establishes, and what it does not
- **Established, exact:**
  - On D₀, no Q72-bridge form d₀…₃^B or Abar^B lies in span{P_V, H, Abar₁} on V, whether pinched or not.
  - The bridge couples the Walsh-2 and Walsh-4 quartets.
  - 60·d₁^B ≠ H.
  - The bridge spreads w₆₃'s loss over every step.
  - Every weighting of Q's loss sequence that lands in the K_c family has c = 0.
  - The c-direction on V is the overlap form's Walsh-3 split.
- **Not established:**
  - any value of c, and no claim is made for 1, 40/3, 48 or 60;
  - bridge forms d_n^B for n ≥ 4, which are not computed (the sequence is infinite, since B has full rank by Q87C);
  - combinations of several bridge forms. Those span more of the six-dimensional C-even/odd commutant on V, so a
    combination can be tuned into the span. That would be a choice, not a derivation, and is not pursued;
  - the other 7 orbit-1 classes for Part 2, which are not run (Part 3 covers all 8);
  - any pole or ARF.

## Next
Q92 [derive]: c multiplies exactly the overlap direction T_O (Part 3). Test the one native place where a two-time
overlap is weighted against a norm. That is the original 2026-11-07 action's clock Dirichlet term
½r²‖y_{t+1} − e^{2iθ_t}y_t‖², with r = π/e native, which expands into ½r²(‖y_{t+1}‖² + ‖y_t‖²) − r²·Re⟨y_{t+1},
e^{2iθ_t}y_t⟩. Under the explicitly stated reading that one clock step carries one URT history step
(y_{t+1} ↔ Q y_t), A5-average it and decide whether it fixes the ratio of O to the loss sequence, and so a c in terms
of r. Otherwise show exactly that the reading leaves the ratio free.
