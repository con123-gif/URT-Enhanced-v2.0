# Newton's Cathedral — all four ARF corrections, source-preserving reconciliation

**9 November 2026 — independent verification against original, unmodified October 29 coupled 64×64 code; no repository changes.**

## Scope and original provenance

The historical **v101 Full ARF Operator Ledger** (ChatGPT Library) is the four-channel source. It must not be replaced by the September two-pole rail self-energy alone. The corrected v104 history module supersedes v98's untyped `W0+W1+W5` 13-submodule proposal. The original October 29 `cathedral_64_chiral_hybridization_2026_10_29.py` was loaded directly from the Library, not reconstructed from guessed spectra. This note does **not** claim physical electromagnetic or mass identifications from trace counts.

Let `phi=(1+sqrt(5))/2`, `delta=80*pi/(1053*phi)`, `gamma=1/81`, `beta=1/4`, and `tau_d(X)=Tr(X)/d`.

| Historical channel | Four-line v101 formula | Numerical output |
|---|---|---:|
| Vacuum / effective rail | `Delta_delta=-delta^3/63-gamma/40` | `-0.00035959042756760508` |
| Electromagnetic correction | `R_alpha=3/(64 phi)+1/(79 phi^2)` | `0.03380535602328556` |
| Mass coefficient | `C_mass=-(5/16)delta^3+(7/8)pi phi` | `4.446800183122004` |
| Mass residue | `R_mass=(3/35)delta^2-(4/51)pi^3` | `-2.429999742889380` |

Effective rail `delta+Delta_delta=0.14715121973201200`, not the raw `delta=0.14751081015958`. The original v101 source variables `delta^2,delta^3,pi,pi^3,gamma` are declared normalized source inputs; their derivation from the primitive microscopic dynamics remains distinct from trace arithmetic.

## Verified full-operator spectral projector result

The original coupled `K64` on `12_A+12_B+20_A+20_B` has `Tr K=304`, `Tr K^2=1826`. Its original face-incidence kernel splits into rank-four projectors `P3,P5` at dual-face energies 3 and 5. Build:

- `P_(energy 5)` from the symmetric face-sheet `P5` quartet and antisymmetric face-sheet `P3` quartet: **rank 8**.
- `P_(energy 7)` from the rank-five `L_ico=6` vertex module (shifted by one on the first vertex sheet) and antisymmetric face-sheet `P5` quartet: **rank 9**.

The exact SymPy execution verified `P^2=P=P*` and `KP=5P` / `KP=7P`. Therefore:

`Tr[P_(energy 5)(K-zI)^(-1)]=8/(5-z)` and
`Tr[P_(energy 7)(K-zI)^(-1)]=9/(7-z)`.

Using the historically **specified**, nonidentical source weights gives the original two-pole *first ARF*:

`Sigma_ARF(z)=gamma*delta^3*Tr[P7(K-zI)^(-1)] + (gamma/64)*Tr[P5(K-zI)^(-1)]`

`=delta^3/[9(7-z)]+(gamma/8)/(5-z)`.

Thus `Sigma_ARF(0)=delta^3/63+gamma/40`. This derives pole locations and multiplicities from the full original operator, not the source-weight rule from the primitive URT process. The two different trace normalizations are explicit premises.

## Found and resolved a v101 internal normalization discrepancy

v101 writes `tau_8(P_4_5 K_5^-1)` and equates it to `1/40`. **If** `P_4_5` is the full A5 irreducible **rank-four** hidden projector and `K_5=5I` there, its normalized eight-carrier trace is **4/(8×5)=1/10**, *not* `1/40`.

The older v98 paper describes `1/40` as **rank one** in an eight-dimensional carrier at stiffness five: mathematically `1/(8×5)=1/40`, but rank-one selection inside an irreducible A5 quartet is not A5-invariant without more structure. Conversely, the **original complete K64** gives the same needed coefficient with no rank-one restriction:

`tau_64(P_(energy 5) K64^+)=8/(64×5)=1/40`.

This is a rigorous source-compatible **normalization correction**, but must be distinguished from claiming the bare URT microscopic dynamics uniquely selects that observable.

## Audit of the remaining three ARFs (not the same as the two poles)

The mathematical carrier counts in v98/v101/v104 are as follows:

- `R_alpha`: `3/64` is a rank-three normalized history projector; `1/79` is rank one on an explicitly **enlarged 64+15=79 carrier**. The 15-dimensional contribution is independent edge-pair furniture. The weights `phi^-1,phi^-2` are stipulated in the historical source map; no current/photon normalization follows from the dimensions alone.
- `C_mass`: `5/16` is a rank-five trace in a 16-dimensional *transfer algebra carrier*, while `7/8` is a rank-seven complementary tangent projector relative to one selected seed in eight dimensions. This transfer `16` is not automatically the same 16-dimensional two-sheet hidden `4+4+4+4` module.
- `R_mass`: `3/35` is a rank-three projector with inverse stiffness seven over a separate 5D carrier; `4/51` is rank four in the corrected, A5-typed H51 history complement. The `K64` energy-seven **nine-dimensional** eigenspace is a `5⊕4` A5 module; it does not by itself contain an A5-invariant rank-three sector. A separate source/current map is required. The rank-four H51 sector has multiple equivalent quartet copies, so its physical selection is not fixed by the rank alone.

All four historical output **values** were recomputed at 40-digit precision. This verifies the arithmetic and the selected projector ranks; it **does not** prove that all four observables are uniquely forced by the primitive `q=(pi/e)*exp(i 2pi/phi^2)` history process, or that these are observed physical masses/couplings.

## Precise new result

**A5-equivariant full-history recovery of the `gamma/40` residue without a rank-one hidden projection:** the original coupled K64 has an invariant rank-eight eigenvalue-five projector giving `tau_64(P5 K64^+)=1/40`. This repairs the ambiguous `tau_8(P_4_5 K_5^-1)` notation while preserving all 64 states and the independent four-ARF ledger. The derivation retains the full model; it does not import external researchers' code.

**What remains mathematical rather than finished physical theory:** the unique source-to-sector map selecting all four trace functionals, their relative dimensions/weights, and observed current/mass normalization. Producing a numerical near-match is not a substitute.

## Reproduce

`python /mnt/data/CATHEDRAL_ARF_FOUR_CHANNELS_RECONCILIATION_2026-11-09.py`

The verifier imports the original Library `cathedral_audit/cathedral_64_chiral_hybridization_2026_10_29.py`, checks the full exact projectors and all four numerical outputs, and flags the `tau_8` coefficient inconsistency. No user repository was modified.
