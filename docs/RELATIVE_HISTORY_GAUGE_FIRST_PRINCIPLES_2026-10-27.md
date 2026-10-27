# First-principles attempt: relative selected-history phases generate gauge response
Date: 2026-10-27. **Mathematical derivation**, not a claim that physical alpha is fixed.

## Primitive Cathedral distinction
The primitive URT scale-phase motion is q=(pi/e) exp(i*2*pi/phi^2). Its symplectic/metaplectic implementation is different from the positive transfer T=B†B.

For any single common unitary U[A], (U[A]B)†(U[A]B)=B†B. Thus the common URT rotation drops out of the positive transfer and of any scalar function of T. It cannot alone generate an electromagnetic coupling.

A coherent sum over distinct path amplitudes is different:

    C[A] = sum_h U_h[A] B_h
    T[A] = C[A]†C[A]
         = sum_{h,k} B_h† U_h[A]†U_k[A] B_k.

The off-diagonal h != k terms depend on **relative** history phases. For a compact U(1) link connection, U_h†U_k is the Wilson phase around the closed path h^{-1}k. Gauge invariance follows from endpoint cancellation when histories share endpoints. Every term is inherited from positive T; no standalone Maxwell coefficient is inserted at this algebraic stage.

## Exact variance theorem (commuting scalar path amplitudes)
Take finitely many paths h with positive amplitudes a_h>0, integer windings n_h, and shared endpoint:

    C(x) = sum_h a_h exp(i n_h x)
    Z(x) = |C(x)|²
    Gamma(x) = -ln Z(x).

Let p_h=a_h/sum_k a_k. Then differentiation at x=0 gives

    Gamma'(0)=0,
    Gamma''(0) = 2 [sum_h p_h n_h² - (sum_h p_h n_h)²]
               = 2 Var_p(n) >= 0.

For two histories n=(0,1) with amplitudes (a,b),

    Gamma''(0) = 2ab/(a+b)².

All formulas are exact, with no observed alpha and no fitted coefficient. If all n_h are equal, Gamma''=0: common rotation is physically unobservable. Only relative circulation contributes. This is the mathematically required interdependence of structure, movement and response **under the specified coherent-sum rule**.

If selection amplitudes are given by a_h=exp(-eta Delta E_h/2) from the positive source, the response is determined by the full selected spectrum and loop winding distribution. Here eta_Delta=-ln(3/20-80pi/(1053phi)). But use of this particular scalar coherent sum, the actual E_h and the n_h assignments for physically charged H64 histories must be **derived**, not chosen.

## General noncommuting finite history case
For a gauge-covariant family of Hermitian history generators H[A], and Z[A]=Tr exp(-eta H[A]), the exact Kubo-Duhamel Hessian is

    d²(-ln Z)/dx² = eta <H''>_rho
        - eta² {integral_0^1 Tr[rho^s (H'-<H'>) rho^(1-s)
                                  (H'-<H'>)] ds}.

Both the contact/seagull and current-current terms are forced by differentiating the same generator. A physical electromagnetic coupling would be determined by the transverse, zero-momentum coefficient after a derived continuum map and a physically normalized unit charge, rather than by the scalar finite face response.

## Source discovery (cannot conflate)
Existing repo `research_archive/2026-10-17_full_six_triplet_photon/native_bulk_peierls_check.py` builds a geometric chiral current, **then defines** g2=4*pi/137.035999178195 from the historical alpha candidate. It is not a first-principles photon normalization. The companion `native_chiral_selected_history.py` declares its H=abs(W) and conditioned POVM preparation as hypotheses. Do not reuse its g2 as proof. The original A4 free-Fock calculation computes a true Ward-compatible transverse source Hessian, but its physical clock/continuum residue remain unbound.

## Strict status
Established algebraically: single common phase cancels in T; relative history Wilson loops survive; scalar coherent-loop curvature is exactly twice the winding variance; Kubo-Duhamel response includes seagull and fluctuations.

Not established: source-first physical H64 path amplitudes and their electromagnetic windings, unique coherent composition dictated by original URT, 4D IR photon Coulomb residue and hence alpha(0). The old 137+... candidate remains an internal scalar, not the output of this derivation.

The process-first derivation supplies a falsifiable structural target: calculate exact selected H64 closed-path winding variance or its noncommutative analogue from the existing history/charge operator, without using alpha as an input.
