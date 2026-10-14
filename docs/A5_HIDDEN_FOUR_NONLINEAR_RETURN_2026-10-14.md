# Cathedral / URT — A5 hidden-four nonlinear return
14 October 2026 | Continuation at the linear Hom_A5(H13,4)=0 obstruction.

## Provenance
Primary frontier: recovered conversations. Computation uses the ORIGINAL October 8 reconstruction, preserved under research_archive/2026-10-14_recovered_H64/, and its **v113 scalar vacuum**. The signed Jacobian is not the later canonical positive T-star; we calculate a labelled Gram-test G = J^T J. Reproduce: research_archive/2026-10-14_hidden4/A5_hidden4_positive_return.py.

## Exact representation decomposition
The 60 proper icosahedral rotations act by signed permutation of the six antipodal axes, hence on all 64 Walsh histories. The A5 four-dimensional character is chi4=(4,0,1,-1,-1). Its projector is
P4 = (4/60) sum_{g in A5} chi4(g) U_g.
Projection error Frobenius 5.60e-16; ||P4 H13||_F = 5.21e-16; rank P4=16.

Full character decomposition, confirmed with all 60 actions:
H64 = 4 (1 + 3 + 3prime + 4 + 5) = 4 x 16.
H13 = 2 x 1 + 3 + 3prime + 5.
H51 = 2 x 1 + 3 x 3 + 3 x 3prime + 4 x 4 + 3 x 5.
The extra centre site adds the second H13 singlet beyond the 12-shell's 1+3+3prime+5.

Four hidden quartets arise at Walsh degrees 2 (one), 3 (two), and 4 (one). They are **not automatically identical** with the older entropy-rail 4_3 + 4_5 pair; that identification remains to be derived. The four 16-dimensional representations are not uniquely distinguished dynamical layers without a multiplicity-space selector.

The linear obstruction Hom_A5(H13,4)=0 does not imply nonlinear decoupling. Direct symmetric-square character calculation:
dim Hom_A5(Sym^2 H13,4) = 4,
with channels 3 x 3prime, 3 x 5, 3prime x 5, and Sym^2 5.

## Actual positive Gram return in recovered v113 vacuum
For recovered orthonormal visible/history columns U=H13, W=H51, state p=U x-star, and dated parameters alpha=sqrt(4/3), beta=1/4, thetaH=12/5:
J(x)=alpha beta [I - thetaH diag(cos(Ux))].
Use G=J^T J >= 0, Bg=U^T G W, Dg=W^T G W, P4h=W^T P4 W.

Positive instantaneous sector return:
K4(0)=Bg P4h Bg^T >= 0.
Exact positive history partition without presuming Dg and P4h commute:
K4(t)=Bg exp(-t Dg/2) P4h exp(-t Dg/2) Bg^T;
K(t)=Bg exp(-t Dg) Bg^T;
K(t)-K4(t)=Bg exp(-t Dg/2) (I-P4h) exp(-t Dg/2) Bg^T >=0.

Reproduced values:
- G eigenvalues 0.07074223 to 0.16330206.
- ||Bg||_F = 0.04259005437; ||Bg P4h||_F = 0.01445957936; rank(Bg P4h)=8.
- Tr K4(0) = 0.00020907943517, fraction of full return 11.5264%.
- Four-sector fractions at t=1 and t=5 are 11.1311% and 9.6283%.
The hidden-four return in this explicit selected-state model is therefore nonzero and positive.

For signed-J diagnostics alone, ||B4||_F = 0.01865798659; quadratic approximation from cos(p) gives ||B4^(2)||_F = 0.01880958724, relative deviation ~0.832%. This is a local model calculation, not the physical canonical T-star.

A subtlety: at the particular selected v113 scalar vacuum the direct sources P4(p^2) and P4(2 p3 p3prime) have tiny norms 2.67e-9 and 1.17e-9, respectively. **The mean quadratic source is approximately zero even though the state-dependent differential coupling and positive hidden return are nonzero**. Do not confuse source with susceptibility/return.

## Result and physical boundary
The old linear no-go was too broad if applied to all nonlinear/history routes. This calculation establishes explicit A5 hidden quartet multiplicities, four symmetry-allowed quadratic channels, and a nonzero positive feedback through the actual recovered v113 selected-state history blocks.

It does NOT identify the H64 quartets with the entropy-rail 4_3 + 4_5, derive a gravity/SM coupling, recover the later fully species-loaded T-star, or prove a theorem of nature. Continue by identifying the physically selected multiplicity subspace and calculating the four-sector return in the later exact T-star without adding freely adjustable weights.
