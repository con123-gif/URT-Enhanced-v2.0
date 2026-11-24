# Human proof chapter: from arithmetic windows to exclusion of zeros

Status: SOURCE-MATCHED mathematical reconstruction, not a new kernel verification. Upstream commit 40e56bab026552e089d7afcfeff08d2defb9c005. This chapter supplies the actual analytic subargument, not just theorem names. It does not establish the upstream arithmetic window estimates independently.

## 1. Prime-power signal, precise assumptions
Source: Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean (blob 81c8dfd66d910d083d5bc88c664c7917fdbdfe96).
For a Dirichlet character chi, let
 A_chi(y) = sum_{n <= floor(y)} Lambda(n) chi(n) max(y/n - 1,0),
with von Mangoldt Lambda. For a trivial character define G_chi(y)=A_chi(y)-y log y+(1+gamma_E)y. Otherwise G_chi(y)=A_chi(y)+y L'(chi,1)/L(chi,1).
A character family F has finite index set, positive moduli N_i, characters chi_i, real weights a_i>0, and admissibility N_i=1 or chi_i != 1. Define G_m(y)=sum_i a_i Re G_chi_i(y).
For fixed 0<theta<1 and delta>0, suppose for every real Y0 there is Y>=Y0 such that G_m(y)<=C y^theta for every y in [Y,Y^(1+delta)], with C fixed real. The estimate is ONE-SIDED, not an absolute bound. Arbitrarily late full multiplicative windows suffice; no eventual all-y bound assumed.

## 2. Reduce to logarithmic windows
Sources: WindowHypOfRpow.lean (dde1c159371538875c28374574ca7e452b0450d9), WindowHypUOfWindowHyp.lean (701f0502ae106ab89e390105cd9c98e6cf881e1a), under Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/.
For every eta>0 choose Y sufficiently large so Y>=1 and |C| delta log Y<=Y^eta. This is possible since log Y=o(Y^eta); the source proves it via log Y <= Y^(eta/2)/(eta/2) and Y^(eta/2)>=|C|delta/(eta/2). The original window hypothesis permits Y above the maximum of this threshold and any prescribed starting point.
Set R(y)=|C| y^theta, which is nonnegative and dominates G_m on the selected window. Its weighted integral is exactly |C| delta log Y, hence <=Y^eta. With u=log y, U=log Y, let g(u)=G_m(exp u) and B(u)=R(exp u). Then the interval becomes [U,(1+delta)U] and the weighted integral becomes integral B(u) exp(-theta u) du <=exp(eta U). For every eta>0 and every real U0 there is such U>=U0 and an integrable nonnegative majorant B>=g on that interval. This is precisely WindowHypU.

