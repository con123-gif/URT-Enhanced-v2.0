# Newton's Cathedral — icosahedral Golay–Leech selection gate (2026-10-25)

## Inputs and precedence

Use the existing centred 13-site Cathedral graph: one centre joined to the 12 vertices of the icosahedron. The 12-site shell alone defines the binary code. Keep separate the canonical species-loaded positive transfer on H64,

    T_* = P_G W_Delta^(1/2) exp(-eta_Delta K_*) W_Delta^(1/2) P_G,

and the **new graph-derived parity projector** constructed here; their identification is **not established**.

## Exact graph and code construction

Let A be the (12x12) icosahedral adjacency, J the all-ones matrix, D=J-A, and P the permutation matrix pairing antipodal vertices. Exact integer matrix identities:

    A² = 3I+2J-2P
    D² = 3I+4J-2P
    D² = I (mod 2).

The binary generator G=[I|D] and parity-check H=[D|I] satisfy G H^T=0 (mod 2). Also G G^T=0 (mod 2), so the code is self-dual because it has rank 12 in length 24. Every generator row has weight 8; binary orthogonality makes all codeword weights divisible by 4. Exhausting 2^12 input rows gives the full weight enumerator:

    0:1, 8:759, 12:2576, 16:759, 24:1.

This is the [24,12,8] extended binary Golay code. This mathematical construction is **classical/previously known**; its use in the Cathedral architecture is a candidate application, not a novel invention of the code.

## One exact candidate positive selection

On 24-bit computational basis |x>, define S_i = product_{j:H_ij=1} Z_j. Each of the 12 commuting checks has weight 8. The projector

    P_Golay = product_{i=1}^{12} (I+S_i)/2

has rank 4096 in a 2^24-dimensional bitstring Hilbert space; P_Golay^2 = P_Golay = P_Golay†. Therefore T_Golay=P_Golay† P_Golay=P_Golay is exactly positive and selects the 4096 codewords from 16,777,216 possible configurations. Selection fraction 1/4096; for a uniform raw ensemble, exact entropy reduction/relative entropy is 12 ln 2 nats = 12 bits. This is a **mathematical candidate**; its eight-body parity-check Hamiltonian is not shown to arise from the original pairwise graph dynamics or from the canonical H64 transfer.

## Leech shell construction

The Golay code with the standard parity/coset gluing constructs the Leech lattice. Explicitly, vectors scaled by 1/sqrt(8) have integer numerators

    { 2c+4x : c in C, sum(x_i) even }
    UNION
    { 1+2c+4y : c in C, sum(y_i) odd },

where x,y are integer 24-vectors; 1 is the all-ones vector. The unscaled minimal shell comprises:

    1104  vectors of type (±4)^2, 0^22
    97152 vectors of type (±2)^8, 0^16 with Golay octad supports and even minus signs
    98304 vectors of type (±3)^1, (±1)^23 with Golay sign patterns
    TOTAL = 196560 distinct norm-squared-32 vectors.

The code explicitly constructs all 196560 and verifies distinctness and norm. Pairwise non-overlap is sampled; full optimal packing and lattice properties are established external mathematical theorems, not newly proved here.

**Essential gluing caveat:** Naive Construction A on C is not the Leech lattice: ±sqrt(2) e_i already give 48 squared-norm-2 vectors. A separate gluing/parity rule removes the roots. The Cathedral does not yet derive this gluing rule dynamically.

## The 13-mode positive heat transfer does not perform binary Golay selection

The centred 13-site graph Laplacian has spectrum

    {0(1), (6-sqrt(5))(3), 7(5), (6+sqrt(5))(3), 13(1)}.

Its heat kernel exp(-t L13) is strictly positive-definite for every finite t>=0: at t=0.1, the smallest eigenvalue is exp(-1.3)=0.2725317930. It cannot be a rank-deficient hard-code projector. Applying 12-site heat separately to the two 12-coordinate halves takes a nonconstant generator codeword outside the binary alphabet at t=0.1. This is not a disproof for all nonlinear transfers, only for the natural heat candidate.

