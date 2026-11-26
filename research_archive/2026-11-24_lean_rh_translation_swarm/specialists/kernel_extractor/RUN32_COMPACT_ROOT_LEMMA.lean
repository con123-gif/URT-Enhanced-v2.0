import New.TwistedHecke.RootLemma
import Mathlib.Tactic

/-!
RUN32, 26 November 2026 — independent human source-matched reconstruction;
native probes PREPARED, NOT executed. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207 (main observed unchanged);
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96. Read protocol, handoff,
expansion, AGENTS, continuity and peers. RUN31 575d0d31; theta peer
1cc71623 covers projector, explicitly leaves root_lemma; c423f7ff
and 5a7952de concern other primitives.

Pinned sources relative to grh-compact/src:
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
The last is separate, not discharged here.

1. Stepanov over the actual quotient ring.
For W local, choose representatives of its q residue classes.
Distinct representatives differ by a unit, hence their images
under any unital ring map do also. If the first E Taylor coefficients
of nonzero Phi vanish at every image, the E-th powers of the
corresponding linear factors divide Phi. The powers are pairwise
comaximal, so their PRODUCT divides Phi. Since this product is monic,
degree adds on multiplying any nonzero polynomial, including over
rings with zero divisors. Thus qE <= deg Phi; no field hypothesis.

2. Two Gauss filtrations, upper and perturbation.
Write y_s=rootVar(a,a',s), x_s=rootVar(a',a,s), a != a'.
d_s=c(y_s)-c(x_s) in [2/5,8/5], q=P^N, omega=d_i/q>0,
D_s=P^((s-i) mod N), M_s=q D_s, E_i=q, E_s=D_s for s!=i.
The native weights m,e are M_s on x_s and E_s on y_s respectively,
zero elsewhere. Let pi merge y_i into x_i and fix other variables.
For auxiliary t define the algebra map C by
 C(x_s)=x_s t^M_s, C(y_i)=x_i, C(y_s)=y_s (s!=i),
identity on the other variables. Modify C to Psi at s!=i by
 Psi(x_s)=x_s t^M_s - eps_s y_s t^E_s,
 Psi(y_s)=y_s - eps_s x_s,
eps_s=-1 if parity(s)=parity(i), +1 otherwise. This matches chi
and chi-eta of the source. Give t weight -omega and each output
z weight c(z)+m(z)omega. C preserves variable weights, including
the merge c(x_i)+q omega=c(y_i). Psi-C gains at least 1/20:
at x_s the gain is d_s-E_s omega >=2/25; at y_s it is
M_s omega-d_s>=2/5, using D_s>=5 and D_s/q<=1/5.
Filtered substitution follows by expanding monomials and telescoping
the product differences one factor at a time, using the multiplicative
adic filtration and addition of equal-level elements. This proves
the required aeval_sub_mem_of_gaussFiltration interface without
assuming finite valuations for all ring elements.

