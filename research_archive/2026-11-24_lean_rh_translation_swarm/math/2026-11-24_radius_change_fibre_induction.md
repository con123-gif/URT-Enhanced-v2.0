# Radius-change cardinality lemma: human proof of remaining small-section leaf
Status: SOURCE-MATCHED local mathematical reconstruction; project remains OPEN. Independent interactive continuation of geometry RUN2, not a repetition of the quotient-injection or conditional size chapter. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. No physics changes, new axiom, or Lean execution.

## Exact source and scope
Under src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/:
- EncardSeminormBallPowLeRadiusChange.lean (819afb0c0d33f897fc32277d8480603e827a352b), encard_mul_encard_le_isBallFam, encard_ball_pow_le.
- EncardSeminormBallPowLeRadiusChangeStatement.lean (35a92dc495988f7529236479b1344eae8bff353d), GlobalTheory.T.encard_seminormBall_pow_le_radius_change, directly applies encard_ball_pow_le.
- ExistsLogNcardSeminormBallExpSmallLe.lean (78652f5802201a83030be5b2af64ae38db0371e6), log_ncard_ball_exp_le calls this exact wrapper.
- Definitions/Divisors/CharZeroFunctionField.lean under AbelianVarietyTheory (f0bb42594c83ce7baca8da440bbbd36f2c9d730a) defines IsBallFam.

Let G be any additive commutative group, Lambda an additive subgroup, B(r) a real-indexed family contained in Lambda. The four assumptions are: 0 in B(r) when r>=0; subtraction sends B(r) x B(s) into B(r+s); for every positive integer q and x in Lambda, q*x in B(q*r) iff x in B(r); containment in Lambda. No vector-space structure, torsion-freeness, positive-definite norm or lattice-volume assumption required.

Monotonicity: for r<=s subtract zero in B(s-r) from each x in B(r). Also -y in B(b) follows by subtracting y from zero in B(0).

## 1. The fibre inequality
For a,b real, q a positive integer with 2b<=q and B(a),B(b),B(1) finite, consider F:B(a) x B(b)->B(qa+b), F(x,y)=qx+y. Its range follows by scaling and subtraction of -y.
Fix a nonempty fibre over z and choose (x0,y0). For any other (x,y) in it, q(x0-x)=y-y0 belongs to B(2b) subset B(q). Since x0-x in Lambda, scaling equivalence gives x0-x in B(1). The map (x,y)->x0-x is injective on that fibre: equal images imply equal x, and the fibre identity then implies equal y by group cancellation, not by cancelling multiplication by q. Consequently every fibre has cardinal at most |B(1)|. Summation over fibres proves
|B(a)| |B(b)| <= |B(1)| |B(qa+b)|.
The codomain count is extended cardinal; the image count is finite. No division.

## 2. Geometric-series induction (exact source)
Take R>=1, natural Q,e, Q>=2R+1, B(R) finite. B(1) finite by monotonicity, and has at least one element. If B(R Q^e) is infinite, the extended-cardinal inequality follows immediately because |B(1)|^e is nonzero, including e=0. Otherwise all smaller-radius balls needed below are finite.
Define s_j=sum_{i=0}^{j-1}Q^i. Then s_0=0, s_{j+1}=Q s_j+1, and s_j+1<=Q^j by induction using Q>=2: s_{j+1}+1=Q s_j+2<=Q(s_j+1)<=Q^{j+1}. Thus for j<=e, R s_j<=R Q^e.
Induct on j<=e to prove
|B(R)|^j <= |B(1)|^j |B(R s_j)|.
At j=0 this is 1<=|B(0)|. For the induction step multiply by |B(R)| and apply section 1 with a=R s_j, b=R, q=Q. The output radius Q R s_j+R=R s_{j+1}. No cancellation of cardinalities or interchange of quantifiers. At j=e use monotonicity:
|B(R)|^e <= |B(1)|^e |B(R s_e)| <= |B(1)|^e |B(R Q^e)|.
This proves the imported wrapper's precise result, and records the stronger intermediate radius R s_e in the finite-large-ball case. The induction is e steps; not a claim that the whole RH proof is linear time.

