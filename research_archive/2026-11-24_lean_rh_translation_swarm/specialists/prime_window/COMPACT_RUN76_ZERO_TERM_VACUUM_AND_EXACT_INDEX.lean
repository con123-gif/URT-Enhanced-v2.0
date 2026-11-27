import New.Seesaw.GoodDatumExists

/-!
# RUN76 — common vacuum scalar, frequency cancellation and actual diagonal index
27 November 2026. SOURCE-MATCHED human proof under explicitly retained native
model premises; scalar Lean certificates prepared, NOT run.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
(grh-compact/src), Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Current mission blob a69122b6ad568910a45d2bc13961ab9da4855143 read,
including completion-first, migration, and unified engine; manuscript blob
619ae01be98c32e053eef1c8bcd44ccddd0664e7. Follow RUN75 0fbc00e5.
Prior work located by search: structure/compact/RUN68_NEIGHBOUR_RESIDUE_AND_ADMISSIBLE_EVAL.md
blob 31fbc0be1cb7a50546b45b3257c849b07cffc365 already proves the rank-one
neighbour columns, residue partition, generic index and tau at the
conditional caller; structure RUN70 blob c046e89451685195e0a190f489b9707f93deefa1
already supplies name denominators and the original cutBound assembly.
Theta RUN52 also supplies the local neighbour glue. Do not count these
again. New task is the retained zeroTermFin_finHeisOp_vacElem supplier
at AdmissibleEvaluation 192, with an independent caller audit and
explicit actual diagonal index (rather than a generic subgroup map).

## 1. Prove the common scalar before varying the translate
Source EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02 lines 24–75.
Let L=Ohat^n, L0=Ohat^n0, F=zeroTermFin D, v and v0 the two
native vacua. Let I,K denote the finite frame blocks D.iAdelic.map snd,
D.kAdelic.map snd. Let G be the finite unitary g on the target,
Cmat the source c, and B=I G+K Cmat, integral by the exact hB of
RUN75 and the splitting frame equality AdmissibleEvaluation 183–196.
All matrices and frames in this paragraph are finite-adelic.
The native frame decomposition is y=Ldual a+I w+K b, with
K^H y=a, I^H y=w (ZeroTerm.lean 441–449; the native frame Gram swaps
the two isotropic blocks, not the middle block). Covariance on the
zero-a subspace is EXACT:
    F rho(I w+K b) f = rho0(w) F f.
This is EdgePair 39–41; retain the actual normalized mixed model law.
Since Bx belongs to L for every x in L0, rho(Bx)v=v by the native
vacuum law. Set w=Gx, b=Cmat x in this covariance. It follows that
rho0(Gx) Fv=Fv for every integral x. By zeroTermFin_spec, Fv belongs
to the finite part. Apply the vacuum-line lemma, FinitePart 57–61:
    Fv = c0 omega0(G)v0.
In detail omega0(G)^-1 Fv is fixed by the whole standard lattice
under Weil-Heisenberg covariance. The native standard-lattice
projection on the finite part equals the rank-one vacuum projection,
so it is c0 v0, with c0=dataInner(v0,omega0(G)^-1 Fv).
No assertion that c0 is nonzero or algebraic is needed. It depends
only on D and G, not on y, n, coefficient embeddings, or twist inputs
to the subsequent admissible evaluation. This exact order of choices
is crucial for the common good datum.

## 2. For arbitrary y, one integral correction and one matrix equality
If F rho(y)v=0 use zeta=0 with the SAME c0. Otherwise use the already
reconstructed zeroTermFin_support (RUN73) with M=M'=I_identity and the
standard vacuum lattice invariance. There is l in L with K^H(y-l)=0.
Decompose z=y-l in the finite frame. The a coordinate vanishes, hence
z=I w+K b, I^H z=w. The decisive identity is
    G B^H z = G(G^H I^H z+Cmat^H K^H z)=w.
It uses G G^H=1, not an estimate on an inverse frame. Consequently
F rho(z)v = rho0(w)Fv = c0 omega0(G)rho0(B^H z)v0.
The finite Heisenberg law and rho(l)v=v yield
rho(y)v = phase1 rho(z)v; phase1 is a value (or inverse value)
of the native finite additive character. Likewise B^H l is integral
because B is integral (star preserves Ohat), so
rho0(B^H z)v0=phase2 rho0(B^H y)v0, with phase2 another finite
character value or inverse. Their product is of finite order by
isOfFinOrder_psi_f (the signs do not matter for this conclusion;
they have not been replaced by one). Combining gives
    F rho(y)v = (zeta*c0) omega0(G)rho0(B^H y)v0,
with zeta zero or of finite order for every y, exactly EdgePair 58–75.
If c0=0 the nonzero branch yields contradiction and every output
vanishes; the displayed conclusion still holds without division.
Retain the primitive-factorization/self-duality behind support,
native frame Gram, vacuum-line projection, mixed-term covariance and
finite Weil-Heisenberg law; this is a human proof of the specific
caller, not an independent construction of the Weil representation.

