# A401895 — exact exclusion through 660 digits and campaign reconciliation

27 November 2026, hourly 16:24 UTC session. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. This is a finite mathematical certificate, not a proof of the infinite conjecture or a Lean-verified submission.

## Improvement
Round 10 established the two-ended carry recursion; Round 13 proved that the independent-prefix test admits an infinite branch. The pending reduction PR7177, author @physbuzz, strengthens the admissible sixes lengths to ell mod 297 in {0,66,165,264} using modulus 81. Its kernel accepted, but actual PR metadata is still open and the verdict reports a GitHub 403 merge failure. Credit to @physbuzz for that restriction. We use it as a mathematically explicit necessary condition, not as a merged theorem.

We optimized the exact disjoint-pair enumeration: orient the endpoints so units digit a=7 and leading digit b=8 (reversal is involutive). At depth t, the next coefficient is s=c+8x+7y, where c=sum_{i=1}^{t-1} A_i B_{t-i}. Given x, the next low carry forces y=3(6-u-c-8x) mod 10, because 3*7=1 mod10. Thus there are only 10 possible transitions rather than 100. Retain nonnegative integer carries u'=(s+u-6)/10 and v'=6+10v-s satisfying the proven Round10 high-side bound v'<=9(t+1)+10. Enumerate with depth-first search and disjoint outer digit pairs, using O(ell) storage.

For an even length 2t the pair prefix already specifies the entire word; for odd length 2t+1 try all 10 centre digits. The remaining coefficients c_j for t<=j<=ell-1 can then be calculated exactly, using c_j=c_(2ell-2-j). The low and high carries must agree at the central coefficient: c_(ell-1)+u=6+10v. Together with all previous paired transitions this is equivalent to all output digits being six, including the final carry 6. No floating point, probabilistic pruning or extrapolation. The first two candidate counts reproduce Round10 exactly.

Executed C++17 twice through 660 digits (second execution additionally checked direct arbitrary-precision integer products on the first 128 complete candidates at each admissible length). All complete candidates failed. Counts:

| Factor digits | Complete candidate words | Passed first additional paired carry | Solutions |
|---:|---:|---:|---:|
|66|547|71|0|
|165|104550|9343|0|
|264|46123|4559|0|
|297|622140|57159|0|
|363|1537780|146293|0|
|462|377678|36254|0|
|561|7056990|661092|0|
|594|834599|79295|0|
|660|1416481|138795|0|

Total 11,996,888 complete candidates, 11,891,791 at newly checked admissible lengths, 1,152 independent direct multiplication checks. The next admissible length is 759. An attempted run to 990 timed out without a certified endpoint; no inference from it. This replaces a naive exhaustive scan by a bounded exact recursive enumeration; it does not establish any asymptotic complexity or prove the infinite claim. No special URT advantage demonstrated.

