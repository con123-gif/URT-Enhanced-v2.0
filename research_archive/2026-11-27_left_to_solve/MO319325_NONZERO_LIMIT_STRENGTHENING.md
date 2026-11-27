# MO319325: the same counterexample with nonzero singular limits

This is a strengthening of the already checked disproof for the SAME problem,
not an additional solution. The selected, pinned Lean certificate remains the
unchanged two-dimensional proof. The block extension below is a mathematical
proof; no separate Lean execution for this variant is asserted.

Use the two-dimensional matrices and sequences in the selected certificate:
A2=diag(-1,-2), P2(k), X2(k), with A2 P2+P2 A2^T=-X2, both SPD inputs tending
to zero, and normalized outputs alternating diag(2,4) and diag(4/3,14/3).
Define the three-dimensional block matrices

    A3=diag(A2,-3),
    P3(k)=diag(P2(k),1),
    X3(k)=diag(X2(k),6).

The eigenvalues of A3 are -1,-2,-3, so it is Hurwitz. For any nonzero vector
(v,s) in R^2 x R, its P3 quadratic form is v^T P2 v+s^2>0; similarly its X3
quadratic form is v^T X2 v+6s^2>0. Thus every P3(k),X3(k) is positive definite.
Block multiplication gives

    A3 P3(k)+P3(k) A3^T
      =diag(A2 P2(k)+P2(k) A2^T,-6)=-X3(k).

Entrywise, hence ordinary finite-dimensional norm convergence gives

    P3(k)->diag(0,0,1),   X3(k)->diag(0,0,6).

Both limits are NONZERO, positive semidefinite and singular. The principal
positive square root of P3(k) is diag(sqrt(P2(k)),1), because this block matrix
is positive definite and squares to P3(k); uniqueness of the principal root
identifies it. Consequently

    P3(k)^(-1/2) X3(k) P3(k)^(-1/2)
      =diag(P2(k)^(-1/2) X2(k) P2(k)^(-1/2),6).

Its (0,0) entry still alternates between2 and4/3. The same cofinal even/odd
subsequence contradiction therefore proves nonconvergence. Thus even adding
nonzero singular-limit requirements would not restore the claimed universal
conclusion.

Official statement prerequisite: https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/9686 .
Selected full Lean2x2 disproof: https://github.com/con123-gif/open-math-agents/actions/runs/46039599862 .
Source: Ludwig, https://mathoverflow.net/questions/319325 , CC BY-SA4.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex; root and
scouting lanes jointly checked the block extension. Standard block-matrix,
Lyapunov and principal-root mathematics are acknowledged.
