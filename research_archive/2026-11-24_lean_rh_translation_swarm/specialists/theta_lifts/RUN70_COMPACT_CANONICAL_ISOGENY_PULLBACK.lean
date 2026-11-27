import Lib.CM.MainTheorem.ConjugateCurve
import Mathlib.Tactic

/-!
# RUN70 — canonical CM multiplier, exact isogeny pullback and nonsingular uniformization
27 November 2026. Source-matched human derivation, independent audit and native replay pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Upstream main observed at same pin. Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
read completion-first and mandatory reduction sections, AGENTS, protocol,
handoff, expansion, current manuscript 944957c6f43b63df7a845472b31492dc0ca1cb8f.
RUN69 3af9c4a3 left canonical pullback and prescribed invariants open.
Peer prime RUN69 6de4f9d9 now supplies split Hecke pairing; integration
219694f2 and editor cbe51302 explicitly request canonical multiplier.
Do not repeat the split Hecke derivation, good-reduction proof or theta section basis.

Source ledger:
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
83–105 CMLattice and multiplier, 141–173 Eisenstein and prescribed invariants,
363–367 multiplier_quadGen_mul, 369–373 mul_mem_or_mul_sub_t_mem,
377–381 multiplier_eq_canonicalMultiplier, 386–390 comp_mul_mem_sections.
Lib/CM/Sigma/SigmaFunction.lean 08de17d5fa2f0e4c4cbc61c22d99a85ec367294e:
40–95 area, form, isogeny definition, integral symplectic pairing and degree.
Lib/Shimura/ComplexTheta/CanonicalMultiplier.lean f0648bf8e9109ca31c541d499f677f2791b5b479:
canonicalMultiplier definition.
Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52:
19–36 conjugate isogeny, 60–68 conjugate curve, 77ff torsion transport.

## 1. The two-torsion calculation replaces sign-case grind
Let C be the actual datum with d prime, d=7 mod 8, lattice Lambda,
t a nonperiod half-period, omega=(1+i sqrt(d))/2, bar omega=1-omega.
Both omega t and bar omega t are nonperiods. Both multipliers preserve
Lambda. Their product n=(d+1)/4 is an even integer. Let V=Lambda/2Lambda,
T=[2t]. This is a two-dimensional F2 space. The reductions P of omega
and Q of bar omega satisfy P+Q=I, PQ=QP=0, P²=P, Q²=Q.
Both PT and QT are nonzero by the native nonmembership hypotheses,
so V=im P direct sum im Q with both summands of dimension one.

The alternating form E(u,v)=Im(conj(u)v)/area(Lambda) has value ±1 on
a lattice basis and hence its reduction e on V is nondegenerate.
For l in Lambda the native character is
  chi(l)=sigmaSign(l) exp(2pi i E(l,t)).
Here sigmaSign(l)=1 for [l]=0 and -1 otherwise; the exponential is
(-1)^e([l],T). For v in either image of P,Q, v=0 gives chi=1.
Otherwise v is distinct from T, since T has nonzero projection onto
the other summand. In dimension two over F2 distinct nonzero vectors
have pairing one. Thus both factors are -1, giving chi=1 exactly.
This proves multiplier_quadGen_mul for BOTH omega and bar omega,
with no square-root choice. The same decomposition immediately
proves mul_mem_or_mul_sub_t_mem: for 2x in Lambda, a=omega or
bar omega, the projected class [2ax] is either zero or [2at],
because [2at] is the unique nonzero vector in the corresponding line.
These are precisely ax in Lambda or a(x-t) in Lambda.

## 2. Canonical semicharacter, with no unproved phase choice
The actual Appell–Humbert cocycle on the lattice is
chi(u+v)=chi(u)chi(v)exp(pi i E(u,v)).
A reversed sign in the exponent would agree here since E(u,v) is
integral. Apply with u=bar omega l and v=omega l; by section 1 both
characters on the right equal 1. Since E is alternating and
omega l=l-bar omega l,
  chi(l)=exp(pi i E(bar omega l,omega l))
        =exp(pi i E(bar omega l,l)).
