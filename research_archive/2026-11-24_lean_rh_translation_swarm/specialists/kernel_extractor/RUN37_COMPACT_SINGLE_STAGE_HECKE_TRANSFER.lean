import Lib.Weil.Unramified.HeckeTransfer
import Mathlib.Tactic

/-!
RUN37 — actual single-stage split Hecke transfer (A), 26 Nov 2026.
Status HUMAN DERIVED / source-matched; independent audit and native replay
outstanding. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and
Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
e31631247c97cb90685d74c54b3051d55cfaf608. Read protocol, AGENTS, handoff
and lane assignment. Latest peer 403556a7 (marked orbit and sizes),
a599aa5c (marked column intertwining), 8e256416 (root/depth/flag caller),
8bf73512 (short spanning), a122a57d (B majorant), 170965ea (cut budget).
RUN31 575d0d31 already derives inverse-polynomial coefficients and
chain-wide cancellation but explicitly retains hecke_transfer_of_pairing.
RUN36 46483cc0 concerns a distinct elementary-divisor caller. This note
supplies the single-stage representation identity, not those results again.

Source ledger, relative to grh-compact/src:
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd
Lib/Weil/Unramified/UniformiserScalar.lean 51969de5cd90a47fac42404faf1a7b4fcce39645
Lib/Weil/DualPair/PairSumNegation.lean d2f45383d2e972574a7e749da0f2b4bb9283c6da
Lib/Weil/Unramified/HeckeGL.lean 923db13430eeb318ab80421c84b9a18a3d021ad3
Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547

1. Actual residue kernels and scalar normalization.
Work at the split place w with residue field k_w of cardinal q, local
ring O and uniformizer pi. Source and target ranks n,m=n+d. The fixed
datum f has projOn {w} f=f, so in the named local factor it is the
indicator of Mat_(m,n)(O); other factors are unchanged. Both characters
are unramified at w. Put A=a.frobValue n w=chi_S(pi)*sqrt(q)^n and
B=b.frobValue m w=chi_T(pi)*sqrt(q)^m, with chi_S=a.spaceChar n and
chi_T=b.spaceChar m. A,B nonzero, no p-adic unit assertion about B.
For each residue subspace U of dimension j, take the SAME native
basicCosetRep R_U, with integral R_U, pi R_U^-1 integral, kernel of
R_U mod pi equal to U and determinant valuation j.
The elementary support statement z R_U^-1 integral iff z integral
and U subset ker(z mod pi) follows in both directions: multiply by
R_U for necessity, and for sufficiency reduce z(pi R_U^-1); the image
of pi R_U^-1 mod pi is in U since R_U(pi R_U^-1)=pi I. This proof
applies to arbitrary rectangular z and includes j=0 and full rank.
For the target action h=R_U^T, g=1, use its transpose to apply that
statement to z^T, giving support U subset ker(z^T mod pi) of dimension
m-rank(z mod pi). For source action g=R_U^-1,h=1 support is U subset
ker(z mod pi) of dimension n-rank. Nonintegral z contributes zero
in either case, since R_U is integral.

The actual pairWeil_name_on multiplier is
 chi_S(det h)/chi_T(det g) * |det g|^(m/2)/|det h|^(n/2).
At the target representative det h has valuation j, at the source
representative det g has valuation -j. Unramifiedness removes the
unit parts. Thus the respective scalars are EXACTLY A^j and B^j.
No complex conjugate of either character appears. The use of the
inverse on the source and transpose on the target is essential.

2. Weighted subspace sum and rank cancellation.
Let N(s,j) count j-dimensional subspaces of k_w^s. Partition by
containment in a fixed hyperplane. A j-plane not contained in it
intersects in a (j-1)-plane W. In the quotient by W, such planes
correspond to lines off the hyperplane, of which there are q^(s-j)
(normalize the last coordinate to 1). Hence
 N(s,j)=N(s-1,j)+q^(s-j)N(s-1,j-1)
with invalid indices interpreted as zero. Multiply by
(-X)^j q^(j(j-1)/2) and sum; the second summand contributes
-q^(s-1)X times the preceding polynomial since
s-j+j(j-1)/2=(s-1)+(j-1)(j-2)/2. Starting at s=0 proves
 P_s(X):=sum_U (-X)^dimU q^choose(dimU,2)
       =prod_(i=0)^(s-1)(1-q^i X).
These are precisely the native heckePolyCoeff and trivialHecke.
Combining section 1 with this identity gives the two sums of
sum_heckePolyCoeff_smul_pairWeil, with residue labels P_(m-r)(AX)
and P_(n-r)(BX), respectively, where r is the residue rank at the
actual integration point, not a fixed generic rank.
Set Y=q^d A X/B. Since r<=n and m=n+d, split the product at d:
 P_(m-r)(AX)=P_d(AX) P_(n-r)(q^d AX)=P_d(AX) P_(n-r)(BY).
The prefactor P_d(AX) is independent of the local residue matrix;
the identity holds even when this prefactor is zero. Thus it is a
vector identity in the local Schwartz module by linearity of naming,
not merely an eigenvalue relation, with no division by P_d.

3. Actual bilinear pairing, not assumed simultaneous eigenvectors.
Let M be the allowed datum subspace and Bpair:M -> Hom(V,W) the
native bilinear lift. Its hypothesis hB provides, for each g,h,v,
an element Psi in M with underlying datum omega(g,h)f and
 rho(h)Bpair(f,v)=Bpair(Psi,pi(g)v).
