import New.Lift.SparseThickLetters
import New.Lift.ExponentTheorems

/-!
RUN69 — human reconstruction of actual integral cup-product endpoint,
27 Nov 2026. Prepared scalar certificates, NOT compiled. Credit Levent
Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
manuscript 3b552f2f5c30d874e72f574a479c90037482f96d.
Latest peer commits 2203bfae, 3d19cebe, dc4a02df, 7023ef7b,
a2e4e787, 72e67b83, 47581d42, a9b37b94, 33febdb0, b0fe2a3e.
Read Galois RUN69 and integration RUN72 actual diffs: retain their
tame chart/inertia/good-root and caller assemblies. No repeat of
RUN56 cut selection, RUN67 payment or RUN68 numerical guards.

Native sources (all paths relative to grh-compact/src):
New/Lift/CupProductBound.lean a5dfa3dc1372433af295f751c4bd4917ed3e323c
  Pairing.IsSafe, Pairing.ScaledCupBounds.of_isSafe
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141
  isSafe_sum, SidePairing.scaledCupBounds_of_points_at_cuts
Lib/PadicHodge/WachGamma/KisinModuleDefs.lean
  344ef024f5ddaee84ab62c0753b8beafbfd602cb
  smallPart, TateTwist.smallPart_spec, FrobGroup.phi_mul_comm
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc
  KummerChart.mem_cupOrthogonal_of_scaledCupBounds.
This is a common endpoint for all three local exponent branches,
not a new proposed substitute for RH.

1. Exact Witt coefficient descent (actual smallPart_spec).
Let K=C_p^flat, m its valuation maximal ideal (write n for the
native modulus exponent m to avoid confusion). In the Tate
coefficient module M=W(K) tensor Z/p^n(1), identify its underlying
additive group with W(K)/p^n W(K), after choosing the usual
generator of the Tate twist. G acts with the cyclotomic twist,
whereas F=phi acts only on Witt coefficients. Let S be the image
of W(m), i.e. Witt vectors with every component in m. It is an
additive subgroup, NOT an ideal of all W(K); do all pairings in M
before passing to the additive quotient M/S. Both actions
preserve S. Frobenius commutes with G.

F-1 is onto on M: solve x^p-x=a in the algebraically closed
characteristic-p tilt K at the first component; at step j correct
by p^j times a Teichmuller vector solving the same additive
equation for the error mod p^(j+1). This terminates at n.
For descent, suppose (F-1)x in W(m)+p^n W(K).
At level one, v(x_0)<0 is impossible because then
v(x_0^p-x_0)=p v(x_0)<0. Thus x_0 is integral and its residue
is fixed by Frobenius, hence in F_p. Choose its constant lift
c_0 in Z_p, subtract c_0 and the Teichmuller lift of the
remaining first component in m. The result is p x_1.
The p-saturation needed here is exact: if p w is in W(m)
then w is in W(m), since multiplication by p on Witt vectors
over perfect K is V F and shifts p-th powers of coordinates.
After removing a p^n multiple this gives
(F-1)x_1 in W(m)+p^(n-1)W(K).
Induct to conclude x in Z_p+W(m)+p^n W(K).
A nonzero constant modulo p^n has its first nonzero Witt
coordinate in F_p^*, so its image cannot be in S.
Consequently M/S has F-fixed subgroup canonically Z/p^n(1).
The constant embedding is G-equivariant. n=0 gives the
zero module, all assertions trivial.
This derives the algebraic clauses of TateTwist.smallPart_spec
without an extra crystalline assumption. Artin-Schreier-Witt
surjectivity is classical; see Kosters-Wan, On the arithmetic of
Z_p-extensions, arXiv:1607.00523, abstract statement of W_n/(F-1).
That source is a provenance pointer, not a claimed source of
the integral smallPart/continuity clauses, which are as above.
The source's reference to Herr (1998) is not used to assume
an integral Ext vanishing theorem.

2. Exact cup coboundary (actual ScaledCupBounds.of_isSafe).
Keep the same x,w,x' in the two extensions, lying over
p^e1 c, p^e1 c, p^e2 c'. Let a,d,b be their first coordinates,
respectively. Let C_g=p^e1 alpha(c)(g), D_g=p^e2 alpha'(c')(g),
embedded as constants. Write [u,v]=p^e3 P.wittPairing(u,v).
It is bilinear, G-equivariant and F-equivariant, into M.
Set
  U_g=g a-a+C_g, W_g=g d-d+C_g, V_g=g b-b+D_g.
These are exactly first coordinates of the three extension
differences; V is a cocycle, as are C,D,U,W. F fixes constants.
Choose y in M with (F-1)y=[d,Fb-b], by section 1. Define
  k_g=[C_g,g b]-[a,V_g]+g y-y.
