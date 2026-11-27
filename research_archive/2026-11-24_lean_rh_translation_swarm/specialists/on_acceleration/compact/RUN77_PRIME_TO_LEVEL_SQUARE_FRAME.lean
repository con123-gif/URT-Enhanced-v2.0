import New.Curve.ConjugatesOfJets
import Mathlib.Tactic

/-!
# RUN77 — A2 actual local jet transfer needs no arbitrary-length frame

27 November 2026. SOURCE-MATCHED HUMAN REDUCTION; native caller replacement
PREPARED, uncompiled. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005
retained for historical evidence only.
Read latest ONE_EQUATION_MISSION blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
LIVE_PROOF_SPINE 67e542df1b5557b2e1314643931ef1355bbdc50d,
LIVE_OBLIGATIONS 073d86374ebc415e217a2732814dde7b0f3dfb9d, protocol, handoff,
expansion and AGENTS. Actual lane A2/A3. Reuse RUN76 82672996,
RUN72 2a198f50, RUN73 8835e36b, RUN75 0aa83347 and peer character-box
RUN61 b025feef, RUN62 b96a0bbd. Their general frame construction and
transfer are already derived; do not redo them. Current ledger A1/A2,
E1 is conditional on star; no re-opening E1 or claimed RH import.

## Source ledger (relative to grh-compact/src)

* New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0:
  norm_jetSeries_le (actual replacement), norm_jet_jetSeries_le_one.
* New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4:
  isTightFrame_zeta_pow, exists_isTightFrame, exists_cyclotomic_different_factor.
* New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14:
  exists_finitePart_of_isTightFrame.
* Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1a1f08:
  IsTightFrame, IsTightFrame.repeat_vectors, Space.VacuumExpansion.card_dvd.
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  Data.IsGoodDatum.mem_raises, gaugeLe_markOperator_pow, gaugeLe_Bmu_of_isMarked.
* New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185:
  N1, dvd_norm_c0, chiK_eq_one_of_dvd, E, isPrimitiveRoot_zeta.
* New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d:
  alpha and integral inverse/different suppliers.
* New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1:
  same scaled vacuum and integrality.

## 1. Actual marked caller: choose M=N1, not p(dN1)^6+1

Write N=P.N1(s)>0, f=[E:K], r=rank V. The native norm_jetSeries_le
starts by choosing M0=p(dN)^6+1, invokes exists_isTightFrame at M0^2,
and discards the distinguished all-place unit-vector clause. Inspection of
every later occurrence of M in that actual theorem shows only these inputs:
(i) p coprime M, (ii) a frame with Gram length M^2, (iii) M nonzero.
There is no lower bound on M, no prescribed frame length apart from its
square, and no bound involving M in the conclusion.

In Data.IsGoodDatum.mem_raises the prime is NONSPLIT (hΛ.4.2).
The native chiK_eq_one_of_dvd therefore gives p not dividing N.
Choose M=N. Take zeta^j, 0<=j<N, each with multiplicity N.
The original isTightFrame_zeta_pow proves this exact frame of length N^2,
including the original finiteImage integrality. This is not a new theta
space, new norm or datum: all remaining arguments of norm_jetSeries_le
are retained verbatim, with M instantiated to N instead of M0.

The finite-part bridge uses delta_frame=M and area of the SAME CM curve.
For F_M from FrameSections, theta(F_M)=1 and expansion cardinal
Q=(M^2)^(2fr)=M^(4fr) is a p-unit. Each coefficient
m/Q * intVacuum(finVec y_j) is integral by the original vacuum bound.
Translating by a vector x with delta*x integral above p gives only
finite-order phases. Rational approximation and clearing denominators
away from p give the same thetaProducts membership as RUN61 section 4,
with denominator q*M^2, p coprime q*M^2, and linear scale
c*periodFactor/M, of unchanged p-adic norm. The ultrametric inequality
and valuation-ring span give the IDENTICAL conclusion for every linear
form L and radius r0. In particular it is valid for the actual
proj_i' o proj_i o schurJet at mem_raises, same H, f, delta, c, L and r0.

This removes arbitrary-length frame existence (including coin problem,
all-prime blocks, large threshold and distinguished-unit witness) at
the marked nonsplit caller only. It does not remove that theorem at
JetExponentBound or other consumers that use a specified length or
distinguished vector. The native VacuumExpansion cardinal is reduced
from M0^(4fr) to N^(4fr) for the marked branch, exactly a factor
(M0/N)^(4fr) if rank>0; this is a cardinality comparison, NOT an elapsed
time/memory benchmark, nor a statement about the number of all proof
obligations. For rank zero both cardinalities are one.