Psi is unique as an element of the subspace, even if initially
chosen separately for different v. Extend Bpair linearly to the
ambient datum space using a vector-space complement (the actual
B.exists_extend). No equivariance outside the orbit of f is needed.
On Hom(V,W) let source act by F -> F composed with pi(g)^-1 and
target by F -> rho(h) composed with F. Substituting pi(g)^-1 v
into hB gives precisely the required equivariance at f for the
extended map. This argument is independent of the chosen extension.

Compact elements supported at w and its conjugate fix f: use
pairWeil_eq_smul_of_projOn_eq and the unramified determinant
character equals 1 on local compact elements (unit determinant).
It follows that the image F=Bpair(f,-) is spherical for both Hom
actions; with v spherical for pi, Bpair(f,v) is target spherical.
Apply the extended linear map to section 2, using heckePolyOp_eq_sum:
 H_rho(w,X)F=P_d(AX) H_sourceHom(bar w,Y)F.
Evaluation at v commutes with the target action. The invariant
bilinear evaluation pairing satisfies
 ev(pi(g)v, sourceHom(g)F)=F(v).
The exact heckePolyOp_adjoint at w therefore gives
 [H_sourceHom(bar w,Y)F](v)=F(H_pi(w,Y)v).
There is no conjugation of Y (evaluation is complex bilinear, not
Hermitian); sphericality of both arguments is available. This
proves the actual hecke_transfer_of_pairing equation:
 H_rho(w,X)Bpair(f,v)=P_d(AX) Bpair(f,H_pi(w,Y)v).
Retained input: spherical Hecke adjoint (inverse double coset and
transpose convention in SphericalHecke), actual local Weil
multiplier/compact action, residue coset representatives and the
native lift equivariance. No general theta eigenvalue theorem or
external RH premise is assumed. The linear extension is a standard
vector-space fact and requires no topological continuity.

4. Caller integration.
In Data.IsGoodDatum.exists_hecke_transfer, apply section 3 at
each stage e with actual rank difference D.t+1, datum
translateDatum x e, and bilinear map (D.liftKernel ϑ e).lift.
H.support_subset and projOn_translateDatum provide the SAME
vacuum condition for every supported x; hQ, marked p not dividing
gProd*N and native hu provide unramified rank-twisted characters.
The lift_equivariant identity is exactly hB (no separate chosen
lift). The induction invariant S e in LocalStatement transports
H through the chain; the normalization y(e,i) and the inverse
polynomial integrality are already derived in RUN31. In particular
the transfer coefficients are independent of x, and the common
mark operator is moved m times, not selected afresh. The original
root-relevant path is pairWeil_name_on + basicCosetRep_spec +
v_mul_inv_le_one_iff + q_binomial_submodule -> sum_heckePolyCoeff_smul_pairWeil
-> hecke_transfer_of_equivariant -> hecke_transfer_of_pairing ->
exists_hecke_transfer -> exists_move_markOperator -> gaugeLe_markOperator_pow
-> gaugeLe_Bmu_of_isMarked -> exists_indexDvd_Bmu_divisible -> short_forms.
Human reduction retains each upstream local Weil and Hecke
hypothesis; no deletion from original/reduced native dependency
graphs, no new axioms, no import of RH root. Independent audit
should check the compact source adjoint and exact normalization
in the caller's S e recurrence; do not count this as new kernel coverage.

Verification: no lean/lake/elan on local PATH (checked). No new CI
launched or redundant finite diagnostic. Prepared executable native
module probes and finite-product certificate below. Re-read RUN29
actual receipt on state branch: status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804;
six B/C named checks report propext, Classical.choice, Quot.sound;
JetExponentBound timed out (124); all_requested_checks_ok=false.
Actions run 45803534769 has a successful job wrapper but the
published scientific result is error/partial, NOT an overall PASS.
Old-pin reduction engines not run on compact proof. New axiom
results unknown. Keep original source and all pending nodes.

RESUME HERE: independently audit this single-stage transfer at
the exact LocalStatement induction S e, and replay the smaller
HeckeTransfer module/probes in the existing bounded compact CI
runner when capacity permits. Next mathematical supplier:
weylNormSq_Bmu_le, in particular exists_chain_eq_sum and the
actual archimedean branch count / jet norm, separate from already
derived short spanning columns. HANDOFF TO theta, integration,
audit, shared native verification. Full human RH incomplete.
-/

namespace CompactKernelRun37

theorem product_rank_split (q x : ℂ) (d s : ℕ) :
    (∏ i ∈ Finset.range (d+s), (1-q^i*x)) =
      (∏ i ∈ Finset.range d, (1-q^i*x)) *
      (∏ i ∈ Finset.range s, (1-q^i*(q^d*x))) := by
  rw [Finset.prod_range_add]
  congr 1
  apply Finset.prod_congr rfl
  intro i hi
  rw [pow_add]
  ring

theorem scaled_argument (q A B X : ℂ) (d : ℕ) (hB : B ≠ 0) :
    B * (q^d * A / B * X) = q^d * (A * X) := by
  field_simp
  <;> ring

end CompactKernelRun37

#print axioms CompactKernelRun37.product_rank_split
#print axioms CompactKernelRun37.scaled_argument
#print axioms v_mul_inv_le_one_iff
#print axioms basicCosetRep_spec
#print axioms pairWeil_name_on
#print axioms heckePolyOp_adjoint
#print axioms sum_heckePolyCoeff_smul_pairWeil
#print axioms hecke_transfer_of_equivariant
#print axioms hecke_transfer_of_pairing