## 3. Independent audit of tau and weighted transport in structure RUN68
Actual AdmissibleEvaluation 175–215; source matrix B above equals
U tensor R^T with U=x_T^-1 D.zeroPart.incl M, R=J^T Fmid,
Fmid=V'.xFin and J selects its ordinary left indices. Let Hmid be the
finite rational Gram of V'. The native frame gives
Fmid^H Hmid Fmid=1 and the ordinary block of gradedGram is identity,
with zero mixed ordinary/string blocks. Thus Hmid J=J, J^H=J^T, and
    R^H = Fmid^H J = Fmid^-1 J.
Write T=(stackedT).map snd. Both components of TJ vanish:
Y'.stringMap Y'' J=0 by the zero ordinary block of stringMap;
(V.formAdjoint V' (Y.stringMap Y')).map snd J=0 because the form
adjoint is H_left^-1 (Y.stringMap Y')^H Hmid, Hmid J=J, and the
range of Y.stringMap Y' has zero ordinary rows. No string reversal
coefficient or parity-dependent scale is needed for this annihilation.
B^H applied to stackedTFin is the vectorization of
    alpha^-1 U^H x_T^-1 T Fmid R^H
      = alpha^-1 U^H x_T^-1 T J = 0.
This is the same tau as 197–204; independent agreement with RUN68.
The x_T and Fmid coordinate factors are not assumed unitary in the
ordinary Gram; the Hmid J identity is why the right inverse cancels.
No estimate on T or U and no division by alpha beyond the actual
unit alpha in finCoord_homAtPoint. At a place above N all input and
output weights are units by hN/hkappa, so integral B suffices. Off N
gamma=I, b=0; each surviving column of M has only its ordinary
entry times the diagonal weights. hA matches valuations on the
nonzero entries of D.zeroPart.incl. The x_T^-1 left/right block form
preserves that matching because selfOrConj beta is constant on each
block, and the R factor does not affect the weight. Apply the original
adjoint weighted-sum lemma at the conjugate place; the valuation
condition is on B_ij(star w), not B_ij(w). This is precisely the
premise at 208–215. This audit is agreement on the human substitution,
not native verification of hA/hM or the entire theorem.

## 4. Actual diagonal index, no generic all-coordinate quotient needed
Source AdmissibleEvaluation 85,110,140–153, GoodDatumExists 25–28:
before the neighbour gamma, the moved vacuum is for
g=(diag kappa) tensor I, NOT g gamma. The source's hG gives
bar(beta)*kappa_i integral for every i. Write beta=piGBar,
A=N((beta))=|Ohat/(beta)| (positive, beta nonzero).
At each finite place w use integer ord_w with ord_w(uniformizer)=1.
For a coordinate on which kappa=delta, the preimage-integral
condition for an integral x is
    ord_w x >= e_w = max(0,-ord_w delta).
For all other coordinates (kappa=1) it is just ord_w x>=0.
Since delta=chosenIdele / bar(chosenIdele), and its valuations
match beta via PairTensorData 191, put a_w=ord_w beta,
b_w=ord_w bar(beta). Then
    e_w = max(0,b_w-a_w) = b_w-min(a_w,b_w).
Thus e_w<=b_w, and the local quotient has exactly q_w^e_w elements
by the successive residue-field quotients of the DVR. Only finitely
many e_w are nonzero, so the global ONE-coordinate index is
    J_delta = product_w q_w^e_w
            = A / N((beta)+(bar(beta))).
Here + denotes ideal sum (minimum valuations); the equality does
not require the two principal ideals to be relatively prime.
In particular J_delta divides A by the exact exponents (or just hG).
For middlePair all kappa=1, hence the index is exactly 1.
For lastPair only the exceptional final target coordinate has
kappa=delta, repeated across the source ordinary index X'+Unit.
For r=card(X'+Unit), the native overlap formula therefore gives
    |finMultiplier(g)|^2 =
       1 (middle) or J_delta^r (last).
This follows from the Cartesian product of the finite lattice
quotients, not an independent norm guess for the whole gamma.
The actual denominator in the moved-vacuum expansion after
factoring out finMultiplier(g) is this positive integer.
Every term is a root of unity divided by the index; the number of
terms is the index, hence all conjugate l1 sizes at most one.
Since J_delta^r divides A^r and r is at most the full coordinate
count, the original IsAdmissibleEval denominator is immediately
valid, with no generic all-coordinate index-map argument.
For the named data, no claim of eliminating the separate Fourier
denominators. If the tighter pair denominators are desired, use
the same explicit coefficient witness and common constants (the
native IsAdmissibleEval definition itself has the larger fixed
denominator). Across the rho+1 pairs, only the final pair has this
evaluation cost: the combined denominator divides
A^(sum_{j<m} r_j*r_(j+1)+n_(m-1)), rather than the original
coarser cutBound^(2m). Original sufficient constant unchanged;
no manuscript reoptimization is necessary and no root retirement
is claimed. This identifies the exact arithmetic cost and prevents
charging a second denominator for the neighbour residue sum.

## Provenance, graph, evidence
All compact source paths below relative to grh-compact/src:
New/Seesaw/EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02 24–75,124–130.
New/Seesaw/AdmissibleEvaluation.lean 4a0070f1658927e4faf4e596cceb0009478b6c2d 81–160,167–215.
New/Seesaw/GoodDatumExists.lean cc6f93272fb65dd22d8079236a66454b034182b9 21–38,43–82.
New/Seesaw/PairTensorData.lean ade3783be65d0ac72f29b46220354147ffdca110 188–193.
Lib/Weil/Construction/FinitePart.lean 174ee272107a50267fcde8c0ea06aa73f5572fe5 55–61.
Lib/Weil/MixedModel/ZeroTerm.lean e26a6037c53efb630f1dd8cf959aef3e0855fc5d 441–449.
Lib/Weil/Construction/FiniteMultiplier.lean 7b35474d42010a69abe9ba5868c0fce4d4490efc 180–185.
Lib/Weil/Periods/FiniteBesselGroup.lean 14c0b4ab31b22a94941f6c4e52d77b17887cba6b 23–24,88–93.
Lib/Weil/Periods/DegreeAndUnipotent.lean c5b913c258a02c5429bc8962604e04420dbb66e2 20–22.
Lib/Weil/Periods/BesselIntegral.lean b7eb71106debb76e1b97526f7c540b7d4d28bed8 37–39.
Original selected edges: star_inequality -> short_forms -> seesaw ->
exists_isAdmissibleComb_reducedVacuum -> isAdmissibleEval_pairEvalY ->
isAdmissibleEval_finEval -> zeroTermFin_finHeisOp_vacElem ->
{zeroTermFin_support, zeroTermFin_spec, vacuum-line, frame, Heisenberg laws}.
Human reduced graph: same consumer, sections 1–2 with the same listed
primitive inputs; tau uses sections 3 and RUN68; denominator uses
actual diagonal index section 4. No native graph changed. Context key
compact pin, D, G, Cmat, I,K,B, same lattice and common c0, beta,
actual stage, kappa, delta. No URT, no native lean/lake/elan available
(PATH checked). rh_scan/prune/reduce/auto/frontier not executed; the
certificates below are prepared, not native evidence.
Re-read state branch compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six actual B/C axiom checks
(propext, Classical.choice, Quot.sound), A-module build exit 124 at
2700.11s; full_RH_replay=false, all_requested_checks_ok=false.
Orchestrator summary blob d854e29136e98765a472326355afba1978208f24 run
45961051013 (27 Nov 08:08 UTC) is other repository checks, not this proof.
No new kernel PASS. Preserve all prior original/reduced graphs, source
pins, axioms, unresolved global A/B/C, and prime-error obligations.

RESUME HERE: integration/editor attach sections 1–2 to the already
present conditional neighbour argument (RUN68, RUN75), then use the
source's original cutBound constant at GoodDatumExists. Independent
audit check the common c0 before arbitrary y and exact finite-character
phases. Next examine actual still-open marked HasType/elementary
divisor or chosen-level character/standard-data supplier from the
current manuscript, not another duplicate neighbour estimate; coordinate
with theta and kernel lanes. The next native shared replay may include
this certificate without importing Main or claimed RH.
HANDOFF TO integration, theta, editor, independent audit and kernel.
-/

namespace CompactPrimeRun76

theorem valuation_deficit (a b : ℤ) :
    max 0 (b-a) = b - min a b := by
  by_cases h : a ≤ b
  · rw [min_eq_left h, max_eq_right (sub_nonneg.mpr h)]
  · have h' : b ≤ a := by omega
    rw [min_eq_right h', max_eq_left (sub_nonpos.mpr h'), sub_self]

theorem valuation_deficit_le (a b : ℤ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    max 0 (b-a) ≤ b := by
  exact max_le hb (by omega)

theorem power_budget (A r s : ℕ) (h : r ≤ s) : A^r ∣ A^s := by
  refine ⟨A^(s-r), ?_⟩
  rw [← pow_add, show r+(s-r)=s by omega]

theorem actual_index_budget (A J r s : ℕ) (h : J ∣ A) (hrs : r ≤ s) :
    J^r ∣ A^s := by
  obtain ⟨u, hu⟩ := h
  apply dvd_trans _ (power_budget A r s hrs)
  refine ⟨u^r, ?_⟩
  rw [hu, mul_pow]

end CompactPrimeRun76

#check @zeroTermFin_finHeisOp_vacElem
#check @zeroTermFin_support
#check @isAdmissibleEval_finEval
#check Data.isAdmissibleEval_pairEvalY
#print axioms CompactPrimeRun76.valuation_deficit
#print axioms CompactPrimeRun76.valuation_deficit_le
#print axioms CompactPrimeRun76.power_budget
#print axioms CompactPrimeRun76.actual_index_budget
#print axioms zeroTermFin_finHeisOp_vacElem