This is exactly the witness in the source after cancelling
[g a,g b] with g[a,b]. No norm and no extra p-power.
For the inhomogeneous differential delta k(g,h)=g k_h-k_gh+k_g,
the cocycle identities C_gh=C_g+g C_h, V_gh=V_g+g V_h give
  delta k(g,h) = -[C_g,g(h b-b)]-[g a-a,g V_h]
               = [C_g,g D_h]-[U_g,g V_h].
Hence the first of the FOUR actual IsSafe conditions gives,
modulo S, delta k(g,h)=[C_g,g D_h].
This is the scaled cup at exponent e1+e2+e3, not an unscaled
cup and not merely the rational cup product.

3. Exact Frobenius cancellation (other three IsSafe conditions).
Since F commutes with g and fixes C_g,D_g,
  F V_g-V_g=g(Fb-b)-(Fb-b).
Expanding F k_g-k_g and using the chosen y gives
  (F-1)k_g =
     [W_g,g(Fb-b)] - [Fa-d,F V_g] - [d-a,V_g].
The three terms are exactly the third, fourth, second
IsSafe clauses, respectively, at the SAME x,w,x',g,e3.
In particular (F-1)k_g is in S for each g in the chart subgroup
Gamma'. No assertion that F-1 is injective on M.
Section 1 supplies a UNIQUE constant kbar_g modulo p^n with
k_g-kbar_g in S. Since S is stable under G and constants
inject into M/S, the identity of section 2 becomes an exact
identity of constant-valued cochains:
  delta kbar(g,h) =
    p^(e1+e2+e3) P.modPairing(alpha(c)(g),g alpha'(c')(h)).
No division by the Tate pairing or by a p-power.

