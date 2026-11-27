# Matrix lane — MO487192 exact registered target and complete field classification
27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source: Mare, MathOverflow 487192, February 2025, CC BY-SA; Steinberg's positive-real/poset comments acknowledged as recorded in the actual registered source. Standard Jacobson radical, separability and involution facts are prior mathematics. This is an independent extension of the existing certificate, not another eligible problem or a claim of first discovery.

## Fresh official reconciliation
Read current AGENTS.md, CAMPAIGN_LEDGER.md, VERIFIED_PROOFS.json, latest matrix checkpoints, MO198816_SOURCE_AND_PROOF.md, round14 and 18:24 checkpoint, official current tools/oma.sh and lib/join.ts. Direct join.txt web inaccessible and sandbox curl DNS fails; source generator inspected as fallback (prior actual live rule retrieval 46048831941). Direct original MO source and StackExchange API answers/comments inaccessible this run; relied on registered source and archived audit for existing proof only. No fresh lease, no duplicate official submission.
- Three merged full proofs 7724,7815,7817 independently confirmed by actual PR metadata; latest ledger 25 checked certificates, zero confirmed genuinely-new accepted discoveries. Prior novelty audit remains binding.
- MO198816 full disproof PR10139 is open; upstream run46047885906/job140671608373 queued at read; no upstream pass/merge claimed. Imported-target checker previously accepted in run46046988992. Do not duplicate.
- MO290383 #7223 and MO466218 #7625 remain open statement prerequisites.
- MO298064 statement #8847 merged18:11:28; foreign proof #10106 open, author justusklocke-cloud. Do not duplicate.
- Newly merged statement PRs #9480 A383246 (18:49:59), #9482 A383248 (18:50:45), #9503 MO487192 (18:51:52). Other matrix target #9686 MO319325 remains open. Coordinate other lanes for A383246/A383248.
- Explicit all-state is:pr searches for 198816,290383,466218,487192 found existing submissions; for 487192 only #9503. Search for A383246/A383248 returned empty despite known PRs; search indexing cannot establish absence of competing work.

MO487192 registered statement blob 9d10c39e4ec29d7623a0e3f3a9521aa50d6e7110 byte-identical to PROOFS_READY/mo-487192.statement.lean. Archived complete proof blob 9f5d35a7e976be52d2864261e1068aa66dac2c5e unchanged. Recovered exact authorized campaign-verify.yml workflow before use (blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c). Created campaign/proofs/mo-487192.lean on fork oma-campaign-20261127 at commit 3e2cc60bf35d257b8a891f272adc9f09a25c54ce, exact imported-target verification run https://github.com/con123-gif/open-math-agents/actions/runs/46052923130 in progress at read. This is a verification-only push, not official proof submission. No token read or archived. Prior inline certificate passed 46039599862; not a substitute for this new check.

## Independent complete mathematical classification
For a field K and n>=1, let q(v)=v^T v on K^n. Then the following are equivalent:
(i) q is anisotropic (q(v)=0 implies v=0);
(ii) for every invertible A in M_n(K), the joint centralizer C_K(A,A^T) is a semisimple ring.
Indeed if (i) holds, every unital transpose-stable K-subalgebra of M_n(K) is semisimple.

Proof (i)->(ii). Let C be any such subalgebra, J its Jacobson radical. Finite dimensionality gives J nilpotent. Transpose is an anti-automorphism of C, preserving J (the left and right Jacobson radicals coincide). For x in J, y=x^T x belongs to J, is symmetric and nilpotent. A symmetric nilpotent y must be zero: otherwise choose minimal k>=2 with y^k=0 and a vector u with w=y^(k-1)u nonzero. Then q(w)=u^T y^(2k-2)u=0 since 2k-2>=k, contradicting anisotropy. Therefore x^T x=0; each column of x has q=0 from the diagonal of x^T x, so x=0. J=0, hence C semisimple Artinian. The joint centralizer is transpose-stable: transposing either commutation relation gives the other relation.

