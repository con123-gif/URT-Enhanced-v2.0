// Exact integer cross-multiplication checks for the RUN26 human adapter.
// These are scalar regression cases, NOT a prime bound or a Lean test.
import assert from 'node:assert/strict';
let n=0, bad=0;
for(let c=0n;c<=12n;c++) for(let d=1n;d<=11n;d++)
for(let e=1n;e<=9n;e++) for(let k=0n;k<=7n;k++){
  // C=c/3, delta=d/5, eta=e/7, U=4*C*delta/eta^2+k
  let den=15n*e*e, num=196n*c*d+k*den;
  assert(196n*c*d*num*den<=15n*e*e*num*num);
  n++;
  if(c>0n && k===0n){
    // Half the required threshold need not satisfy the quadratic bound.
    let d2=2n*den;
    assert(196n*c*d*num*d2>15n*e*e*num*num);
    bad++;
  }
}
let affine=0;
for(let b=1n;b<=40n;b++) for(let a=1n;a<=80n;a++) if(2n*a>b){
  // eps=min((a/b-1/2)/2,1/4) = min(2a-b,b)/(4b)
  let q=2n*a-b, en=q<b?q:b;
  assert(en>0n && en<2n*b);
  // 2*(a/b)-1 = q/b > 2eps=en/(2b), strictly.
  assert(2n*q>en);
  affine++;
}
console.log({quadraticCases:n,halfThresholdControls:bad,affineCases:affine});