## 3. Consequence in the small-section comparison
In log_ncard_ball_exp_le let epsilon>0, e=max(1,ceil_nat(C/epsilon)), delta=1/e, R=exp(m/e), Q=ceil_nat(2R+1). All balls finite, zero included at the nonnegative radii, hence positive cardinalities. For m>=3e, Q<=4R and R^(e+1)<=exp(2m), so R Q^e<=exp(3m). Take logarithms in section 2:
e log |B_m(R)| <= e log |B_m(1)| + log |B_m(exp(3m))|.
The eventual crude bound C m^d and C<=epsilon e imply
log |B_m(exp(delta m))| <= log |B_m(1)| + epsilon m^d.
This discharges the radius-change cardinality leaf in geometry RUN2. It does not discharge arithmetic Hilbert-Samuel, the off-divisor maximum principle, polynomial asymptotics, or the actual native family existence. Those remain separate premises.

## 4. Executed V8 exact regression
Scaled integer lattice balls B(r)={x in u Z: |x|<=r}, finite cyclic group constant balls at nonnegative radii, and one failure if the fibre condition is dropped. Executed 2700 radius-induction cases (all 2700 strictly sharper radii), 26337 explicit fibre maps, 144 finite torsion examples, one negative control. Zero positive-case failures. These are abstract regression fixtures; the argument above is the general mathematical proof. Reproduce in Python:
```python
from itertools import product
from collections import defaultdict
checks=fibres=sharp=torsion=0
def card(r,u): return 2*(r//u)+1
for u,R in product(range(1,6),range(1,13)):
    for Q in range(2*R+1,2*R+6):
        s=0
        for e in range(9):
            assert card(R,u)**e <= card(1,u)**e*card(R*s,u)
            assert s+1<=Q**e
            sharp+= R*s<R*Q**e
            checks+=1
            s=Q*s+1
for u,a,b in product(range(1,4),range(9),range(9)):
    for q in range(max(1,2*b),max(1,2*b)+3):
        F=defaultdict(list)
        for x in range(-(a//u),a//u+1):
            for y in range(-(b//u),b//u+1):
                z=q*x+y
                assert abs(z*u)<=q*a+b
                F[z].append((x,y))
        for f in F.values():
            ds=[f[0][0]-x for x,y in f]
            assert all(abs(d*u)<=1 for d in ds) and len(set(ds))==len(ds)
            fibres+=1
        assert card(a,u)*card(b,u)<=card(1,u)*len(F)
for n,e in product(range(1,17),range(9)):
    assert n**e<=n**e*n
    torsion+=1
assert 9*7>3*15 # a=4,b=3,q=1 violates 2b<=q; B on Z
assert (checks,fibres,sharp,torsion)==(2700,26337,2700,144)
```

## Continuity: export failure corrected before this session
Original failed job status on cathedral-research-state compute/rh-verified-export-stream-closure-20261124/status.json, run 45348756372: actual raw count 350862311, SHA256 bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9. Original script at 60f7c62f3e484bdce858949fec0a87ca60a4ce7c expects 350862970, same hash. Current script bffe89b20ff5e297d921443492e918933c8e0d92 already corrects count to 350862311. Exact equality of reported digest to pinned digest checked. Registry already has rh-stream-closure-retry-20261124; no completed status file retrieved yet. No duplicate fix, no full export success claim.

RESUME HERE: geometry editor should incorporate the now-explained radius-change leaf; next follow the native arithmetic maximum principle or the actual hPX.1/hPX.2 producers flagged in geometry RUN2, not the closed size algebra. Dependency lane inspect retry status and only claim root closure after authenticated actual output.
HANDOFF TO: geometry, proof editor, integration, audit, dependencies.
