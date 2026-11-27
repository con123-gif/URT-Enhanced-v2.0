import Mathlib

/-!
# Lane 15 — B4: actual Bessel main term cannot be the lower Fourier witness

27 November 2026. SOURCE-MATCHED conditional human audit and exact
negative route, scalar Lean certificate PREPARED / UNCOMPILED.
RH remains OPEN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission, live spine, ledger blobs: 3adc76221a978016e3505cdf3e36ad688354d7d7,
87e949a9ea899dd09d297aa30f59df4d1b533fc4,
261b9e8bf027af37e6abe6920deb544b23352d48. AGENTS, SWARM, HANDOFF and
EXPANSION consulted. Latest relevant peer 4cc35babae8b96e3c322db07b44d2ee0d248d2a2
supplies exact column Fourier clip; editor 40091ec1b986a04a3b45b10d2310c1da2073449a
supplies weighted deficit. Do not rederive them. B2 and C2 native receipts
in LIVE_OBLIGATIONS are separate. No new native receipt obtained.

Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Exact sources in grh-compact/src:
* New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727:
  reducedImage, termsOver, columnDim, mainEnergy, besselEnergy, tailScale,
  IsAdmissible.besselEnergy_le.
* New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1:
  amplitudeSum_move, isStable_besselS, amplitudeSum_besselS_one.
* New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444:
  sum_norm_amplitudeSum_le (class permutation and unitary transport),
  re_trace_besselS_le (small bad-central trace), Fits.exists_translate_finrank_comap_le.
* New/Filling/RowDimension.lean 5f8292b806de0cc8a11c560b573efb6ec7fe7316:
  Data.finrank_rows_le_mass.
* New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76:
  Data.ramifiedColumns_fill_rows.
Use actual D, same P=tQ, t²*c_native*unipCovolume=1, c=columnDim>0,
G=S.GRes, H=S.reducedImage besselS, n=|G|, h=|H|, q=h/n,
m0=besselDegree*mass>0, Dexp=n*m0, d=dim good rows<=Dexp,
tau=tailScale, delta=b^-4, eta=b^-2, alpha=b^-8.

## 1. Exact induced Bessel main kernel and the rank mismatch

In the conventional column inner-product convention use A(g)=P* rho(g) P,
i.e. conjugate of the normalized native amplitude entries in hu; split
A=A0+A1 using rational Bessel subgroup and its complement. The Bessel
kernel is zero off H: termsOver requires reduction of h_c^-1 gamma h_c',
where h_c and h_c' lie in the embedded Bessel Levi, and gamma in the
Bessel subgroup. This is an exact support statement, not a smallness
estimate. A0(1)=I by amplitudeSum_besselS_one.

The transport used explicitly inside sum_norm_amplitudeSum_le is
available before its norm operation. For u in H, the proof chooses
p and sigma0 for every class d by exists_besselS_mem_termsOver; p is
bijective by eq_and_mem_classUnip_of_besselS applied to the product
with inverse of a second lift of the same reduction. The unitary map
on the Bessel-coordinate fiber is the scalar character times the
Kronecker product of local unitary reps (conjugate in the convention
for A). Use amplitudeSum_move with the identity lift on the other
side and the same stable set, now at arbitrary g rather than only
the convolution at 1. This gives A_T(ug)=U_u A_T(g) for the full,
Bessel and complementary kernels, with the same block permutation
unitary U_u. Equivalently choose the inverse class permutation if
using the opposite row indexing. This source-visible lift must be
replayed as an actual declaration; we have not run that replay.
From A0(1)=I one gets U_u=A0(u) independent of lift. Applying covariance
to A0(uv) yields U_uv=U_u U_v, hence U is a unitary representation
of H. No normality of H or commutativity of U is needed.

On orbit coordinates C^G tensor C^c define
    Gamma[g,k] = A(g^-1 k)/n,
    Gamma0[g,k] = A0(g^-1 k)/n.
