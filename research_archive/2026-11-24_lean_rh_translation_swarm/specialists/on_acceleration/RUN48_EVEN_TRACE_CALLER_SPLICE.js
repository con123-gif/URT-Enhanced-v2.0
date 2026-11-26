/*
RUN48, lane 14, 26 Nov 2026. SOURCE-MATCHED / actual caller splice PREPARED, NOT compiled.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine read;
AGENTS, SWARM, HANDOFF, EXPANSION inspected. Peer fccd0f04 joint row, 2becd062
scaled primary SFew, a66af433 Euler box, b86025dc relative mass, 890cfaaa signed
principal mean reviewed. Prior RUN47 2c6af8dc preserved. Upstream pin
40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.

Actual consumer KeepNumU.numberU3U_of_adm2A_imp_adm2B calls rat trace supplier
with CountQAlt. Actual countQ_alt takes an auxiliary quadratic family,
selects n^2+1 good discriminants, gets CountP catalogues and calls rootSum.
For h=2 specialize n=2, m=(e,-e), wt=0. If B is the native FrobEig
multiset (roots of inverse Frobenius), then beta_i = (B.map inv).map (^f_i).
Thus 1+sum B^2 = 1+sum beta_i^(-2/f_i), f_i=1 or 2. Orientation confirmed
against native rat consumer and MapTraceEqSumRootsOfCharpolyMap.lean
7888438098bca3508fa8d662ff1e414f1f5fe309. Distinguish B from B.map inv.
Retain B as existential proof witness for native hfr; no enumeration in T.
Use same bit_of_fibre with U=Sigma i,D_i.S; original 'two' proof uses only
same restriction class, not eigenvalues. Keep original ex proof via frobEx,
FrobEig uniqueness, nonself-twist selection, and same local unramified witness.
Then actual rank-three block trace proof uses B directly, not D'.beta.
The even catalogue cardinality is 2 sum_i card D_i.S rather than cap 8 sum.
The mixed wrapper uses max constants and exponents; all non-h=2 cases keep
original CountQAlt route. Hence no global deletion of CountQAlt, no claim
uniform exponent improved, no kernel speedup. CountP and all essential
arithmetic/geometric/prime-window obligations remain open. Original source
is retained in generated output; new original/reduced graph:
original KeepNumU -> rat_alt -> countQ_alt -> rootSum -> CountP, bit_of_fibre;
candidate KeepNumU -> mixed48 -> even_alt48 -> countQ_even_alt48 -> CountP,
rank2_even_catalogue48, bit_of_fibre, frobEx and compatibility;
mixed48 also -> original rat_alt and countQ_alt (fallback).
These are source-visible selected edges, not elaborated graph or axiom evidence.
Context key pin/toolchain/K/e/M/p/w/h/auxiliary i,v_i,f_i/D_i/ell/Omega/iota,
admissibility and consumer. Preserve prior native graph and axiom records.
Native engine CI 45577239749 and 45576756833 job conclusions retrieved,
pick/run/record success. Prior candidate CI lookup yielded no PR runs; no
new native result. Local lean/lake/elan absent, public git DNS failed.
Executed build against fetched pinned source: 35 fail-on-error
source transformation checks. This is not compilation.

Usage: node RUN48_EVEN_TRACE_CALLER_SPLICE.js <pinned source checkout>
  <path to RUN47_EVEN_FROBENIUS_DIRECT_TRACE.lean> <new output directory>
The generator hash-checks exact source and prior helper bytes; never mutates
pinned source. In disposable pinned checkout, overlay the two generated
files at their original relative paths; compile first Frobenius module
then KeepNumU using the existing native runner (no protected workflow
changes). Append #print axioms commands for new supplier and actual caller.
Run rh_scan/rh_prune and rh_reduce/rh_auto/rh_auto_frontier in native context
as appropriate; record original/reduced type/value/constructor edges and
unresolved axioms. Compiler failures are evidence, not passes.
RESUME HERE: compile overlay in disposable native runner, repair errors,
audit actual KeepNumU branch and compare actual catalogue counts; if native
fails retain old route. Prioritize CountP uniform quantitative supplier.
HANDOFF TO kernel/integration/audit. RH OPEN, zero essential leaves closed.
*/
function build(src,keep,prev){
let checks=0;const ck=(x,m)=>{if(!x)throw Error(m);checks++};const sub=(s,a,b)=>{ck(s.includes(a)&&s.indexOf(a)===s.lastIndexOf(a),"unique anchor: "+a.slice(0,100));return s.replace(a,b)};const take=(s,a,b)=>{let i=s.indexOf(a),j=s.indexOf(b,i+1);ck(i>=0&&j>i,"range: "+a);return s.slice(i,j)};
let end="\nend\nsection\nopen NumberField IsDedekindDomain Formalism.ConjugateSelfDual";
let q=take(src,"theorem countQ_alt :",end),rat=take(src,"theorem frobenius_trace_count_bound_of_rat_eigensystem_count_alt :",end);
let helper=take(prev,"theorem inv_power_map_sum","-- Copy of the source").replaceAll("inv_power_map_sum","inv_power_map_sum48");
helper=sub(helper,"theorem rank2_even_fibre (p e f : ℕ)","theorem rank2_even_fibre48 (p e f q : ℕ) (hq0 : q = p^f)");
helper=sub(helper,"(D : EigData 2 (p^f) ![(e:ℤ), -(e:ℤ)] 0)","(D : EigData 2 q ![(e:ℤ), -(e:ℤ)] 0)");
helper=sub(helper,"  obtain ⟨k,hk⟩ : ∃ k : ℕ, f*k=2 := by","  subst q\n  obtain ⟨k,hk⟩ : ∃ k : ℕ, f*k=2 := by");
helper=sub(helper,"theorem rank2_even_catalogue (p e : ℕ)","theorem rank2_even_catalogue48 (p e : ℕ)");
helper=sub(helper,"(D : ∀i, EigData 2 (p^f i) ![(e:ℤ), -(e:ℤ)] 0)","(q : I → ℕ) (hq : ∀ i, q i = p^f i)\n    (D : ∀i, EigData 2 (q i) ![(e:ℤ), -(e:ℤ)] 0)");
helper=sub(helper,"rank2_even_fibre p e (f i) hp (hf i) (D i)","rank2_even_fibre48 p e (f i) (q i) (hq i) hp (hf i) (D i)");
let qs=`theorem countQ_even_alt48 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt →
    ∃ c A : ℕ, ∀ e : ℕ, 1 ≤ e → ∀ M : ℕ, 1 ≤ M →
    ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 ℚ)), p.Prime → (p : 𝓞 ℚ) ∈ w.asIdeal → ¬ p ∣ M →
    ∃ T : TrData (p^2) e, Nat.card T.S ≤ c * (M * (e+1))^A ∧
      ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p → ∀ (Ω : Type) [Field Ω] [Algebra ℚ Ω] [IsAlgClosure ℚ Ω] (ι : Qbar l ≃+* ℂ),
      ∃ cl : {r : G ℚ Ω →* GL (Fin 2) (Qbar l) // _root_.UpperTheory.GalN.V.AdmRNAlt ι M ![(e : ℤ), -(e : ℤ)] 0 r} → T.S,
        (∀ r r', cl r = cl r' → RepIso r.1 r'.1) ∧
        ∀ r, ∃ B : Multiset ℂ, FrobEig ι r.1 w B ∧ T.t (cl r) = 1 + (B.map (fun b => b^2)).sum := by
  intro hP hL hA
  let n : ℕ := 2
  have hn : 2 ≤ n := le_rfl`;
let qb=q.slice(q.indexOf("\n  classical"));
qb=sub(qb,"  refine ⟨2 ^ (n + 1) * ((n ^ 2 + 1) * ∑ i, c i), ∑ i, A i, ?_⟩\n  intro m wt hm hwt H hH M hM p w hp hpw hpM",`  refine ⟨2 * ((n ^ 2 + 1) * ∑ i, c i), ∑ i, A i, ?_⟩
  intro e he M hM p w hp hpw hpM
  let m : Fin n → ℤ := ![(e : ℤ), -(e : ℤ)]
  let wt : ℤ := 0
  let H : ℕ := e
  have hm : StrictAnti m := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp [m] at hij ⊢
    omega
  have hwt : ∀ i, m i + m i.rev = wt := by
    intro i
    fin_cases i <;> simp [m, wt, Fin.rev]
  have hH : ∀ i, |m i| ≤ H := by
    intro i
    fin_cases i <;> simp [m,H]`);
qb=sub(qb,take(qb,"  obtain ⟨D', hD', e, he, heβ⟩","    refine Nat.mul_le_mul_left"),`  obtain ⟨T, j, hj, hjcard, ht⟩ := rank2_even_catalogue48 p e hp.pos (Fin (n ^ 2 + 1)) f
    (fun i => ⟨hf1 i, hf2 i⟩) (fun i => normV (v i)) hvf D
  refine ⟨T, ?_, ?_⟩
  · rw [hjcard, mul_assoc, mul_assoc]
`);
qb=sub(qb,take(qb,"    (U := Σ i,","  case ex =>"),`    (U := Σ i, (D i).S)
    (fun r r' => RepIso r.1 r'.1) (fun _ _ => iso_symm) (fun _ _ _ => iso_trans)
    (fun r t => (∃ h : _root_.UpperTheory.GalN.V.AdmPNAlt ι M m (r.1.comp (res ℚ Ω (K₀ (u t.1)))), cl t.1 ⟨_, h⟩ = t.2) ∧
      ∃ B : Multiset ℂ, FrobEig ι r.1 w B ∧
        (B.map (·⁻¹)).map (· ^ f t.1) = (D t.1).β t.2) ?ex ?two) ?main
  case main =>
    rintro g ⟨hg, hgQ⟩
    refine ⟨fun r => j (g r), fun r r' H => hg r r' (hj H), fun r => ?_⟩
    obtain ⟨B, hB, hpow⟩ := (hgQ r).2
    refine ⟨B, hB, ?_⟩
    have Ht := ht (g r).1.1 (g r).1.2 (g r).2 (B.map (·⁻¹)) hpow
    simpa [Multiset.map_map, Function.comp_def] using Ht
`);
qb=sub(qb,take(qb,"    refine ⟨⟨i, ⟨(cl","  case two =>"),`    refine ⟨⟨i, cl i ⟨_, hadm⟩⟩, ⟨hadm, rfl⟩, B, hB, ?_⟩
    rw [← map_inv_inv ((D i).β _), ← h2, Multiset.map_map, Multiset.map_map]
    exact Multiset.map_congr rfl fun b _ => inv_pow b (f i)
`);
let nq=qs+qb;
let oldprem="_root_.UpperTheory.GalN.V.Win.N.CountQAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →",newprem="_root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →";
let nr=rat.replace("theorem frobenius_trace_count_bound_of_rat_eigensystem_count_alt :","theorem frobenius_trace_count_bound_of_rat_eigensystem_count_even_alt48 :");
nr=sub(nr,oldprem,newprem);nr=sub(nr,"∀ (p h : ℕ)","∀ (p : ℕ)").replaceAll("p ^ h","p ^ 2");
nr=sub(nr,take(nr,"  intro hQ hN","  intro l _ hl2 hlp"),`  intro hP hL hA hN
  obtain ⟨c, A, hc⟩ := countQ_even_alt48 hP hL hA
  refine ⟨c, A, ?_⟩
  intro K _ _ e he M hM p w hp hw hpM
  obtain ⟨v, hv⟩ := place_over_rational_prime K p w hw
  obtain ⟨T, hcard, hD⟩ := hc e he M hM p v hp hv hpM
  refine ⟨T, hcard, ?_⟩
`);
nr=sub(nr,"K Ω p h w v hp hw hv","K Ω p 2 w v hp hw hv");nr=sub(nr,"fun r => u (cl (W r))","fun r => cl (W r)");nr=sub(nr,"(hcl1 _ _ (u.injective H))","(hcl1 _ _ H)");
nr=sub(nr,"  · obtain ⟨hun, hfr⟩ := hcl2 (W r) B hBv","  · obtain ⟨Br, hBr, ht⟩ := hcl2 (W r)\n    obtain ⟨hun, hfr⟩ := hBr B hBv");nr=sub(nr,"(W r).1 τ⁻¹ ^ h","(W r).1 τ⁻¹ ^ 2");
nr=sub(nr,take(nr,"(hfr τ hτ) h","    rw [← h3"),`(hfr τ hτ) 2
    rw [ht, ← trace_conj_gl3 (g r), hg r, h2, RingEquiv.eq_symm_apply]
    change _ = 1 + (Br.map (fun b => b^2)).sum
`);
let mixed=rat.slice(0,rat.indexOf(" := by")+6).replace("theorem frobenius_trace_count_bound_of_rat_eigensystem_count_alt :","theorem frobenius_trace_count_bound_of_rat_eigensystem_count_mixed48 :").replace(oldprem,newprem)+`
  intro hP hL hA hN
  obtain ⟨c₁,A₁,H₁⟩ := frobenius_trace_count_bound_of_rat_eigensystem_count_alt (countQ_alt hP hL hA) hN
  obtain ⟨c₂,A₂,H₂⟩ := frobenius_trace_count_bound_of_rat_eigensystem_count_even_alt48 hP hL hA hN
  refine ⟨max c₁ c₂,max A₁ A₂,?_⟩
  intro K _ _ e he M hM p h w hp hw hpM
  by_cases hh : h = 2
  · subst h
    obtain ⟨D,hD,HD⟩ := H₂ K e he M hM p w hp hw hpM
    exact ⟨D,hD.trans (Nat.mul_le_mul (le_max_right _ _) (Nat.pow_le_pow_right (Nat.mul_pos hM (Nat.succ_pos e)) (le_max_right _ _))),HD⟩
  · obtain ⟨D,hD,HD⟩ := H₁ K e he M hM p h w hp hw hpM
    exact ⟨D,hD.trans (Nat.mul_le_mul (le_max_left _ _) (Nat.pow_le_pow_right (Nat.mul_pos hM (Nat.succ_pos e)) (le_max_left _ _))),HD⟩
`;
let out=sub(src,q,q+"\n"+helper+"\n"+nq);out=sub(out,rat,rat+"\n"+nr+"\n"+mixed);
let keep2=sub(keep,"_root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countQ_alt hP hLP hA) hN","_root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_mixed48 hP hLP hA hN");
ck(out.includes(q)&&out.includes(rat),"fallback preserved");ck(!nq.includes("rootSum"),"even route no rootSum");ck(nq.includes("resTwo")&&nq.includes("twCard")&&nq.includes("frobenius_power_compatibility"),"witnesses retained");ck(nr.includes("block_conjugate_rank_three_rep")&&nr.includes("frobenius_pow_resDeg_place_norm"),"rank-three transfer");ck(keep2.includes("frobenius_trace_count_bound_of_rat_eigensystem_count_mixed48"),"real caller splice");
return {out,keep2,checks};
}
if(require.main===module){
 const fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
 const [root,prior,outdir]=process.argv.slice(2);if(!root||!prior||!outdir)throw Error('usage: node script pinned-root prior-file new-output-dir');
 const base="src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/", names=['FrobeniusTraceCountBoundOfCmEigensystemCount.lean','KeepNumU.lean'];
 const files=[...names.map(n=>path.join(root,base,n)),prior],expected=["1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40","a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7","4f4ca000218a341f133231726c665461ccfe75d1"];
 const contents=files.map((p,i)=>{const b=fs.readFileSync(p);const h=crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(h!==expected[i])throw Error('blob mismatch '+p+' '+h);return b.toString('utf8')});
 const z=build(...contents);
 if(fs.existsSync(outdir))throw Error('output dir must not exist');
 fs.mkdirSync(path.join(outdir,base),{recursive:true});
 const audit='\n#print axioms UpperTheory.GalN.V.Win.N.countQ_even_alt48\n#print axioms UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_even_alt48\n#print axioms UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_mixed48\n';
 fs.writeFileSync(path.join(outdir,base,names[0]),z.out+audit);
 fs.writeFileSync(path.join(outdir,base,names[1]),z.keep2+'\n#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_adm2A_imp_adm2B\n');
 console.log(JSON.stringify({checks:z.checks,status:'PREPARED_NOT_COMPILED'}));
}
