import Lib.PadicHodge.WachKisin.PeriodMatrixFrame
import Mathlib.Tactic

/-!
# Compact C: period-frame determinant descent and integral lifting
26 November 2026 — INTEGRATION. Human source-matched, conditional on the
actual IsPeriodMatrix.exists_basis and chart lemmas. This fills the next
primitive of the editor RUN59 and math 1c42c408 checkpoint, not the global
determinant assembly. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; initial manuscript
a1cd58ab264179f0e35001a50da0853ef4b9d858 (RUN59).
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, continuity, state/log excerpts,
current mission and latest commit index. Peer 1c42c408 supplies minimal-support
normalization; editor 3c29c488 integrates it, literature 3b3720f77 supplies
downstream frame/retraction; audit 57db85ec confirms earlier cup descent.
Do not duplicate those proofs.

Sources relative to compact src:
- Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean
  348d083320f3e9f59100db1a2f96f5a3f8e92923, IsPeriodMatrix.exists_frame:53–128.
- Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean
  cd91a46eb5624b88af20a96d0450bdf059994b93, exists_basis:81–153.
- Lib/PadicHodge/WachKisin/ChartScalars.lean
  8dc59315a323816ecb0eedf46b5aae0a8c714fc5,
  mk_thetaPhiInv_eq_coeff:21–22, exists_frobE_dvd_sub_of_dvd:35–38,
  eventually_exists_coeff_eq_of_fixed:59–77, bicommutant:102–106.
- Lib/PadicHodge/WachKisin/FrameTheorem.lean
  57d6daa6060f9f00eb27be6525460ba942a73f08, actual frame consumer:64–72.
- New/Selmer/CrystallineBound.lean
  7b7ba1c2ac12f09651b5c1285109ff0435258e79.
No RH theorem imported; no URT premise.

## 1. Extract the coordinate matrix, not a mod-p inverse of Q

Keep the exact native basis witness Q,Z, with det Q nonzero in A_inf,
UZ=E^h Q, Z in the chart bicommutant, and the two quantified conclusions
of exists_basis. Write B=b^T in the native line 68, phi Q=v Q B, v a unit.
R:S -> OFlat is reduction mod p restricted to the chart ring S;
bar denotes reduction mod p on A_inf. All coefficients below lie in their
actual rings; p is a unit only in B^+, not A_inf.

For each chart coordinate lambda_i and row j of Q, consider the S-row
N_(i,j)=lambda_i composed with Q_j. For t in S^d suppose that all these
rows have R(N_(i,j) dot t)=0. By S-linearity this says each coordinate of
Qt is divisible by p. The source's adic-basis membership criterion and
OFlat Hausdorffness (lines 76–81) imply Qt=p w with w integral in A_inf^d:
in the residue ring all coefficients of the reduced vector vanish.
This is an explicit retained chart lemma, not the assertion that an
arbitrary coordinate system detects integral divisibility.

Since p is invertible in B^+ with its inverse in the bicommutant, set
y=Zt/p. Then Uy=E^h w, with y in the bicommutant coordinatewise.
The generating clause of exists_basis supplies s in S^d with Qs=w.
Thus Q(t-ps)=0, and det Q != 0 over the domain gives t=ps. In particular
R(t)=0. This is exactly the premise of exists_det_ne_zero for the set
of rows N_(i,j). Its actual determinant-selection lemma chooses d such
rows forming N over S, with det R(N) != 0. No assumption of an invertible
Q modulo p and no division by p in A_inf is made.

## 2. One nonzero determinant pays all Frobenius iterates

Set B0=R(B), N0=R(N), K=det B0 * det N0. The factor det B0 is nonzero:
if p divided det B in A_inf then det(phi Q)=v^d det Q det B and the
bijective Frobenius preserving p-divisibility would inductively imply
p^m divides det Q for every m. Witt p-adic separatedness would give
det Q=0. Consequently K != 0 in OFlat, an integral domain.

Suppose for contradiction p divides det Q. Use the peer's normalized
minimal-support a, with Qbar a=0, a_nu=1. For g fixing S pointwise,
its action is S-linear and preserves Amax. Bicommutant membership of Z,
applied to g and 1, gives gZ=Z. Such g fixes the required chart scalars,
so the actual Galois transform identity A at lines 70–71 expresses Q
as an integral scalar/matrix times gQ. Reducing and applying g to Qbar a=0
therefore gives Qbar g(a)=0. The minimal-support lemma implies g(a)=a.
This checks the premise of eventually_exists_coeff_eq_of_fixed, not
the stronger claim that arbitrary Frobenius endomorphisms fix a.

