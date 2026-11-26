import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN61 — rational Bessel approximation, exact character, and packet freeness
26 November 2026. HUMAN-DERIVED at actual consumers, independent audit
pending; no new native replay. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10; previous RUN60
38418a9bedee868e547be830f228ac74f9e20867.
Latest main manuscript 1516dd75e274c4ec8e060f618c3aba9384c055e4.
Read peer a122a57d (normalized majorant reviewed), 3e861230 (sharp
correlation), 49e4380d (absolute amplitude integration), b57f1fd0
(classical one-vector bridge), 170965ea (cut error/weight change).
Do NOT duplicate their completed constructions. This fills the
remaining explicit rational approximation/level and group intersection
premises cited at GlobalToLocal:325 and FiniteSystem:215–223, also
AmplitudeSums.amplitudeSum_besselS_one and amplitudeSum_besselU_mul.

## 1. Rational unipotent density without an induction on Bruhat floors

NearTerms.besselU_dense uses rational E dense in A_f(E), trace-one
coordinates and the decomposition into Heisenberg floors. The following
direct block argument proves the same assertion in its precise field
and finite adele setting. It is NOT a theorem over arbitrary rings
where 2 is not invertible.

Write V = X + W + X*, with hyperbolic pairs indexed in the SAME
order in X and X* (reverse the native order of the dual indices when
needed). W includes z and X_0; the Gram matrix is
     H = [[0,0,I],[0,J,0],[I,0,0]], J*=J invertible.
The native definition of unipotentBelow(varrho)=besselU in FloorGroups
requires upper unitriangular action on X, lower unitriangular action
on the ordered dual X*, and identity on W. Thus a matrix in U is
     g = [[A,B,C],[0,I,D],[0,0,L]]
where A is upper unitriangular; for varrho=0 U is trivial.
The equation g* H g=H gives exactly
     L=A^{-*}, B=-A D* J,
     A^{-1} C + (A^{-1} C)* = -D* J D.
There are no other equations: multiplying out gives
 g* H g = [[0,0,A*L],[0,J,B*L+JD],
            [L*A,D*J+L*B,C*L+D*JD+L*C]].
Put Z=A^{-1}C and choose any skew matrix K, K*=-K. Then
     Z = K - (1/2) D* J D.
Hence every such U element, over either E or A_f(E), is obtained from
     (strict-upper entries of A, D, T) -> 
     [[A,-A D*J,A(T-T* - (1/2)D*JD)],
      [0,I,D],[0,0,A^{-*}]].
Surjectivity: take T=K/2. Inverse of A is the finite nilpotent
polynomial sum, so the map is continuous in the finite adele topology,
including inversion of L (its inverse is A*). No topological claim
about a free inverse map or a rational limit in E is needed.
Scalar density E -> A_f(E) follows by clearing denominators in a
basic neighborhood, enlarging the finite set of places to include
all primes over the denominator, then CRT in O_E on the finitely many
prime powers. The chosen numerator can match each local integral
target to the required precision and is integral at all other places;
division by the denominator restores the prescribed neighborhoods.
Equivalently use the actual AdeleTopology density theorem.
Finite products are dense, and continuity gives every adelic U element
in the closure of the rational U image. Rational 1/2 is allowed even
above 2; we have NOT asserted the parameters lie in O_hat or that
one can prescribe integral parameters in a fixed congruence class.
This proves besselU_dense and applies after the actual toLatBasis
isometry (ratMiddle -> latMiddle) used by NearTerms.

## 2. Same congruence witness and same character

Use K=principalLevel=unitaryLevel O_hat gIdele and h_c=inclHFin(c.out).
For arbitrary x in U(A_f) and y in the full adelic unitary group,
the set of a in U satisfying y^-1 x^-1 a y in K is open and contains x.
K is open by its finite-adelic matrix and inverse integrality conditions
and open ideal congruence. Density above yields one rational u0 in U
in this set. This proves exists_besselU_approx, with arbitrary y.
For a given class c and u in U(A_f), choose x=h_c u h_c^-1 in U
(the middle group normalizes U) and y=h_c. The SAME rational u0 satisfies
     u^-1 h_c^-1 ratToFin(u0) h_c in K.                    (1)
Indeed y^-1 x^-1 a y = u^-1 h_c^-1 a h_c. This is the actual
termPosition c c u0, not a separately chosen representative.

On S=besselS the block of the frame f=(e_1,...,e_varrho,z)
is upper unitriangular and S preserves its span. If sigma is the sum
of adjacent superdiagonal entries, then sigma(gh)=sigma(g)+sigma(h)
because the only two contributing indices to each such entry in a
product of upper unitriangular matrices are its endpoints. The
identity and middle H have sigma=0, and sigma(g^-1)=-sigma(g).
Consequently conjugation by H preserves sigma on U. If k belongs
to K, its off-diagonal adjacent entries are each in gIdele O_hat;
thus gIdele^-1 sigma(k) in O_hat. Apply the actual selfDualChar
triviality on O_hat, from the source self-duality, not on an
arbitrary compact open subgroup. With k equal to (1),
     1=psi(k)=psi(u)^-1 psi(ratToFin(u0)),
     psi(ratToFin(u0))=psi(u).                            (2)
