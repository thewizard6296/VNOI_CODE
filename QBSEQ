#include<algorithm>
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define MP(a, b) make_pair(a, b)
using namespace std;
const int DBG = 0;
const int HOME = 0;
const int MAXN = 1010;
const int INF = 1000000001;
 
int n, k;
int a[MAXN], f[2][50];
 
 
int main(){
   if(HOME){
      freopen("QBSEQ.inp", "r", stdin);
      freopen("QBSEQ.out", "w", stdout);
   }
 
   scanf("%d %d", &n, &k);
   FOR(i, 0, n) scanf("%d", a+i);
 
   memset(f, 0, sizeof f);
   int last = 0, next = 1;
   f[next][0] = 1;
   FOR(i, 0, n){
      swap(next, last);
      FOR(r, 0, k) f[next][r] = f[last][r];
      FOR(r, 0, k) if(f[last][r])
         f[next][(r+a[i]) % k] >?= f[last][r]+1;
   }
 
   printf("%d\n", f[next][0]-1);
   return 0;
}
