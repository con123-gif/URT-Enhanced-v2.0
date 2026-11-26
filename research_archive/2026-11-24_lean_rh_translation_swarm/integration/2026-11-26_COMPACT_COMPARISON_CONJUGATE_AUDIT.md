# C audit: two conjugate norms in the comparison determinant

26 November 2026. Independent source-level mathematical audit of
dependency RUN61 / commit 5c2a8c47, section 4. Correction required and
supplied below. Compact pin
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. No new Lean run.
The native source has the correct two-automorphism inequality; this
is a correction to the human reconstruction, not a source defect.

## 1. The precise error and an exact negative control

Write c for ordinary complex conjugation and sigma^c=c sigma c.
RUN61 chooses eta=c sigma^(-1)c sigma(zeta), and correctly observes
sigma<eta,zeta>=Q_sigma(zeta) for the rational real table Gram matrix.
Its additional assertion Q_sigma(eta)=Q_sigma(zeta) is generally false.
The correct identity is

    sigma^c(eta)=sigma(zeta),
    Q_(sigma^c)(eta)=Q_sigma(zeta).                              (1)

An exact one-coordinate negative control: let a=cuberoot(2)>0,
omega a primitive cube root of unity, and choose a complex field
automorphism extending sigma(a)=omega a, sigma(omega)=omega on
the splitting field of X^3-2. Take zeta=1+a. Then
eta=1+omega^2 a, so

    |sigma(eta)|^2=(1+a)^2,
    |sigma(zeta)|^2=1-a+a^2.

Their difference is 3a>0. This is an algebraic counterexample,
not a numerical experiment or an assumption about continuity.

## 2. Cauchy--Schwarz has exactly the two norms needed

For any rational real symmetric positive Gram matrix G,

    sigma(v^*G w)=(sigma^c v)^*G(sigma w).

Hence |sigma<v,w>|<=||v||_(sigma^c)||w||_sigma. For level forms
the same identity holds termwise in their positive rational
weighted class sum. This is precisely
`LevelForm.norm_map_inner_le`, not an ordinary same-sigma inequality.
No claim that sigma commutes with c or preserves a complex norm is
permitted.

## 3. Corrected eigenvalue and determinant argument

Retain the SAME table space, H=smallHookNumber>0, gl, subspace L,
tested condition and sep from the actual LiftVolumeHeight caller.
The peer archimedean comparison bound has the needed quantifier

    H ||gl(xi)||_rho^2<=exp(beta) Q_rho(xi)
                         for EVERY complex automorphism rho.   (2)

The tested projection bound is also available at every rho, in
particular at rho=sigma. Put M=H pr_L gl gl^*|_L. For an eigenpair
Mz=lambda z with z nonzero, set zeta=gl^*z and take eta as above.
Sep makes zeta nonzero, so Q=Q_sigma(zeta)>0. Adjointness and
the rational table Gram matrix give sigma<gl eta,z>=Q. Pairing the
eigenvector equation in the SECOND, linear argument gives

    |sigma(lambda)| Q
       <=H ||gl eta||_(sigma^c) ||pr_L gl zeta||_sigma
       <=H ||gl eta||_(sigma^c) ||gl zeta||_sigma
       <=exp(beta) Q.                                         (3)

The second line uses the tested condition on gl zeta, not on
gl eta. In the last line apply (2) to (eta,sigma^c) and
(zeta,sigma), then use (1). This is the necessary repair to
RUN61's written inequality. It changes no constants or witnesses.

Cancel Q>0. Every eigenvalue, counted with its characteristic
polynomial multiplicity, satisfies |sigma(lambda)|<=exp(beta).
The algebraic determinant product then yields

    |sigma(det M)|<=exp(dim(L) beta).

For L=0 the determinant is one and the statement holds directly.
Diagonalizability and a norm-preserving automorphism are unnecessary.
At the actual untwisted caller beta=2r B0, as in RUN61's size proof.

## 4. Integration and status

Read actual bodies:
`Lib/Adelic/CuspForms/LevelForms.lean`, normSqAt and
norm_map_inner_le (lines 160--174);
`New/Rows/LiftVolumeHeight.lean`,
norm_det_compressedGramOp_arch_le (87938141d4103b485fd5a7125721798f65f973f1);
`New/Selmer/FitTwists.lean`, normSqAt_starProjection_le
(c62935a73ccbef6c7fc42f45c83f111e811a5825).
The source applies its size hypothesis twice with these two
automorphisms. This audit repairs that exact bridge. It is not
an independent audit of every numerical class/line bound in RUN61,
and does not supply the separate p-adic Auerbach, comparison
detection, reciprocity or Selmer inputs.

The original peer file is retained for provenance. Integrate its
archimedean determinant argument only with (1)--(3). No new
Lean/Lake execution, native PASS or full human-proof audit is claimed.

RESUME HERE: use this corrected pairing in the common determinant
witness; audit the p-adic Auerbach coordinates and exact local
denominator at the actual LiftVolumeHeight caller next.