Proof (ii)->(i). If v!=0 and v^T v=0, let N=vv^T. It is symmetric and nonzero (a nonzero coordinate has nonzero square), N²=0. A=I+N invertible with inverse I-N and A^T=A. Thus C_K(A,A^T) is the centralizer of N. In that algebra N is nonzero central square-zero, giving the nonzero square-zero two-sided ideal CN. This lies in its Jacobson radical, so C is not semisimple. QED. Neither diagonalizability nor char zero is required for the fixed-dimension theorem.

Consequently the third MO487192 assertion for all dimensions holds over a particular characteristic-zero K iff K is formally real: if -1=sum a_i², (1,a_1,...,a_m) is isotropic; conversely any isotropic nonzero vector divided by a nonzero coordinate gives -1 as a sum of squares. For n=1 q is always anisotropic; over C already n=2 fails, with N=[[i,1],[1,-i]]. Its centralizer consists exactly of tI+z(N+iI), equivalently span(I,N), a dual-number algebra. This is smaller than the existing 3x3 checked certificate; not a replacement without Lean verification.

For the first two registered conjuncts, there is an additional characteristic-zero positive argument. Every rational A (in particular every finite poset's 0/1 Cartan matrix) has a semisimple joint centralizer over Q by anisotropy of the ordinary rational dot product. For any characteristic-zero K, C_Q(A,A^T)⊗_Q K -> C_K(A,A^T) is an algebra isomorphism: the joint centralizer is the kernel of the linear map X↦([X,A],[X,A^T]), and extension of scalars over fields preserves this kernel; the canonical map respects multiplication and identity. A finite-dimensional semisimple algebra over the perfect field Q is separable, hence its base change to any field extension is semisimple (standard separable algebra theorem). This proves the first two conjuncts, not only their real versions. The product-of-chains case is a finite poset special case. Empty poset gives the zero ring under the usual semisimple module convention. This is a hand argument beyond the archived disproof, not a new distinct solution, not kernel checked, and not claimed original; standard semisimple/separable algebra and anisotropic involution literature predate the question (e.g. Cimpric arXiv:0807.5017 for related involution notions; not asserted to contain this exact classification). Targeted literature search not exhaustive.

## Executed exact challenges
Python/SymPy verified N²=0, N^T=N, det(I+N)=1, inverse I-N and solved the four linear centralizer equations, yielding (x,y,z,t)=(t+2iz,z,z,t). Exhaustive vector search over p=3,5,7,11,13,17,19 and n=1,2,3 (21 field/dimension cases) confirmed anisotropy iff n=1 or n=2 and p=3 mod4 in this range, and every isotropic case produced exact nonzero square-zero N=vv^T modulo p. These finite checks are only a challenge of the universal hand proof.
```python
import sympy as s, itertools
I=s.I; N=s.Matrix([[I,1],[1,-I]]); A=s.eye(2)+N
assert N*N==s.zeros(2) and N.T==N and A.det()==1
x,y,z,t=s.symbols('x y z t'); X=s.Matrix([[x,y],[z,t]])
print(s.linsolve(list(X*A-A*X),(x,y,z,t)))
assert s.simplify(A*(s.eye(2)-N)-s.eye(2))==s.zeros(2)
for p in [3,5,7,11,13,17,19]:
 for n in [1,2,3]:
  v=next((v for v in itertools.product(range(p),repeat=n) if any(v) and sum(a*a for a in v)%p==0),None)
  if v:
   M=s.Matrix(v)*s.Matrix(v).T
   assert any(int(a)%p for a in M) and all(int(a)%p==0 for a in M*M)
  assert (v is None)==(n==1 or n==2 and p%4==3)
```
Actual execution succeeded. No new full Lean certificate for the extension, no additional count.

RESUME HERE: read the actual imported-target verdict for run46052923130, relay accepted result to campaign owner, recheck all-state proof PRs and actual live desk/team/owner lease state before any official MO487192 submission. Do not take a lease or submit if another worker owns it. Preserve existing MO198816 proof PR and monitor upstream verdict separately.
