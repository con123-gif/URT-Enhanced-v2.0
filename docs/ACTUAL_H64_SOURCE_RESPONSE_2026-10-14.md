# Actual recovered H64 source response — 14 October 2026

## Provenance and precedence

This calculation uses the ORIGINAL conversation-library file Cathedral_Rederivation_2026-10-08.py, SHA-256 8c809d3ab24887d5c575af5340e702db3b8360fa3301bf4f2fc804e85eca17c9, now preserved under research_archive/2026-10-14_recovered_H64/. It is a dated **v113 scalar vacuum branch**, not the current fully species-loaded, selected October transfer. Do not promote local scalar no-go tests or provisional witnesses to claims about the full Cathedral.

The recovered code constructs the exact Walsh H64=H13+H51 orthonormal basis on the 64 sign histories, K_A5/13-graph and circulation data, and the 64x64 signed vacuum Jacobian from the recovered fixed legacy selector parameters alpha=sqrt(4/3), beta=1/4, theta_H=12/5. It saves H13 (64x13), Hidden (64x51), the selected scalar P, Jac (64x64), A (13x13), B (13x51), and D (51x51) in an NPZ. This makes the v113 response genuinely computable and avoids the placeholder 64x64 numerical witness previously used.

## Reproduced original outputs (no observation used)

Vacuum minimum E=3.8846802896719836, hidden spectral radius ||D||2=0.40408535014225916, ||B||F=0.06245730100182763, ||Sigma(1)||F=0.0024180335670430197, where Sigma(z)=B(zI51-D)^(-1)B^T. The 13x51 B has rank 13. J is negative definite with eigenvalue interval [-0.40410650012203536,-0.26597411626518974]; it is a signed linearized update, not the positive master transfer. The positive Gram completion J^T J has eigenvalue interval [0.0707422305230487,0.16330206344088058], and its projected Sigma(1) norm is 0.0015182471642734739.

The original hidden memory ||B D^n B^T||2 at n=(0,1,2,3,5,10,20,30) is approximately
(3.1414347849e-3, 9.5993747149e-4, 2.9431467794e-4, 9.0630703573e-5, 8.7564134425e-6, 3.1510969799e-8, 1.5121640602e-12, 1.2617807776e-16). This older scalar branch is contracting; it alone gives no persistent galactic halo and does not adjudicate the later nonlocal/typed history program.

## Actual source derivatives, not fitted halo profiles

On the frozen v113 sphere ||x||=r, the source-free energy is
E(x)=1/2(1/beta-alpha)||H13 x||^2 + alpha theta_H sum_j[1-cos((H13 x)_j)].

Load either of the two pre-existing A5 singlet sources s=0 or s=1 as E(x)-j x_s, without adding any continuous model parameter. Let Q be an orthonormal tangent basis at the recovered optimum x*. With the constrained Lagrange multiplier mu=x*·grad E/||x*||², compute

H_t=Q^T[Hess E(x*)-mu I]Q,    x_s'=Q H_t^(-1) Q^T e_s.

The tangent-Hessian minimum eigenvalue is 0.03118729395539, so these linear responses are locally well defined. The two susceptibilities e_s·x_s' are respectively 14.831618306399 and 22.642510822623.

Let J(x)=alpha beta [I-theta_H diag cos(H13 x)]. Its exact source differential is dJ=alpha beta theta_H diag[sin(H13 x*) (H13 x_s')]. With B=H13^T J Hidden, D=Hidden^T J Hidden and R=(I-D)^(-1), the full derivative of Sigma(1)=B R B^T is

dSigma=dB R B^T + B R dB^T + B R dD R B^T.

Calculated for signed J:
- singlet 0: ||dSigma||F=0.015813902613697, trace=-0.007070209451760; finite difference error 5.8e-10;
- singlet 1: ||dSigma||F=0.037731851200446, trace=+0.012347128428718; error 3.1e-9.

For positive Gram G=J^T J, differentiate G directly, dG=dJ J+J dJ, and use its projected B_G,D_G:
- singlet 0: ||dSigma_G||F=0.008570640874093, trace=-0.000377811021150; finite difference error 2.3e-10;
- singlet 1: ||dSigma_G||F=0.020709592665762, trace=-0.003313789843245; error 1.2e-9.

All checks pass using the recovered source code; the positive Gram response is nonzero, so the observed history sensitivity is not solely an artefact of the signed Jacobian.

## Physical verdict: no invented 'proof of Nature'

These are actual finite source-response measurements in the recovered v113 branch. They do not provide a unique physical baryonic-source combination, mass scale, spatial field propagation, Einstein stress tensor, lensing potential, cold-dark-matter clustering, or a galaxy prediction. The two A5 singlets are both allowed but have different response coefficients, making it unjustified to pick one retrospectively because it matches a galaxy. The positive Gram G=J^T J is a legitimate positive completion for this *test*, but is **not claimed to equal the later canonical selected T_star**. The October 8 common-action work also distinguishes the fully selected source contacts and physical metric dictionary from the older scalar restricted computation.

This is not a no-go for the full Cathedral. Equally, finite algebra plus compatible slopes does not prove the dark-matter interpretation. Science requires the source/distance/metric dictionary to be derived independently and checked against galaxies, lensing and CMB without observational tuning.

## Reproduce

1. Install numpy/scipy.
2. Run python research_archive/2026-10-14_H64_physical_gate/recovered_H64_gram_audit.py.
3. The audit invokes research_archive/2026-10-14_recovered_H64/Cathedral_Rederivation_2026-10-08.py in a temporary directory and recomputes the derivatives.

Retained previous work: docs/DARK_INFORMATION_HISTORY_CONTINUATION_2026-10-13.md and docs/H64_DARK_INFORMATION_FULL_OPERATOR_AUDIT_2026-10-13.md, now understood as limited/conditional representations, not a replacement for this recovered original operator.