The first is O*O, O(e_g tensor v)=rho(g)P v/sqrt(n).
Using support and covariance BEFORE norms, directly multiply:
    Gamma0^2 = q Gamma0, Gamma0*=Gamma0, tr Gamma0=c,
    Gamma0 Gamma=q Gamma=Gamma Gamma0.
Thus Q0=Gamma0/q is an orthogonal projection of rank r0=c/q,
and the full orbit Gram is supported on Q0. Its row rank need not
be r0. This allows restricting future Fourier computations to the
induced H-module without any loss of nonzero eigenvalues.

The actual native arithmetic sizes now determine the obstruction:
    tau^44 * h*c <= c^2/m0
    (IsAdmissible.besselEnergy_le, exact definitions).
Cancel c,m0>0:
    q*d <= q*Dexp = h*m0 <= c/tau^44.             (RANK CAP)
Equivalently r0/Dexp >= tau^44. This is NOT a fitted or synthetic
scale; it is the actual size guard in Setup. The Bessel main Gram
has far more nonzero eigenvalues than the allowed good row dimension.

## 2. Consequences for the proposed lower PSD Fourier witness

Let Pi=L(e0) on the orbit coordinates, where L is left regular.
The central good projection commutes with Gamma and Gamma0, and
O Pi=R O. Put Gg=Pi Gamma Pi, Bg=Pi Gamma0 Pi. Then
rank Gg<=d, 0<=Bg<=q I. The nonzero eigenvalues of Gg coincide
with those of the actual averaged row operator T_W because
O Pi (O Pi)*=T_W, with the same normalization as peer CLIP.

Any PSD common lower witness X<=Gg and X<=Bg has rank<=d:
ker Gg is contained in ker X by positivity. All eigenvalues of X
are at most q. Therefore
    tr X <= q*d <= c/tau^44.
This also applies to any Fourier-block witness from the Bessel main
term alone that is certified below BOTH the main and total Fourier
blocks: under the finite-group Fourier transform, scale each block
by 1/n_pi and repeat n_pi times to form X on orbit coordinates, so
its trace is exactly the sum of witness traces in peer CLIP.
For tau>=2, b>=1000 this upper bound is strictly less than
c*(1/2-eta+delta+alpha). Thus the main term cannot supply the desired
lower witness by simply dropping the complement, even if it were
possible to certify the necessary PSD ordering. This rejects a
specific strategy, NOT the full Fourier route.

There is an independent lower bound on the size of the correction.
For the two native factors, re_trace_besselS_le bounds each bad
projector trace on Gamma0 by delta*c. Indeed tr L(x) Gamma0 is the
real part of the native sum of x(s)*amp_Bessel(s^-1)/nu: centrality
allows replacing g k^-1 by k^-1 g in the trace, and conjugation
uses x(s^-1)=conj(x(s)). The two commuting bad projectors dominate
1-Pi in sum. Positivity gives tr Bg >=(1-2delta)c.
With J the range projector of Gg, the trace of Bg on ker Gg
is at least tr Bg-q*d. The variational formula for the negative
part of the Hermitian difference gives the exact lower bound
    tr (Bg-Gg)_+ >= (1-2delta-tau^-44)c.           (CORRECTION)
Proof: test against I-J; tr((I-J)Gg)=0 and tr(J Bg)<=q*d.
Hence a trace-norm-small perturbation from Bessel main is impossible
under the actual admissible sizes. The complement is NOT a PSD
error, nor globally small in this norm. The native complement
estimate energy_compl_besselS_le only covers translates whose one
component is in the Bessel image; it does not imply a global Fourier
trace-norm bound. Keep its original use for the first moments.

This is a precise reason to backtrack from the main-term-only witness
requested in the peer handoff. A successful Fourier lower witness
must include the non-Bessel terms at leading order. The induced
support reduction remains useful if deriving that bound. Do not
assume the rank or size inequality is an estimate of actual spectral
deficit; the full CLIP/DEFICIT still unproved independently of B3.
The existing sharp-energy route remains the preferred reliable
fallback. Neither A nor C nor any root obligation is retired.

