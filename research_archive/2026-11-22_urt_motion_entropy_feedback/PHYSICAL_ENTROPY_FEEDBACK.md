# Primitive URT gain and golden-phase interference: physically different entropy flows
22 November 2026. Standalone URT–ZPE. **THEOREM / CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for the exact one-idler canonical dilation in research_archive/2026-11-21_urt_primitive_amplifier (commit 87e15048). No Cathedral ARFs; no observational parameters.

## The physical question
User direction: treat pi, phi, e as laws of cosmic movement, not a tower of formal operators. Does the *same* primitive quantum recurrence produce entropy and an energy source simply by repeated motion? This calculation derives the one-step-to-many-step quantum consequences **before** assuming a horizon or fitting H0.

Let alpha=pi/e, theta=2pi/phi², s=sqrt(alpha²−1). The previously declared minimum-noise signal–idler transformation is a'=exp(i theta)(alpha a+s b†), b'=exp(i theta)(alpha b+s a†). It is an SU(1,1) transformation on (a,b†) with matrix M=[[alpha exp(i theta),s exp(i theta)],[s exp(−i theta),alpha exp(−i theta)]], det M=1, tr M=2 alpha cos theta.

## Result 1: phase frustration suppresses runaway in a *closed, coherent, reused-idler* system
x=alpha cos theta=−0.852197379279762, so |x|<1: both eigenvalues of M are on the unit circle, exp(±i psi), psi=acos(x). Chebyshev recurrence gives the **exact** pair number after n copies of M acting on the initial two-mode vacuum:

N_coh(n)=(alpha²−1) sin²(n psi)/(1−alpha² cos² theta).

Thus N_coh <= 1.226279093969194 and the signal's reduced entropy <= 1.531619687224777 k_B (per two-mode signal mode, natural logarithms). The entropy can **decrease**: n=3: 1.52681081438 k_B, n=4: 1.23543964141 k_B. The full two-mode state remains pure. A golden-phase rotation is dynamically important: removing it (theta=0) makes alpha cos theta=alpha>1 and the same repeated transfer hyperbolic/runaway.

There is a stronger physical inconsistency for treating this closed two-mode dynamics as the literal scalar URT growth of *an arbitrary signal mean*: (M²)_11=q²+s², not q², where s²=(pi/e)²−1=0.335705707054748. The reused idler feeds its excited amplitude back. No fitted counterterm is permitted.

## Result 2: the exact scalar URT mean recurrence can be retained by fresh uncorrelated idlers
If a fresh zero-mean vacuum idler enters each step, the channel gives <a_n>=q^n<a_0> for every initial signal mean. For a vacuum starting signal its occupation and reduced entropy obey

N_fresh(n)=alpha^(2n)−1,
S_fresh(n)/k_B = g(N_fresh(n)), with g(N)=(N+1)ln(N+1)−N ln N.

Entropy increases monotonically and has asymptotic per-step gain 2 ln(pi/e)=0.2894597716988004 nat. This does **not** mean the total closed universe gains von Neumann entropy: signal+all idlers+physical pump must be included. It means accessible/reduced entropy rises when emitted idlers are not coherently returned. Fresh uncorrelated modes or an equivalent active controller are a **physical extra mechanism**; neither is selected solely by the three constants.

For equal signal/idler frequency omega, energy conservation requires the source to spend an exact positive energy per step:
Delta E_pump(n to n+1)=2 hbar omega (alpha²−1)alpha^(2n).
This is not free extractable zero-point energy and includes a pump/reservoir requirement.

## Result 3: definite energy-capacity test against existing native lattice growth
The unchanged original magnetic-layer joining ledger (research_archive/2026-11-21_urt_zpe_three_layer_refinement) gives preparation + seam work. The minimal matched-idler source expenditure, in units of E_sheet, is 2(alpha²−1)=0.6714114141 for one fresh-idler amplification cycle, or 2(alpha⁴−1)=1.5682194717 for two cycles. The six archived n=2,3,4 lattice sizes and both native flux sectors require 1.315–1.435 E_sheet. **One source cycle is energetically insufficient; two source cycles have enough nominal source-energy capacity in all six checked examples.** This is a capacity check, **not** a proven actual energy transfer to a sheet/seam. No conclusion about an unlimited reservoir or the full universe follows.

## Physical verdict for cosmic motion
There is now a non-numerological direct link among all three constants: the e/pi gain determines quantum noise and energy expenditure, while the phi-derived rotation controls coherent interference and suppresses runaway. **The physical bifurcation is coherent recirculation versus production/renewal of accessible modes.** The microscopic rate, reservoir budget, mapping of these modes to cosmic geometry, and any causal-horizon entropy remain to be derived; therefore neither the expansion acceleration nor H0 follows from this theorem alone. In particular do not quietly replace the old redshifted cosmological energy with bare bulk ZPE. The next physical experiment/test is to implement the *native sheet coupling* with a real pump ledger and check whether two full gain cycles can fund creation and joining while keeping the original flux and exact energy conservation.

## Execution
Actual local code /mnt/data/urt_motion_entropy_20261122/cert.py ran with OPENBLAS_NUM_THREADS=1 python, exit 0. Tested the original canonical commutator, analytic elliptic spectrum, all 512 coherent powers, scalar feedback residual, fresh-idler occupation and pump-energy identity, and six original sheet/seam energy budgets. Maximum iterative vs analytic occupation error 4.284e−13. New GitHub CI not yet claimed.

**RESUME HERE:** one concrete experimental/theoretical physical step: exact autonomous local signal–idler–fresh-sheet interaction with conserved reservoir energy and a demonstrated two-cycle transfer, rather than another cosmological ansatz or ARF.
