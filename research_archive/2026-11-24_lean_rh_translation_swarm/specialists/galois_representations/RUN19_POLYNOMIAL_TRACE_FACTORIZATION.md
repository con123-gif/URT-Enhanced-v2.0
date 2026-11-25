# RUN19 — polynomial trace factorization and original block trace
2026-11-25. SOURCE-MATCHED / PARTIAL (pinned native proof reconstructed; current upstream relocation still unresolved). Project OPEN. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/protocol/continuity excerpts, RUN17–18, 16 recent commit patches with peer handoffs, integration 0100 and acceleration RUN19. CI checkpoint #408 01:25:36 UTC passes physical checks only; no RH replay. Some full peer files and external blueprint not reopened. Integration owns CoreAll/Row0; this is the distinct RUN18 trace-factorization frontier.

## Provenance
Repo leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005 (retained). Latest observed H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (2026-11-25 01:15:19 UTC). Compare H against previously observed b2f365a68500e2bde98cd60a2324263fc62fba10: 711 ahead, 0 behind, 300 file records (not exhaustive).
All paths relative to src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/.
- P ScalarCommutation/SpecAlg.lean blob ad2649702d29a9a02b67d2312919100da95f81e6: L49–87 trace_list_prod_mul_eq_prod_mul_trace_of_pow_sub_mul_zero; L89–97 trace_wop_mul_eq_wop_mul_trace_of_pow_sub_mul_zero; L99–116 compressed operator relations; L118–152 word and power compression; L154–163 diagonal trace; L166–255 specAlg.
- P ScalarCommutation/TypeSlice.lean blob 1c176ad18a52ea0eaa699e930cfcd2381a09b283 L64–70 Rel, L121–126 SpecAlg; H same path blob dcac4541d897050320fb28100f751caf3d80fe0a L99–105 and L151–156 respectively. Both declaration slices exactly equal by connector + V8 (2/2).
- P ProjectiveAutomorphicHecke/MapWopWmap.lean blob 1fe2c40629839c6824f70c04f14a3ccb866af5b4 L16 wop, L26 wmul, L35–39 wop_wmul, L59–60 Cert. H same path blob 10a3698dfce45340ea6e08d45e3b84631e9a8e5d (same as RUN18 observed H).
- H old SpecAlg, PTracePow and PProjTrace paths return 404. Four exact-name code searches returned no results. Do not infer deleted declarations or changed theorem. Relocation not resolved. Keep all P proofs, not latest H proof-equivalence claims.

## 1. Native trace removal proof, not semisimplicity
Let M be a finite-dimensional complex vector space, J any type, T_j endomorphisms commuting pairwise, theta:J→C arbitrary, and P idempotent. Assume every T_j commutes with P and for EACH j there exists N_j≥0 with (T_j-theta_j I)^{N_j}P=0. For EVERY finite word w, and EVERY Z commuting with each T_j and with P, the theorem states
Tr(T_w Z P) = theta_w Tr(ZP).
Here T_w is the ordered product in the list, theta_w the ordered scalar product; empty word means I and 1. No diagonalizability, orthogonality, positivity, invertibility, nonzero P, or finite J. The proof is induction on w, with Z generalized.

For w=j::v, set Y=T_v Z, D=T_j-theta_j I. Pairwise commutation and the hypotheses on Z imply Y commutes with every T_i and P. In particular D commutes with Y and P (scalars central). The native proof uses (DP)^{N_j+1}=D^{N_j+1}P= D(D^{N_j}P)=0, valid even N_j=0. Since DP commutes with Y, DPY is nilpotent: (DPY)^{N_j+1}=0. Its trace is zero (finite-dimensional complex nilpotent operator has all eigenvalues zero). Because YP=PY,
DPY = T_j YP - theta_j YP.
Taking trace gives Tr(T_jYP)=theta_j Tr(YP). Apply the induction hypothesis for v with the same Z, multiply by theta_j, and obtain the formula. Base case empty word immediate. The generalization over Z in the native statement preserves the commutation obligations. This is exact nilpotent trace removal, not replacing a Jordan block by an eigenvalue as an operator.

For a finite-support word polynomial s=(s_w), wop(T,s)=sum_w s_w T_w, wop(theta,s)=sum_w s_w theta_w. By distributivity and trace linearity the word formula gives
Tr(wop(T,s) ZP)=wop(theta,s) Tr(ZP).
This is the entire L89–97 lift; no exchange of infinite sums. Coefficients may be arbitrary complex numbers. The result is an equality even if wop(theta,s)=0 or Tr(ZP)=0.