## Reproducible certificate (executed with g++ -O3 -std=c++17; run with argument 660)
```cpp
#include <array>
#include <vector>
#include <iostream>
#include <cstdlib>
#include <cstdint>
#include <boost/multiprecision/cpp_int.hpp>
#include <cassert>
using boost::multiprecision::cpp_int;
using namespace std;
constexpr int MAX=1000;
int A[MAX],B[MAX],W[MAX],R[MAX];
uint64_t nodes[MAX]={}, tried[MAX]={}, first[MAX]={}, survivors[MAX]={};
int limit;
bool permitted(int l){int r=l%297;return r==0||r==66||r==165||r==264;}
void finish(int t,int u,int v,int mid){
 int ell=2*t+(mid>=0); ++tried[ell];
 for(int i=0;i<t;i++){W[i]=A[i];W[ell-1-i]=B[i];}
 if(mid>=0)W[t]=mid;
 for(int i=0;i<ell;i++)R[i]=W[ell-1-i];
 if(tried[ell]<=128){cpp_int n=0,r=0,d=0;for(int i=0;i<ell;i++){n=n*10+W[ell-1-i];r=r*10+W[i];}for(int i=0;i<2*ell;i++)d=d*10+6;assert(n*r!=d);}
 for(int j=t;j<ell;j++){
  int c=0;for(int i=0;i<=j;i++)c+=W[i]*R[j-i];
  if(j==ell-1){if(c+u!=6+10*v)return;++survivors[ell];break;}
  if((c+u)%10!=6)return;
  int nv=6+10*v-c;if(nv<0)return;
  if(j==t)++first[ell];
  u=(c+u)/10;v=nv;
 }
 if(survivors[ell]){cerr<<"WITNESS ";for(int i=ell-1;i>=0;i--)cerr<<W[i];cerr<<"\n";exit(2);}
}
void dfs(int t,int u,int v){
 ++nodes[t];
 if(permitted(2*t)&&2*t<=limit)finish(t,u,v,-1);
 if(permitted(2*t+1)&&2*t+1<=limit)for(int m=0;m<10;m++)finish(t,u,v,m);
 if(t>=limit/2)return;
 int c=0;for(int i=1;i<t;i++)c+=A[i]*B[t-i];
 for(int x=0;x<10;x++){
  int y=((3*(6-u-c-8*x))%10+10)%10;
  int s=c+8*x+7*y;
  int nv=6+10*v-s;
  if(nv<0||nv>9*(t+1)+10||s+u<6)continue;
  A[t]=x;B[t]=y;dfs(t+1,(s+u-6)/10,nv);
 }
}
int main(int argc,char**argv){limit=argc>1?atoi(argv[1]):297;if(limit<2||limit>=MAX)return 1;A[0]=7;B[0]=8;dfs(1,5,10);for(int t=1;t<=limit/2;t++)if(t%10==0||t==limit/2)cout<<"depth "<<t<<" nodes "<<nodes[t]<<"\n";for(int l=2;l<=limit;l++)if(permitted(l))cout<<"length "<<l<<" complete candidates "<<tried[l]<<" first additional carry passed "<<first[l]<<" solutions "<<survivors[l]<<"\n";}
```

## Campaign reconciliation
Read latest campaign ledger (15:49 UTC), Round13, upstream join.ts and reference oma.sh. Fresh direct site join.txt/catalogue access failed (DNS and web); no new desk claim or proof PR from this session. Historical workflow job140538181549 confirms note33408 acknowledged and a release-response JSON parser SyntaxError. Fix parsing using an ordinary Python quoted string or heredoc; do not assume that parser failure implies release failure. No token reused.

Direct PR metadata: proofs7724,7815,7817 remain open/unmerged; all three already passed upstream kernel checker per prior ledger. Statement PRs7223 and7625 and reduction7177 explicitly report accepted compilation followed by 403 merge failure. Statement PRs7865,7930,7931,7933 remain open. New independent parallel campaign submissions: MO198816 statement PR8568 (complete disproof), A124869 statement PR8569 and A124870 statement PR8442 (complete proofs). All three currently open. Inspected actual successful workflow jobs and axiom reports:
- MO198816 job140616213958/run46031510476: OMA.disproof uses only propext, Classical.choice, Quot.sound.
- A124869 job140614498460/run46031012204: OMA.solution uses only those three axioms. Do not confuse the unrelated MO298064 draft in the same log, which still uses sorryAx.
- A124870 job140611036825/run46029987618: OMA.solution uses only those three axioms.

At least 12 complete kernel-checked genuine-open candidate problems in campaign (9 previous + 3 new independent parallel results, subject to prior-work audit); 3 full proof PRs and 0 confirmed merged/credited genuine-open solutions from inspected records. Known-prior A390815 and A399155 excluded. The three new statement submissions are not proof submissions and are not credited to this session. The current infrastructure and upstream human review cannot be bypassed. No external note acknowledged in this session. Next: reconcile actual merges, work with current reduction authors and live notes when available, obtain permitted fresh lease before submission; for A401895 seek global digit-overlap or arithmetic constraints rather than extending finite checks indefinitely.