Here psi is the native unipotentChar, an additive character applied
to gIdele^-1 sigma, so no sign convention beyond its actual definition
is changed. This proves unipotentChar_eq_of_mem_principalLevel and
exists_rat_approx_unipotentChar_eq. It supplies the rational label
in GlobalToLocal:325 and the two independently permitted labels in
AmplitudeSums.amplitudeSum_besselU_mul; each label satisfies BOTH
its own level and phase constraint. The absolute sums and cutoff
partition arguments remain those of the peer results.

## 3. Actual principal-level freeness of a Bessel term

The rational S=besselS stabilizes the isotropic flag and its last
frame z modulo X. The same block computation shows its induced
middle isometry preserves z, so preserves X_0=z^perp in W since
h(z,z)=-N !=0. It is the embedding H of a rational isometry eta of
X_0. Removing H on the right leaves U. This proves
     gamma = u toBesselH(eta), u in U,
in the rational coordinates, consistent with MiddleGroupEmbedding.
The middle form on X_0 is the source standard hermitian form up to
the common scalar N; cancelling N is valid over E.

If termPosition(c,d,gamma) belongs to K, use the actual homomorphism
identities of LevelBridge:
     termPosition(c,d,gamma)
      = (h_c^-1 ratToFin(u) h_c)
           inclHFin(c.out^-1 stdEmbFin(eta) d.out).
