# Q108 — First photon-like gauge stiffness directly from Born transitions, not a Wilson-plaquette action

2026-11-14. **THEOREM for the specified finite Q106 charged moving transfer and Born observation; physical Maxwell/ARF still OPEN.** No observed numbers or historical ARF equations used.

## Native source and modelling scope

Q101 reconstitutes the complete original five-Platonic 190-cochain and 50-vertex source via hidden 4_3/4_5 and 64-history isometry, producing the 60 minima and two 30-node moving-frustration graphs. Q105 derives the charged16 spontaneous weak axis Q_s and the shortest SU2 transporter U_ab. Q106 proves the exact degree-7 quaternionic charged spinor spectral law. Q107 proves the Berry charged line bundle over each 30/60/32 configuration sphere has Chern ±7 and the old unit Wilson action is just a conditional choice.

Q108 **re-executes original Q107/Q106/Q101 certificates** and uses precisely the 30-state positive-charge spin band in the **existing Q106 unit shortest transport**, not an invented constant-phase magnetic graph.

At each vertex a, take the +1 eigenvector v_a of S_a=n_a·σ. For each original edge (a,b), define

    h_ab = <v_a | U_ab | v_b>,
    U_ab = (I+S_a S_b)/sqrt(2(1+n_a·n_b)).

The chosen local sections have arbitrary individual U1 phases, but h transforms by vertex U1 conjugation. Each |h_ab|=1, its triangle and pentagon phase equals the exact Q107 charged Berry phases. This is a **specified Q106 kinetic completion**, not claimed unique in all revised URT dynamics.

Introduce a compact external unit-charge link phase A_ab via h_ab(A)=h_ab exp(i A_ab), h_ba(A)=h_ab(A)*. At dimensionless step τ, the **direct Born** transition law is

    T_ij(A,τ)=|exp[-iτ h(A)]_ij|².

T is bistochastic, positive and exactly invariant under vertex gradient shifts A→A+dλ (conjugation of h). Assume a projective observation of the configuration after one step from uniform initial position. The unique *classical Fisher information matrix* of that stated observation is

    F_ef(τ) = (1/30) Σ_ij [∂_e T_ij ∂_f T_ij / T_ij].

No Wilson-plaquette term or arbitrary gauge-kinetic prefactor was inserted. This is a canonical **information metric on observable transition probabilities**, conditional on the quantum h, τ and the projective measurement interpretation. It is NOT a physical action until such an identification is derived.

## Exact leading Fisher theorem

The original 30-state graph has 20 triangles, with each edge in one triangle, and no 4-cycles: nonadjacent vertices have at most one length-two path. Therefore the first link-phase-dependent Born probability term on an adjacent transition is of order τ³ from interference between a direct one-hop and the alternate two-hop path around its unique triangle. The link phase enters through the triangular gauge flux F_f. Every directed edge is equivalent under native A5 symmetry.

Let t=|h_ab|=1 and θ3=Arg z3 with Q107 z3=[7−3√5+i(1+√5)]/16. On each directed edge, T_ij = t²τ² + O(τ³) and its phase-flux derivative has leading magnitude t³|cosθ3|τ³; the **six directed edges per triangle** give the exact Fisher leading coefficient

    c4 = (6/30) t^4 cos² θ3 = t^4 cos² θ3 /5.

All nonedges have at most one length-two path and do not contribute at τ⁴; unitarity T(-τ)=T(τ)^T makes F even in τ. With D_triangle the original 60×20 oriented triangular face-to-edge incidence,

    F(τ) = c4 τ^4 D_triangle D_triangle^T + O(τ^6).

Since cosθ3=(Re z3)/|z3| and |z3|=((5−√5)/8)^(3/2), exact simplification for **Q106 unit transport** gives

    **c4 = 1/10 − 11√5/250 = 0.0016130089900092534.**

This leading matrix has rank exactly **20**. The independent numerical Frechet-derivative certificate measures convergence of the complete 60×60 Fisher matrix to that analytic leading operator, with relative norm errors 0.06922 at τ=0.05 and 0.01738 at τ=0.025.

At τ=2π/24 (a declared 24-track step convention) the FULL native Fisher matrix has **31 strictly positive coexact modes and 29 exact gradient-gauge zero modes**. Positive eigenvalues range approximately 1.35367×10^-5 to 5.40840×10^-5. Its trace is approximately 0.001239733. The other 11 coexact eigenvalues empirically exhibit τ⁶ scaling as τ→0, associated with the pentagonal sector; **their exact τ⁶ coefficient is not yet proved**. This is a genuine hierarchy of the probability response in the defined model, not a particle-mass or physical gauge prediction.

## A necessary distinction from raw spinor overlap

An alternative equally source-covariant non-fitted hopping is

    h_ab^(overlap)=<v_a|v_b>.

It has the **same Berry plaquette phase** but |h_ab|²=(5−√5)/8, rather than 1. Its leading Fisher coefficient is

    **c4^(overlap) = 13/160 − 29√5/800 = 0.0001925358156326235.**

This is the coefficient of the raw-overlap completion; it must NOT be attributed to Q106's unit SU2 shortest transport. Both variants were executed and compared to their exact analytic small-time limits and full spectra. Their distinct values show precisely why **a normalized local quantum transport rule**, not just Chern number or symmetry, is needed to identify physical photon stiffness.

## Why the physical ARF is not yet derived and the direct next attempt

Q108 computes a normalized *finite quantum information metric* from Born probabilities with no inserted bare Maxwell action. It is not a continuum 4D physical Maxwell photon: it acts on 60 edges of the abstract 30-state *configuration* sphere, not the 528 original v61 real-spacetime Wilson links. It also depends on the choice of moving hopping and dimensionless observation time. The existing native v61 charged sea K_joint, 24-clock and H13/H51 transfer have no uniquely derived full joint CP instrument or current-to-gauge embedding.

**RESUME:** derive a unique completely positive transfer/instrument that couples this Q106 charged moving band, the *actual* original v61 192 spatial Wilson source and the complete 190+64+24 URT history/clock. Compute the same-instrument gauge-invariant current response/Maxwell inverse residue (not an added Wilson term). Verify pure-gauge/second Ward and physical clock calibration. If no unique instrument follows, do not identify c4 or Chern7 with electromagnetic alpha. Do not choose the kinetic option because it happens to match old ARFs.

### Execution

    OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python research_archive/2026-11-14_q108_born_fisher_photon/Q108_BORN_FISHER_GAUGE.py

Executed in local container: Q101 five-solid 190/50/H64 and Q106/Q107 exact proofs plus two native spinor kinetic models; exact leading coefficient verified symbolically, Frechet derivatives (60 gauges × full 30×30 unitary), Ward annihilation, 31+29 spectrum and short-time regression all PASS. GitHub registered CI pending.
