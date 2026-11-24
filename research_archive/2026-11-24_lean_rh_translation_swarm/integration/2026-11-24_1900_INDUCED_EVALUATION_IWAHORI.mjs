import {execFileSync} from "node:child_process";
import {createHash} from "node:crypto";
function certificate(){
 const count={matrixCases:0,pivots:0,factorizations:0,groupCases:0,groupEquivariance:0,groupSmoothness:0,negative:0};const ck=(x,m)=>{if(!x)throw Error(m)};
 function runMat(p,m,k,n,exhaustive){
  const q=p**k,step=p**m,mod=x=>((x%q)+q)%q;
  const I=Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>+(i===j))),zero=I.map(r=>r.map(()=>0));
  const add=(a,b,s=1)=>a.map((r,i)=>r.map((x,j)=>mod(x+s*b[i][j]))),mul=(a,b)=>a.map((r,i)=>r.map((_,j)=>mod(r.reduce((v,x,t)=>v+x*b[t][j],0)))),eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
  const congr=a=>a.every((r,i)=>r.every((x,j)=>mod(x-I[i][j])%step===0));
  const inv=a=>{ck(congr(a),"not congruent");let t=add(I,a,-1),s=I,z=I;for(let i=1;i<=k;i++){z=mul(z,t);s=add(s,z)}ck(eq(mul(s,a),I)&&eq(mul(a,s),I),"inverse");return s};
  const iv=x=>{for(let y=0;y<q;y++)if(mod(x*y)===1)return y;throw Error("nonunit pivot")};
  let seed=11;const next=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return (seed>>>16)%(q/step)};
  for(let t=0;t<(exhaustive?(q/step)**(n*n):120);t++){
   let v=t;const A=I.map(r=>r.map(x=>{let a=exhaustive?v%(q/step):next();v=Math.floor(v/(q/step));return mod(x+step*a)}));
   for(let b=0;b<3**n;b++){
    let d=b,beta=Array.from({length:n},()=>{let x=d%3;d=Math.floor(d/3);return x}),ord=Array.from({length:n},(_,i)=>i).sort((i,j)=>beta[i]-beta[j]||i-j);
    const upper=a=>a.every((r,i)=>r.every((x,j)=>beta[i]<=beta[j]||x===0)),lower=a=>a.every((r,i)=>r.every((x,j)=>beta[i]>=beta[j]||x===0)),diag=a=>upper(a)&&lower(a);
    const unip=(a,up)=>(up?upper(a):lower(a))&&a.every((r,i)=>r.every((x,j)=>beta[i]!==beta[j]||x===I[i][j])),lev=a=>a.map((r,i)=>r.map((x,j)=>beta[i]===beta[j]?x:0));
    function fact(g){
     let h=g,Q=I;
     for(let z=0;z<n;z++){let a=ord[z],E=zero.map(r=>r.slice());for(let t=z+1;t<n;t++){let i=ord[t];E[i][a]=mod(h[i][a]*iv(h[a][a]))}
      ck(eq(mul(E,E),zero),"square-zero");const L=add(I,E,-1);ck(eq(mul(L,add(I,E)),I),"inverse");Q=mul(L,Q);h=mul(L,h);ck(congr(Q)&&congr(h)&&lower(Q),"K and opposite");
      for(let j=0;j<=z;j++)for(let i=j+1;i<n;i++)ck(h[ord[i]][ord[j]]===0,"prior columns");count.pivots++;}
     ck(upper(h)&&eq(h,mul(Q,g)),"triangularize");let P=inv(Q),M1=lev(P),M2=lev(h),Z=mul(P,inv(M1)),Y=mul(M1,M2),X=mul(inv(M2),h);
     ck(unip(Z,false)&&diag(Y)&&unip(X,true)&&[Z,Y,X].every(congr),"factor types");ck(eq(mul(mul(Z,Y),X),g),"ZYX");count.factorizations++;return [Z,Y,X];
    }
    fact(A);const [Z,Y,X]=fact(inv(A));ck(eq(mul(mul(inv(X),inv(Y)),inv(Z)),A),"XYZ from inverse");count.factorizations++;count.matrixCases++;
   }
  }
 }
 runMat(2,1,2,2,true);runMat(3,1,2,2,true);runMat(2,1,2,3,true);runMat(2,1,3,3,false);runMat(2,2,4,2,true);
 const G=[[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]],key=a=>a.join(","),mul=(a,b)=>b.map(x=>a[x]),sign=a=>((a[0]>a[1])+(a[0]>a[2])+(a[1]>a[2]))%2?-1:1;
 const groups=[];for(let mask=1;mask<64;mask+=2){let H=G.filter((_,i)=>mask&(1<<i)),S=new Set(H.map(key));if(H.every(a=>H.every(b=>S.has(key(mul(a,b))))))groups.push(H)}
 for(const P of groups)for(const K of groups)for(const mode of [0,1]){const chi=a=>mode?sign(a):1,ks=new Set(K.map(key));if(P.some(a=>ks.has(key(a))&&chi(a)!==1))continue;const values=new Map();
  for(const a of P)for(const b of K){let g=key(mul(a,b)),v=chi(a);ck(!values.has(g)||values.get(g)===v,"well-defined");values.set(g,v)}
  const F=g=>values.get(key(g))??0;ck(F(G[0])===1,"evaluation");
  for(const a of P)for(const g of G){ck(F(mul(a,g))===chi(a)*F(g),"left covariance");count.groupEquivariance++}
  for(const b of K)for(const g of G){ck(F(mul(g,b))===F(g),"right fixed");count.groupSmoothness++}count.groupCases++;
 }
 ck(sign(G[1])===-1,"bad intersection witness");count.negative++;ck(key(mul(G[1],G[2]))!==key(mul(G[2],G[1])),"noncommuting order");count.negative++;ck([[0,1],[1,0]][0][0]===0,"level-zero pivot");count.negative++;return count;
}
const ledger=[
  {
    "path": "src/GroundTheory/AutomorphicForms/IwahoriFactorization.lean",
    "blob": "7b63eb58c228ab2851279433bb608180269619d1",
    "anchors": [
      "def elimKey",
      "def elimCol",
      "theorem elimCol_mul_elimCol",
      "theorem elimCol_mul_apply",
      "def elimGL",
      "theorem elimGL_mem_blockUpper_dual",
      "theorem exists_mul_mem_blockUpper",
      "induction s using Finset.induction_on_max_value",
      "div_mul_cancel₀",
      "hz j hjs a hja",
      "theorem iwahoriFactorization_of_elim",
      "(hlevi",
      "(hlevi'",
      "set m₁",
      "set m₂",
      "refine ⟨p *",
      "conj_mem_unipotentRadical",
      "theorem mem_congruenceSubgroup_of_le",
      "theorem diag_ne_zero_of_mem_congruenceSubgroup",
      "theorem valuation_elimCol_le",
      "theorem elimGL_mem_congruenceSubgroup",
      "theorem leviProj_mem_congruenceSubgroup",
      "theorem congruenceSubgroup_iwahoriFactorization",
      "theorem iwahoriFactorization_symm",
      "theorem congruenceSubgroup_iwahoriFactorization'"
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsIrreducibleSecondFactorOfIrreducibleProduct.lean",
    "blob": "486fdd6e3b310f838b3ead5aa9509c71e47ace25",
    "anchors": [
      "theorem exists_mem_ind_apply_one",
      "theorem continuous_leviProj",
      "theorem exists_openSubgroup_GL",
      "theorem exists_indSp_apply_one",
      "∃ f : IndSp",
      "exists_mem_ind_apply_one exists_openSubgroup_GL",
      "isSmooth_comp (isSmooth_twist",
      "exact ⟨f, h1",
      "c' * c⁻¹",
      "mem_smoothPart_of_nhds",
      "hF0 _ hx",
      "GlobalTheory.CentralExponent.exists_cong_subset"
    ]
  }
],pin="40e56bab026552e089d7afcfeff08d2defb9c005";
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs PINNED_RH_CHECKOUT");let anchors=0;for(const l of ledger){const b=execFileSync("git",["-C",root,"show",pin+":"+l.path]);const sha=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(sha!==l.blob)throw Error("blob "+l.path);for(const s of l.anchors){if(!b.toString("utf8").includes(s))throw Error(s);anchors++}}console.log(JSON.stringify({anchors,results:certificate()},null,2));
