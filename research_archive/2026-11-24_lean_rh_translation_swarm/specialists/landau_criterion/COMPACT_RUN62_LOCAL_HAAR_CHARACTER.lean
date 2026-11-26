import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN62 — local self-duality and exact Haar normalization at the B caller
2026-11-26. Human source-matched proof of the stated local substeps,
independent audit requested. Native adapter prepared, not compiled.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Peer geometry aa47d59203ab086184527776e0ef9fdb2e89d20f has already
closed finite split-level count and checked the packet level bridge.
Peer integration a31e63855d81562e8366d3fc88cd13be2bf714ba retains
actual standard-level/Haar construction. Do not repeat finite count.

## 1. Exact local Fourier kernel, including residue characteristic two

Let T be a finite star-stable set, A=LocProd(T), O its integer
ring, e_T:A -> finite adeles extension by zero, r_T restriction.
Use the native selfDualChar of Filling, not an arbitrary additive
character. LevelBridge.forall_selfDualChar_mul_eq_one_iff asserts
that the annihilator of O_hat under this character is O_hat.
The local psi is selfDualChar composed with e_T. For a in A,
the products e_T(a)r for r in O_hat equal e_T(a r_T(r)).
Restriction maps O_hat onto O by extension by zero. Thus
    (forall r in O, psi(ra)=1) iff e_T(a) in O_hat iff a in O.
Since star preserves O, the same holds for psi(star(r)a).
Normalize additive Haar on A by vol(O)=1. Then
    integral_O psi(star(r)a) dr = 1_O(a).
If a in O every integrand is 1. Otherwise select r0 in O with
psi(star(r0)a) != 1. Translation r -> r+r0 preserves O and
measure, so the integral I equals psi(star(r0)a) I, hence I=0.
The character is unitary, O compact, so integration is legitimate.
This gives exactly the kernel used in GlobalToLocal:135-140;
it does not assume the conclusion of a local Plancherel bound.
For an integrable compactly supported function f on A, Fubini
then gives integral_O |integral_A f(x)psi(star(r)x) dx|^2 dr
= integral_A integral_A f(x) conj(f(y)) 1_O(x-y) dx dy.
This last quantity equals sum over A/O of |integral_{c+O} f|^2,
bounded by integral_A |f|^2 by Cauchy-Schwarz (each coset has
volume one). Use L1 and L2 for this final assertion. No claim
that this alone constructs all fields of the Place instance.

## 2. Exact skew-coordinate Haar chart

Use the integral trace-one element tau and skew unit w
with w,w^-1 integral, w*=-w, tau+tau*=1 furnished by the
actual IsAdelic.exists_skew_unit data in GlobalToLocal:105-117.
Write B={b in O: b*=-b}, A^-={b in A: b*=-b}.
The map A^- x A^- -> A
    (a,b) -> tau w a+b
has inverse
    a=w^-1(x+x*), b=x-tau(x+x*).
Indeed wa is self-adjoint, and b+b*=0 since tau+tau*=1;
a*=-a because (w^-1)*=-w^-1. Substitution gives both inverse
identities. This inverse works even when 2 is not a unit,
unlike the symmetric/antisymmetric half-trace decomposition.
The map and inverse preserve integral coordinates, hence send
B x B bijectively onto O. They are continuous additive maps.
Push forward the product of the two additive Haar measures
with nu(B)=1. The result is Haar and gives O mass one;
uniqueness identifies it with the native volume on A.
This is the exact product normalization sp at GlobalToLocal:110.
For any self-conjugate scalar g in A^x integral, with md(g)
the additive Haar multiplier on A, the chart commutes with g.
Consequently md(g)=s(g)^2, where s(g)>0 is the Haar multiplier
on A^-. In particular nu(gB)=sqrt(md(g)), with no local
factor of two even at dyadic places. This supplies the skew
scaling used by StandardLevel:200-217, retaining its actual
Heisenberg congruence-preimage argument.

## 3. Middle-group measure and finite packet coefficient

K_T=unitaryLevel O 1, C_T=unitaryLevel O F.g. Define
H_T as the Bessel middle group, H0=H_T intersect K_T,
H1=H_T intersect C_T. In StandardLevel.exists_isLatticeLevel
the measureH is the inclusion pushforward of the inverse of
Haar on H_T normalized at H0. Thus measureH(K_T)=1 and
right invariance under H_T follows from inversion of left Haar.
No assertion that ambient groupMeasure is normalized at K_T.
The exact lift of any h in H0 to an integral finite adelic
middle element is h at T, identity off T. Star stability
ensures the unitary relation holds at both members of each
conjugate pair. The same extension of h^-1 shows integrality
of the inverse. Conversely restriction of a global integral
middle element lies in H0. Since g^-1 is integral off T,
the peer level comparison identifies the kernel of its finite
reduction with H1. Equivalently apply GlobalToLocal:
card_reducedImage_mul to measureH and B=besselH with these
actual support and right-translation properties.
Thus H0/H1 has |Hbar| cosets, all of the same measure:
    |Hbar| measureH(C_T) = measureH(K_T)=1.
This is a statement about the subgroup measure, not the
ambient Haar probability; no assertion about global rational
surjectivity is needed. All cosets measurable since C_T open.

For the floor exponent, use rho=shape.varrho, k=shape.k,
f=numInfPlaces E, g=S.g>0 and md(F.g)=g^(-2f), as follows
directly from the degree 2f and support guard g^-1 integral
off T. At each a=0,...,rho-1, the native floorModulus is
    md(F.g)^(k+1+2(rho-a-1)+1/2).
