# Q161bf — Q96 charge holonomy on native 24-clock
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **Result:** THEOREM for a declared conditional flux convention.

Take the original Q96 species charge registry (three generations and charge conjugates), with 72 fractional-charge entries and 24 integral-charge entries. Take the original 24-cycle forward difference. In each charge sector q put a seam holonomy h_q=exp(2πiq), leaving the other 23 forward links unchanged: D_q[k,k]=-1, D_q[k,k+1]=1 for k<23; D_q[23,23]=-1, D_q[23,0]=h_q. This **unit-flux convention is a declared assumption**, not a derivation from URT or the Q101 face source.

By exact determinant expansion, det(D_q)=1-h_q. For q=±1/3,±2/3, |det(D_q)|²=3 and rank D_q=24. For q=0,±1, h_q=1 and rank D_q=23. Consequently the direct sum on the 96×24 carrier has rank 72×24+24×23=2280, nullity 24. The untwisted Q161be charge-squared clock diagnostic had nullity 372; these are **different operators**, not a repair of its kernel.

Evidence: local standalone SymPy script `Q161BF_CERT.py`, exit 0 (2026-11-18); original Q96 charge multiplicities checked exactly and all seven 24×24 determinants checked exactly. No empirical inputs or historical ARF parameters.

**Scope:** This is a conditional holonomy diagnostic, not the requested source-dependent Q101/H64/Q96 Ward join; no physical gate is closed. **Next question:** does the primitive five-solid/190/H64 source actually fix the seam holonomy and yield a Q96-equivariant 24-clock link, rather than an assumed unit-flux twist?