Call these factors U' and H'. The lattice coordinate map preserves
the Bessel blocks, as in the native toLatBasis_mem_besselU and
inclHFin_mem_besselH. The native entrywise level lemma follows
directly: H' is identity outside X_0, and the X_0 block of U'H'
equals that of H'. Hence every entry of H' is either an entry of
U'H' or the corresponding identity entry. The same for the inverse,
using (U'H')^-1=(H'^-1 U'^-1 H')H'^-1 with conjugated U in U.
Therefore integral entries, inverse integrality, and entrywise
congruence to I of U'H' imply all these properties of H' alone.
No separate claim that the U' and H' factors initially integral.
Since columnLevel=K.comap(inclHFin) by IsAdmissible, we have
     c.out^-1 stdEmbFin(eta) d.out in columnLevel.
The two class representatives represent the same double coset:
c=d. After replacing d by c, eta lies in the stabilizer classAut,
which is trivial by the actual Filling.aut_columnLevel hypothesis
(and the rational embedding is injective). Hence eta=1.
Now gamma=u and its original termPosition(c,c,gamma) is in K.
By definition gamma in classUnip(c). This proves exactly
     gamma in besselS, termPosition(c,d,gamma) in K
        => c=d and gamma in classUnip(c).                 (3)
The freeness and admissibility hypotheses are NOT deleted; their
construction in FillingAdmissible/ColumnDefs is a separate obligation.

## 4. The top-floor intersection at the finite packet caller

In the same rational form let H_l=GT(l) fix all basis vectors
on floors <l. At l=varrho it fixes every hyperbolic pair, hence
acts only on W (orthogonal complement). At l=varrho+1=n it
also fixes z and acts only on X_0. If sigma,tau in H_varrho and
sigma z=tau z, their quotient sigma^-1 tau fixes z and all pairs,
so belongs to H_n. This proves the exact top-floor specialization
of inv_mul_mem_of_orbitPoint_eq + unitriGroup_inf_floorGroup_last.
For the full intersection H_varrho cap Q_n, Q_n only requires
upper unitriangularity on the frame; since H_varrho has zero
off-W coordinates in its z column and identity on all earlier
pairs, that condition forces the z column to equal z. Conversely
H_n fixes the frame. Thus H_varrho cap Q_n=H_n.
Since U acts as identity on W modulo X and fixes every middle
diagonal block, H_varrho cap U={1}, and hence H_n cap U={1}.
This is eq_one_of_mem_floorGroup_inf for l=n, j=varrho, exactly
the consumer's guard. No assertion of triviality of an arbitrary
floor intersection.

At FiniteSystem:215–223, the fixed fibre equality gives c_i=c_j
and equal X_0 coordinates of gamma_i z,gamma_j z. Each gamma
lies in H_varrho by hu, so the other hyperbolic coordinates vanish.
The common frame products hs give equal z coordinates, since pairing
with z is multiplication by -N on that coordinate. Thus the same
gamma_i^-1 gamma_j lies in H_n. The local comparison of the
term positions and the off-T integrality ho together imply that
termPosition(c'_i,c'_j,gamma_i^-1 gamma_j) lies in K, by the
actual mem_principalLevel_iff; this identity is simply
  termPosition(c_i,c'_i,gamma_i)^-1
    termPosition(c_i,c'_j,gamma_j).
H_n is a subgroup of S. Apply (3) to THIS quotient, not an
unrelated element: c'_i=c'_j and quotient in classUnip(c'_i)
subset U. The top-floor intersection yields gamma_i=gamma_j.
As in the editor's earlier caller proof, equality of b and A(i,b)
and the two actual congruences gives equality of reduction(k_i)
and reduction(k_j) (native reduction_eq_iff). With the original
tuple injection h, i=j and b=b'. This discharges the previously
retained group-intersection and approximation suppliers of the
sharp packet injectivity proof, conditional on the actual standing
Filling data and local/global level comparison (not rederived here).
No claim that the full B proof or all group hypotheses are closed.

## Evidence and dependency ledger
Actual compact source bodies: New/Filling/NearTerms.lean
bd8a969f8d1bda48ca0468c28a8a62bc78e280ce (all four lemmas);
Lib/DiscreteSeries/Bruhat/FloorGroups.lean ec03810781f335ba1c19f6b818b015f6d4014bac;
Lib/DiscreteSeries/Bruhat/BigCell.lean da06dcfda1a1401b8ad51f94649da9b760907a87;
Lib/Adelic/Poincare/BesselSubgroup.lean 4cfedb82d9c709e48f4c7ada365b284a9e68642d;
MiddleGroupEmbedding.lean acd373a67e884d5b6136da5ed4d45a5fd37eac94;
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727;
LevelBridge.lean e2d344c09aa5a8da8707dc49b49f407005ddc487;
GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610;
FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7.
Actual consumers inspected. Original static edges:
BigCell (floor induction + Eichler) -> besselU_dense -> exists_besselU_approx;
BesselSubgroup (character + level) + MiddleGroupEmbedding + column
freeness -> NearTerms; NearTerms -> GlobalToLocal and AmplitudeSums;
FloorGroups + NearTerms + mem_principalLevel_iff -> FiniteSystem
-> Moments -> B enough_forms -> star_inequality.
Reduced human local edges: block parametrization + scalar density ->
besselU_dense; open K + H normalizer + frame root sum -> (1),(2);
block projection + columnLevel_eq + aut_columnLevel -> (3);
top intersection + (3) + level bridge -> tuple injection.
Only this local human replacement bypasses the Bruhat induction for
density. Its other callers remain. No global dependency deletion,
no root import, no weakening of admissibility or axiom evidence.
Context key: compact pin, actual S and form/lattice basis, c,d,
same gIdele and char, same finite T and level, actual tuple labels.

Local command -v lean/lake/elan returned no paths. No native
rh_prune/scan/reduce/auto/frontier on compact pin this run. Actual
jobs fetched for 45577239749,45576756833,45799225653,45803534769;
the first three historical tasks successful. Last wrapper jobs
successful but authenticated partial receipt d07359dc70c3f9f28e4858c835e5fa5424b6f539
overall_task_passed=false: six native probes three standard axioms,
JetExponentBound build timeout 124; full_RH_replay=false.
No new PASS; no finite diagnostics claimed. The executable group
equalities and native probes below are prepared, not compiled.
All original/reduced graph and axiom artifacts untouched.

RESUME HERE: integrate (1)–(3) and top-floor intersection into the
existing sharp-correlation and finite tuple injection derivations
rather than reconstruct their already written analytic bounds.
Independent audit the block chart against native Bessel ordering and
the actual local/global level comparison. Next derive remaining
actual standard-level/group bridge or review Rallis test-space
hypotheses at the separate caller with literature/geometry.
HANDOFF TO integration/editor, positivity geometry, formal audit,
compact native verification. Human RH reconstruction incomplete.
-/

namespace CompactRun61

theorem conjugate_approx_error {G : Type*} [Group G] (u h a : G) :
    h⁻¹ * ((h * u * h⁻¹)⁻¹ * a) * h =
      u⁻¹ * (h⁻¹ * a * h) := by group

theorem term_factor {G : Type*} [Group G] (c d u eta : G) :
    c⁻¹ * (u * eta) * d = (c⁻¹ * u * c) * (c⁻¹ * eta * d) := by group

theorem term_quotient {G : Type*} [Group G] (c d e a b : G) :
    (c⁻¹ * a * d)⁻¹ * (c⁻¹ * b * e) =
      d⁻¹ * (a⁻¹ * b) * e := by group

#print axioms conjugate_approx_error
#print axioms term_factor
#print axioms term_quotient
#check besselU_dense
#check Filling.exists_besselU_approx
#check Filling.unipotentChar_eq_of_mem_principalLevel
#check Filling.exists_rat_approx_unipotentChar_eq
#check Filling.eq_and_mem_classUnip_of_besselS
#check inv_mul_mem_of_orbitPoint_eq
#check unitriGroup_inf_floorGroup_last
#check eq_one_of_mem_floorGroup_inf
#check Filling.IsFillingLevel.sum_blocks_le_topKernel
#print axioms Filling.exists_rat_approx_unipotentChar_eq
#print axioms Filling.eq_and_mem_classUnip_of_besselS
#print axioms Filling.IsFillingLevel.sum_blocks_le_topKernel

end CompactRun61