Summing exponents BEFORE evaluating powers gives
    sum_a (k+1+2(rho-a-1)+1/2)=rho(k+rho+1/2).
Hence v=F.unipotentMass=g^(-f rho(2k+2rho+1)).
The exact split-level count in peer aa47d592 gives
U=unipOrder=g^(f rho(2k+2rho+1)), so vU=1.
rho=0 has the empty product one; all factors positive finite.
This proves the scalar normalization of
GlobalToLocal.IsFillingLevel.g_pow_mul_unipotentMass;
not a second derivation of the split-level count.

Now use Z of FiniteSystem, J=[Z:C_T], M=groupMeasure(C_T).
By right invariance, groupMeasure(Z)=JM.
The native massRatio therefore equals JM^2 U^2.
Since |Sbar|=|Hbar| U and measureH(C_T)=1/|Hbar|,
    massRatio=measureH(C_T) J M^2 (|Sbar| U).
This closes the separate subgroup normalization in peer
RUN62's packet scalar at FiniteSystem:178-183, conditional
on the standing lattice-level construction and ambient Haar
properties. There is no extra power of |Hbar|. Both measures
are kept distinct, and the level and finite support are the
same as in Moments:49,142.

## 4. Remaining actual construction (not closed)

StandardLevel.exists_isLatticeLevel constructs the hyperbolic
basis, integral chart and top-floor theta mass. The above
proofs do not replace its integral hyperbolic-basis matrix,
Eichler lift or box mass lower bound; nor do they replace
the gauge's content-index uniform bound, the quadric
disintegration, or groupMeasure_boxSet_le. Those remain
necessary at FiniteSystem:288 and the Rallis test-space
supplier remains separate. In particular the unipotent
mass exponent by itself does not prove the mixed floor
congruence preimage in heisenbergMeasure_eq_floorModulus.
Do not infer that every standard level premise is discharged.

## Evidence and graph ledger

Source bodies inspected at compact pin:
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4
New/Filling/LevelBridge.lean e2d344c09aa5a8da8707dc49b49f407005ddc487
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111
New/Filling/EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce
Lib/DiscreteSeries/Bruhat/EichlerMaps.lean c1d16d7a700fa344bce743a2ead6ecee7ab0fa8a
Also read RallisInner/SharpData and CompactLift/RallisFormula;
no Rallis hypothesis asserted discharged this run.
Original local graph: selfDualChar + skew Haar product ->
exists_isFillingLevel -> card_reducedImage_mul + floor modulus
-> FiniteSystem -> Moments -> enough_forms -> star_inequality.
Reduced human edges: self-dual lattice + translation -> exact
local Fourier kernel; trace-one skew chart -> product Haar and
skew modulus; H0/H1 finite cosets + normalized subgroup Haar
-> middle mass; exact exponent sum + peer count -> packet
scalar. All outstanding original edges retained; no global
pruning or deletion. Context key: compact pin, actual S,F,T,
star-stability, g support, H0/H1, same reduction and measures.

Native lean/lake/elan unavailable (command -v returned no paths).
No native pruning, reduction or axiom run attempted on a wrong
toolchain. Actual Actions run metadata retrieved: 45577239749,
45576756833,45799225653 completed success (historical).
45803534769 wrapper completed success but previous authenticated
partial receipt d07359dc70c3f9f28e4858c835e5fa5424b6f539 records
overall_task_passed=false and A timeout; no claim of full PASS.
No new native PASS or numerical test claimed. Prepared algebraic
adapter and native declaration probes below; independent audit
and actual compact Lean compilation outstanding.

RESUME HERE: insert the middle Haar normalization and Fourier
kernel into existing B packet proof. Next derive actual integral
hyperbolic-basis/Eichler chart used in StandardLevel:95-145,
or the mixed floor congruence preimage at 200-217 with exact
native free-entry ordering and retained content-index hypotheses.
Coordinate separately with literature/geometry on Rallis test
space; no new conditional endgame reformulation.
HANDOFF TO integration/editor, positivity geometry, formal audit
and compact verification. Human RH reconstruction incomplete.
-/

namespace CompactRun62

theorem trace_chart_cancel {R : Type*} [CommRing R]
    (t u a b : R) (h : t + u = 1) :
    (t * a + b) + (u * a - b) = a := by
  calc
    _ = (t + u) * a := by ring
    _ = a := by rw [h, one_mul]

theorem packet_factor {R : Type*} [CommRing R]
    (H U v J M : R) (h : H * v = 1) :
    v * J * M^2 * ((H * U) * U) = J * M^2 * U^2 := by
  calc
    _ = (H * v) * (J * M^2 * U^2) := by ring
    _ = _ := by rw [h, one_mul]

#print axioms trace_chart_cancel
#print axioms packet_factor
#check Filling.exists_isFillingLevel
#check Filling.forall_selfDualChar_mul_eq_one_iff
#check Filling.IsFillingLevel.card_reducedImage_mul
#check Filling.IsFillingLevel.g_pow_mul_unipotentMass
#check IntegralPlace.exists_isLatticeLevel
#check IntegralPlace.IsStdLevel.heisenbergMeasure_eq_floorModulus
#check Filling.IsFillingLevel.sum_blocks_le_topKernel
#print axioms Filling.exists_isFillingLevel
#print axioms Filling.IsFillingLevel.card_reducedImage_mul
#print axioms Filling.IsFillingLevel.g_pow_mul_unipotentMass

end CompactRun62
