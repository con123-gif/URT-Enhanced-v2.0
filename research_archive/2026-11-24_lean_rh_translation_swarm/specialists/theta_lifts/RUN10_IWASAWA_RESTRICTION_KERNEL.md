# Theta lifts RUN10 — Iwasawa factorization and the invariant restriction kernel

2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the actual Avac.iwaQ_of' producer, conditional on native TAll and the existing SD/LD data. No Lean replay or URT speed claim. RH project OPEN.

## Continuity and upstream

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log head, continuity, research protocol, CI summary checkpoint 380 (physical PASS unrelated to this proof), RUN9 and recent specialist handoffs (Galois, character boxes, Landau, literature, geometry, prime, editor, kernel, acceleration, integration); other lane directory listings inspected but not all latest bodies reread; linked external blueprint not reopened. Geometry RUN9 concerns integral moduli tangent frames, not this adelic theta restriction. No duplication with its proof. Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Main head observed 1da818b50f1e18808db2792b9dc735bda8cb84d8; IwaTop path 404 at head, ParabolicThetaScalar head blob a23779d94797d121d725fb22c982427066172a1d, SiegelWeilStdOf head blob ba9124032c534e1ddb55f57c44896c58c699a144. No migration equivalence inferred; maintain original pin.

## 1. Exact statement and caller

SiegelWeilStandard/SiegelWeilStdOf.lean:63–65 supplies (Avac.iwaQ_of' hT) to AStep.stepOf. IwaTop.lean:17–46 proves iwaQ_of' (hT : TAll) : IwaQ. LowerRankDatum.lean:150–153 defines IwaQ: for every number-field pair F,E with Algebra F E and sigma:E→ₐ[F]E, every d:SD sigma, L:LD d and x:d.G, there exist q,k:d.G, g:L.sd.G, r:real, c:complex with k∈d.K, x=q j(g) k, r>0 and simultaneously

  a_d(j(h)x)=r a_L(hg) for every h∈L.sd.G,
  T_d(om_d(j(h)q)Phi)(X)=c T_d(om_d(j(h))Phi)(X)

for every Schwartz Phi, every h and every matrix X whose i0 column is identically zero. All SD/LD fields and their typeclass assumptions are inherited. The witnesses are fixed before Phi,h,X; no point-dependent scalar. The statement does not require c≠0. The higher-rank inequality m<n is not a hypothesis here. LD.res is an explicit input field, not proved by this theorem.

## 2. Obtain the factorization in the original adelic group

Write S={inl i0,inr i0}, J_eps=[[0,I],[eps I,0]], eps an integer unit, and M=inFrame_d(p). IsQ(i0,M,lambda) means M restricted to S-complement rows/columns is identity, column inl i0 is lambda times the corresponding coordinate vector, and row inr i0 is zero except at inr i0. Lambda is an adelic unit; do not replace the adelic ring by a field.

IwaLine.line_fix' first uses d.ok.hgt.iwa to write x=p0 k1. The upper-left block A of p0 is invertible by par_frame (block triangular determinant is a unit). LineFix.good d supplies GL Iwasawa with singleton {i0}, A=a1 κ, κ in kGL. Both a1 and its inverse have zeros off the distinguished column's diagonal. Their product gives (a1)_{i0,i0}(a1^-1)_{i0,i0}=1, producing the unit lambda. The lifted compact element mL(κ) is built with blocks κ and (conjugate κ^-1)^T; frame-form and inverse checks, finite integrality for the element and inverse, and archimedean unitarity establish mL_mem_K. Put p=p0 mL(κ)^-1, k=mL(κ) k1. Then x=pk and p has the claimed column. This is not the same GL over a DVR used by the geometry lane.

IwaEps.eps_eq chooses the same eps for both d and L. They share A,r,s; mixed Hermitian/skew cases are impossible because d.ok.hm gives m≥1, and the simultaneous conditions would imply A.J=0 in characteristic zero, contradicting a nonzero signature entry at an infinite place. Equal cases use KWhit.rel_sign. Both frames then preserve J_eps after scalar extension.

SubMulRight.q_split' uses the form identity M^T J_eps conjugate(M)=J_eps. Evaluating against the distinguished column forces the corresponding opposite row to vanish off its distinguished entry: the multiplier eps conjugate(lambda) is a unit. Restrict the form identity to S-complement: the removed summand is zero by the row condition. The restricted matrix preserves the lower form, and mkG constructs the actual g:L.sd.G (invertibility from determinant of a product equal to one, then conjugation out of its frame). Because j(g^-1) acts as identity on the distinguished rows/columns, multiplying M on the right by its frame inverse kills the complement block to identity and preserves the column/row conditions. Thus q=p j(g)^-1 satisfies IsQ and x=q j(g) k. This uses exact LD.j_in, j_out, em injection and range complement, not arbitrary compression of a group element.

## 3. Height: the ratio is the absolute value of the distinguished unit

IdentityOnLastEmbedding.q_conj' proves IsQ is invariant under j(h)-conjugation, with unchanged lambda. Indeed H=inFrame(j(h)) and H^-1 both fix distinguished rows/columns, and H M H^-1=I+H(M-I)H^-1; its complement block is I and its distinguished column/row are preserved.

EmEqInr.q_ht' uses isQ_21 (lower-left zero), isPar_of_frame, and isQ_11: every row of the upper-left block except i0 equals the identity row, with diagonal entry lambda at i0. The determinant is lambda by det_row. Lower-rank height equality a_d(j(h))=a_L(h) is proved by a_j using the lower model Iwasawa, j_K (embedding preserves compactness, including finite integrality of inverse), determinant of embedded parabolic block diag(A',1), and both original height normalizations. Therefore
  a_d(q j(h))=|lambda|_E a_L(h).