3. Exact translated lower filtration.
The native g(r)=swap(a,a') times transvection with its parity sign
lies in the Levi since a,a' are in the same block. Its action sends
x_s to y_s and y_s to x_s+eps_s iota_s(r)y_s; other variables fixed.
Set A=iota_i(r), A_s=iota_s(r). Taylor-translate by A after applying
Psi to this action. For s!=i the image of y_s is exactly
 x_s[(t+A)^M_s-A_s]+eps_s y_s[A_s-(t+A)^E_s].
As w^2=p, both (t+A)^M_s and (t+A)^E_s equal t to the corresponding
power plus A_s modulo w^2 (iterated native Frobenius and cyclic
letter congruence). The A_s terms cancel BEFORE estimating.
The image of x_s is y_s-eps_s x_s. At i the two images are x_i
and x_i[(t+A)^q-A], the latter congruent to x_i t^q.
Use t weight +omega and output weights c(z)-e(z)omega.
For y_s the main y_s t^E_s term has exact original weight, and
x_s t^M_s gains M_s omega-d_s>=2/5. For x_s the y_s term gains
d_s-E_s omega>=2/25. At i the merge has c(y_i)-q omega=c(x_i).
Every error term is divisible by w^2 and has nonnegative t-degree;
the weight deficits are at most max(d_s,E_s omega)<=8/5, so
the adic gain 2 pays them. This composition preserves the lower
filtration. IMPORTANT: apply it to polyAction(g(r)^-1) f, whose
membership is the actual hypothesis h(g(r)); the inverse and forward
actions cancel, yielding Taylor_A(Psi(f)) in the lower filtration.
Do not mistakenly apply the lower bound only to translated f and
then claim it controls the same Phi without this cancellation.

4. Single coefficient and the actual root lemma.
Let L=l+weight(c,alpha), with f_alpha not divisible by w^(l+1)
and every native Levi translate of f in filtration level L.
Let Phi(t) be coefficient of output monomial pi_*alpha in Psi(f),
reduced modulo w^(l+1). Define M(alpha)=sum M_s alpha(x_s),
E(alpha)=sum E_s alpha(y_s).
In upper weights pi preserves c(z)+m(z)omega, so coefficient t^j
for j>M(alpha) has adic level l+(j-M(alpha))omega>l and vanishes.
At j=M(alpha), C(f) has coefficient exactly f_alpha: the pair
(pi_*beta,M(beta)) uniquely determines beta, since only x_i,y_i
merge and M_i=q>0 recovers the split after subtracting all other
x_s contributions. The 1/20 improvement of Psi-C kills the
difference at this coefficient modulo w^(l+1). Thus Phi is nonzero
and degree exactly M(alpha). In the lower filtration pi preserves
c(z)-e(z)omega. After each Taylor translation, j<E(alpha) has
adic level l+(E(alpha)-j)omega>l and vanishes.
Hence t^E(alpha) divides Phi(t+A) for all r in W.
Step 1 yields q E(alpha)<=M(alpha)=q sum D_s alpha(x_s).
Cancel q>0: sum E_s alpha(y_s)-sum D_s alpha(x_s)<=0.
Divide by q again for the native normalized excessWeight. This
reconstructs TwistingData.root_lemma under its actual premises.

5. Actual exists_depth_factorization consumer.
Here a<r, a'=r, omega0=deepIndicator(r)-excessWeight(i,a,r)/2.
The root variables have deep indicators 1 and 0, and excess
weights in [-1/5,1], giving differences of omega0 in [2/5,8/5].
The Hermite/Smith factor supplies a common F whose depth-scaled
translated coefficients are all divisible by w^x. Preserve its
parahoric-coset surjectivity and integral transport.
For each monomial gamma choose l_gamma by the first failure of
w^(l+1) divisibility in some Levi translate, or truncate at
ceil_+(x-weight(omega0,gamma)), avoiding infinite valuation of zero.
Minimize l_gamma+weight(omega0,gamma) over the finite monomials.
If truncated this minimum is >=x; otherwise root_lemma gives
excess(gamma)<=0, so omega0(gamma)>=depth(gamma). Native
w^x | w^depth(gamma) coeff and w^(l_gamma+1) not dividing coeff
imply l_gamma+depth(gamma)>=x by cancellation of nonzero powers
in the domain. Thus the common minimum is >=x in both cases.
For all beta, l_beta+depth(beta)>=x+excess(beta)/2.
When excess(beta)>h>=2c, this pays the extra c powers after
dividing the common w^x factor. This is the actual excessCond
conclusion for the SAME primitive Q, not an independently chosen
Q per coefficient. The determinant depth sum, deepForms dimension,
pairing and projector are separate retained suppliers.

Evidence: executed four exact rational guard checks in Python:
min(t*d-s for t,d,s in product([5],[Q(2,5),Q(8,5)],
[Q(2,5),Q(8,5)]))==Q(2,5);
min(s-h*d for h,d,s in product([0,Q(1,5)],[Q(2,5),Q(8,5)],
[Q(2,5),Q(8,5)]))==Q(2,25);
Q(2,25)>Q(1,20); Q(2)-Q(8,5)>Q(1,20), Q=Fraction.
Two SymPy Taylor cancellation checks executed:
expand(x*(A+a)-s*y*(B+a)+s*a*(y-s*x)-(x*A-s*y*B))==0
for s=1,-1. Scalar checks only, not native replay.
No local lean/lake. RUN29 actual state a56e2d3a, receipt 088cd2ec:
six B/C checks with standard axioms, A module timeout,
all_requested_checks_ok=false despite outer workflow success.
No compact rh_scan/prune on these declarations. New axioms unknown.
Original/reduced graphs untouched; no dependency deleted. Static chain:
stepanov_count + filtered substitution + Frobenius congruence ->
root_lemma -> exists_depth_factorization -> hasType_twisted_hecke ->
marked index -> A -> star_inequality. Remaining parallel suppliers
deepForms, pairing, projector, local index and height. No RH import.

RESUME HERE: insert sections 1-5 at exists_depth_factorization;
audit the opposite Gauss weights, inverse action cancellation and
the exact truncation. Native next batch RootLemma alone BEFORE
ElementaryDivisors or JetExponentBound, using the shared bounded
runner; add caller probes after that module is available. No
competing job or protected workflow change. Next mathematical
supplier DeepFormCost weighted interpolation; coordinate with theta.
HANDOFF TO theta, integration, editor, audit and kernel.
-/

namespace CompactKernelRun32

theorem upper_gap (d s t : ℝ) (hd : 2/5 ≤ d) (hs : s ≤ 8/5)
    (ht : 5 ≤ t) : 1/20 ≤ t*d-s := by
  have h : 0 ≤ (t-5)*(d-2/5) :=
    mul_nonneg (sub_nonneg.mpr ht) (sub_nonneg.mpr hd)
  nlinarith

theorem lower_gap (d s h : ℝ) (hd : d ≤ 8/5) (hs : 2/5 ≤ s)
    (hh : h ≤ 1/5) (hh0 : 0 ≤ h) : 1/20 ≤ s-h*d := by
  have h1 := mul_le_mul_of_nonneg_left hd hh0
  linarith

theorem minimum_pays_excess (l depth excess x c : ℝ)
    (h : x ≤ l+depth-excess/2) (he : 2*c ≤ excess) :
    x+c ≤ l+depth := by linarith

end CompactKernelRun32

#print axioms CompactKernelRun32.upper_gap
#print axioms CompactKernelRun32.lower_gap
#print axioms CompactKernelRun32.minimum_pays_excess
#print axioms stepanov_count
#print axioms aeval_sub_mem_of_gaussFiltration
#print axioms TwistingData.root_lemma
