import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix

/-!
# RUN60 — fixed period ratios, Hodge frame and invariant basis
26 Nov 2026. Human reconstruction, not native replay. Credit Alpöge,
Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10: completion-first.
Read protocol/expansion/handoff/AGENTS, manuscript and RUN59. Peer commits
2ce507a2 (Weil comparison), 4aee920f (CM periods), 403556a7 (Hecke guards),
b7b304a3 (Ribet row budget), 622fbfec (central character) cover distinct
branches; do not duplicate. This continues RUN59's outstanding ratio
and frame prerequisites at the actual C caller.

Source ledger (all compact src unless specified):
Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
lines 54–91 exists_witt_coeff_of_isChartOf, Bcris.exists_witt_ratio.
Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
coordinate extension, separation, reduction modulo z and bicommutant.
Lib/PadicHodge/TateSen/DeRhamFiltration.lean dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b
BdR.exists_sub_mem_of_smul_sub_mem.
Lib/PadicHodge/TateSen/NearOne.lean 90cdd38ccf750df2458c39e947f56ffb1b0cdcf5
tate_eq_zero_of_chi_twist, le_of_hodgeTate_stable.
Lib/PadicHodge/WachKisin/HodgeFrame.lean 158f4df424f222f593b6f2baee57a294ab221f03
exists_hodge_frame, hasJumps_of_basis.
Lib/PadicHodge/Crystalline/RegularityFrobenius.lean 2cf7f7ee07b73f475818198db19ee7f65aec7a06
lines 58–88 fontaine_regularity and IsAdmissible.exists_basis.
Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
lines 24–60 fixed coefficient lift and exists_isPeriodMatrix.
Readable companion grh/src/Lib/PadicHodge/Crystalline/FixedRatios.lean
cb955b591c2c7de4b85120f0ebe3e4267277f464 confirms the expanded
algebraic argument, NOT used as an interchangeable Lean proof.

## 1. De Rham fixed classes (including the exact zero submodule)
Let D=B_dR^+, L=Frac(D), t its uniformizer with g(t)=chi(g)t.
The image of j is open, with fixed algebraic field K. Use the classical
Ax–Sen–Tate statements C_p^G_K=K, C_p(n)^G_K=0 for n!=0.
Let S be any D-submodule of L. If S is all L the conclusion is trivial.
Otherwise S is 0 or t^m D: a nonempty set of integer valuations
bounded below has a minimum, and a set unbounded below gives all L.
Suppose gx-x in S for every g. If x in S choose a=0. Otherwise n=v_t(x)
is below the cutoff (or S=0). The leading coefficient c of t^-n x is
nonzero and satisfies chi(g)^n g(c)=c. Hence n=0 and c in K. The
algebraic embedding K -> D lifts c, fixed by the group. Subtract c:
if x-c not in S, its strictly positive valuation is again forced
to be zero by the same argument. Contradiction. Thus x-c in S.
This supplies both fixed ratios (S=0) and filtered classes at the
LongGap and HodgeExpansion consumers. No convergence of a sequence
of algebraic representatives is needed.

