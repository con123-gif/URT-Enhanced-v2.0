# Newton’s Cathedral — Rail Bandwidth Principle

Date: 2026-10-02

## Definition

Newton’s Cathedral contains two independently fixed rails:

```
d_*  = 80 pi / (1053 phi)
d_cl = 3/20
```

Their difference is

```
Delta = d_cl - d_*
      = 0.002489189840420375.
```

The canonical interpretation is:

> **Delta is the bandwidth/window between the geometric/quantum rail and the classical rail.**

It is not a free parameter and it is not a normalization chosen to fit data.

## Why the bandwidth matters

The bandwidth defines the small admissible interval separating the two limiting response structures.

Its logarithmic depth is

```
eta_Delta = -ln Delta
          = 5.995797986741314.
```

The same fixed bandwidth then determines

```
p5 = Delta^2/(1+Delta^2)
```

and the selected state

```
rho_* = (I4 + Delta^2 I4)/[4(1+Delta^2)].
```

The responsive entropy obeys

```
delta S = 2 k_B eta_Delta delta p5.
```

Thus Delta is not merely a small residual. It is the width controlling the finite response window from which the downstream information geometry is constructed.

## Provenance / evidential rule

The fact that one derived bandwidth reappears in several downstream sectors can strengthen the case for the construction, but only under a strict rule:

- Delta must be fixed **before** the downstream comparison;
- it must not be retuned sector by sector;
- the downstream formula must arise from an independently justified construction rather than being engineered to reproduce a known target.

Under those conditions, successful reuse of the same Delta is genuine cross-sector consistency.

The evidential chain is therefore:

```
independent rails
-> unique bandwidth Delta
-> eta_Delta
-> rho_*
-> entropy / BKM response
-> independently derived physical sectors.
```

The more independent sectors close with the same unchanged bandwidth, the stronger the provenance/coherence of the Cathedral construction.

This is evidence for the framework, not by itself proof that Newton’s Cathedral is the correct theory of nature.