## 3. Exact regression actually executed

Local CPython/SymPy, not native arithmetic data, verifies the flat
spectrum and illustrates why local complement information does not
control the global negative correction. For cyclic G of size n,
H subgroup size h, A0=1_H, A=1 (trivial rep, c=d=1), exact:

```python
import sympy as S
for n,h in [(8,2),(12,3),(16,1)]:
 H=set(range(0,n,n//h)); q=S.Rational(h,n)
 B=S.Matrix(n,n,lambda i,j:S.Rational(int((j-i)%n in H),n))
 A=S.ones(n,n)/n
 assert B*B==q*B and B.trace()==1 and B.rank()==n//h
 assert B*A==q*A and A*B==q*A and A.rank()==1
 diff=A-B; ev=diff.eigenvals()
 neg=sum(-v*m for v,m in ev.items() if v<0)
 assert neg==1-q
 assert all(diff[i,j]==0 for i in range(n) for j in range(n)
            if (j-i)%n in H)
 print(n,h,B.rank(),A.rank(),neg,sum(abs(v)*m for v,m in ev.items()))
```
Actual output: 8 2 4 1 3/4 3/2; 12 3 4 1 3/4 3/2;
16 1 16 1 15/16 15/8. The correction saturates the unprojected
rank lower bound despite being identically zero on subgroup blocks.
These controls are not a native host proof or a claimed counterexample
to RH. lean/lake not found on local PATH. Native rh_scan/rh_prune/
rh_reduce/rh_auto/rh_auto_frontier not executed. Scalar Lean below
prepared only; no PASS. Original and reduced graphs/axioms retained;
this is source-visible evidence, not a new recursive graph.
Context key: same compact pin, actual D, G,H,A0,A,e0,c,d,Dexp,tau.
No URT comparison or claimed advantage.

RESUME HERE: abandon the Bessel-main-only witness and global
small-complement perturbation. Replay the source-visible covariance
as an actual amplitude caller, then use the existing B3 sharp-moment
fallback to integrate B4 into the live spine; only reopen direct CLIP
if a full-kernel witness including off-Bessel amplitudes is available.
Coordinate native verification via the existing shared runner.
HANDOFF TO B3/B4, integration, kernel, audit. RH remains OPEN.
-/

namespace RHEditorBesselRank

theorem rank_cap (h c m n d tau : ℝ)
    (hh : 0 ≤ h) (hc : 0 < c) (hm : 0 < m) (hn : 0 < n)
    (ht : 0 < tau) (hd : d ≤ n*m)
    (hs : tau^44 * (h*c) ≤ c^2/m) :
    (h/n)*d ≤ c/tau^44 := by
  have h1 : tau^44 * (h*c) * m ≤ c^2 :=
    (le_div_iff₀ hm).mp hs
  have h2 : (tau^44 * h * m) * c ≤ c*c := by
    convert h1 using 1 <;> ring
  have h3 : tau^44 * h * m ≤ c :=
    (mul_le_mul_right hc).mp h2
  have h4 : h*m ≤ c/tau^44 := by
    apply (le_div_iff₀ (pow_pos ht _)).mpr
    convert h3 using 1 <;> ring
  calc
    (h/n)*d ≤ (h/n)*(n*m) :=
      mul_le_mul_of_nonneg_left hd (div_nonneg hh hn.le)
    _ = h*m := by field_simp
    _ ≤ c/tau^44 := h4

theorem correction_budget (c t qd bad neg : ℝ)
    (htrace : (1-bad)*c ≤ t) (hcap : qd ≤ c)
    (hneg : t-qd ≤ neg) :
    (1-bad)*c-qd ≤ neg := by linarith

#print axioms rank_cap
#print axioms correction_budget
end RHEditorBesselRank