## 2. General local transfer, even if p divides N: one block suffices

Optional further HUMAN reduction at norm_jetSeries_le for the remaining
p | N branch (not needed by the marked nonsplit caller). We only need
SQUARE Gram length prime to p, not a particular square or a frame with
a distinguished vector. Take N=qL with q=p^a, a>=1, gcd(p,L)=1, r0=N/p,
b=zeta^r0, D=Phi_N'(zeta). Use the EXACT cyclotomic factor identity
already derived in peer RUN62 section 1 with cofactor L:
    D(b-1)L=N V, V in O_E, V | L.
Thus D(b-1)/q=V in O_E.

Let c0=(1+sqrt(-d))/2, n=(d+1)/4. The native c0+bar(c0)=1,
c0 bar(c0)=n and dvd_norm_c0 imply p|n. Unlike the arbitrary-length
construction we can replace its common congruence root t by
    t=bar(c0)^a, T=t/q.
Define ONE block of vectors (exact same block form as RUN62)
    u(j,k,i)=zeta^j [1_(k=0) b^i + T(b^i-b^k)],
    0<=j<r0, 0<=k,i<p.
All u lie in E cap alpha O_hat:
- At places not over p, q is a local unit and u is integral, hence
  alpha^-1 u is integral (native alpha^-1 integral).
- Above p where c0 is not in the maximal ideal, c0 is a unit, so
  c0^a t=n^a is divisible by q in the local ring. Thus t/q, u integral.
- Above p where c0 belongs to the maximal ideal, alpha=1/D; the
  difference b^i-b^k is divisible by b-1 in O_E, and
  D T(b-1)=t V integral. Hence D u integral.
No global unit assumption on c0, no simultaneous congruence root,
and no other prime blocks.

The exact Gram calculation from RUN62 section 3 applies for every
T in K. In the i,k sum cross terms vanish by primitive p-root sums;
the j sum then separates all distinct E/K embeddings. Its diagonal is
    C=N(1+T+bar(T)+2p T bar(T)).
Substitute S=Tr_K/Q(t) in Z, H=n^a/q in Z, before taking norms:
    C=N+L S+2p L H.                                  (1)
Indeed t bar(t)=n^a. Modulo p, c0 and bar(c0) are complementary
idempotents (sum 1, product 0); their positive powers are themselves.
Thus S≡1 mod p, and (1) gives C≡L mod p, so p does not divide C.
The Gram diagonal is nonnegative, as a sum of squares. C is an integer,
nonzero modulo p, hence C is a positive integer. Equivalently the
factor is |1+T|^2+(2p-1)|T|^2>0.

Repeat the single block with multiplicity C. Its Gram length is C^2,
and p is coprime C. Apply the same local transfer with M=C. This proves
a sufficient general square-frame existence using only the two branches
p|N and p∤N, under the native cyclotomic identity and alpha suppliers.
No claim that C is smaller than M0 in all cases. The p|N construction is
a human derivation, not a native replacement. In particular the full
exists_isTightFrame theorem remains necessary for other callers.

## 3. Graph and exact premises

Original static edges:
mem_raises -> norm_jetSeries_le -> {exists_isTightFrame,
exists_finitePart_of_isTightFrame, VacuumExpansion, norm_intVacuum_le_one,
finiteImage_approx, denominator splitting, thetaProducts, valuation span}.
Reduced marked edge:
mem_raises -> norm_jetSeries_le_prime_to_level_run77 ->
{chiK_eq_one_of_dvd (caller adapter), isTightFrame_zeta_pow,
same remaining suppliers}.
Reduced general HUMAN edge replaces only exists_isTightFrame with one
block / ordinary root frame, retaining exact cyclotomic factor, CM
embedding, alpha, trace and local integrality inputs.
No kernel-level graph edge or axiom retired; original/reduced graphs and
all prior evidence preserved. Context cache key pin,P,s,p,embedding,V,
delta,f,c,L,r0,N,M,frame and actual marked hΛ.4.2; do not apply the
prime-to-level lemma in the p|N case. No URT performance claim.

## 4. Actual execution and native evidence

