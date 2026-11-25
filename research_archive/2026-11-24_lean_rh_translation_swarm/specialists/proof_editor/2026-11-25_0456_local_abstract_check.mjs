// Exact finite algebra regression, not Lean replay or analytic proof.
function certificate(){
 const out={sphere:0,disc:0,derivative:0,cauchy:0,controls:0};const ck=(p,k)=>{if(!p)throw Error(k);out[k]++};const sq=x=>x*x;
 for(let R=2n;R<=12n;R++)for(let Q=1n;Q<R;Q++)for(let a=-Q;a<=Q;a++)for(let b=-Q;b<=Q;b++){
  if(sq(a)+sq(b)>sq(Q))continue;
  for(let x=-R;x<=R;x++)for(let y=-R;y<=R;y++){
   const w=sq(x)+sq(y);if(w>sq(R))continue;
   const A=R*R-a*x-b*y,B=b*x-a*y,nn=sq(A)+sq(B);
   if(w===sq(R))ck(nn===sq(R)*(sq(x-a)+sq(y-b)),"sphere");
   ck(nn>=sq(R)*sq(R-Q),"disc");
   ck((sq(a)+sq(b))*sq(R)*sq(R-Q)<=sq(Q)*nn,"derivative");
  }
 }
 for(let R=2n;R<=100n;R++)for(let r=1n;r<R;r++){let P=R+r,D=R-r;ck(P>0n&&D>0n&&2n*P*2n===4n*(R+r),"cauchy");}
 ck(4n-2n*2n===0n,"controls");ck(2n!==1n,"controls");return out;
}
console.log(JSON.stringify(certificate()));