## 2. Consumer: original uncompressed block traces
For each q in a FINITE index type Q, let W_q be finite-dimensional over C. T_{q,j},e_q,u_q,u'_q are endomorphisms. Rel has six exact premises: e²=e; e(T_j e)=T_j e; e(ue)=ue; T_i(T_j e)=T_j(T_i e); u(T_j e)=T_j(ue); u'(ue)=e. No assumption original T_j commute on the whole W_q. Assume there exist q0 and x0≠0 in W_q0 with e x0=x0 and every T_j x0=theta_j x0.
Compress t_{q,j}=T_{q,j}e_q, v_q=u_q e_q; all six relations imply pairwise t commutation, t-v commutation, t-e commutation, v-e commutation, u'v=e and e²=e (native L99–116).
On W=product W_q (finite direct sum), use diagonal maps t_j,V,E,U'. By RUN18 pProjOne there is one finite word polynomial a with scalar value 1 and P=wop(t,a) idempotent and satisfying all generalized eigenvalue conditions. P commutes with t_j,V,E because every constituent does. The vector supported only at q0 is fixed by both P and E (word evaluation on common eigenvector); therefore Q0=PE is nonzero and idempotent. U'V=E implies V is injective on im(Q0): VQ0 x=0 implies Q0 x=E Q0 x=U' V Q0 x=0. TracePow with lower bound 1 produces n≥1 such that C=Tr(PE V^n)≠0. Both n and a are fixed BEFORE the universal quantifier on s.
The original native output is sum_q Tr(wop(T_q,wmul(a,s)) u_q^n e_q) ≠0 whenever wop(theta,s)≠0. Here wmul is concatenation convolution of finite word supports; wop(T,wmul(a,s))=wop(T,a)wop(T,s) even for noncommuting T. To derive the stronger exact equality:
1. u^n e=(ue)^n e and e(ue)^n e=(ue)^n e, by induction using e²=e and [ue,e]=0 (L143–152).
2. If eX=X then T_j X=T_j e X and e T_j e X=T_j e X. Induct from the right over a word, then take the finite linear sum: wop(T,s)X=wop(t,s)X and e wop(t,s)X=wop(t,s)X. Apply first to s then to a (L118–141). Thus the original summand equals Tr(wop(t_q,a) wop(t_q,s) v_q^n e_q).
3. Trace of the diagonal operator equals sum of block traces (finite product basis; L154–163). The original sum now equals Tr(P wop(t,s) V^n E). Cycle P to the right (trace cyclicity), set Z=V^n E, which commutes with every t_j and P. Section 1 gives scalar wop(theta,s) times Tr(V^n EP). Commute E with V and cycle to get C=Tr(PE V^n).
Therefore for ALL s, including those with scalar value zero,
sum_q Tr(wop(T_q,wmul(a,s)) u_q^n e_q) = wop(theta,s) C.
Since C≠0, nonvanishing follows over C. This translates L229–255. The equality is exhibited by the proof, though SpecAlg only states the implication. Crucially one common (n,a) suffices even for infinite J. This does not prove occurrence of the original global automorphic eigensystem without its arithmetic input.

## 3. Source-to-root handoff
RUN17 exact consumer specOfF→specData→specTopG→IsFnL/PlanEx; RUN15–16 Pack/GeoOne; integration 0100 Row0→Row0b. New peer evidence: acceleration RUN19_RESUME.md (blob 5c85f2aefd6dec4150e4016dddfd6a67d3d9b477) lists authenticated manifest names/IDs and raw-slicer requests: UpperTheory.Gal.Spc.specAlg 13962369 (zero-based type/value roots 1059634995/1059646507); specOfF 13965895 (1059827818/1059842589); specTopG 13966873 (1059933754/1059934839). These are peer manifest lookup records, not independently verified incoming root paths in this run. Request actual role-labelled outgoing references from specAlg and incoming root paths for these IDs; do not equate private helper source calls with raw-term reachability until matched. Integration owns coreAll_of/rest, so leave it untouched. RUN11 native frob_laws supplier and relocated H bodies remain open. Earlier 15 PlanEx All fields and separate witnesses retained.

## 4. Executed checks
Connector/V8 19 exact source-line anchors (SpecAlg P L49,52,53,77,78,79,84,87,89,96,97,190,226,236,240,249,253,254,255), 2/2 exact cross-revision Rel and SpecAlg predicate comparisons, four source snapshots checked. No local Git checkout or Lean kernel replay. Reproduce source checks using git show P:path and H:path and the listed line ranges; git rev-parse REF:path gives the stated blob hashes.