Local Lean/lake not available. Executed the following fail-on-error Python
arithmetic regression (exact quadratic integers and fractions, actual
admissible N0,d,s; not direct field/Lean computation):

    from fractions import Fraction as F
    from sympy import factorint, isprime
    from math import gcd
    def mul(a,b,n):
        x,y=a;u,v=b
        return x*u-n*y*v,x*v+y*u+y*v
    def power(a,k,n):
        b=(1,0)
        while k:
            if k&1:b=mul(b,a,n)
            a=mul(a,a,n);k//=2
        return b
    def conj(a):return a[0]+a[1],-a[1]
    def tr(a):return 2*a[0]+a[1]
    cases=blocks=controls=0
    for N0 in (18480,36960,55440):
        d=next(N0//2-1+j*N0 for j in range(10000) if isprime(N0//2-1+j*N0))
        assert d%8==7 and (2*(d+1))%N0==0 and (d+1)%N0!=0
        n=(d+1)//4
        for s in (0,1,4,12):
            c=5;z=s
            while z>=3:z//=3;c+=1
            N=N0*3**c*2**s
            assert gcd(N,d)==1
            for pp,aa in factorint(N).items():
                p,a=int(pp),int(aa);q=p**a;L=N//q
                assert n%p==0 and gcd(p,L)==1
                t=power((1,-1),a,n);tb=conj(t)
                assert mul(t,tb,n)==(n**a,0)
                assert mul(t,power((0,1),a,n),n)==(n**a,0)
                S=tr(t);H,rem=divmod(n**a,q)
                assert rem==0 and S%p==1
                C=N+L*S+2*p*L*H
                assert C==N*(1+F(S,q)+2*p*F(n**a,q*q))
                assert C>0 and C%p==L%p and gcd(C,p)==1
                assert (1%q)!=0
                controls+=1;blocks+=1
            oldM=d*(d*N)**6+1
            assert gcd(N,d)==1 and N<oldM
            cases+=1
    print(f'{cases} admissible (N0,d,s) cases; {blocks} p-block exact arithmetic checks; {controls} negative controls')

Actual output exit 0:
12 admissible (N0,d,s) cases; 60 p-block exact arithmetic checks; 60 negative controls.
The negative control t=1 rejects the required norm divisibility by q;
it is not a test of all p-adic field valuations. No synthetic speed
benchmark or claim of native proof.

Actual CI artifact cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six original named checks
standard three axioms; module_1_build exit 124 after 2700.11 seconds,
all_requested_checks_ok=false, full_RH_replay=false.
B2 replay status path compute/rh-compact-b2-human-replay-20261127/status.json
not yet present at retrieval (404); no inference of job success or failure.
No native compact rh_scan/prune/reduce/auto/frontier execution this run;
old-pin engine CI does not validate this replacement.

The certificate below copies the native norm_jetSeries_le proof after
its initial frame selection unchanged, with only the choice of M and
the guard hLevel replaced. It does not invoke norm_jetSeries_le as a
proof. Prepared, not compiled; elaboration may require simp adjustments
for M nonzero. The generic algebra helpers below are not the actual
p|N model replay.

RESUME HERE: kernel/integration replay the exact
norm_jetSeries_le_prime_to_level_run77 replacement and substitute it
at Data.IsGoodDatum.mem_raises with hLevel := hΛ.4.2 ∘ chiK_eq_one_of_dvd;
audit constructor-inclusive dependency and axiom difference. Next
acceleration step after receipt: if the general square-frame route is
still required at norm_jet_jetSeries_le_one, formalize the one-block
construction in section 2; otherwise preserve it as a human candidate
and move to the next unresolved A2 primitive. Do not recompute frame
existence or period bounds. HANDOFF TO theta, kernel, integration/editor,
independent audit. The decisive star inequality/RH remain OPEN.
-/

open CMLattice Fintype Function stdLattice LinearMap Matrix MvPowerSeries NeZero Real Space
  Submodule Subtype

namespace Parameters

variable {P : Parameters} {s : ℕ} {n : Type} [Fintype n]

lemma norm_jetSeries_le_prime_to_level_run77 {ε} {V : Space (E P s) n ε} {p : ℕ} [q : Fact p.Prime] [PadicPlace p] {δ f}
    [V.IsStd] (hLevel : ¬ p ∣ P.N₁ s) (hf : f ∈ standardData V δ) c (L : _ →ₗ[ℂ] ℂ) {r : NNReal} (H : ∀ Θ,
  .map ιₚ Θ ∈ P.thetaProducts s δ ‖ιₚ (c * P.periodFactor s)‖ n → ‖ιₚ (L Θ)‖ ≤
  r) : ‖ιₚ (L (V.jetSeries (c * P.jetScale s) f))‖ ≤ r := by
  let M := P.N₁ s
  have hM : p.Coprime M := q.1.coprime_iff_not_dvd.2 hLevel
  have hw := P.isTightFrame_zeta_pow s M
  obtain ⟨F, hW, hF, -, K, y, _, hy, _, hs⟩ := exists_finitePart_of_isTightFrame V M (by simp :
    M * M ≠ 0) (by simp) hw.repeat_vectors (fun _ ↦ (1, 0)) (by simp) omega₀_mem_cmCurve_lattice
    (by simp [QuadField.area_eq_of_eq_scaledIdeal latticeModule_cmCurve])
  apply span_le (p :=
    (Valuation.leSubmodule _ r).comap (.restrictScalars _ (L ∘ₗ V.jetSeries _))).2 _ hf
  rintro _ ⟨x, h, rfl⟩
  simp_rw [intVacuum, ← by simpa [by simpa [monomialSection] using hF 0, mul_div_cancel₀, *] using
         hs <| (P.vacuumScale s ^ card n / card K) • V.θ, map_sum, map_smul]
  refine sum_mem fun j _ ↦ smul_mem _ (⟨_, mul_mem (by simp) (by simpa [hM.norm_natCast_eq_one,
    intVacuum] using norm_intVacuum_le_one : ‖_‖ ≤ 1)⟩ : embValRing) (?_ : ‖_‖ ≤ r)
  have ⟨γ, hγ, e⟩ := exists_finiteImage_approx hW (x + -y j)
  simp [finHeisOp, semichar, ↓rho_finVec, ← e]
  have ⟨_, h', hN⟩ := exists_forall_mul_mem_Ô (finiteImage (algebraMap P.K _ δ * M • γ ·))
  obtain ⟨_, m, _, ⟨⟩⟩ := WfDvdMonoid.max_power_factor h' q.1
  use H _ ⟨_, _, _, _, m * M * M, _ / M / _ * (_ * _), _, hw.repeat_vectors, by
    simp [hF, PowerSeries.map_subst, linearSeries, smul_eq_C_mul, apply_ite, monomialSection]
    rfl, by grind [q.1.dvd_mul, q.1.coprime_iff_not_dvd], by simp [hM.norm_natCast_eq_one, jetScale,
    field], fun (i, t) ↦ by convert neg_mem (mul_mem_of_quadInt _ (herm_mem_quadInt (_ * m • M • _)
    (mem_Ô.2 fun w ↦ by_cases (by simpa [finiteImage, add_sub, -smul_eq_mul] using nsmul_mem
                                    (sub_mem (nsmul_mem (add_mem h (integralAfter.of_integral hγ))
    M) (integralAfter.of_integral (hy j))) m t w ·) (by simpa [by simpa using v_algebraMap_eq_one ·,
    finiteImage, (mul_left_comm _ m.cast)] using (mem_Ô.1 (hN t) w))) (hw.1 i.1))
    omega₀_mem_cmCurve_lattice); simp [← Finset.mul_sum, mul_assoc, field]⟩


#print axioms norm_jetSeries_le_prime_to_level_run77
#check Data.IsGoodDatum.mem_raises
#check Parameters.chiK_eq_one_of_dvd
#check Parameters.isTightFrame_zeta_pow
end Parameters

namespace RHAccelerationRun77

theorem block_scalar (N q L p T U S H : ℝ) (hq : q ≠ 0)
    (hN : N = q*L) (hS : T+U = S/q) (hH : T*U = H/q) :
    N*(1+T+U+2*p*T*U)=N+L*S+2*p*L*H := by
  calc
    N*(1+T+U+2*p*T*U) = N*(1+(T+U)+2*p*(T*U)) := by ring
    _ = N+L*S+2*p*L*H := by rw [hS,hH,hN]; field_simp [hq] <;> ring

theorem complementary_power_sum {R : Type*} [CommRing R] (x y : R)
    (hxy : x*y=0) (hs : x+y=1) (k : ℕ) : x^(k+1)+y^(k+1)=1 := by
  have hx : x*x=x := by
    calc
      x*x = x*(x+y) := by rw [mul_add,hxy,add_zero]
      _ = x := by rw [hs,mul_one]
  have hy : y*y=y := by
    calc
      y*y = y*(x+y) := by rw [mul_add,mul_comm y x,hxy,zero_add]
      _ = y := by rw [hs,mul_one]
  have px (j : ℕ) : x^(j+1)=x := by
    induction j with
    | zero => simp
    | succ j ih => rw [pow_succ,ih,hx]
  have py (j : ℕ) : y^(j+1)=y := by
    induction j with
    | zero => simp
    | succ j ih => rw [pow_succ,ih,hy]
  rw [px,py,hs]

#print axioms block_scalar
#print axioms complementary_power_sum
end RHAccelerationRun77
