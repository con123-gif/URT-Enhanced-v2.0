# Coupled cycle 12 predeclaration — Ward / matching / RG for y_even : y_odd

Cycle 11 left a 2-plane of inversion-allowed hopping pairing-currents,
spanned by an odd current (to hidden 4_3) and an even current (to hidden
4_5). This cycle tests whether any Ward identity or consistency condition
of the joint hidden-plus-H13 system forces a unique ratio
r = y_even / y_odd, including one-loop renormalisation of that ratio.

Tests, fixed before computing:

W1. Inversion, A5 and the geometric U(1) Ward identities of the hopping
    action S_K + y_odd ⟨h_3, T_odd(ψ,ψ)⟩ + y_even ⟨h_5, T_even(ψ,ψ)⟩.
    Each current is already an intertwiner of the matching parity and
    charge. The identities will be checked on the three theories
    (y_odd, y_even) = (1, 0), (0, 1) and (1, 1). If all three satisfy
    them, the identities do not fix a ratio.

W2. Hidden-sector linear equations for h_3 and h_5 (different A5
    irreps, opposite inversion parity, inverse Hessians 2 c_3 versus
    2 Δ² c_5). A joint Ward that mixed the two hidden blocks would be
    needed to relate y_odd to y_even; the block-diagonal Hessian of
    cycle 03 will be cited as evidence that no such mixing exists.

M1. Numerical values of the named extra matching recipes, for the
    record, not as derivations:
    - V_hist weights: r = Δ² and r = Δ
    - F source scales: r = σ(4_5)/σ(4_3) and r = ||B(Sym² 5)|| / ||B(3⊗5)||
    - canonical hidden fields: r = sqrt(H_5 / H_3)
    These will be compared with each other. Disagreement among them is
    a look-elsewhere count of matching rules, not a selection.

R1. One-loop Yukawa beta functions in a mass-independent scheme whose
    tensor factors are built from the cycle-11 hopping frames T_odd and
    T_even. Inversion forbids generating one Yukawa from the other, so
    β_odd ∝ y_odd and β_even ∝ y_even: both axes are always fixed rays.
    Coefficients (A_o, B_o, A_e, B_e) in
        β_o = y_o (A_o y_o² + B_o y_e²),
        β_e = y_e (A_e y_e² + B_e y_o²)
    will be computed from fermion wave-function, hidden wave-function
    and 1PI vertex contractions, in three variants:
    (i) equal diagram weights;
    (ii) Hodge-weighted fermion lines (canonical λ_3 = 6−√5, λ_{3'} = 6+√5,
         λ_5 = 7);
    (iii) variant (ii) with hidden propagators from the cycle-03 Hessian
         (conditional on that hidden quadratic form).
    A mixed fixed ratio r_*^2 = (A_o − B_e)/(A_e − B_o), if positive, is
    recorded as an additional ray, not as uniqueness.

If a single ray is forced by W1–W2 or by R1 without extra assumptions,
the unused one-loop / EM / ARF pipeline of cycle 11 will be run in a
subsequent predeclared cycle, conditional on the cycle-08 linear-average
history Hessian. If not, the obstruction is the family of Ward-valid,
RG-closed theories along at least the two inversion axes, together with
the disagreement of the matching recipes in M1.

No ARF target is inserted unless a ray is forced. Classification
PROVED / CONDITIONAL / FALSIFIED / OPEN.
