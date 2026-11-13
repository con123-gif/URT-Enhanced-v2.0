# Q65: which conditioning of the chronology selects the Q64 history? (ACTIVE PROBLEM A, attempt A2)

Date: 2026-11-13 (Claude, scheduled session). Gate A.
Status: **THEOREM + OBSTRUCTION (exact finite statements). CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**
Certificate: `Q65_HORIZON_SELECTION_CERTIFICATE.py` (check `research.q65_horizon_selection`). Exact integers and
Fractions; the Perron roots and square roots enter only through rigorous rational bounds. Executed in Claude's
cloud sandbox: exit 0 in 13 s.

## Question

Q64 (attempt A1) selected one Q24 dictionary orbit (orbit 1, 8 A5 classes, e.g. D = (0,2,4,6,10,9)) and the lift
σ₁ by maximising L(D,σ) = ∏_h S_D[h,σh]/(S_D[h,2h]+S_D[h,2h+1]). The functional was stated, not derived. A2 asks
whether it is forced, in particular whether it is the large-deviation (natural-extension) conditioning of the
chronology K_D = S_D/120 on the URT successor rule.

Reading adopted (no one to ask): "forced" is tested against the canonical ways of conditioning the original
chronology K_D on the URT kinematics h → {2h, 2h+1} and on reversibility. All objects are the original Q3 twirl of
the primitive Q2; nothing is fitted.

## Setup

M_D = S_D restricted to the URT graph (de Bruijn B(2,6); all 128 weights positive, so M_D is primitive),
u_n = M_D^n 1. Conditioning the K_D chain on the next n steps being URT-admissible gives the time-0 kernel

  p_n(h → k) = M_D[h,k] u_{n−1}(k) / u_n(h).

p_1 is Q64's p_D. For a reversible history σ (a bijection of the 64 histories) the u-factors telescope:

  L_n(D,σ) = ∏_h p_n(h → σh) = raw(D,σ) · ∏_h u_{n−1}(h) / ∏_h u_n(h),  raw(D,σ) = ∏_h M_D[h,σh].

As n → ∞, p_n → the Doob transform of M_D and L_∞(D,σ) = raw(D,σ)/λ_D⁶⁴ (λ_D the Perron root).

## Results

1. **The lift is horizon-independent (theorem).** For every class D, the σ-dependence of every functional in this
   note is raw(D,σ) (up to a D-dependent constant), so the maximising lift and its ties are those of Q64 on every
   class. On orbit 1 it is σ₁, unique.
2. **The dictionary is horizon-dependent (obstruction).** The maximiser over all 768 classes, exact for n = 1..30:
   - n = 1, 2: orbit 1 with σ₁ (Q64's answer; margins 4.545, 1.464);
   - n = 3..11: orbit 3 (Q64's runner-up, exceptional, σ₁ unique);
   - n = 12..30: a further orbit X = {(0,2,4,7,9,10), (0,2,7,4,10,9), (0,2,9,11,7,5), (0,2,10,8,4,6),
     (0,3,4,6,9,11), (0,3,7,5,10,8), (0,3,9,10,7,4), (0,3,10,9,4,7)}, which is not exceptional (no C3 ⊂ A5 fixes a
     lift there, Q61) and whose best lift is **not unique** (4 tied bits, 16 lifts).
   - Doob limit n = ∞: X, strictly (Collatz–Wielandt bounds, λ_X ≈ 7.5277455 versus λ ≈ 8.8746252 on orbit 1).

   So **the Q64 functional is not the large-deviation conditioning**: the natural-extension route of A2 selects a
   different orbit with no unique history. The finite-n values beyond n = 30 are not certified; only n ≤ 30 and
   the limit are.
3. **One-step Bayes reading (theorem).** With p_1 as the dynamics and a uniform prior on dictionaries,
   P(D, σ | every history steps once, the step is a bijection) ∝ L(D,σ): Q64's functional is exactly the joint
   posterior. Its marginal Z_D = P(bijection | D) and the conditional mode P(σ | D, bijection) are also maximal on
   orbit 1. If instead URT admissibility is treated as *data* under K_D, the evidence P(admissible ∧ bijective | D)
   and P(admissible | D) are maximal on orbit 5. (A uniform prior is forced only within Q24 orbits by the
   symmetry; across orbits it is the neutral choice, stated here.)
4. **Horizon-free bridge (theorem).** The KL-closest doubly stochastic kernel to M_D on the URT graph (Sinkhorn /
   uniform-marginal Schrödinger bridge) splits into 32 2×2 blocks [[t,1−t],[1−t,t]], t = √(ad)/(√(ad)+√(bc)).
   Its likelihood of σ is ∏_x max(ad,bc)/(√(ad)+√(bc))² at the raw-argmax lift. It is **uniquely maximised on
   orbit 1 with σ₁**, margin > 3.12 over every other class. A doubly stochastic kernel preserves the uniform
   measure at every step, as a reversible history does, so this conditioning has no horizon.

## What this establishes

- Conditionings that impose reversibility on the one-step law (one-step Bayes, the uniform-marginal bridge)
  select Q64's orbit 1 and σ₁. Conditionings that impose URT admissibility over a long horizon (n ≥ 3, Doob)
  select other orbits; the long-horizon one has no unique lift.
- Hence A1 is **not yet forced**. The question is now sharper: which of the two conditioning types is the native
  one. The bridge is the better candidate, because a reversible history is measure-preserving at every step and
  the bridge is the unique (KL) kernel with that property on the URT support. That uniqueness is a known property
  of Sinkhorn scaling, not something this certificate proves.

## Open

- A2 continued: derive that the native chronology must be the uniform-marginal bridge rather than the
  admissibility-conditioned chain (for example from Q3's A5-covariance plus measure preservation of Q's lifts),
  or find an original operator that decides between them.
- A3, A4 unchanged. Note for A4: the n-step path likelihood along σ is L_n-type, so A4's robustness test is now
  known to fail for the admissibility conditioning at n ≥ 3; it should be run with the bridge.