Set r=|lambda|_E. IwaCut.absE_pos follows from |lambda|_E |lambda^-1|_E=1 in nonnegative reals. Now j(h)x=(j(h)qj(h)^-1) j(hg)k; right K-invariance, conjugacy and q_ht' give the required a_d(j(h)x)=r a_L(hg). No assumption about raw height as a group homomorphism.

## 4. Scalar on the restricted Schwartz values

ParabolicThetaScalar.parabolic_theta_scalar:108–167 has premise TAll, an index i0, q:d.G, lambda an adelic unit and IsQ. Write inFrame(q)=[[A,B],[0,D]]. par_frame constructs n0,m0 IN d.G with q=n0 m0, frames [[I,BD^-1],[0,I]] and diag(A,D). Both diagonal blocks are invertible: triangular determinant is unit; form preservation implies block-diagonal form preservation. Native Weil action hT.2.1 supplies the unipotent phase and Levi action. In detail:
- IsQ implies columns of D away from i0 are identity columns, as are those of D^-1 by inv_col. Hence X D^T=X and X(D^-1)^T=X if X's i0 column is zero.
- For beta=BD^-1, entries beta_ij vanish when both i,j differ from i0; this follows by splitting the product sum at i0.
- Gram G_X=d.gram X X has zero row and column i0. In trace(beta G_X)=sum_ij beta_ij G_X,ji every summand is zero: either i or j equals i0 (Gram factor zero) or neither does (beta factor zero). Thus d.tt(beta G_X)=0 and the additive character evaluates to 1. No unproved cancellation of nonzero oscillatory integrals.
- Apply the unipotent action to om(m0)Phi, which is Schwartz by stability, followed by the Levi action. The source chooses the fixed scalar
  c=chi(det A) |det A|_E^(m/2)
with the source's real-power/complex coercions. Consequently T_d(om(q)Phi)(X)=c T_d(Phi)(X) for every Schwartz Phi and every zero-column X. No nonzero assumption or division by c in iwaQ_of'. The determinant of A is lambda by the same isQ_11/det_row identity; no change to the source choice is necessary.

## 5. Key simplification: invariant kernel, not an unjustified commutation of q and j(h)

Define the linear restriction R0(Phi): X↦T_d(Phi)(X) on zero-column matrices, with Schwartz domain. Let N=ker R0. The LD.res field with lower vector 0 implies om(j(h))N⊂N for ALL h: a zero restriction is a valid match with the lower zero Schwartz vector; om'(h)0=0 and T'(0)=0. This step uses no surjectivity of R0 and no extension of Phi from a lower vector. It is exactly IwaTop lines 36–37.

