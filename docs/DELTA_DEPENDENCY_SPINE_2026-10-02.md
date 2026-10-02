# Newton’s Cathedral — Delta Dependency Spine

Date: 2026-10-02

## Central statement

The organising scalar of Newton’s Cathedral is not an arbitrary fitted constant.

Two independently defined rails are

```
d_*  = 80 pi / (1053 phi)
d_cl = 3/20
```

and the Cathedral bandwidth is

```
Delta = d_cl - d_*
      = 0.002489189840420375.
```

The main structural claim is that the continuous response sector descends from this single derived bandwidth together with the discrete finite geometry.

## Dependency spine

```
finite counts / A4-A5 geometry
        |
        +--> gamma = 1/81
        |
        +--> d_* = (1-gamma) pi/(13 phi)

classical face rail
        |
        +--> d_cl = 3/20

d_* , d_cl
        |
        v
Delta = d_cl - d_*
        |
        +--> eta_Delta = -ln Delta
        |
        +--> p5 = Delta^2/(1+Delta^2)
        |
        +--> rho_* = (I4 + Delta^2 I4)/[4(1+Delta^2)]
        |
        +--> chi_35 = 8 eta_Delta (1+Delta^2)/(1-Delta^2)
        |
        +--> entropy variation = 2 k_B eta_Delta delta p5
        |
        +--> alpha-root internal invariant
        |
        +--> history / hierarchy response candidates
        |
        +--> gravity / gauge response candidates
        |
        +--> cosmological response candidates
```

The exact status of each downstream physical identification is tracked separately in the claim and closure ledgers. The dependency itself must not be confused with empirical proof.

## Where pi, phi and e enter

- pi enters the geometric rail and phase/circulation closure.
- phi enters the icosahedral/golden geometry and therefore d_*.
- e enters through the logarithmic/exponential map: eta_Delta=-ln Delta and Gibbs/transfer factors exp(-eta_Delta L).

Thus the pi-phi-e structure and the rail bandwidth are not separate motifs. They meet in the response chain.

## Why this matters

If Delta were a fitted free parameter, downstream agreement would carry little evidential force.

Instead Delta is fixed upstream by

```
Delta = 3/20 - 80 pi/(1053 phi).
```

Therefore every genuinely independent downstream derivation that uses the same unchanged Delta is a cross-sector consistency test of the same underlying construction.

The strongest possible Cathedral result would be a theorem of the form:

```
finite geometry + URT
-> d_* and d_cl
-> unique Delta
-> unique master state
-> all dimensionless physical observables
```

with no target-dependent branch choices or additional continuous constants.

That is the parameter-free theory-of-nature target.


## Why the bandwidth propagates

The hidden generator is

```
L_hid = 3 P3 + 5 P5.
```

The selected state is

```
rho_* = exp(-eta_Delta L_hid)/Z
```

with

```
eta_Delta = -ln Delta.
```

Therefore the relative Boltzmann weight of the two hidden quartets is

```
w5/w3
=
exp[-eta_Delta(5-3)]
=
exp(-2 eta_Delta)
=
Delta^2.
```

This is the central transmission mechanism.

The rail bandwidth is not merely inserted into later formulas. It becomes the exact relative occupation of the two hidden irreducible sectors:

```
p3 = 1/(1+Delta^2)
p5 = Delta^2/(1+Delta^2).
```

Hence

```
rho_* = (I4 + Delta^2 I4)/[4(1+Delta^2)].
```

All linear-response geometry built from this state inherits the same eigenvalue ratio.

In particular,

```
Hom(4_3,4_5)
~= 4 tensor 4
= 1 + 3 + 3' + 4 + 5
```

is the common response carrier later regrouped into geometry/gravity, U(1), SU(2), and the eight-dimensional colour carrier.

The BKM/Kubo-Mori stiffness on off-diagonal 4_3 <-> 4_5 perturbations is therefore a function only of the two state eigenvalues, and thus only of Delta:

```
chi_35/k_B
=
8 eta_Delta (1+Delta^2)/(1-Delta^2).
```

This explains why the same bandwidth appears across several response sectors: those sectors are not independent systems being fitted to the same number. They are different irreducible directions of one response space built from the same rho_*.

The scientific question is therefore shifted from

```
why does one number fit many things?
```

to

```
does the physical identification of each irreducible response direction follow uniquely from this one state?
```

That is the sharper theory-of-nature test.
