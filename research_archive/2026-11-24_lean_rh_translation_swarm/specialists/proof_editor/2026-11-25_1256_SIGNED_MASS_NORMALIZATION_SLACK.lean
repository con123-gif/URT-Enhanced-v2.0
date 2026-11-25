import Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 15 — absolute determinant anchor from native scalar suppliers
25 Nov 2026. SOURCE-MATCHED conditional proof, Lean certificate PREPARED,
NOT COMPILED. RH OPEN. No new manuscript volume.
Pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
Current upstream 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a (batch 18);
LinkMin current blob 31ddf3666b5c0336cbbb6f9afdc5785210d4efec, four
relevant theorem names present, not proof-equivalence evidence.
Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc read first including
mandatory engines; AGENTS, continuity, state excerpts, protocol,
handoff, expansion, end-of-day spine and live manuscript consulted.
Peer 9e7a5f49 (aggregate mass identity), 9edc3b00 (virtual baseline),
5ea960de (constant spread), a543f365 (far-range), e669681c (torsion)
and current recent peer summaries checked. This is not another
determinant moment: derive the actual two-sided anchor using the
retained native suppliers and explicitly quantify slack.

**Absolute count anchor with signed mass slack (editor, 25 Nov).** On the same native host put F=fk, r=k+m-1, a=m(m-1)/(2k), t=(m-1)/k, v=log(host.v/pi), c=log(2pi), g=log(g0*g1), and let W=sum_{rho,j} log w(j,rho)/f. Set delta=log(volY0/(massI(k)*prod_{k<M<=r} ratioH(M)))/F. The exact native closed form, retaining this defect, is X=logXuD=(m-1+a)v-t(v+c)/2+(m+a)g+l+s+P+delta, where l=sum log lValEta/F, s=sum log(1-g_i^(-j))/k and P=sum_rho log(dsig_rho*facProd(r)/vand_rho)/F. For R=W+m(v+g), cancel first: X-R=(a-1-t/2)v+a g-t c/2+l+s+(P-W)+delta. The actual LinkMin lower suppliers give l>=-1, s>=-1/4, P-W>=-7L-5/4 (k>=m>=44), and 0<=v<=L, 0<=c<=3, g>=0, 0<=t<=1, a>=t/2. Therefore X-R>=-8L-4+delta. Its upper suppliers give l<=1, s<=0, P<=m(12+12L), g<=2CY L, a<=m/2, so X<=(27/2+3CY)mL+12m+1+delta. Consequently the single common normalization interval -2L<=delta<=m suffices for the original sharp count at L>=9: X>=lowS+5 and X<=(15+3CY)mL-21. In particular the common virtual baseline C satisfies the previous anchor interval whenever the original native mass/volume equality holds (delta=0); in fact the relaxed interval suffices. This closes the *conditional anchor arithmetic*, not the actual geometric normalization supplier. No increase in the native 11L constant, no change to host quantifiers or independent mass-error consumers. Source LinkMin b570e24f, LogWeightMinusLogBBound 8d9b1ee9, LemmaFiveOneOfTheoremTwo 2b7d6755. Human proof; scalar Lean certificate prepared, not compiled.

