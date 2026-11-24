function harmonicCertificate(){
 const S=400,add=(a,b)=>[a[0]+b[0],a[1]+b[1]],neg=a=>a.map(x=>-x),scale=(a,n)=>a.map(x=>x*n);
 const A={x:[400,0],sqrtx:[200,0],eps:[0,400],tol:[0,4],delta:[0,-50],nlo:[800,3196],nhi:[800,3204],mlo:[200,-29],mhi:[200,-21],klo:[1800,3996],khi:[1800,4004],La:[0,404]};
 const mul=(...vs)=>vs.reduce(add,[0,0]),div=(a,b)=>add(a,neg(b)),checks=[];
 function compare(id,left,right,coeff,assumption){
  const gap=div(right,left);
  // affine difference over 0<eps<1/52: both endpoints nonnegative,
  // and strictly positive in the interior for eventual constant absorption.
  if(gap[0]<0||52*gap[0]+gap[1]<0||gap[0]===0&&gap[1]===0)throw Error("no strictly positive gap "+id);
  checks.push({id,left,right,gap,coeff,assumption});
 }
 compare("SizeKRel.1",mul(A.tol,scale(A.mhi,5),A.nhi,A.eps,A.eps),A.klo,"2","f=2n");
 compare("SizeKRel.2",mul(scale(A.mhi,5),A.nhi,A.eps),A.klo,"16*max(CGam,0)","CGam fixed/bounded for given family; negative case immediate");
 compare("SizeKRel.5",mul(scale(A.mhi,2),A.eps),A.klo,"1","positive ranks");
 compare("SizeKRel.6",mul(A.mhi,A.sqrtx,A.eps),A.klo,"1","log x<=x^eps eventually");
 compare("SizeKRel.7",mul(A.tol,scale(A.mhi,6),A.eps),A.klo,"1","log k>=1");
 compare("SizeKRel.8",mul(A.tol,scale(A.mhi,3),A.eps,A.eps),A.klo,"2","SizeQD, QS<=fixed C*n; log rdE<=2*x^eps eventually; log k>=1");
 compare("SizeKRel.11",mul(A.tol,A.eps),A.nlo,"1","b=exp(x^eps), log log b=eps log x<=1; correction: use eps log x<=x^eps and an extra eps exponent below");
 // The preceding clause needs two factors x^eps, not one. Reject an omitted log contribution.
 checks.pop();
 compare("SizeKRel.11",mul(A.tol,A.eps,A.eps),A.nlo,"1","b=exp(x^eps), eps log x<=x^eps eventually, r>=1 and log r>=1, f>=n");
 compare("SizeKRel.12",mul(A.tol,A.eps),A.nlo,"1","f>=n, log k>=1");
 const rho1=div(mul(A.nhi,A.delta,A.eps,A.La),A.klo);
 const rho2=div(mul(A.tol,A.eps,A.La),A.klo);
 if(rho1[0]!==-1000||rho1[1]!==-38||rho2[0]!==-1800||rho2[1]!==-3188)throw Error("rho");
 const sumExp=[Math.max(rho1[0],rho2[0]),Math.max(rho1[1],rho2[1])];
 // Exact monomial factorization after x=phi^s, y=x^(-eps/400).
 const terms=[{c:2,e:[200,29]},{c:2,e:[0,0]},{c:4,e:[200,429]},{c:2,e:[200,-1538]}],peak=[200,429];
 const residual=terms.map(t=>({c:t.c,e:div(t.e,peak)}));
 if(residual.some(t=>t.e[0]>0||t.e[1]>0))throw Error("invalid residual");
 let rejects=0;for(const v of [[-1,0],[0,-1],[1,-53],[0,0]])try{compare("bad",[0,0],v,"1","negative control")}catch(e){rejects++}
 if(rejects!==4)throw Error("negative controls");
 // Exact integer-grid replay of all exponent comparisons; no float tolerances.
 let replay=0;
 for(let d=53;d<=1000;d+=7)for(let p=1;p*52<d;p++)for(const z of checks){
  const q=BigInt(z.gap[0])*BigInt(d)+BigInt(z.gap[1])*BigInt(p);
  if(q<=0n)throw Error("grid comparison");replay++;
 }
 return {lattice:S,checks,rho:{terms:[{c:8,e:rho1},{c:1,e:rho2}],envelope:{c:9,e:sumExp},absorption:"x>=81 implies 9*x^(-5/2)<=x^(-2)"},normalized:{terms,peak,residual},negativeControls:rejects,exactGridReplays:replay};
}
console.log(JSON.stringify(harmonicCertificate(),null,2));
