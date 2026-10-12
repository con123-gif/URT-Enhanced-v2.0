# Best Candidate Dictionary

**Date:** 2026-10-12  
**Status:** Strongest parameter-free result so far

## Map
Relative entropy stiffened by the frozen four channels:

\[
\frac{m_i}{m_1}
=
\exp\bigl(-(\sigma_1-\sigma_i)\eta_\Delta\bigr)
\cdot
\exp\bigl(-4(\sigma_1-\sigma_i)\bigr)
\]

## Result
```
[1.00000,  0.0045856,  0.00026624]
```

## Diagnostic (u-type)
```
Observed: [1.00000,  0.007341,  0.0000127]
```
- Middle generation: factor ~1.6
- Lightest generation: factor ~21
- Mean log10 distance: 0.763 (best of all certificates)

## Ingredients (all frozen)
- Singular scales \(\sigma\)
- Entropy stiffness \(\eta_\Delta = -\ln\Delta\)
- Integer 4 (four channels / four orbits / 4_g)

No free continuous parameter. No observed mass used as input.

## Status
Candidate continuum dictionary. Not yet derived from the transfer operator, but the numerical obstruction is now reduced to a single remaining factor of order 20 on the lightest generation.

Operation Condor continues.