The following exact finite regression was executed locally in Python/SymPy, not Lean. It is a theorem illustration, not a substitute for the general proof or an actual automorphic instance. Negative controls: dropping T-Z commutation allows nilpotent J times Z to have nonzero trace; using n=1 need not work due to cancellation between blocks. Uncompressed T's deliberately do not commute. Output: word identities 186; polynomial identities 204; original block trace identities 102; negative controls 2 (noncommuting Z, n=1 cancellation); n=2 common trace=4.
```python
from itertools import product
from sympy import Matrix, eye, zeros, diag, Rational, I, expand

E = diag(1, 1, 1, 0)
N = zeros(4); N[0, 1] = 1
A = diag(2, 2, 3, 0) + N
B = diag(-1, -1, 5, 0) + 2*N
C = zeros(4); C[0, 3] = 7; C[3, 3] = 11
D = zeros(4); D[1, 3] = 3; D[3, 3] = -2
T = (A+C, B+D); t = tuple(x*E for x in T)
P = t[0]**2*(3*eye(4)-t[0])/4
assert P == diag(1, 1, 0, 0)
assert T[0]*T[1] != T[1]*T[0]
theta = (2, -1)
a = {(0,0): Rational(3,4), (0,0,0): Rational(-1,4)}

def word(X,w):
    m = eye(4)
    for j in w: m = m*X[j]
    return m

def val(w):
    n = 1
    for j in w: n *= theta[j]
    return n

def wop(X,s): return sum((c*word(X,w) for w,c in s.items()), zeros(4))
def wval(s): return sum(c*val(w) for w,c in s.items())
def wmul(a,s):
    out = {}
    for x,c in a.items():
        for y,d in s.items(): out[x+y] = out.get(x+y,0)+c*d
    return out

def trace(M): return expand(M.trace())

assert wval(a) == 1 and wop(t,a) == P and P*P == P
for j in range(2):
    assert (t[j]-theta[j]*eye(4))**2*P == zeros(4)
    assert t[j]*P == P*t[j]
assert t[0]*t[1] == t[1]*t[0]
blocks = []
for sign in (-1,1):
    v = diag(sign,sign,2,0)
    u = v+C
    up = diag(sign,sign,Rational(1,2),0)
    assert E*E==E and E*u*E==u*E and up*u*E==E
    for i in range(2):
        assert E*T[i]*E==T[i]*E
        assert u*T[i]*E==T[i]*u*E
        for j in range(2): assert T[i]*T[j]*E==T[j]*T[i]*E
    assert u*E==v
    blocks.append((u,v))
assert sum(trace(P*E*v) for u,v in blocks)==0
assert sum(trace(P*E*v**2) for u,v in blocks)==4
words = [w for k in range(5) for w in product(range(2),repeat=k)]
word_checks=0; poly_checks=0; original_checks=0
polys = [{w: 1, (): 2+I} for w in words if w] + [{(): 1}, {(0,):1, (): -2}, {(0,1):I,(1,0):-I}, {}]
for u,v in blocks:
    for n in (1,2,3):
        Z=v**n*E
        for w in words:
            assert trace(word(t,w)*Z*P)==val(w)*trace(Z*P)
            word_checks+=1
        for s in polys:
            assert expand(trace(wop(t,s)*Z*P)-wval(s)*trace(Z*P))==0
            poly_checks+=1
for n in (1,2,3):
    constant=sum(trace(P*E*v**n) for u,v in blocks)
    for s in polys:
        left=sum(trace(wop(T,wmul(a,s))*u**n*E) for u,v in blocks)
        assert expand(left-wval(s)*constant)==0
        if n==2 and wval(s)!=0: assert left!=0
        original_checks+=1
J=Matrix([[0,1],[0,0]]); Z=J.T
assert J**2==zeros(2) and trace(J*Z)==1 and trace(Z)==0
print(f'word identities {word_checks}; polynomial identities {poly_checks}; original block trace identities {original_checks}; negative controls 2 (noncommuting Z, n=1 cancellation); n=2 common trace=4')
```
RESULT: DONE at pinned source level for two private trace lemmas and exact original-block consumer; PARTIAL for upstream relocation and authenticated root/dependency edges. No RH proof completion, independent Lean kernel validation or URT improvement claimed.

RESUME HERE: retrieve the pinned P Source SpecOfF.lean (RUN17 blob 2a619e581a3f64fd8a548f6dc7ad614a8b591ebf) and reconstruct the next not-yet-expanded supplier of its finite definite-form-class operator construction, in particular compare the changed finite_doubleCoset supplier and prove the class transport/finite-dimensional prerequisites (avoid RUN17's assembly repetition). In parallel ask kernel/dependency lane for specAlg manifest ID 13962369 value-root 1059646507 direct references and authenticated H relocation via source index; retain PTracePow/PProjTrace and frob_laws gaps. HANDOFF TO Galois, dependencies, kernel, integration, editor, audit, literature. Project OPEN.
