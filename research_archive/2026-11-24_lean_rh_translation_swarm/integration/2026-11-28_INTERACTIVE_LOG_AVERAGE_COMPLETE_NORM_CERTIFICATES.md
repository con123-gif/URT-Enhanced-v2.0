# Complete finite full-norm enclosures for expanding logarithmic witnesses

Continuation of c76cecf61d1fb3f0d544f3264010871c0be4f789 (exact source retrieved), and its dual large-sieve tail theorem. This closes the previously unevaluated band between 4N and N^(3/2) for THREE finite cutoffs only, by actual C++ integer-enclosed arithmetic and exact Python rational comparisons. It does not prove asymptotic middle-band convergence or RH. No worker/schedule changes, Lean replay, claim of novelty, or additional zero-free region. This is numerical certification with a proved analytic tail bound, not an independent proof of density.

## Method and exact arithmetic bounds
Select the logarithmically averaged and two-block-centered coefficients as in c76cecf, using long double only to choose the witness. Round the selected coefficients to v_n/S with S=2^44. These rational coefficients define the actual witness being certified; after rounding the exact mean and weighted sum need not equal 0 and -1 respectively. The analytic large-sieve tail bound holds for arbitrary coefficients and the following calculation includes the actual mean enclosure.

Let z_n=trunc(v_n/n), A=sum z_n, R_j=S+j*A-sum v_n floor(j/n). The true scaled residual differs from R_j by at most jN. Calculate divisor sums by prime-by-prime zeta transform, then cumulative increments A-sum_(n|j)v_n. Put S0=2^24, T=S/S0, rq_j=trunc(R_j/T), E_j=ceil(jN/T)+1. The true S0-scaled residual lies within E_j of rq_j. Thus directed floor/ceiling at scale K=2^44 of max(0,|rq|-E)^2/(S0^2*j*(j+1)) and (|rq|+E)^2/(S0^2*j*(j+1)) give exact rational lower and upper sums through L=N^(3/2).

Compute exact Jordan totients J2. Apply reverse divisibility transform to z; then
 12 S^2 Q <= qnum = 3 (|2S+sum v_n-A|+N)^2 + sum_(d>=2) J2(d)(|sum_(d|n)z_n|+floor(N/d))^2.
The full infinite tail is bounded by qnum/(12 S^2) times [1/(L+1)+N^2/((L+1)(L+2))]. This includes the mean term, so no assumption of exact centering after rounding is needed. Each coefficient and transformed divisor sum fits signed 64-bit by the absolute coefficient-sum guard B; the cumulative R_j is bounded by S+B+jN by comparison with the true residual 1+sum c_n b_n(j). The code guards the relevant fixed-width operations; 128-bit term numerator products and Jordan-energy sums are explicitly checked. The partial term sums cannot overflow 128 bits, since each numerator is guarded below 2^128, each denominator >=2^49 and L<=2^27 in this run.

## Actual execution, 28 November 2026
g++ -O3 -std=c++17, local container. The code below was executed. Raw integer output fields N,L,partial_lower_numerator,partial_upper_numerator,qnum,lower/upper j<=N,lower/upper N<j<=4N,lower/upper 4N<j<=L,guard:
16384,2097152,148480303671,148484132545,79743362506091285995112049267,122085139305,122085691314,20743073900,20743481739,5652090466,5654959492,GUARDS_PASS
65536,16777216,132759184273,132789280736,246321435154766319495240946592,114534087832,114537969411,13370464086,13373087863,4854632355,4878223462,GUARDS_PASS
262144,134217728,117896057173,118128454314,781896536672762860560507629967,98021232146,98047293805,16451154376,16472026114,3423670651,3609134395,GUARDS_PASS

Decimal reports (not themselves the exact fractions):
N, lower full norm, upper full norm, upper far tail, lower/upper previously unmeasured gap
16384,0.008440128094150623,0.00976113297636446,0.0013207872359252896,0.00032128414579801756,0.0003214472310446581
65536,0.007546485919249335,0.008564198538669634,0.0010160018335677614,0.00027595390037049583,0.00027729489954708697
262144,0.006701614959922608,0.0075195287213305545,0.0008047035133800292,0.00019461314485624825,0.00020515553813993392

Exact Python Fraction comparisons passed: largest-cutoff full norm upper < 0.00752, below both smaller-cutoff lower bounds. Certified relative improvements >=0.10907409965 against N=16384 and >=0.0035721524 against N=65536 (decimal reports). The middle versus small pair is NOT certified as a strict improvement: their enclosures overlap. The three interval sums agree exactly with the total directed sums. No monotonicity claim. Largest test evaluates every j through 134,217,728; observed runtime 5.57 seconds, peak memory 1,078,272 KB on this execution. The evaluation is O(L log log L) arithmetic operations and O(L) space, L=N^(3/2); the witness construction is O(N), not the complete certificate. No exact bit-complexity claim.

## Executed C++ source
SHA256 0c4e50d05b1b2f0906e96243098b2fc547420d7084df981b3d7dabbcfd752ee6 on local file /tmp/rh_log_full_cert.cpp. Compile and run for the three N above. Rounded coefficient choices may depend on long-double library details; the certificate encloses the actual selected rational vector and does not claim exact optimality.

