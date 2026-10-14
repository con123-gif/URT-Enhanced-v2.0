# Newton–Platonic branch-conditioned Lorentz metric and memory law
14 October 2026 — independent exact finite mathematics; no URT or Cathedral inputs.

## 1. Exact geometric construction
Let P=I5−J5/5 be the rank-four zero-sum projector in R5 and Q_i=(5/4)P e_i e_i^T P, i=1,...,5. Then Q_i²=Q_i, Tr Q_i=1, Σ_i Q_i=(5/4)P, and Tr(Q_i Q_j)=1/16 for i≠j.

Define **branch-selected internal metric** g_i=P−2Q_i. On H=range(P), g_i²=I_H and its signature is **(−,+,+,+)**. These are canonical Householder reflections; no additional coefficient is fitted.

Exact overlaps: Tr(g_i g_j)=4 for i=j and 1/4 otherwise. Unconditioned mean: g_bar=(1/5)Σ_i g_i=(1/2)P, positive definite on H. Thus Lorentzian signature is branch-conditional and is lost by naive mixing.

## 2. Full Lorentz Clifford algebra inside the hidden operation algebra
All 25 ordered products Q_iQ_j span End(H)≅M4(R), with rank 16, split into 10 reversal-even symmetric and 6 reversal-odd antisymmetric modes. Choose any orthonormal branch-adapted frame. Let Z=diag(1,-1), X=[[0,1],[1,0]], J=[[0,1],[-1,0]]. Four real gamma matrices are
Γ0=J⊗Z, Γ1=Z⊗I2, Γ2=X⊗I2, Γ3=J⊗J.
They satisfy {Γμ,Γν}=2 diag(-1,1,1,1)μν I4, i.e. an explicit Cl(3,1) representation. Since Q_iQ_j span M4(R), all gamma matrices belong to the linear span of these ordered Platonic operations. This is **algebraic compatibility with real Dirac/Lorentz structures**, not a derivation of a physical differential equation; the full algebra also supports other signatures.

## 3. Exact branch-metric stochastic law
The minimal-projective instrument M_j=√(4/5) Q_j gives T_{ji}=(3/4)δ_ji+1/20. Hence, if branch i is selected initially,
E[g_n|i]=P/2+(3/4)^n (g_i−P/2).
Its conditional mean eigenvalues are λ_time(n)=1/2−(3/2)(3/4)^n and λ_space(n)=1/2+(1/2)(3/4)^n (multiplicity three). It is Lorentzian for n=0,1,2,3; positive definite for n≥4. Each actual selected g_i nevertheless remains Lorentzian at every n: the signature change belongs to **averaging**, not an established physical phase transition.

With stationary labels and Hilbert–Schmidt tensor correlation C_g(n)=E Tr[(g_{X0}−P/2)(g_{Xn}−P/2)]:
**C_g(n)=3(3/4)^n exactly**. This upgrades the abstract five-state 3/4 memory to an explicitly constructed metric-tensor observable.

## 4. Causal cone incompatibility of simultaneous branches
For a unit simplex ray v_i, g_i(x,x)=||x||²−2(v_i·x)². Timelike requires (v_i·x)²>||x||²/2. Tight-frame identity Σ_{i=1}^5(v_i·x)²=(5/4)||x||² makes simultaneous timelikeness for three distinct branches impossible (three inequalities would sum to >3/2||x||²). Thus an unconditional single common time cone across three selected branch metrics cannot be assumed.

## 5. Meaning
**Exactly established:** five canonically induced Lorentz-signature branch forms, real Clifford algebra realizable through hidden operation products, tensor memory law, finite conditional averaging horizon, and cone incompatibility. No fitted number or Cathedral/URT transfer is used.

**Not yet established physically:** these internal forms equal spacetime metrics; coordinate derivatives, universal causal cone, general covariance, quantum matter/Einstein gravity, physical Planck crossover, measured effect. In particular Householder matrices, Clifford algebras and symmetric Markov chains are existing mathematics. Priority of this particular conjunction is not proven.

**Reproduction:** exact SymPy verifier in the current conversation at /mnt/data/newton_platonic_lorentz_metric_exact.py.
