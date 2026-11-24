# Finite-field character classification and explicit induced Weil parameter
2026-11-24. SOURCE-MATCHED continuation of depth_zero_frobenius_parameter_proof.md. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. No synthetic data. The original proof's finite exceptional cases are computed exactly below. No local Lean kernel run; full RH reconstruction remains open.

## Source ledger
All below under src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/:
- NameLaws.lean bacce9b1591f33a3d01f365d52dea406fd415dce
- NameCentral.lean 3f464328ab80f63f72c59c04fb41eec8e2e3c705
- TypeEx.lean 1fe68a05883be17946a5f6d797d22d9fe552b993
- IsSemisimpleInducedParam.lean d3412a05a3986e499bf640fe1eae54fea6ec6b55
- PairCheckThreeTwo.lean 4def811c68481291d9ad29ecb3106823dbaa6378
- PinFld.lean 4909d7af14357fba651c1b857a20192e6f01c471
- PinChar.lean be922c67043b498872a67f810bbb33b9c7a87d7b
- PinNum.lean b6859bd0b7f1e8653ff15ab063f946a370746958
Exact definitions RecTTransport.lean 631f12febe08029e0d1d11139a704a6aaab367fb.

## 1. The restricted character-sum uniqueness problem (Pin)
Fix prime g, n>0, K/F_g of degree n, G=K*, N=g^n-1. A regular character θ has n distinct Frobenius conjugates A={θ^(g^j):0≤j<n}. For a second regular θ' let B be its orbit. Unless θ' is in A, A and B are disjoint because Frobenius has period n.
Let D consist of z in G with degree over F_g less than n. If z has degree d<n, d divides n by the tower law. Choose prime p dividing n/d. Then d divides n/p, so z lies in the subgroup z^(g^(n/p)-1)=1. Hence |D|≤b(g,n)=Σ_{p|n prime}(g^(n/p)-1). This is PinFld.exists_D.
For disjoint A,B set H(z)=Σ_A χ(z)-Σ_B χ(z). Characters of G are unit-modulus and orthogonal: the sum of a nontrivial character is zero by multiplying its argument by an element on which it is not one. Thus Σ_G |H|²=N(|A|+|B|). If H vanishes outside D and |A|+|B|>0, the triangle inequality gives N(|A|+|B|)≤|D|(|A|+|B|)²; divide by the positive size. This proves PinChar.card_le. Also if a character η is trivial on D, the Fourier coefficient of H at ψ equals that at ψη; since the coefficients are N, -N or 0 according to membership, both A and B are stable under multiplication by η. This proves PinChar.mul_mem.
Taking B empty, if the orbit sum vanished at every full-degree z, we would get N≤n b. PinNum.one_bd supplies n b<N, contradiction. Taking B the second orbit gives N≤2n b. PinNum.two_bd supplies the opposite strict inequality except four explicit pairs (g,n)=(2,2),(3,2),(2,4),(2,6). The bound b≤2g^floor(n/2) follows from distinct divisors n/p≤floor(n/2) and a geometric sum; for n≥12 use m=floor(n/2)≥6 and 8m+1≤2^m≤g^m (elementary induction), giving 2n b+1<g^n. The smaller n polynomial inequalities and one_bd remain cited to the source PinNum (not independently rechecked here in full).

