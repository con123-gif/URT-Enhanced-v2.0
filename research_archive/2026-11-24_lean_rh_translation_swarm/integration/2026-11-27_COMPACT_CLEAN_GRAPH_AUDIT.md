# Clean data remove every nongraph boundary term

27 November 2026. Source-matched human derivation and caller audit;
independent review/replacement replay pending. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact source pin
`72fead102f663d5c7a407964a13dc0cf9d977207`.

This audits the retained nondefinite branch of
`SharpData.exists_graph_eq_of_zeroTerm_ne_zero` directly. Reuse the
finite named Schrödinger action and zero-term invariance; do not
assume that an arbitrary Schwartz vector kills boundary orbits.
It completes this specific annihilator argument, not the general
rapid-decay theorem in `KernelDecay.lean`.

## 1. One-place annihilator lemma, with an actual uniform average

Let w be a finite place with w!=bar w, and let Psi be a locally
constant compactly supported function in its named local matrix
coordinates. Let L be a bounded functional on the native datum
space. Suppose an additive local parameter u acts, on named data,
by multiplying Psi(y) by

    chi_u(y)=psi_w(trace(u F(y))),

where the trace pairing is nondegenerate and F is continuous.
Suppose L is invariant under every corresponding Heisenberg
operator, and F(y)!=0 wherever Psi(y)!=0. Then

    L(name(Psi)f)=0.                                          (G1)

Proof: the nonzero support of a locally constant compactly
supported function is compact. Its F-image C is therefore compact
and excludes zero. Take increasing compact open additive lattices
U in the parameter space, whose union is that space. Their
annihilators U-perp shrink to zero by local additive duality.
Some U has C intersect U-perp empty. Otherwise the nonempty
compact closed sets C intersect U-perp would have nonempty
intersection, containing zero, a contradiction.

Average the operators over this ONE U with probability Haar.
Character orthogonality gives integral_U chi_u(y)du=0 at every
point of the support. Thus the averaged named datum is zero.
The average is a Bochner integral in the native Banach space:
the parameter is compact, its action continuous, and Heisenberg
operators are isometries. The bounded functional can be passed
through the integral. Its invariance makes that integral equal
L(name(Psi)f), proving (G1).

This is stronger justification than choosing a different killing
character for each point and silently exchanging infinitely many
choices. It introduces neither a conditional integral nor an
unproved limiting interchange. The local character is the actual
psi_0 with its inverse-different scaling; nondegeneracy is the
source finite self-duality, not a guessed conductor.

For a named global function above A with A intersect bar A empty,
the required pure modulations at w in A are obtained by taking
the Heisenberg parameter supported at bar w. Its translation part
on the A coordinates is zero; its conjugated part gives exactly
the displayed character. This is the specialization of
`Space.rho_name` / `IsSchwartzBruhat.schrodingerAct_star` used by
`KernelDecay.name_eq_zero_of_invariant`. The invertible factors
alpha and j change the parameter coordinates, not the available
set of characters.

## 2. The clean hypothesis supplies precisely this local lemma