4. Topology and exact global group descent.
For continuity retain the actual open embedding of Gamma in
G_p and the near-one statement eventually_eq_pow_smul for
both crystalline cocycles and their coboundaries. The finite
Witt coordinates of each fixed input vary continuously under
Galois action: the native WittCFlat.eventually_smul_sub_mem
says multiplying a near-one difference by any FIXED coefficient
still gives smallPart modulo p^n. Thus for fixed g, g' close to g,
every finite expression in k_{g'}-k_g above lands in S:
the constants C,D are locally constant mod p^n by the cocycle
law and near-one statement; the remaining terms are pairings of
fixed coordinates and their small differences. More explicitly
this is continuity of finite Witt-coordinate addition and
multiplication over the tilt, followed by the open subgroup
W(m) at finite length; do not infer arbitrary multiplication
preserves S. The quotient map to unique constant therefore
gives a locally constant kbar; the exact source continuity
supplier is retained, not a new native proof of tilt topology.
The original cup is continuous for the same cocycle/near-one
reason. Multiplying by p^(e-e1-e2-e3) preserves coboundaries.
The class in H^2(Gamma,Z/p^n(1)) restricts to zero in Gamma'.
The chart subgroup is open of index prime to p
(actual index_coprime), so Cor Res=[Gamma:Gamma'] on
continuous group cohomology. Its multiplication is invertible
on this p^n-torsion group (Bezout). Hence the class itself
vanishes, proving ScaledCupBounds e c c' at the human level
conditional exactly on the four safety clauses and retained
topological facts. This is standard restriction/corestriction,
not a new vanishing assumption or an assumption of perfectness
of P. The chart need not be normal for this transfer.

5. Letter aggregation and actual orthogonality caller.
The cross-letter terms in IsSafe_sum are literally zero:
the coefficient root acts on u_i and v_j by omega_i and
omega_j. Balanced bilinearity gives
 (omega_i-omega_j) P(u_i,v_j)=0.
For distinct letters their Teichmuller difference is a unit
in A_inf; hence the paired term is zero even modulo p^n.
Sum the diagonal terms in the additive subgroup S.
This justifies aggregation without a factor #letters and is
the exact isSafe_sum used by scaledCupBounds_of_points_at_cuts.
No claim here that the individual IsSafe conditions follow
without the cut, Hodge-depth and integral form proofs.

The native universalSide takes C=Z_f(Y) and alpha=id.
At mem_cupOrthogonal_of_scaledCupBounds let x in Z_f(L);
for every allowed Y, actual pairing P and crystalline y in
Z_f(Y), apply the common cup theorem to the SAME y,x and
the hypotheses of their two sides. Then p^e x lies in the
intersection defining cupOrthogonal. This is universal in Y,
P, y, not just a single perfect pairing; the native caller
takes the same exponent e independent of them. Inserting
this into the already derived DVR length inequality
(p^e annihilates the quotient of a lattice of rank r, so
length <= r e length(O/p)) uses the same local index and
normalization from RUN67/68. No extra factor from the
number of cuts, letters, or lattice ranks in the exponent.

Source-visible dependency graph (original and global reduced
graphs kept untouched):
OnePlaceDefect -> CrystallineBound or tame_types_exponent
 -> scaledCupBounds_of_cut_windows / _of_killsCokernel
 -> scaledCupBounds_of_points_at_cuts
 -> isSafe_of_exponents and isSafe_sum
 -> ScaledCupBounds.of_isSafe -> smallPart_spec, transfer
 -> mem_cupOrthogonal_of_scaledCupBounds -> normLength.
New human endpoint reconstruction: exact four-term safety
consumer, Witt descent, coefficient extraction, prime-to-p
transfer, letter aggregation. Retained native integral
suppliers: initial z-power, liftIdeal descent, frame/Hodge
strictness, depth-step costs, and actual safe-pair profile/
long-gap existence wherever not already supplied by peers.
Do not mark those or any globally reachable native edges
retired. Context cache key compact pin, chart Gamma', same
p,n, coefficient DVR, all three lattices, actual c,c', x,w,x',
same e1,e2,e3,e, all four safety clauses. No new external axiom,
URT or RH premise. No import of Main.

Actual execution: local command -v lean/lake/elan empty.
Executed SymPy expansion of both exact identities with
independent symbols for the transformed coefficients.
Both residuals exactly 0 (not numerical estimates).
Reproducer:
  import sympy as s
  Cg,gCh,Dg,gDh,a,ga,b,gb,ghb,y,gy,ghy=s.symbols(
      'Cg gCh Dg gDh a ga b gb ghb y gy ghy')
  Vg=gb-b+Dg; gVh=ghb-gb+gDh; Ug=ga-a+Cg
  kg=Cg*gb-a*Vg+gy-y
  gkh=gCh*ghb-ga*gVh+ghy-gy
  kgh=(Cg+gCh)*ghb-a*(Vg+gVh)+ghy-y
  assert s.expand(gkh-kgh+kg-(Cg*gDh-Ug*gVh))==0
  Fa,Fb,gFb,d,gd=s.symbols('Fa Fb gFb d gd')
  FVg=gFb-Fb+Dg; Wg=gd-d+Cg
  assert s.expand(Cg*(gFb-gb)-Fa*FVg+a*Vg+
      gd*(gFb-gb)-d*(Fb-b)-
      (Wg*(gFb-gb)-(Fa-d)*FVg-(d-a)*Vg))==0
This checks the scalar coefficient expansion only; the human
bilinear derivation above supplies the actual identities.
Actual CI artifact reread: cathedral-research-state/compute/
rh-compact-primitives-replay-20261126/outputs/targeted_results.json,
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, six native
TiltingLemma/Filling.Moments declarations report only
propext, Classical.choice, Quot.sound. A build timeout 124
at 2700.11s, all_requested_checks_ok=false, full_RH_replay=false.
No native compact rh_scan/prune/reduce/auto/frontier run.
Prior old-pin engine successes not evidence of this file.
Below prepared scalar Lean certificates plus native probes;
NOT a new native PASS. Original graphs and axiom ledger preserved.

RESUME HERE: integrate the exact common cup endpoint with
Galois RUN69 and integration RUN72, then derive the still
unclosed initial z-power and liftIdeal derivation/strictness
from CokernelKillers and LongGap (especially
exists_extend_form, exists_inclKer_eq_of_projTriv_eq_zero,
exists_reaches_deep). Audit the local continuity supplier
and all four safety clauses at the actual walk caller.
HANDOFF TO integration/editor, Galois, formal audit,
native runner. Human RH reconstruction remains incomplete.
-/

namespace RHRun69Literature

theorem cup_cancellation {R : Type*} [CommRing R]
    (Cg gCh Dg gDh a ga b gb ghb y gy ghy : R) :
    let Vg := gb-b+Dg
    let gVh := ghb-gb+gDh
    let Ug := ga-a+Cg
    let kg := Cg*gb-a*Vg+gy-y
    let gkh := gCh*ghb-ga*gVh+ghy-gy
    let kgh := (Cg+gCh)*ghb-a*(Vg+gVh)+ghy-y
    gkh-kgh+kg = Cg*gDh-Ug*gVh := by
  dsimp
  ring

theorem frobenius_cancellation {R : Type*} [CommRing R]
    (Cg Dg a b gb Fa Fb gFb d gd : R) :
    let Vg := gb-b+Dg
    let FVg := gFb-Fb+Dg
    let Wg := gd-d+Cg
    Cg*(gFb-gb)-Fa*FVg+a*Vg+gd*(gFb-gb)-d*(Fb-b) =
      Wg*(gFb-gb)-(Fa-d)*FVg-(d-a)*Vg := by
  dsimp
  ring

#print axioms cup_cancellation
#print axioms frobenius_cancellation
#check Lift.TateTwist.smallPart_spec
#check Lift.Pairing.ScaledCupBounds.of_isSafe
#check Lift.KummerChart.PairingSide.isSafe_sum
#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_of_points_at_cuts
#check Lift.KummerChart.mem_cupOrthogonal_of_scaledCupBounds
#print axioms Lift.TateTwist.smallPart_spec
#print axioms Lift.Pairing.ScaledCupBounds.of_isSafe
#print axioms Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_of_points_at_cuts
#print axioms Lift.KummerChart.mem_cupOrthogonal_of_scaledCupBounds

end RHRun69Literature