## 3. Zeros create noncancelling poles
Sources: DedekindLFunctions/LandauZeroFreeCriterion.lean (54fd0de979e0dad6ac7709ad8ecbec8a29e21872), LandauTheorems/poleData.lean (1f7fdc4409d2f1185700764c51d5c17a907d76e1).
There exists Phi with Phi(s)=integral_0^infty g(u) exp(-s u) du for Re(s)>2; g is measurable and |g(u)|<=C0 exp(2u) for u>=0. In Re(s)>0 its exceptional set Z comprises zeros of any family L-function and their complex conjugates. Phi is differentiable outside Z and Z is locally isolated in the right half-plane.
At rho in Z, Phi(s)=c/(s-rho)+h(s) near rho, with h analytic and c != 0. The residue is
 c = -S/[rho(rho-1)], S=sum_i a_i(m_i+m_i')/2 >0,
where m_i,m_i' are nonnegative multiplicities of zeros of L(chi_i,s), L(chi_i^{-1},s). A zero of at least one contributes positively. The common factor prevents cancellation between family members. A real rho satisfies 0<rho<1 because no member vanishes for Re>=1, so c=S/[rho(1-rho)]>0 is real. These signs matter in the one-sided argument. The source regularises the modulus-one zeta factor using (s-1)zeta(s) at s=1; other members are nontrivial by admissibility.

## 4. The analytic contradiction
Source: LandauTheorems/landauWindow.lean (7915058f10b33a52652290cd887cbccdc00e676a).
Set D_k(z)=(-1)^k Phi^(k)(z)/k!. landau_window_key proves the following using the Laplace expression, a majorant on the window, and tails outside it:
 there exist sigma>2 and C1 such that for every eta>0 and every U0 there exist U>=U0 and integer k>=U, for every real t,
 |D_k(sigma+it)|+Re D_k(sigma) <= C1 exp(eta U)/(sigma-theta)^k.
No replacement by an absolute bound on g or by a bound for all derivative orders is allowed.
Assume a pole rho0 in Z with Re rho0>theta. The source's landau_dichotomy and landau_nearest choose one of two configurations:
 A. A unique nearest pole rho to z=sigma+it, distance d>0, isolated in a disk of radius r>d, with room for an analytic disk centered at sigma; choose e=(d+r)/2 with d<e<=sigma-theta. Pole asymptotics give D_k(z)=c/(z-rho)^(k+1)+O(e^-k); Cauchy bounds give D_k(sigma)=O(e^-k). Combining the reverse triangle inequality with Re D_k(sigma)>=-|D_k(sigma)| yields A0 d^-k<=M e^-k+C1 exp(eta U)/(sigma-theta)^k, A0=|c|/d>0.
 B. A uniquely isolated real nearest pole beta>theta centered at sigma, d=sigma-beta>0, and e=(d+r)/2, d<e<=sigma-theta. Here the residue c is real positive; Re D_k(sigma)>=c/d^(k+1)-M/e^k, and the absolute-value term is nonnegative. The same inequality holds with A0=c/d>0.
In both cases, put E=sigma-theta>=e and A=|M|+|C1|. Taking U>=0 and k>=U, the inequality implies
 A0 (e/d)^k <= A exp(eta U) <= A exp(eta k).
Choose eta=(1/2)log(e/d)>0. Then A0 exp(eta k)<=A, impossible for k>=U with arbitrarily large U. If A=0 the inequality is already impossible. Thus no pole in Z has Re>theta.
This last algebraic compression is an elementary consequence of the exact source hypotheses (source counterpart landau_window_contra/landau_growth_contra), not a new RH argument or an additional URT assumption. The Cauchy, pole isolation, and window-tail lemmas are retained obligations for the full proof.

## 5. Connect back to the genuine proof chain
Deduction.lemmaL (LandauTheorems/lemmaL.lean, 6c37aebd05121b6d68e3532d8529f0ce8357386f) obtains PoleData from the family and applies landau_window to its zero set. Re>=1 is handled separately by charFamily_LFunction_ne_zero_of_one_le_re; for theta<Re<1 membership in Z gives contradiction.
Deduction.zeroFree_of_rpow_window (LandauTheorems/ZeroFreeOfRpowWindow.lean, 2ed00ad3aa862f3e522686557fb8f559b17fc002) combines sections 2-5.
The actual bridge is UpperTheory.Comparison₂.formB (Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean, 2dc9b4e690951c66ffe443e279fcada259bcce13): level_family supplies F, the signal equality and the zero-free equivalence. It instantiates delta=la-1 and C=1, where la>1 is the window exponent. This is an explicit proof-term reference, not inferred from filenames.
UpperTheory.Top.zeroFreeAll_of_topG (CharacterBoxes/ZeroFreeAllOfTopG.lean, 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1) passes level_gm_le_on_family_scales and formB to zeroFreeOn_of_tiedWin_cyc. The latter still needs its own reconstruction. plugWin uses la=3/2 (so delta=1/2), shapeWin and supplyChi; supplyChi requires VWinAt psi 401 (CharacterBoxes/SupplyChi.lean, 339885b77069601fb716a60739369805241e8222). Do NOT assume these arithmetic inputs have now been proved by the analytic chapter.
Finally UpperTheory.Top.imprimitive (CharacterBoxes/Imprimitive.lean, 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa) extends primitive nonvanishing to arbitrary chi. Its L-function is the primitive L-function times finitely many Euler factors 1-chi_prim(p)p^-s. For Re s>1/2, |chi_prim(p)|<=1 and p^-Re(s)<1, so no factor vanishes. The excluded principal-character-at-one condition is transferred using changeLevel_primitiveCharacter and changeLevel_one. This establishes EveryCharacter once ZeroFreeAll is available. The reflection chapter then gives RH.

## Execution and limitations
Fetched original source at pinned revision and inspected declarations, signs, exception cases and quantifier scopes. This is source-matched prose, not executed Lean. Independent formal verification is reported at https://math.mit.edu/~drew/grh/; our own translation audit remains open. Current sandbox has about 30 GB free vs 61.57 GB raw export, 5.8 GiB RAM, no Lean installed, and MIT hostname lookup fails. Compressed export 7,699,933,588 bytes; checksum verified against publication text, not against downloaded bytes. No full-corpus graph run, no URT speedup claim. Do not attempt to download/unpack the full file in the same constrained session.
RESUME HERE: reconstruct zeroFreeOn_of_tiedWin_cyc and the source of level_gm_le_on_family_scales, then tie its arbitrarily large window guarantee to the upper arithmetic/geometry hypotheses. Separately unpack the seven-input every_character_of_theta_integrals_local_matching adapter. Preserve exact one-sided bounds and residue positivity.
HANDOFF TO: math, character boxes, positivity and integration lanes.
