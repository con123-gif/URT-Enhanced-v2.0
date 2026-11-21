# Reversible prime URT requires rational completion, while Möbius requires a boundary

Date: 2026-11-21. Standalone arithmetic branch.  
Result class: exact algebra of a declared magnetic/projective prime connection; **not** derivation of canonical quantisation, physical vacuum or RH.

## Theorem 1 — Minimal algebraic reversible completion

By unique factorization, `(N_{>0}, multiplication) = direct sum over primes of N_0`, with exponent vector `v_p(n)>=0`, all but finitely many zero. Its universal Grothendieck-group completion is `(Q_{>0}, multiplication) = direct sum over primes of Z`. Fractions introduce negative prime exponents, exactly what is required to reverse multiplication by a prime.

On `H+=ell^2(N_{>0})`, multiplication by `p` is an isometry `S_p` but not surjective, hence not unitary. On `HG=ell^2(Q_{>0})`, multiplication by `p` is a bilateral **unitary** permutation of the orthonormal basis. Twisting every edge by a unit-modulus history phase preserves unitarity. Consequently **reversible prime dynamics requires a different ambient Hilbert space from the positive-cone partition function**.

## Theorem 2 — Exact Weyl-type algebra and associative cocycle

Restrict to primes `p<q` and exponent coordinates `(a,b) in Z^2`, representing positive rationals `p^a q^b`. Write `theta=2pi/phi^2` and choose the previously *declared* arithmetic phase `c=eps(p,q)exp(-i theta)` where `eps` is quadratic-reciprocity sign. On `ell^2(Z^2)` define

`U_p|a,b> = |a+1,b>`,
`U_q|a,b> = c^(-a)|a,b+1>`.

They are unitary and obey exactly `U_p U_q=c U_q U_p`. This is the standard discrete *magnetic translation* or noncommutative two-torus algebra, equipped with the specified arithmetic value of `c`. The algebra is standard; the arithmetic phase assignment remains conditional to our construction.

The ordered operator `W(a,b)=U_p^a U_q^b` satisfies

`W(g)W(h)=sigma(g,h)W(g+h)` with

`sigma((a,b),(c,d))=c^(-b c)`.

The cocycle identity `sigma(g,h)sigma(g+h,k)=sigma(h,k)sigma(g,h+k)` holds for **all integer exponents** by bilinearity. No finite cutoff is used in this proof.

The twisted lattice acts like a discrete Weyl pair, but does **not** establish the continuous canonical commutation relation `[Q,P]=i hbar`, nor define units of physical action; that requires a strongly continuous extension and a physical identification, neither provided by primitive URT.

## Theorem 3 — A tradeoff: unitarity destroys the Möbius boundary, compression restores it

On the *reversible group space* all prime translations are unitary: `U_p U_p^*=I`, so `I-U_pU_p^*=0`. The earlier Möbius-divisibility boundary operators vanish!

Let `P+` project from `ell^2(Z^2)` onto the positive-exponent quadrant `ell^2(N_0^2)`. The compressed forward prime shifts `S_p=P+U_p|H+` and `S_q=P+U_q|H+` are isometries, but no longer surjective. Then

`I-S_p S_p^* = 1_{a=0}`, `I-S_qS_q^*=1_{b=0}`,

and

`(I-S_pS_p^*)(I-S_qS_q^*) = I-S_pS_p^*-S_qS_q^*+S_{pq}S_{pq}^*`

where `S_{pq}S_{pq}^*` denotes the diagonal projection onto states divisible by *both* `p` and `q`, not a putative commuting product operator `S_{pq}=S_pS_q` (which is path-dependent in the twisted representation). The RHS exactly isolates the unique state `(a,b)=(0,0)` and expresses Möbius inclusion-exclusion for two primes. This extends to any finite prime set, preserving divisibility projections while magnetic transport remains noncommutative.

This is a mathematically precise separation: **reversible ambient dynamics versus arithmetic boundary selection**. It is a candidate formal analogy to an intrinsic boundedness constraint, not a claim about physical spacetime.

## Theorem 4 — Reversibility alone destroys the ordinary zeta thermal trace

Let `Hlog|r>=(log r)|r>` on `ell^2(Q_{>0})`. For each complex `s`, `exp(-s Hlog)` is **not trace class**: if `Re(s)>0`, the states `r=p^{-k}` contribute magnitudes `p^{k Re(s)}`; if `Re(s)<0`, the states `r=p^k` contribute magnitudes `p^{k |Re(s)|}`; if `Re(s)=0`, infinitely many diagonal entries have modulus 1. Thus no trace on the full group completion yields the classical zeta function.

Compression to the original integer positive cone recovers `Tr_H+ exp(-s Hlog)=zeta(s)` for `Re(s)>1` over all primes, but `Hlog` and this trace do not acquire any nontrivial information about zeros from the magnetic phase. This is an exact **arithmetic boundary / reversible dynamics tension** requiring a nontrivial construction before an RH bridge is possible.

Bost–Connes arithmetic quantum statistical mechanics already uses prime multiplication as isometries and has `zeta` as partition function; this general mathematical bridge is not unprecedented. Reference: https://www.its.caltech.edu/~matilde/qBostConnes.pdf . Magnetic translation projective unitary representations and twisted group algebras likewise are established; e.g. https://www.math.uwo.ca/faculty/khalkhali/files/BNCG_1sted.pdf .

## Certificate and precise next step

`prime_urt_group_completion_2026_11_21.py` executed locally, pure Python standard library. It checks 162 exponent-basis commutators (including negative valuations), 31,250 cocycle identities across both arithmetic sectors, and the positive-cone Möbius projection identity. All checks passed. These are finite regressions of the exact identities above, not an RH proof.

**Next test:** construct an actual representation that (i) preserves the positive-cone zeta trace, (ii) retains genuinely nontrivial twisted prime-loop holonomy, and (iii) produces a **specified classical-zeta explicit-formula or completed-xi determinant**, instead of merely a generic positive magnetic Laplacian. A separate physical task is to derive a *charged field, canonical commutation and physical energy scale* from primitive URT rather than inserting them.

**RESUME HERE:** group completion and compression mathematically closed; quantum origin, RH, cosmology not established. Do not identify the discrete Weyl flux with physical Planck action or infer a vacuum energy density from dimensionless coefficients.