Details of the source matching:
src/Formalism/SharpRestriction/GlobalSchurBounds/LinkMin.lean
b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f:
family_of_global_statements (exact log identity); upper_weight_bound_eventually
(hSL >= -f(m-1), hSG >= -2, hSPW >= f(-1-k-7kL), hlo);
part_five_family_of_mass_volume (hSL <= fm, hS5 <= 0,
hS6 <= fkm(12+12L), hlg <= 2CY L); division_level_prime_family.
GlobalRankLatticeProofs/LogWeightMinusLogBBound.lean
8d9b1ee9cc0e41975f2b5339b1ec183dd35bb626 (actual local dimension lower
and log weight bounds). LemmaFiveOneOfTheoremTwo.lean
2b7d6755659146ca64a2aad8f1a426b6f196bd87 (same closed form).
PartFiveExplicitOfPropositions.lean 2b94505b7a3cedf501929bc5bfccc948fe21c776
(consumer needs original lowS, upper side and independent mass error).
The native hSL/hSG/hSPW normalize to l>=-(m-1)/k>=-1,
s>=-2/k>=-1/4, P-W>=-7L-1-1/k>=-7L-5/4.
The upper hSL gives l<=m/k<=1. Since 0<=t<=1, 0<=c<=3
(pi<4, log2<1), -tc/2>=-3/2. Exact cancellation of the
m v and m g terms is essential; a-t/2=(m-1)^2/(2k)>=0.
Hence the lower loss is L+3/2+1+1/4+5/4+7L=8L+4.
For upper, discard -t(v+c)/2<=0, use m-1+a<=3m/2,
m+a<=3m/2, v<=L, g<=2CY L. No sign assumption on CY
beyond the native nonnegative g bound. Upper margin at delta<=m
is (3L/2-13)m-1 >= m/2-1>=21. Lower margin at delta>=-2L
is L-4>=5. The existing virtual baseline comparison
C-1/4<=X<=C+3/4 then implies C>=lowS+17/4 and
C<=upper-83/4 for any word (if word fibre empty, count is vacuous).
This is stronger than required anchor lowS+1/4<=C<=upper-3/4.
The exact defect formula uses positive factors and the same factorial,
local index and mass ratio identities; the actual ratio need not be
equal to the model to use this scalar replacement. This does not prove
delta lies in the interval for an arbitrary native host. Native exact
mass identity gives delta=0, and all other source assumptions remain.

Original source-visible graph retained: Main -> ... -> core_gm ->
ch_top -> CountF -> LinkMin.division_level_prime_family ->
ramified_rank_lines_of_free / part_five_family_of_mass_volume ->
family_of_global_statements -> mass_telescope / BaseVolumeEqualsMass.
Also h3 (sigma degree), gapB_ev, place dimension/weight bounds, hSL,
hSG, hSPW, hS6, variation, mass-error and count consumers.
Reduced overlay: same native suppliers + signed mass defect interval ->
exact normalized identity -> both original sharp bounds (with slack)
-> same part_five_explicit_of_propositions. Local candidate only;
no global premise deletion, no new typed dependency extraction.
Cache context pin,D,host,sc,k,m,f,Delta,w,rho,word,actual consumer.
Backtrack to original identity if interval/replay fails.
Actual same-host eventual quantifiers unchanged; no URT claim.

Execution: local shell command -v lean/lake returned no paths.
CPython/SymPy executed four symbolic identities (not synthetic hosts):
```python
import sympy as s
m,k,f,L,v,g,c,sl,sg,p,w,d=s.symbols('m k f L v g c sl sg p w d', positive=True)
a=m*(m-1)/(2*k); t=(m-1)/k
raw=f*((m-1)*k+m*(m-1)/2)*v-f*(m-1)/2*(v+c)+sl+f*m*(2*k+m-1)/2*g+f*sg+p
X=raw/(f*k)+d; R=w/f+m*(v+g)
assert s.cancel(X-R-((a-1-t/2)*v+a*g-t*c/2+sl/(f*k)+sg/k+(p-k*w)/(f*k)+d))==0
assert s.cancel(X-((m-1+a)*v-t*(v+c)/2+(m+a)*g+sl/(f*k)+sg/k+p/(f*k)+d))==0
assert s.expand((-8*L-4)-2*L-(-11*L))==L-4
CY=s.symbols('CY')
assert s.expand((15+3*CY)*m*L-((s.Rational(27,2)+3*CY)*m*L+13*m+1))==s.Rational(3,2)*m*L-13*m-1
print('4 exact symbolic identity checks; at L=9,m=44: lower slack=5, upper slack=21')
```
Actual output as printed; exit 0. These verify algebra only.
Prior actual CI status files re-read: strip-root 45577239749 pass
98.87s b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc; prune 45576756833
pass 77.94s 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Older actual-root job status error 53256e3da3f32a68162c6ff17e461324acf08d4e;
not evidence of complete replay. Prior conditional strip axioms
propext, Classical.choice, Quot.sound; original scan pending 324 nodes.
This certificate is NOT compiled, no new native PASS/axiom result.
Coverage denominator: two targeted native count bounds; both have
source-matched scalar replacement under retained inputs. No global
completion percentage.

RESUME HERE: at actual LinkMin callers replace only the mass normalization
step by the exact signed-defect identity, then replay both sharp count
bridges. Upstream task: derive the relaxed defect interval from actual
Haar-volume/definite mass normalization (or retain original zero identity),
and authenticate sigma-degree and gap producers. No new conjectural moment.
HANDOFF TO: integration (compact paragraph), positivity geometry, audit,
kernel (caller-level native replay).
-/