### Actual exceptional finite cases, resolved by exact orbit arithmetic
G is cyclic of order N, so every character is η0^t for a fixed generator η0 of its dual and exponent t modulo N. This follows by sending a generator of G to a primitive Nth root and noting every character is determined by that value. In each source exceptional pair choose e divisible by every g^(n/p)-1. Then η0^e is trivial on D. Disjoint orbits with equal full-degree sums would both have to be regular exponent orbits invariant under addition of e modulo N.
Computed exhaustively on the FOUR ACTUAL Lean exceptions (PairCheckThreeTwo.lean, not generated fixtures):
(g,n,N,e) | regular exponent count | regular & translation-invariant exponent count | invariant orbits
(2,2,3,1) | 2 | 0 | none
(3,2,8,2) | 6 | 0 | none
(2,4,15,3) | 12 | 0 | none
(2,6,63,21) | 54 | 6 | {7,14,28,35,49,56}
The first three exclude both orbits outright; the last permits only one orbit, so two disjoint ones are impossible. The code uses exact small integer residues and enumerates each exponent once; no floating-point approximations or simulation.
```python
for g,n,e in [(2,2,1),(3,2,2),(2,4,3),(2,6,21)]:
    N=g**n-1
    reg=closed=0
    orbits=set()
    for t in range(N):
        a={t*pow(g,j,N)%N for j in range(n)}
        if len(a)!=n: continue
        reg+=1
        if {(x+e)%N for x in a}!=a: continue
        closed+=1
        orbits.add(tuple(sorted(a)))
    assert len(orbits)<=1
    print(g,n,N,e,reg,closed,sorted(orbits))
```
Executed V8 equivalent produced the table above. Therefore Pin's nonvanishing and uniqueness follow from orthogonality, field arithmetic, the cited PinNum general bounds and the independently checked native exceptions.

## 2. NameLaws and central scalar (NameLaws, NameCentral)
The source greenRegularCharacters supplies a family τ_F(θ) of cuspidal characters indexed by regular θ, equality exactly up to Frobenius orbit and exhaustion of cuspidal characters. Its irreducible-characteristic-polynomial formula is
Tr τ(y)=(-1)^(n-1) Σ_{j<n}θ(z^(g^j)),
where z is a root of charpoly(y). Keep the Green theorem itself as a named imported obligation; the following deductions do not prove the theorem.
Every full-degree z∈K* is realized as an eigenvalue of an invertible matrix y in GL_n(F_g): multiplication by z on the n-dimensional field has characteristic polynomial the minimal polynomial of z (power basis), irreducible and with nonzero constant term. Two regular names for the same finite character therefore have equal orbit sums at every full-degree z. Pin implies they differ by a Frobenius power. Exhaustion gives a regular name for every cuspidal τ; comparison to the family τ_F plus uniqueness then proves that names in one orbit give equal finite characters. Frobenius powers preserve regularity since F^n=id. Any ring isomorphism of finite fields over F_g commutes with the base prime field and Frobenius; transporting a root and its character by this isomorphism preserves both the naming formula and distinctness of conjugates. These are all four NameLaws fields.

For central scalar c∈F_g*, Schur's lemma gives τ(cI)=l I since τ is irreducible. Pin gives a full-degree z with nonzero orbit sum. Multiplication by c does not change the field generated by z. Let L_z denote the invertible multiplication matrix. Then L_(cz)=cI L_z and the naming formula gives Tr τ(L_(cz))=θ(c)Tr τ(L_z) because c is Frobenius-fixed. The scalar action gives the same trace as l Tr τ(L_z). The trace is nonzero by Pin, hence l=θ(c). This proves the exact NameCentral field without division by a potentially vanishing character value.