## 2. Exact chart-specific ratio (not merely invariants of a ring)
Write B=B_max^+[1/mu], B+=A_max[1/p], T=chart bicommutant,
Lambda=W(F_{p^f}), z=chart parameter. Suppose b'!=0 and b'g(b)=g(b')b.
All embeddings into L are injective. Section 1 gives b/b'=a in K.
Clear the SAME mu denominator to get B0,C0 in B+, C0!=0, B0=a C0.
By coordinate expansion modulo p^m A_max and p-separatedness, some
i has extendedCoord_i(C0)!=0. RUN59's coefficient divisibility,
applied to (1,-a) and (B0,C0), has zero left sum, hence
extendedCoord_i(B0)=a extendedCoord_i(C0).
The two coordinates belong to T. Extract the largest common power
z^n, finite by z-power separation of the nonzero second coordinate.
Write them z^n gamma0,z^n gamma1. They are not both divisible by z.
The quotients gamma_j belong to T by mem_bicommutant_of_mul, since
z^n in T nonzero. Cancel z^n in L, obtaining gamma0=a gamma1.
For one common sufficiently large m (finite intersection of two
eventual statements), chart reduction yields
    p^m gamma_j = w_j + z u_j,   w_j in Lambda, u_j in T.
Exact cancellation gives
    a w_1 - w_0 = z (u_0 - a u_1).
The left side x is algebraic over Q_p. If nonzero, its inverse is
also algebraic over Q_p and integral over B+ (a Q_p-algebra).
The right quotient v=u_0-a u_1 is integral over B+ because a is.
Thus z*(x^-1 v)=1 in the integral closure of B+ in L.
Units descend along integral extensions: e.g. multiply the monic
equation for z^-1 by z^(degree-1) to express z^-1 in B+.
This would make z a unit, contradicting primitive gamma.
Consequently a w_1=w_0. If w_1=0, w_0=0 too, so z divides both
p^m gamma_j and therefore both gamma_j (p a unit). Contradiction.
Factor w_1=p^r u with u a unit of Lambda, and multiply by u^-1:
    p^r b = (u^-1 w_0) b'.
This is the exact conclusion for the given f, not an unspecified
unramified extension, and requires no division by a possibly
zero numerator. It also proves the near-one version by taking
an open subgroup where the ratio identity holds and its chart.
At the fixed-period caller b'=1, p^-r is in T and Lambda maps
into T; hence b is represented in T as needed by exists_isPeriodMatrix.

## 3. Invariant basis over the actual ring
Let a finite sum w of coordinates in B satisfy b g(w)=g(b)w
along F, with b nonzero and nearOne <= F. For each nonzero coordinate,
the near-one ratio result gives w_i=b a_i with a_i in B (p invertible).
For zero coordinates put a_i=0. This is finite support; cancelling
b g(b) shows g(a_i)=a_i along the ORIGINAL filter F, not merely
near one. This is fontaine_regularity.
For a B-module spanned by F-fixed elements take a maximal independent
subset of those elements. If a fixed y is outside its span, maximality
gives a nonzero b and a finite coefficient vector w with b y=sum w_i v_i.
Independence implies the same ratio identities on w_i by applying the
action and clearing denominators. Hence w=b a, a in B. Cancel b
using torsion-freeness where applicable. More generally the native
IsAdmissible.exists_basis uses the linear-independence cancellation
to obtain y in the span: the admissible module is spanned by fixed
vectors and is a B-vector base change from Q_p; thus B-torsion-free
even for the original Z_p-module with torsion. (B inverts p.)
Contradiction. The maximal independent set spans and is a B-basis.
This supplies the actual invariant M at exists_isPeriodMatrix,
not the weaker assertion of a basis over Frac(B).
For a finite free Z_p lattice this is finite of its rank by base change.

## 4. Hodge frame (determinant descent, not ordinary Smith form)
Let U invertible over L and N(g) g(U)=U along F. Start with Y=I,
choose common k_i sufficiently negative so W=U diag(t^-k_i) integral.
Among all such UY=W diag(t^k_i) with Y in SL of algebraic integers
(O_Qpbar), F-almost fixed, minimize v_t(det W) (nonnegative integer).
All columns remain invariant as a frame. Put P=theta(W).
The equation reduces to N(g) g(P) diag(chi(g)^k_i)=P; hence ker(P)
is stable for coordinate action chi(g)^(-k_i)g.
If kernel nonzero, take a nonzero vector of inclusion-minimal support.
Its support subspace in the kernel has dimension 1: two independent
vectors would permit cancelling a nonzero coordinate. Normalize a
coordinate i of maximum p-adic norm to 1. Twisted Galois action
preserves support; after normalization, its ratios satisfy
chi(g)^(-k_j+k_i) g(a_j)=a_j. Tate vanishing makes a_j=0 at unequal
weights and Ax–Sen–Tate makes the remaining coefficients algebraic
and F-almost fixed. Norms <=1 by normalization. This works for
F=top (all g) and the stated near-one filters.
Let A be the identity with column i replaced by a. det A=a_i=1,
A integral algebraic and F-almost fixed. Replace Y by YA.
Because a_j is zero at unequal weights, the new i-th column of
UY is t^k_i W a. But P a=0, so W a=t v for an integral column v.
Replace column i of W by v and increase k_i by one; leave all
other columns unchanged. The resulting determinant is det W/t:
by multilinearity, replacing column i by W a before division
multiplies determinant by a_i=1. It is nonzero and has smaller
valuation, contradiction. Thus P invertible and W in GL(D).
Y^-1 integral by adjugate and determinant 1. This supplies the
specific integral determinant-one, F-fixed Y needed in RUN59,
not just a Smith diagonalization over L with arbitrary basis changes.

For actual jump consumer the inverse matrix P^-1 gives rows
f_i on the lattice basis with f_i(N(g)v)=chi(g)^(-k_i)g(f_i(v)).
These rows form a C_p-basis of the semilinear functionals. For a
weight u functional f=sum c_i f_i, comparison using that basis
gives chi(g)^(k_i-u)g(c_i)=c_i (equivalently the inverse twist
depending on side); for k_i!=u Tate forces zero, at equality
Ax–Sen–Tate near-one gives algebraic c_i. Hence jump at u is
the number of i with k_i=u as an algebraic dimension (independence
over C_p implies independence over Qpbar). This supplies the actual
weight interval at exists_isPeriodMatrix. No Frobenius eigenvalue
bound inferred from Hodge weights.

## 5. Provenance / external-theorem ledger
Brinon–Conrad CMI notes §9.1, Theorem 9.1.5 and Proposition 9.1.6,
printed pp131–132, give fraction-field invariants for ordinary
B_cris built from divided powers, not automatically source B_max
or this chart's exact f. Text retrieved; screenshot attempted
but returned 502. https://math.bu.edu/people/jsweinst/AWS/Files/BrinonConradPAdicHodgeTheory.pdf
Do not substitute ordinary B_cris regularity on name match. The
above native argument handles exact chart f and open-image group.
Ax–Sen–Tate and nonzero cyclotomic twist vanishing are classical
inputs, native NearOne points to Ax J Algebra 15 (1970), Tate
p-divisible groups §3, Fontaine–Ouyang §§3.3–3.5 and Brinon–Conrad §14.
The application to open image is via its corresponding finite
extension K; no arbitrary infinite subgroup vanishing asserted.
Prior RUN59 chart coefficient argument and its foundational
approximation/extension assumptions retained. Section 2 explicitly
retains ChartScalars coordinate approximation, z separation and
mod-z coefficient decomposition; these are source-specific suppliers,
not axioms or verified external theorems. Their actual bodies were
read, not newly reconstructed in full here. The original graph
and all prior notes preserved. Candidate reduction edges:
C -> frame_theorem -> exists_isPeriodMatrix -> (exists_basis,
exists_hodge_frame, fixed-period lift, jumps) -> sections 1–4 ->
(Ax–Sen–Tate, chart extension/approximation/separation, chart existence).
The same filtered class result also consumed by LongGap/HodgeExpansion.
Cache by pin, chart, group, filter, coefficient ring, weight and
module; no global deletion claimed.

Native status: shared RUN29 outputs targeted_results.json blob
088cd2ec0e935ee1a282f10096949bcf671cc804 and status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f reread, CI 45803534769:
six named checks in TiltingLemma/Moments with standard three axioms,
module_1 timed out 124, overall error, full_RH_replay=false.
No result for this file. Native lean/lake unavailable in prior run;
no new native replay claimed. Following executable probe and small
algebraic certificate prepared, not compiled. No finite diagnostics
needed for this exact argument, no claimed RH import or circular root.
RESUME HERE: integrate sections 1–4 with RUN59 and earlier frame
inverse; independently audit sign convention for jump rows and
general admissibility cancellation. Discharge retained ChartScalars
extension/coordinate approximation and chart existence prerequisites
or obtain exact published equivalence; then move to remaining C
local defect and Bessel/Siegel–Weil/Rallis actual callers.
HANDOFF TO integration/editor, formal audit, native runner.
-/

section
variable {L : Type*} [Field L]
theorem run60_ratio_cancellation (a p g0 g1 w0 w1 z u0 u1 : L)
    (h : g0 = a * g1)
    (h0 : p * g0 = w0 + z * u0)
    (h1 : p * g1 = w1 + z * u1) :
    a * w1 - w0 = z * (u0 - a * u1) := by
  linear_combination h0 - a * h1 - p * h

end

#check BdR.exists_sub_mem_of_smul_sub_mem
#check exists_witt_coeff_of_isChartOf
#check Bcris.exists_witt_ratio
#check fontaine_regularity
#check IsAdmissible.exists_basis
#check exists_hodge_frame
#check Lift.Chart.IsChartOf.exists_mem_bicommutant_of_fixed
#print axioms exists_witt_coeff_of_isChartOf
#print axioms exists_hodge_frame
#print axioms IsAdmissible.exists_basis
#print axioms run60_ratio_cancellation