namespace RHSignedMassNormalizationSlack

theorem lower_budget (L a t v c g l s P W delta X R : ℝ)
    (hL : 9 ≤ L) (ha : t/2 ≤ a) (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    (hv0 : 0 ≤ v) (hv : v ≤ L) (hc0 : 0 ≤ c) (hc : c ≤ 3)
    (hg : 0 ≤ g) (hl : -1 ≤ l) (hs : -(1/4:ℝ) ≤ s)
    (hP : -7*L-5/4 ≤ P-W) (hd : -2*L ≤ delta)
    (hX : X-R=(a-1-t/2)*v+a*g-t*c/2+l+s+(P-W)+delta) :
    R-11*L+5 ≤ X := by
  have ha0 : 0 ≤ a := by linarith
  have h1 : -L ≤ (a-1-t/2)*v := by
    have h := mul_nonneg (sub_nonneg.mpr ha) hv0
    nlinarith only [h,hv]
  have h2 : 0 ≤ a*g := mul_nonneg ha0 hg
  have h3 : t*c ≤ 3 := by
    calc t*c ≤ 1*c := mul_le_mul_of_nonneg_right ht1 hc0
      _ ≤ 3 := by linarith
  linarith

theorem upper_budget (L m CY a t v c g l s P delta X : ℝ)
    (hL : 9 ≤ L) (hm : 44 ≤ m) (ha : a ≤ m/2)
    (ht : 0 ≤ t) (hv0 : 0 ≤ v) (hv : v ≤ L) (hc : 0 ≤ c)
    (hg0 : 0 ≤ g) (hg : g ≤ 2*CY*L) (hl : l ≤ 1)
    (hs : s ≤ 0) (hP : P ≤ m*(12+12*L)) (hd : delta ≤ m)
    (hX : X=(m-1+a)*v-t*(v+c)/2+(m+a)*g+l+s+P+delta) :
    X ≤ (15+3*CY)*m*L-21 := by
  have hm0 : 0 ≤ 3*m/2 := by linarith
  have h1 : (m-1+a)*v ≤ (3*m/2)*L := by
    calc (m-1+a)*v ≤ (3*m/2)*v :=
      mul_le_mul_of_nonneg_right (by linarith) hv0
      _ ≤ _ := mul_le_mul_of_nonneg_left hv hm0
  have h2 : (m+a)*g ≤ (3*m/2)*(2*CY*L) := by
    calc (m+a)*g ≤ (3*m/2)*g :=
      mul_le_mul_of_nonneg_right (by linarith) hg0
      _ ≤ _ := mul_le_mul_of_nonneg_left hg hm0
  have h3 : 0 ≤ t*(v+c) := mul_nonneg ht (add_nonneg hv0 hc)
  have h4 := mul_nonneg (show 0 ≤ m by linarith) (show 0 ≤ L-9 by linarith)
  nlinarith only [hX,h1,h2,h3,h4,hm,hl,hs,hP,hd]

theorem anchor_join (C X low high : ℝ)
    (h1 : C-1/4 ≤ X) (h2 : X ≤ C+3/4)
    (h3 : low+5 ≤ X) (h4 : X ≤ high-21) :
    low+1/4 ≤ C ∧ C ≤ high-3/4 := by
  constructor <;> linarith

theorem anchor_auto (C X low high : ℝ)
    (h1 : C-1/4 ≤ X) (h2 : X ≤ C+3/4)
    (h3 : low+5 ≤ X) (h4 : X ≤ high-21) :
    low+1/4 ≤ C ∧ C ≤ high-3/4 := by
  first | (rh_reduce 3 using [anchor_join]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact anchor_join C X low high h1 h2 h3 h4

rh_scan Formalism.MainNotions.StandardLattice.upper_weight_bound_eventually limit 2000
rh_scan Formalism.MainNotions.StandardLattice.part_five_family_of_mass_volume limit 2000
rh_prune Formalism.MainNotions.StandardLattice.upper_weight_bound_eventually as RHSignedMassNormalizationSlack.native_lower_pruned
#print axioms lower_budget
#print axioms upper_budget
#print axioms anchor_join
end RHSignedMassNormalizationSlack