## Rank/selection consequence for the existing H64 transfer

If W_Delta is strictly positive on H64 and K_* is finite Hermitian, Q=W_Delta^(1/2)exp(-eta_Delta K_*)W_Delta^(1/2) is positive-definite. Then

    T_* = P_G Q P_G
    ker(T_*) = ker(P_G),   rank(T_*)=rank(P_G).

Proof: <v,T_*v>=<P_G v,Q P_G v> vanishes iff P_G v=0. **Under these hypotheses, exact hard selection is supplied by P_G, not by the invertible thermal factor Q**. To identify Golay selection with Cathedral dynamics, derive P_G from the icosahedral parity checks *in the native H64 degrees of freedom*, or specify a justified embedding/lift V that intertwines the physical selection and Golay selection. The 4096 orthogonal 24-bit Golay basis states cannot all be represented in a 64-dimensional Hilbert space without enlargement or changing the representation.

## Conditional no-fit maximum-entropy Cathedral/Golay bridge

The Cathedral already fixes Delta=3/20-80*pi/(1053*phi) = 0.0024891898404204 and the hidden fraction p5=Delta²/(1+Delta²)=6.1960276707e-6. There are 12 linearly independent Golay checks, and the icosahedral symmetry acts transitively on them. **If** each check's excited-state probability equals p5, then the maximum-entropy distribution respecting these 12 constraints is a product Bernoulli distribution over syndromes, uniform over each 4096-state syndrome coset. Its transfer has no newly fitted coefficients:

    Q_i=(I-S_i)/2,
    T_Delta=product_i [ (I-Q_i)+Delta² Q_i ]
           = exp[-(2 eta_Delta) sum_i Q_i],
    eta_Delta=-ln Delta.

The syndrome energy levels k=0,...,12 have multiplicity 4096*binom(12,k) and unnormalised transfer eigenvalue Delta^(2k). Its partition function is

    Z=4096 (1+Delta²)^12 = 4096.304559417805.

For a normalized maximum-entropy state:

    P(all 12 checks satisfied)=(1-p5)^12=(1+Delta²)^(-12)
                               = 0.999925650201691;
    E(failed checks)=12 p5=7.43523320478646e-5;
    entropy=12*(ln2 + h2(p5))=8.31873212240734 nats;
    information relative to uniform raw 24-bit configurations
           =12*(ln2-h2(p5))=8.316800211031346 nats.

**Interpretation:** this is a concrete, parameter-free *conditional extension* once the identification check-excitation<->hidden p5 is posited. Symmetry supports equal check weights and maximum entropy uniquely fixes the independent Gibbs form. The identification itself is not derived from the original H64 interaction; alternate natural choices beta=eta_Delta give a different selection probability 0.97060745, demonstrating that the microscopic matching is essential.

## Final status

- **CLOSED (pure mathematics):** icosahedral matrix identity; Golay code parameters and full enumerator; parity-projector positive transfer and its 12-bit selection; Leech 196560 minimal-shell enumeration.
- **OPEN physical identification:** derive that T_* implements the graph parity checks; derive eight-body parity from fundamental couplings; derive the Leech gluing/coset rule from URT dynamics; identify physically relevant observables.
- **NOT claimed:** a new proof of the Golay/Leech theorems, a 24-dimensional physical spacetime, or a completed theory of nature.

## Reproduce

`python cathedral_golay_leech_selection_audit.py`

Requirements: numpy, scipy, networkx. Outputs `cathedral_golay_leech_selection_results.json` and a JSON printout. Reference: Wolfram MathWorld Icosahedral Graph and Leech Lattice; icosahedron Golay construction in finite simple Conway groups formalisation thesis; sphere-code paper on Leech minimal vectors.