```cpp
#include <bits/stdc++.h>
using namespace std;using i64=int64_t;using u64=uint64_t;using i128=__int128_t;using u128=__uint128_t;
constexpr i64 S=1LL<<44,S0=1LL<<24,T=S/S0;constexpr u64 K=1ULL<<44;
const u128 MAXU=~u128(0);
u128 mul(u128 a,u128 b){if(a && b>MAXU/a)abort();return a*b;}
u128 plusu(u128 a,u128 b){if(b>MAXU-a)abort();return a+b;}
u128 ab(i128 a){return a<0?u128(-a):u128(a);}
string str(u128 a){if(!a)return "0";string x;while(a){x+=char('0'+a%10);a/=10;}reverse(x.begin(),x.end());return x;}
int main(int argc,char**argv){int N=atoi(argv[1]);int root=sqrt(N);assert(root*root==N);int L=N*root;int k0=root;long double Z=logl((N+1.L)/k0);
vector<int8_t> mu(N+1);vector<int> lp(N+1),ps;mu[1]=1;for(int n=2;n<=N;n++){if(!lp[n]){lp[n]=n;ps.push_back(n);mu[n]=-1;}for(int p:ps){i64 j=i64(n)*p;if(j>N)break;lp[j]=p;if(n%p==0){mu[j]=0;break;}mu[j]=-mu[n];}}
vector<long double> c(N+1);long double m=0,err=0,A0=0,C0=0;for(int n=1;n<=N;n++){long double y=(long double)mu[n]/n-err,t=m+y;err=(t-m)-y;m=t;if(n==1)continue;long double w=n>=k0?log1pl(1.L/n)/Z:0;long double W=logl((N+1.L)/max(k0,n))/Z;c[n]=mu[n]*W-n*m*w;A0+=c[n]/n;C0+=c[n];}
int l=N/2+1,h=3*N/4;long double ha=0,hb=0;for(int n=l;n<=h;n++)ha+=1.L/n;for(int n=h+1;n<=N;n++)hb+=1.L/n;long double R=1+(C0-A0)/2,u=-2*R/(h-l+1-(N-h)*ha/hb),v=-u*ha/hb;
vector<i64> coeff(N+1),z(N+1);i128 B=0,AA=0,C=0;for(int n=2;n<=N;n++){if(n>=l)c[n]+=n<=h?u:v;assert(fabsl(c[n])*S<1e18L);coeff[n]=llroundl(c[n]*S);z[n]=coeff[n]/n;B+=ab(coeff[n]);AA+=z[n];C+=coeff[n];}assert(B+i128(ab(AA))+S<INT64_MAX);assert(B+2*S+i128(L)*N<INT64_MAX);i64 A=AA;
vector<u64> J2(N+1);for(int n=1;n<=N;n++)J2[n]=u64(n)*n;for(int p:ps)for(int j=p;j<=N;j+=p)J2[j]=J2[j]/(u64(p)*p)*(u64(p)*p-1);
for(int p:ps)for(int j=N/p;j>=1;j--)z[j]+=z[p*j];
u128 mean=ab(2*i128(S)+C-AA)+N,qnum=mul(3,mul(mean,mean));for(int d=2;d<=N;d++){u128 v=ab(z[d])+N/d;qnum=plusu(qnum,mul(J2[d],mul(v,v)));}
vector<bool> composite(L+1);vector<i64> a(L+1);copy(coeff.begin(),coeff.end(),a.begin());for(int p=2;p<=L;p++)if(!composite[p]){if(i64(p)*p<=L)for(i64 j=i64(p)*p;j<=L;j+=p)composite[j]=true;for(int j=p;j<=L;j+=p)a[j]+=a[j/p];}
i64 acc=S;u128 low=0,high=0;array<u128,3> blo{},bhi{};for(int j=1;j<=L;j++){acc+=A-a[j];i64 rq=acc/T;u64 E=(u64(j)*N+T-1)/T+1;u128 ar=ab(rq),lo=ar>E?ar-E:0,hi=ar+E;u128 den=u128(S0)*S0*j*(u64(j)+1);u128 x=mul(K,mul(lo,lo)),y=mul(K,mul(hi,hi));u128 ll=x/den,hh=y/den+(y%den!=0);low+=ll;high+=hh;int b=j<=N?0:j<=4*N?1:2;blo[b]+=ll;bhi[b]+=hh;}
cout<<N<<","<<L<<","<<str(low)<<","<<str(high)<<","<<str(qnum)<<","<<str(blo[0])<<","<<str(bhi[0])<<","<<str(blo[1])<<","<<str(bhi[1])<<","<<str(blo[2])<<","<<str(bhi[2])<<",GUARDS_PASS\n";
}
```

## Remaining proof obligation
The earlier unconditional far-tail theorem remains valid for the exact log-average-centered family. These new finite certificates include the intermediate range and give rigorous full-norm comparisons for selected rounded witnesses. They DO NOT establish a uniform asymptotic middle-band estimate. Further numerical enlargement cannot by itself prove RH. No all-scale cancellation theorem was obtained in this turn; do not present finite decreasing norms as convergence, or this computation as linear-time in the coefficient cutoff.