For each Schwartz Phi put Psi=om(q)Phi-c Phi. Schwartz stability and submodule closure give Psi Schwartz. The scalar result gives R0(Psi)=0. By kernel invariance R0(om(j(h))Psi)=0. Linear action and the group-homomorphism law now give
  R0(om(j(h)q)Phi)=c R0(om(j(h))Phi).
This is the desired uniform scalar transport. Equivalently the residual om(q)-c Id has image in N and N is stable under the embedded group. This is a human-readable restatement of the exact residual proof, not a new premise or novel URT result. In particular q and j(h) need not commute; scalar equality before applying j(h) would not suffice without LD.res. This explains why RUN9 could transport the same c at every lower group point, including h=1.

## 6. Dependency and trust boundary

Actual source-body edge: Fin.siegelWeilStd_of → Avac.iwaQ_of' → line_fix', eps_eq, q_split', parabolic_theta_scalar, absE_pos, KWhit.a_mul_K, q_ht', q_conj', KWhit.om_mem_sch, Tl linearity, LD.res, T_zero. Expanded local producers above; deeper obligations still include TAll (particularly the two Weil action laws and Schwartz stability), CM Good/Iwasawa, SD height and frame package, LD construction and its equivariant restriction, and imported form/height lemmas. General matrix/determinant, Iwasawa and Weil-action ideas are classical; no publication attribution is inferred solely from names and no new independent published theorem is claimed. No assertion that any remaining field is an axiom, sorry, placeholder or independently verified without kernel evidence. Static reference matches are not elaborated edges. This advances RUN9's IwaQ input only.

## 7. Executed source check and reproduction

Connector JS fetched the ten files at the original pin, compared supplied blob IDs to independently recorded IDs, and asserted 88 literal line anchors; all 88 matched. These are actual source checks, not numerical model tests, raw-byte hash replay or kernel validation. Reproduce on the upstream checkout by saving the following compact certificate as Python and executing from its root. It checks the same ten blob IDs and a representative anchor per file (88-anchor expanded list not needed to reproduce the source identities).
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
base="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",65,"Avac.iwaQ_of'"),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",150,"def IwaQ"),
("VacuumIwasawa/IwaTop.lean","fc0a326c9635f836f0e78f145cc65d63b0edf6c3",36,"L.res Ψ hΨs 0"),
("VacuumIwasawa/IwaCut.lean","49a7dc8c42a6c69adeaeb266e8ed4b153d5a42ff",26,"theorem absE_pos"),
("VacuumIwasawa/IwaLine.lean","ab197cdaeb23edc0926fcfafc2b35e9492013b2c",181,"theorem line_fix'"),
("VacuumIwasawa/IwaEps.lean","9059bb27db8d8d41f34c5844618ed5f324266360",33,"theorem eps_eq"),
("VacuumIwasawa/SubMulRight.lean","5104f800f1594f01f51f74e7556ab6d3a7b94c72",155,"theorem q_split'"),
("VacuumIwasawa/ParabolicThetaScalar.lean","1f8b19544f40d1685d5ff724ce30274debd4d348",108,"theorem parabolic_theta_scalar"),
("VacuumIwasawa/IdentityOnLastEmbedding.lean","cd1cfd6fb2fda59773b8180626f670e1507c01fe",102,"theorem q_conj'"),
("VacuumIwasawa/EmEqInr.lean","ead3a45ff2876c86d6d5b18efc70f63f0d1f8d53",180,"theorem q_ht'")]
for p,sha,i,a in rows:
    b=subprocess.check_output(["git","show",pin+":"+base+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=b).decode().strip()==sha,p
    assert a in b.decode().splitlines()[i-1],(p,i)
print(len(rows),"blob IDs and representative anchors")
```
Python replay above not run here; connector static check was executed. No physical gate/queue changes.

RESUME HERE: reconstruct the actual Avac.vacK_of producer (VacuumIwasawa/VacTop.lean, caller SiegelWeilStdOf line 58), especially lower-rank restriction of vacuum generators and the Fock inclusion; CwInvIota.vac_K' and its finite-place peeling are separate native inputs. Keep LD.res construction, OrbRes, HolLead, FourierZero and lInt2 deeper suppliers open. Request role-labelled authenticated kernel edges for Avac.iwaQ_of' and parabolic_theta_scalar. HANDOFF TO integration, editor, theta, dependency, kernel, audit and literature. Project OPEN.