Define C_0=I and C_(n+1)=B phi_S(C_n) over S. With e_n=sum_{j<n} p^j,
induction gives the exact identities in OFlat:
  Qbar R(C_n) a^(p^n)=0,
  det R(C_n)=(det B0)^e_n.
Here the vector power is entrywise. The first follows by applying
Frobenius to the preceding zero equation and using phi(Qbar)=vbar Qbar B0;
cancel the unit vbar. The second follows from determinant multiplicativity
and reduction of phi_S to p-th power. e_0=0, e_(n+1)=1+p e_n.
Since p>=2, 1+e_n<=p^n (induction: 2+p e_n<=p(1+e_n)).
Thus
  K det R(C_n) divides K^(p^n).
Indeed K det R(C_n)=(det B0)^(1+e_n) det N0; multiply by
(det B0)^(p^n-1-e_n) (det N0)^(p^n-1).
No division by det B0 or det N0. This is the precise native recurrence
at lines 99–102; it uses the SAME B and N at every depth.

## 3. Coefficient approximation converts the recurrence into a contradiction

Fix arbitrary M>=0. By the chart approximation theorem, applied to the
finite coordinates of a with the fixedness above, choose ONE n sufficiently
large and s_i in S with
  coeff_(M+n)(R(s_i))=coeff_M(a_i).
Write r=coeff_(M+n):OFlat -> O_C/p. Perfection gives
r(a_i^(p^n))=coeff_M(a_i), hence r(Qbar R(C_n) R(s))=0.
In particular theta_(M+n)((Q C_n s)_j) is divisible by p in O_C
for each row j, by the native mk_thetaPhiInv_eq_coeff.

For each of the selected coordinate rows of N, apply
exists_frobE_dvd_sub_of_dvd to lambda_i and alpha=p in S.
It says theta_(M+n)(lambda_i((Q C_n s)_j)) is also divisible by p.
Because lambda_i is S-linear, that expression is the corresponding row
of N C_n s. Therefore
  r(R(N C_n)) * r(R(s))=0.
The coordinate nu of r(R(s)) is 1, not merely nonzero. Multiplying by
the adjugate and taking coordinate nu proves
  r(det R(N C_n))=0
even in the non-domain O_C/p. This is the exact nonzero-divisor argument
in lines 103–110; taking a nonzero vector would be insufficient.

Since det R(N C_n) divides K det R(C_n), which divides K^(p^n),
we obtain
  0 = coeff_(M+n)(K^(p^n)) = coeff_M(K).
Every M is arbitrary; Perfection.ext gives K=0, contradicting section 2.
Hence p does NOT divide det Q. This completes the determinant-contraction
block as a human derivation conditional on the exact earlier basis/chart
lemmas. It does not establish those earlier lemmas by fiat.

## 4. Actual integral frame consumer, no new divisibility premise

The second, prime-to-p divisibility clause of exists_basis now applies
with delta=det Q and l=any row of adj Q: l Q=delta e_i^T. If
U Y=E^h X for integral X (columns understood), it gives det Q | (adj Q X)_ij
for every i,j. Choose one integral L with adj Q X=det Q L; multiply by Q
and cancel nonzero det Q to obtain QL=X. This is native hQ at 112–115.
Applying it with X=tau^h I and the existing period inverse Y=U' gives
Q L=tau^h I, the exact input of FrameTheorem.lean:66–72.
Applying it to the native Galois transform A g H gives the integral
matrix G for gZ=Z G by injectivity of U and cancellation of E^h.
The inverse Z' with Z' Z=E^h still uses the source's A_inf approximation
at lines 116–126; we retain that part rather than assuming B^+ divisibility
from rational spanning. Also retain the earlier exists_basis contraction
and the chart fixed-coefficient approximation proof, BdR radius and
normalized RowBalanced estimate. No new global root node retired.

