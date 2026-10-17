# Native icosahedral photon: exact gauge-invariant closed-loop response (17 Oct 2026)

This is an **executed, unfitted quadratic Maxwell calculation**, not an assignment of the physical Koide phase. The executable file and numerical outputs are available in the conversation artifact `cathedral_photon_exact_2026-10-17.zip`.

## Exact native source and integration
Let (D=d_2\in\mathbb R^{30\times20}) be the oriented face-to-edge incidence of the canonical icosahedral sphere; (K=DD^T) is the coexact Maxwell link kernel. Because (D\mathbf1=0) and `rank(D)=19`, the gauge-invariant covariance of the 20 face Wilson currents is **exactly**
[
P=D^TK^+D=I_{20}-\mathbf1\mathbf1^T/20.
]
This passes numerical full-matrix residual below 5e-15. In the specified Gaussian Maxwell measure on the gauge quotient,
[
\langle\exp(i n^TD^TA)\rangle
=\exp[-(g^2/2)n^TPn].
]
Face variances all equal (19/20), distinct faces have covariance (-1/20). This is a real positive **amplitude factor**, not a Berry phase.

For an external conserved link source (j), the classical sourced field is (A_\star=g^2K^+j), and a Wilson loop acquires a genuinely oriented phase (\Phi_n[j]=g^2 n^TD^TK^+j). This is the exact source-to-holonomy map; it does not invent a source or assign its phase from lepton data.

## Exact dynamical loop response
The face Laplacian spectrum is (0^1,(3-\sqrt5)^3,2^5,3^4,5^4,(3+\sqrt5)^3).
Its single-face retarded-parameter resolvent (analytic away from poles) is
[
G(z)=\frac{3(z^4-12z^3+49z^2-78z+38)}
{(z-5)(z-3)(z-2)((z-3)^2-5)}.
]
The exact static value is (G(0)=-19/20); six values evaluated from actual 30×30 matrices match the rational expression below 1e-10. This is an actual five-band dynamical photon kernel, not a photon-speed scalar.

## Numerical example with an explicitly conditional coupling
Using the previous Cathedral fine-structure **candidate**, not treating it as an independently derived electromagnetic coupling, (\alpha^{-1}=137.035999178195), then (g^2=4\pi\alpha=0.0917012368262). The one-face zero-source Wilson amplitude is (e^{-19g^2/40}=0.957376940850), while the exact native chiral-face Bargmann phase remains (-0.2005594411352) rad before and after Gaussian photon averaging.

For the explicit **illustrative** unit closed source (j=De_f), the Maxwell solution yields a phase (g^2 19/20=0.0871161749849) rad on that face. This source is not claimed to equal the physical signed H64 lepton history source. Ordinary Gaussian photon retardation alone does not supply a unique Koide mass phase.

## Physics boundary
All above formulas follow from the existing gauge-incidence complex with standard Gaussian integration. The mass-splitting phase would have to come from an actual nonzero oriented H64 current joined to this photon kernel and the charged-fermion 13/51 pole operator; no such physical map is selected by these equations alone. Do not turn a source-free Wilson attenuation into a screened phase or claim that this is a proof of the observed charged-lepton masses.