Let n=rank(S)>0, let L0 be a rational maximal isotropic subspace
of S plus negative S, and choose a complete isotropic frame

    D.k = (K;K'),      K* J_S K = K'* J_S K'.                 (G2)

Let f=name(A,Psi)f0 be clean in the source definition: Psi is
Schwartz–Bruhat above A, A intersect bar A empty, and Psi(y)!=0
implies the matrix y_w:S_w->T_w is left invertible at a fixed w.
If Psi is zero there is nothing to prove. Otherwise w belongs
to A: Psi(y)=Psi(idem_A y), and if w were outside A the latter
nonzero value would have y_w=0, which is not left invertible
when n>0. This also makes w!=bar w explicit.

Fix arbitrary f', arbitrary source g, and suppose

    E_L0(doubleDatum(f',Omega(g,1)f)) != 0.                   (G3)

If K' is singular, choose a nonzero rational vector c in its
kernel. Put v=Kc. The stacked frame (K;K') is injective, so v!=0.
In the definite branch, (G2) gives v*J_Sv=0 and immediately
contradicts v!=0. In the clean branch define the bounded
functional

    ell(u)=E_L0(doubleDatum(f',Omega(g,1)u)).

The zero term is invariant under the Heisenberg subspace of its
induced Hom splitting. Its parameters include maps on the first
source summand of the form

    J_T^(-1) Z v* J_S,     Z arbitrary,

and zero on the second summand. Indeed the induced rational
frame is J_T^(-1) tensor (D.k* J_double)^transpose; insert a
coefficient Z c* and use K'c=0. Transporting through the SAME
g and the same rational frames is exactly the family

    X z Y* epsilon_S,
    X=T.dualFrame^(-1),
    Y=S.coordMatrix(g,v)=g^(-1) S.x^(-1) v.                  (G4)

Thus ell is invariant under every member of (G4). This is the
invariance hypothesis of the actual `name_eq_zero_of_invariant`
call in SharpData, not invariance of f itself.

On clean support its local frequency is the matrix

    F(y)=(X_f)* y Y_f.                                     (G5)

It is nonzero at w: X is locally invertible, Y_w!=0 since v is
a nonzero rational vector and g,S.x are locally invertible,
and y_w is left invertible. All implications take place at
the same w, with the same g and the same finite frame. The
projection of Psi's support at w is compact and (G5) is continuous.
Section 1 therefore gives ell(f)=0, contradicting (G3).

Consequently K' is invertible in both branches. The case n=0
has a single zero-dimensional graph and requires no local test.

## 3. Graph label, inverse and multiplicity

Put delta=-K(K')^(-1). Multiplying (G2) by (K')^(-*) and
(K')^(-1) shows delta*J_S delta=J_S. The column space of (K;K')
is exactly

    Gamma_delta={(delta u,-u):u in E^n}.                    (G6)

For example set u=-K'a in a vector (Ka,K'a). The second
projection of (G6) is an isomorphism, so delta is unique.
There is no graph multiplicity in the sum over Lagrangians.

The source `graphSplitting S delta` has frame (delta;-I), and
`zeroTerm_graphSplitting` evaluates it as

    E_Gamma_delta(doubleDatum(f',f))
       =weilMatrixCoeff_b(f,f',ratEmbed(delta^(-1))).        (G7)

The inverse in (G7) must remain. If the graph sum is reindexed
by gamma=delta^(-1), the source lemma instead displays
`graphSplitting S gamma^(-1)`. These are the same bijection,
not a second theta normalization.

The explicit companion l-frame is (delta;I)(1/2)J_S^(-1).
Its pairing with (delta;-I) is I, including the factor 1/2.
The source zero-term integral then gives (G7) through the
already normalized native theta pairing: the rational linear
change on Hom has global determinant modulus 1, and the
negSource theta phase is the SAME one in doubleDatum. This
audit preserves that earlier double-product/phase supplier;
it does not independently choose a conjugation scalar.

## 4. Actual consumer and remaining audit boundary

Substitute (G1)–(G7) into the shared Rallis unfolding, using the
two native majorants proved in
`2026-11-27_COMPACT_SIEGEL_WEIL_NATIVE_BRIDGE.md`. First unfold
the nonnegative graph absolute sum, which is integrable by the
operator-norm bound. Then use signed quotient unfolding and
Fubini. No boundary term is discarded before absolute
integrability is available. This discharges the nondefinite
clean-support implication at this caller under the exact
named-model, zero-term, double-product and Haar background.

The local finite dual datum is a distinct requirement and is
already derived in the 26-Nov cutoff note, sections 3–4. Its
actual source was reread here: the frame is finite-adelic
x=(I;uI;0), bar(u)u=-1, x*x=0; z=idem_(A union bar A)j/N;
k=I+zxx*; the scalar finMultiplier(kappa^(-1)) in f' is
essential. The exclusion is the exact conductor contradiction
|z g_il/mu|=min(|z|,|g_il|)>1. Do not replace it by an arbitrary
indicator multiplication or infer nonvanishing from a signed
integral. The norm-negative-one unit and vacuum covariance
remain among that construction's explicit prerequisites.

Source inspected at the pin:
`Lib/Weil/DualPair/KernelDecay.lean` lines 60–74;
`Lib/Weil/MixedModel/Names.lean` and the split finite
Schrödinger laws;
`Lib/SiegelWeil/RallisInner/SharpData.lean` lines 55–145,
236–285, blob ea9f665a9a89411f1353d098ff2e0a4e59a719f5.
No Lean execution, no whole-graph retirement, no complete human
RH proof claimed. Independent audit remains required.

Independent agreement: Landau RUN73, 1ae8974a,
`specialists/landau_criterion/COMPACT_RUN73_CLEAN_GRAPH_CHARACTER.lean`,
read in full after refreshing the branch. It proves the same
transported invariant-functional implication by a finite compact
coset partition and one nontrivial character per coset. Our
single uniform compact average and that finite partition are
compatible implementations of additive character orthogonality.
Both retain the identical source frame, place, naming law and
native conductor. Its audit also checks the phase signs of the
common model bridge; it does not certify the whole Rallis/RH proof.

RESUME HERE: audit the common model/convergence bridge and the
exact dual-datum multiplier/character normalization at
CharacterLiftNorm and TriangleArrows. Keep the one original
row family and all unresolved A/C primitive suppliers.