Original graph retained. Human replacement edges, exact caller:
  exists_frame:72–111
  <- exists_basis.generating + adicBasis/OFlat separatedness
  <- exists_det_ne_zero + minimal-support + Frobenius and Galois transforms
  <- ChartScalars.eventually_exists_coeff_eq_of_fixed
     + exists_frobE_dvd_sub_of_dvd + Perfection.ext
  -> not p | det Q
  -> exists_basis.prime-to-p divisibility -> hQ -> QL=tau^h I, Galois lift.
Do not delete any original/reduced graph entries or axiom evidence.
Independent reviewer should check chart-map typing at all coefficients
and the unit v reduction; do not apply coefficient maps to B^+.
A/B recent editor integrations preserved without alteration.

## Executed diagnostic / verification boundary

Local command -v lean/lake/elan returned none. Exact Python checks executed
in current sandbox: 606 exponent identities/inequalities (p=2,3,5,7,11,13,
n=0..100); 112 normalized kernel/determinant cases over Z/4, all passed.
Negative control 2*2=0 in Z/4, 2 != 0, shows why a nonzero coordinate is
not sufficient. These are scalar diagnostics, NOT native-period tests.
Reproduce:
```python
from itertools import product
checks=0
for p in (2,3,5,7,11,13):
 for n in range(101):
  e=sum(p**j for j in range(n))
  assert e+1<=p**n and e==(p**n-1)//(p-1)
  assert sum(p**j for j in range(n+1))==1+p*e
  checks+=1
assert checks==606
count=0
for a,b,c,d in product(range(4),repeat=4):
 for x,y in product(range(4),repeat=2):
  if (x==1 or y==1) and (a*x+b*y)%4==0 and (c*x+d*y)%4==0:
   assert (a*d-b*c)%4==0
   count+=1
assert count==112
assert 2*2%4==0 and 2!=0
print(checks,count)
```
Actual prior native receipts: run 45799225653 concluded success (targeted
only), 45803534769 concluded workflow success but primitive receipt
d07359dc70c3f9f28e4858c835e5fa5424b6f539 explicitly records six successful
theorem probes (standard three axioms) and one module timeout 124.
Neither checks this new human replacement. Attempted direct targeted
output path compute/rh-compact-targeted-verification-20261126/outputs/
targeted_results.json returned 404; do not fabricate its contents.
Old-pin native engine not used against compact pin. No new Lean PASS,
full replay, graph pruning claim, or proof completion.

RESUME HERE: independently audit sections 1–4 at PeriodMatrixFrame:72–128;
then derive A_inf approximation inverse Z' and the exists_basis contraction
at PeriodMatrixBasis:87–153 (especially the two bounded-denominator
estimates, S-adic free lattice and approximation divisibility). Integrate
this block directly in the existing C frame chapter; do not repeat
minimal support or endgame. Prepare shared compact verification probes,
not competing CI. HANDOFF TO editor, math, literature, audit, kernel.
-/

namespace IntegrationPeriodFrame
def exponent (p : ℕ) : ℕ → ℕ
  | 0 => 0
  | n+1 => 1 + p * exponent p n

theorem exponent_bound {p : ℕ} (hp : 2 ≤ p) (n : ℕ) :
    1 + exponent p n ≤ p ^ n := by
  induction n with
  | zero => simp [exponent]
  | succ n ih =>
    calc
      1 + exponent p (n+1) = 1 + (1 + p * exponent p n) := rfl
      _ ≤ p * (1 + exponent p n) := by rw [Nat.mul_add, Nat.mul_one]; omega
      _ ≤ p * p ^ n := Nat.mul_le_mul_left p ih
      _ = p ^ (n+1) := by rw [pow_succ']

theorem power_budget {R : Type*} [CommMonoid R] (K : R)
    {p : ℕ} (hp : 2 ≤ p) (n : ℕ) :
    K ^ (1 + exponent p n) ∣ K ^ (p^n) :=
  pow_dvd_pow K (exponent_bound hp n)

#check Lift.Chart.exists_det_ne_zero
#check exists_fixed_ker
#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.IsPeriodMatrix.exists_frame
#check Lift.Chart.eventually_exists_coeff_eq_of_fixed
#check Lift.Chart.exists_frobE_dvd_sub_of_dvd
#print axioms power_budget
#print axioms Lift.Chart.IsPeriodMatrix.exists_frame
end IntegrationPeriodFrame
