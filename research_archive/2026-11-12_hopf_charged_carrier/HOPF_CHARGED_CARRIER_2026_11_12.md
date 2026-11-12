# Hopf charge sectors of 2I and the canonical charged carrier of the hidden quartets (2026-11-12)

Status: WORK IN PROGRESS / NOT VERIFIED ON CI — floating-point certificate with exact closed forms asserted;
executed in Claude's cloud sandbox, exit 0. User-directed (Con, chat): use the Hopf geometry of the Platonic axes.

## Prior work (ledger)
- Hopf U(1) link on the icosahedral shell, c₁ = 1, 19 cycle holonomies, and the charge-one magnetic shell
  12_{Q_H=1} = 2 ⊕ 4 ⊕ 6 under 2I: `research_archive/Cathedral_Master_Index.md` (regenerated 2026-08-28). Recorded there as
  closed for the defined shell; **absent from `docs/RESEARCH_STATE.md`**, whose §5 instead targets the hypercubic v61
  operator. The Master Index's stated endpoint is "the coefficient-free equivariant Wilson-history action on the
  Hopf/2I shell".
- Theorem A of `2026-11-12_gate_b_v61_internal_symmetry/`: no A5 or 2I action exists on the gauge-covariant v61 family.
Already established: Q_H = 1 content. Potentially new: all charges, the charge-two quartet, the twisted projection.

## Construction
2I = 120 unit icosians ⊂ S³. Hopf map q ↦ q v₀ q̄ onto the 12 vertices, fibre Z₁₀ = ⟨z⟩ (z of order 10 about v₀);
likewise onto the 20 faces with fibre Z₆. Charge-n vertex sector: functions on 2I with f(q zᵏ) = ω^{−nk} f(q),
ω = e^{2πi/10}; dimension 12; 2I acts on the left and commutes with the fibre U(1).

## Results
1. Content by Hopf charge (n mod 10; n and 10−n conjugate):
   n=0: 1⊕3⊕3′⊕5 · n=±1: 2⊕4′⊕6 · n=±2: 3⊕4⊕5 · n=±3: 2′⊕4′⊕6 · n=±4: 3′⊕4⊕5 · n=5: 6⊕6.
   The A5 quartet 4 occurs only at Hopf charge ±2 and ±4, once each. Neutral vertex functions contain no quartet
   (this is why the hidden 8 is the kernel of the face→vertex incidence), and odd charges are spinorial. The
   archive's "hidden charge-two quartets" is thereby a statement of Hopf geometry.
2. Twisted projection. Π_n = orthogonal projector onto charge n; G_n = Π_face Π_n Π_face on the 20 face functions.
   On the hidden 4₃ ⊕ 4₅: G_n = 0 for n = 0 and all odd n; for n = ±2, ±4 it has rank 4 and equals
   a P₃ + b P₅ ± √(ab)·(i × the unit antisymmetric cross intertwiner), with
   n = ±2: a = (5+√5)/20, b = (3−√5)/12;  n = ±4: a = (5−√5)/20, b = (3+√5)/12
   (a₂+a₄ = b₂+b₄ = 1/2; (b₂/a₂)(b₄/a₄) = 5/9). The cross term is purely imaginary (iY type: A5-invariant,
   inversion-odd, time-reversal-odd) with |κ|² = ab exactly, and its sign is the sign of n, i.e. the orientation
   of the Hopf fibre.
3. Consequence for Gate B. The map face functions → charge-n vertex sections is linear, 2I-equivariant,
   U(1)-covariant and has fixed normalisation. It is the object §5 asks for, with matter on the Hopf shell instead
   of v61. One fibre orientation breaks inversion by a fixed amount (R-odd coefficient 2√(ab) = 0.303531 at |n|=2,
   0.491123 at |n|=4); summing n and −n restores it. This corrects the addendum of the Gate B note, which said no
   principle fixes the pseudoscalar coefficient: the Hopf orientation does, within this construction.

## Not established
The Dirac/Wilson operator on the charged vertex sections (the Master Index notes the one-sheet hop is not
Hermitian and the two-sheet lift is unimplemented); both Ward orders; a pole and residue; any value of α. The
identification of the physical join with Π_n is a construction, not a derivation. No gate is closed.

## RESUME HERE
Next single question: build the self-adjoint two-sheet (n, −n) Hopf–Wilson operator on the charge-±2 vertex
sections with the c₁ = 1 link phases of the Master Index, check Hermiticity and both Ward orders, and compute the
induced quadratic form on the hidden quartets through Π_{±2}.