This is exactly the native canonicalMultiplier for multiplication
by bar omega. It is asserted only on lattice arguments, which is
all the pullback needs. No claim of equality on arbitrary complex z.
Retain the native Appell–Humbert cocycle, or its elementary proof
from the sigma sign and lattice determinant; no appeal to CM reciprocity.

## 3. Pullback at the actual isogeny caller
For C,D at the SAME d, write A_C,A_D for positive lattice areas.
The source assumes a Lambda_C subset Lambda_D and
a conj(a) A_C=N A_D with N natural, NOT a nonzero restriction.
Using H_C(u,v)=pi conj(u)v/A_C gives for every u,v
  H_D(au,av)=N H_C(u,v),
and likewise E_D(au,av)=N E_C(u,v).
Multiplication by a commutes with bar omega. For l in Lambda_C,
al is a period of D, so section 2 gives
  chi_D(al)=exp(pi i E_D(bar omega al,al))
           =exp(pi i N E_C(bar omega l,l))=chi_C(l)^N.
For any entire g in sections(D,k), its native automorphy is
  g(w+l')=chi_D(l')^k exp(k H_D(l',w)+k H_D(l',l')/2) g(w).
Set w=az and l'=al, and substitute both exact identities BEFORE
taking norms. Then
  g(a(z+l))=chi_C(l)^(kN)
     exp(kN H_C(l,z)+kN H_C(l,l)/2) g(az).
Composition is entire, so g(a dot) belongs to sections(C,kN),
the exact comp_mul_mem_sections. This also handles a=0,N=0:
areas force N=0 if a=0, and g(a dot) is constant.
The canonical multiplier supplier is thereby reduced to integral
two-torsion linear algebra, not any theorem about conjugate curves.
This supplies RUN69's transported sections F,H at the actual
conj_isogeny_mem_lattice caller and its final clause when the
additional nonzero degree-N conjugate isogeny hypotheses hold.
Do not remove those third-clause hypotheses.

## 4. Prescribed nonsingular invariants, including g2=0 or g3=0
For target complex a,b with D0=a³-27b² nonzero, let E4,E6 be the
normalized modular Eisenstein series on the upper half-plane and
Delta_mod=(E4³-E6²)/1728, the weight-12 cusp discriminant, nowhere
zero there. These are the standard inputs of the native proof.
Define the weight-12 holomorphic form
  F=E4³-(12a)³ Delta_mod/D0.
Its constant term at the cusp is 1. If F had no zero, then 1/F
would be holomorphic of weight -12, also holomorphic at the cusp
(the reciprocal Fourier expansion is defined near q=0).
A nonzero negative-weight holomorphic modular form at level one
is impossible: for weight k<0, y^(k/2)|f(tau)| is invariant, tends
to 0 in the cusp by boundedness, and attains a positive maximum
on a truncated standard fundamental domain, hence on H modulo
SL2(Z). Near a positive maximum f is nonzero and
  Laplacian log(y^(k/2)|f|)=-k/(2y²)>0,
contradicting the local maximum principle. Boundary points of the
fundamental domain cause no exception by invariance. Thus F(tau)=0
for some tau in H, and
  D0 E4(tau)^3=1728 a³ Delta_mod(tau).
Use the native scaling formulas for the period basis (w tau,w):
  g2=c⁴ E4/12, g3=c⁶ E6/216, c=2pi/w.
If a!=0, E4!=0 by the displayed equality; choose c!=0 with
c⁴=12a/E4. Then using E6²=E4³-1728 Delta_mod gives
  (c⁶ E6/216)^2 = (12³ a³/E4³)(E4³-1728 Delta_mod)/216²
                = (a³-D0)/27=b².
Consequently the resulting g3 is b or -b. If necessary replace
c by i c, which leaves c⁴ unchanged and negates c⁶. If b=0
there is nothing to change.
If a=0, the zero of F gives E4=0 and E6!=0 since Delta_mod!=0.
Also b!=0. Choose c!=0 with c⁶=216b/E6. This gives both invariants
without division by E4. In each case w=2pi/c is nonzero and the
period basis is real-linearly independent since Im tau>0.
This proves the source's exists_lattice_of_g₂_g₃ from the exact
Eisenstein identities, normalized cusp behavior, nonvanishing
modular discriminant and elementary complex analysis; it does
not assume surjectivity of j or CM algebraicity.
In RUN69's conjugate-curve construction set a=sigma(g2), b=sigma(g3);
D0!=0 by the field automorphism. The prescribed-invariant lattice
and RUN69's cubic surjectivity supply the provisional datum before
CM stability, avoiding circular use of conjugate isogenies.

## Ledger and verification
Original source-visible path: Main -> New.grh -> star_inequality ->
Data.short_forms -> theta-chain integral generator -> CM conjugation
-> conj_isogeny_mem_lattice -> comp_mul_mem_sections ->
multiplier_eq_canonicalMultiplier -> multiplier_quadGen_mul;
exists_galConjugate -> exists_lattice_of_g₂_g₃.
Reduced human suppliers: native two-torsion guards + unimodular
alternating pairing + AH cocycle -> canonical pullback -> RUN69
section transport; normalized modular forms + complex maximum
principle -> nonsingular lattice -> RUN69 conjugate curve.
Retain exact foundations above, section division, all other A/B/C
frontiers and source proof-term roles. Context key includes compact pin,
d,C,D, t, k,a,N and separate provisional d'=0 construction.
No deletion of original/reduced native graphs or axiom ledger,
no claimed RH theorem imported, no URT, no new equivalent RH target.
Local command -v lean/lake/elan returned none. Actual CI artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state reread: run 45803534769 has six B/C native
named checks with propext, Classical.choice, Quot.sound; A build timeout
124 at 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
General orchestrator 45920280710 succeeded on peer 8b6f39e, not this proof.
No native compact rh_scan/prune/reduce/auto/frontier run or new PASS.
Prepared scalar certificates below and source axiom probes are uncompiled;
no numerical tests substituted for proof. Independent audit requested.

RESUME HERE: integrate canonical pullback into RUN69 and prime RUN69
6de4f9d9 at the actual A caller. Check source section_division proof
for general isogeny pullback (all simple preimage zeros, a!=0),
then the still-open local gauge/stage index and marked Hecke consumer;
reuse peer results rather than repeating the split pairing.
HANDOFF TO integration, editor, audit, literature, native runner.
Human RH reconstruction incomplete.
-/

namespace ThetaRun70

theorem area_factor (s A B N : ℂ) (hA : A ≠ 0) (hB : B ≠ 0)
    (h : s*A = N*B) : s/B = N/A :=
  (div_eq_div_iff hB hA).2 h

theorem modular_scale_sq (a b c E4 E6 Dm : ℂ)
    (h : E4^3 - E6^2 = 1728*Dm)
    (hF : (a^3-27*b^2)*E4^3 = 1728*a^3*Dm)
    (hc : c^4*E4 = 12*a) (hE : E4 ≠ 0) :
    (c^6*E6/216)^2 = b^2 := by
  have hc3 : c^12*E4^3 = 1728*a^3 := by
    linear_combination (c^8*E4^2 + 12*a*c^4*E4 + 144*a^2)*hc
  have h1 : E4^3*b^2 = a^3*E6^2/27 := by
    linear_combination (a^3*h-hF)/27
  have hz : E4^3 * ((c^6*E6/216)^2-b^2) = 0 := by
    linear_combination E6^2/46656*hc3-h1
  exact sub_eq_zero.mp ((mul_eq_zero.mp hz).resolve_left (pow_ne_zero _ hE))

#print axioms area_factor
#print axioms modular_scale_sq
end ThetaRun70

#check CMLattice.multiplier_quadGen_mul
#print axioms CMLattice.multiplier_quadGen_mul
#check CMLattice.mul_mem_or_mul_sub_t_mem
#print axioms CMLattice.mul_mem_or_mul_sub_t_mem
#check CMLattice.multiplier_eq_canonicalMultiplier
#print axioms CMLattice.multiplier_eq_canonicalMultiplier
#check CMLattice.comp_mul_mem_sections
#print axioms CMLattice.comp_mul_mem_sections
#check exists_lattice_of_g₂_g₃
#print axioms exists_lattice_of_g₂_g₃
