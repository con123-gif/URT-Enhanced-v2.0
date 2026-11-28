# O(N) golden feedback — integer-enclosed finite-range certificate

28 November 2026. Continuation of c336f70dd7fd2e782fd39a58e5488d584ccccbdb and 47811129d634a258768f176f65de63fb6a2f5edd. User specifically requests O(N) reduction at the relaxed feedback stage. Applied Euler linear sieve, shared prefix and exact merge, not the original URT dynamical kernel. The result is a finite-range deterministic arithmetic certificate, NOT an all-scale estimate or RH proof. No worker/schedule changes.

Let m(x)=sum_{n<=x} mu(n)/n, q(x)=phi*m(phi*x)-m(x), E(x)=x*q(x)^2. The two jump streams are the positive integers n and l/phi. Their order is exact: n<l/phi iff l^2-ln-n^2>0. No floating point decisions about event ordering are necessary.

Let S=2^50 and P=1821744317201705. The two integer quadratic tests prove P/S<phi<(P+1)/S. Compute T_j=sum_{n<=j}mu(n) floor(S/n) by one prefix pass. Then |S*m(j)-T_j|<=j. At a state (n,l), let Q=trunc(P*T_l/S)-T_n. The integer guard |T_l|<=24*S and phi<2 imply
 |S*q-Q|<=n+2*l+25.
Thus |S*q| is between max(0,|Q|-rad) and |Q|+rad with rad=n+2*l+25. For an event time bracketed by integers a<=t<=b, its E is between a*max(0,|Q|-rad)^2/S^2 and b*(|Q|+rad)^2/S^2. Check both pre/post jump states, including each integer endpoint; between events E increases linearly (q constant), so these enclose the whole interval. At l/phi use the current integer n and n+1 as the time bracket. At integer events both time bounds are exact. Bounds on pre-jump values also bound the supremum from below. All threshold decisions in the code are integer comparisons; printed decimals are approximate reports only. Signed 64-bit prefix accumulation cannot overflow for this N, by sum 1/n<=1+log N<20, and the 128-bit multiplication guard checks upper square times time before multiplying.

Actual executed g++ -O3 -std=c++17, local container. N=27,147,000, 1,691,692 primes, 43,923,154 events, 18 dyadic blocks X=64,...,8388608. All integer guards passed, including E<=3/4 and maximum excursion from each block's starting value <=3/4 throughout [64,16777216]. Runtime 1.03 seconds and peak RSS 246832 KB on this execution. Approximate selected lower/upper enclosures for block supremum:
X,max_lower,max_upper
64,.404064501456,.407323086159
4096,.292865675754,.292865679627
32768,.710712287082,.710712400150
262144,.237631079329,.237633385887
1048576,.380661393414,.380678586966
4194304,.613955049163,.614063695725
8388608,.452152558564,.452416581191

For the exact jump law A+C=E(Y)-E(X)-J, J>=0, the same finite check proves A+C<=3/4 for all prefixes of the 18 tested blocks. This follows from the certified energy bound, not an independent bound on the signed cross correlation. The strongest previously proposed constant feedback target is more than RH requires; the preferred all-scale target remains an upper O_epsilon(X^epsilon) bound for all dyadic prefixes. This calculation neither proves that estimate outside the finite range nor establishes any zero-free region. No monotonicity or extrapolation claimed.

Reproducible executed core:
```cpp
#include <bits/stdc++.h>
using namespace std; using i128=__int128_t; using u128=__uint128_t; using i64=int64_t;
constexpr i64 S=1LL<<50;
constexpr i64 P=1821744317201705LL;
static bool before(int n,int l) {
 return (i64)l*l-(i64)l*n-(i64)n*n>0;
}
long double val(u128 x){return (long double)x/((long double)S*S);}
int main(){
 if(!((i128)P*P-(i128)P*S-(i128)S*S<0 && (i128)(P+1)*(P+1)-(i128)(P+1)*S-(i128)S*S>0))return 1;
 const int kmax=23, Xmax=1<<kmax, N=27147000;
 if(!before(2*Xmax,N))return 2;
 vector<int8_t> mu(N+1); vector<int> lp(N+1), primes; mu[1]=1;
 for(int i=2;i<=N;i++){if(!lp[i]){lp[i]=i;primes.push_back(i);mu[i]=-1;}for(int p:primes){i64 j=(i64)i*p;if(j>N)break;lp[j]=p;if(i%p==0){mu[j]=0;break;}mu[j]=-mu[i];}}
 vector<int>().swap(lp); vector<i64> pref(N+1);for(int i=1;i<=N;i++) pref[i]=pref[i-1]+mu[i]*(S/i);
 auto bounds=[&](int n,int l,int tlo,int thi){
 if(n<0||l<0||n>N||l>N||llabs(pref[l])>24*S)abort();
 i64 q=(i64)((i128)P*pref[l]/S)-pref[n]; i64 rad=(i64)n+2LL*l+25; i64 ab=llabs(q);
 i64 lo=max(0LL,(long long)(ab-rad)),hi=ab+rad;
 if ((u128)hi*hi > (~(u128)0)/thi) abort();
 return pair<u128,u128>((u128)lo*lo*tlo,(u128)hi*hi*thi);};
 cout<<setprecision(12);
 i64 all_events=0; for(int k=6;k<=kmax;k++){
 int X=1<<k, end=2*X,n=X,l=(int)((i128)P*X/S);
 while(!before(X,l+1))++l;while(before(X,l))--l;
 auto st=bounds(n,l,X,X); u128 maxlo=st.first,maxhi=st.second; i64 events=0;
 auto collect=[&](int tlo,int thi){auto e=bounds(n,l,tlo,thi);maxlo=max(maxlo,e.first);maxhi=max(maxhi,e.second);};
 while(n<end){if(before(n+1,l+1)){collect(n+1,n+1);++n;collect(n,n);++events;}
 else{collect(n,n+1);++l;collect(n,n+1);++events;}}
 auto en=bounds(n,l,end,end);
 if(maxhi>((u128)S*S*3)/4 || maxhi-st.first>((u128)S*S*3)/4)abort();
 all_events+=events;
 cout<<X<<","<<val(maxlo)<<","<<val(maxhi)<<","<<val(st.first)<<","<<val(st.second)<<","<<val(en.first)<<","<<val(en.second)<<","<<val(maxhi)-val(st.first)<<","<<events<<"\n";
 }
 cout<<"INTEGER_GUARDS_PASS intervals 18 events "<<all_events<<"\n";
}
```

Euler sieve, prefix computation and merged event scan each O(N) in bounded word arithmetic; O(N) storage. For arbitrarily large N precision and integer widths must be increased; no uniform bit-complexity or RH proof follows. Next genuine mathematical task: obtain independent signed feedback estimate, not more finite-range evidence.