## 3. Actual induced Weil parameter (IsSemisimpleInducedParam.indEx)
Fix ambient field/place data, degree-one Weil element φ, n>0, characters η_j of inertia indexed by integers with η_j(φtφ^-1)=η_(j+1)(t), η_j=η_k iff n divides j-k, and open ker η_0. Prescribe nonzero determinant c at φ. Put b=(-1)^(n-1)c. The space
V_b={f:Z→C : f(j+n)=b f(j)}
is n-dimensional: values on 0,...,n-1 determine f(j)=b^floor(j/n)f(j mod n), valid also for negative j because b≠0. This gives an explicit linear isomorphism V_b≃C^n.
Write σ=φ^d t_σ with d=deg σ, t_σ in inertia. Define
(ρ(σ)f)(j)=η_(j+d)(t_σ) f(j+d).
The n-periodicity of the η_j ensures preservation of V_b. For σ,σ' with degrees d,d', t_(σσ')=φ^-d' t_σ φ^d' t_σ'. Character covariance implies η_(j+d+d')(φ^-d't_σφ^d')=η_(j+d)(t_σ); multiply the two character factors to obtain ρ(σσ')=ρ(σ)ρ(σ'). Identity acts trivially. Inertia acts diagonally by η_j(t), φ by the cyclic shift with last row wrap b. Hence det ρ(φ)=(-1)^(n-1)b=c and charpoly ρ(t)=∏(X-η_j(t)).
Smoothness: each ker η_j is the continuous conjugation preimage of ker η_0. Their finite intersection for 0≤j<n is open in inertia and fixes the entire space. Semisimplicity of each ρ(σ): write σ^n=φ^(n d)t for t in inertia. Since inertia is compact and the action kernel is open, its image is finite, so some positive m has ρ(t)^m=I. The shift by nd acts as scalar b^d. Thus ρ(σ)^(nm)=b^(dm)I. The polynomial X^(nm)-b^(dm) has distinct complex roots because nm>0 and b≠0. An operator annihilated by it is semisimple.
Irreducibility: let U be a nonzero invariant subspace and u∈U with u_i≠0. For another occupied coordinate k, choose inertia t distinguishing η_i(t) from η_k(t); the vector (ρ(t)-η_k(t)I)u is still in U, has i-coordinate nonzero and k-coordinate zero, and creates no new nonzero coordinates. Iterating eliminates all other occupied coordinates, and scaling gives e_i. Shift powers then give all coordinate vectors; hence U=V_b. This is the support-decreasing induction single_mem in the source. Set monodromy zero, satisfying nilpotence and the WD covariance equation. Transport to C^n to obtain a Weil-Deligne class. If every η_j kills wild inertia then the constructed representation is tame. This proves the five exact IndEx outputs conditional only on its stated character-orbit and ambient group/topology premises; the native proof explicitly constructs the representation, no classification or LLC theorem invoked here.

## 4. TypeEx: existence and uniqueness of the finite depth-zero type
Transfer σ through the continuous p-adic isomorphism i. The native isSupercuspidal_of_isCuspidal and isCuspidal_repK show the principal-congruence fixed representation has the cuspidal condition. Since depth zero gives a nonzero fixed vector, TameGen.exists_simple produces a finite simple subrepresentation τ of the finite quotient action with injective intertwiner into the fixed space. The native character criterion gives IsCusp τ.character: invariants for a proper unipotent radical vanish by the cuspidality result and injection. Inclusion of the fixed space gives the nonzero inflation map into σ. Transport through the representative-class equivalence gives existence on the originally specified representative.
For uniqueness, transport two inflation maps to the same representative of the local class. Each is injective: its kernel is finite-group invariant (reduction surjective), and finite type irreducible plus nonzero map forces zero kernel. The imported st6 theorem of the torus/congruence argument gives that the image of each is the ENTIRE principal-congruence fixed space, using finite cuspidality and local central character. Hence their common image identifies the two finite type spaces by the linear isomorphism φ'^{-1}φ. The two maps intertwine the same local action of integral GL; reduction is surjective, so this is an isomorphism of finite-group representations. Their characters agree by invariance of trace under conjugation. This proves TypeEx's two fields, preserving the native supercuspidal, finite simple submodule and st6 producer obligations.

## 5. Frontier and integration
The actual native IndEx matrix construction and the exceptional Pin arithmetic are now translated, rather than left as theorem-name placeholders. NameLaws, NameCentral and TypeEx are reconstructed conditional on the listed producers. Shared Frobenius orbit and character algebra connect directly to the preceding ParEx/ParUniq/ParTw chapter and the guarded cusp-map chapter. No URT premise added. Source extraction/whole-proof coverage not claimed.
RESUME HERE: inspect the actual greenRegularCharacters producer and PinNum.one_bd/two_bd complete finite-case proof; then st6/finite cuspidal type producers and ExtEx/ResEx/ResBase/ResIndep. Merge chapter into current manuscript rather than repeat previous algebra.
HANDOFF TO: editor, literature, integration, galois, audit.
