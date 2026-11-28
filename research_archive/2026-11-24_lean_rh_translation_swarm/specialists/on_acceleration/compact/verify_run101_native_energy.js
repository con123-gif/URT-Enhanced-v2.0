#!/usr/bin/env node
// Exact finite identities only; does not test B3 arithmetic or RH.
const P=[[[1n,2n],[2n,-1n],[0n,1n]],[[3n,0n],[-1n,2n],[2n,1n]]];
const perms=[[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]];
const plus=(a,b)=>[a[0]+b[0],a[1]+b[1]],mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],conj=a=>[a[0],-a[1]],sq=a=>a[0]**2n+a[1]**2n;
const sum=xs=>xs.reduce(plus,[0n,0n]),inner=(a,b)=>sum(a.map((x,i)=>mul(conj(x),b[i])));
const rep=(g,v)=>g.map((_,i)=>v[g.indexOf(i)]),inv=g=>g.map((_,i)=>g.indexOf(i)),prod=(g,h)=>h.map(i=>g[i]);
const dyad=g=>[0,1,2].flatMap(i=>[0,1,2].map(j=>sum(P.map(v=>{const w=rep(g,v);return mul(conj(w[i]),w[j])}))));
const energy=g=>P.reduce((s,v)=>s+P.reduce((t,w)=>t+sq(inner(v,rep(g,w))),0n),0n);
let pairs=0,subsets=0,reserves=0;
for(const g of perms)for(const h of perms){const a=inner(dyad(g),dyad(h));if(a[1]!==0n||a[0]!==energy(prod(inv(g),h)))throw Error("dyad identity");pairs++}
for(let mask=0;mask<64;mask++){const l=perms.filter((_,i)=>mask>>i&1).reduce((a,g)=>a+energy(g),0n);let r=0n;for(const v of P)for(const w of P)for(let i=0;i<6;i++)if(mask>>i&1)r+=sq(inner(v,rep(perms[i],w)));if(l!==r)throw Error("energy additivity");subsets++}
for(let e=0n;e<50n;e++)for(let a=0n;a<50n;a++)for(let eta=0n;eta<150n;eta++)if(2n*(5n*e+a)<=eta){if(9n*e>2n*(eta-5n*e-a))throw Error("reserve");reserves++}
if(energy(perms[0])===0n||energy(perms[0])*4n===energy(perms[0]))throw Error("normalization control");
if(pairs!==36||subsets!==64||reserves!==30150)throw Error("coverage");
console.log({pairs,subsets,reserves,negative_control:"omitting factor 4 in nonzero c*nu normalization changes energy"});
