#include<algorithm>
#include<vector>
using namespace std;
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define PB(a) push_back(a)
#define TR(c, it) for(typeof((c).begin()) it=(c).begin(); it!=(c).end(); it++)
typedef vector<int> VI;
typedef vector<VI> VVI;
typedef pair<int, int> II;
typedef pair<int, II> III;
typedef vector<II> VII;
typedef vector<VII> VVII;

const int DBG = 0;
const int HOME = 0;
const int MAXN = 10010;
const int MAXM = 1010;
const int INF = 1000000001;

int T, n, m;
int f[MAXN][MAXM];
int w[MAXN], v[MAXN];
int sol[MAXN];

int main(){
   if(HOME){
      freopen("HUGEKNAP.inp", "r", stdin);
      freopen("HUGEKNAP.out", "w", stdout);
   }
   scanf("%d", &T);
   while(T--){
      scanf("%d %d", &n, &m);
      FORE(i, 1, n) scanf("%d", &w[i]);
      FORE(i, 1, n) scanf("%d", &v[i]);


      int oo = 1, t;
      f[0][0] = 0;
      FOR(j, 1, m+1) f[0][j] = -1;
      
      FORE(i, 1, n){
         memcpy(&f[i][0], &f[i-1][0], (m+1)*sizeof(int));
         if(DBG) FOR(j, 0, m+1) printf("%d%c", f[i][j], j==m?'\n':' ');
         FOR(j, 0, oo) if(f[i-1][j] >= 0){
            t = j+w[i]; if(t>m) break;
            if(DBG) printf("%d --> %d %d(%d, %d)\n", j, t, i, w[i], v[i]);
            f[i][t] >?= f[i-1][j]+v[i];
         }
         oo = oo+w[i] <? m+1;
      }
      
      int res=0, k=0, e;
      FOR(j, 0, m+1) if(res < f[n][j]){ res = f[n][j]; e = j; }

      FORD(i, n, 1) if(f[i][e] != f[i-1][e]){
         sol[k++] = i; e -= w[i];
      }

      reverse(sol, sol+k);
      printf("%d %d\n", res, k);
      FOR(i, 0, k) printf("%d%c", sol[i], i==k-1?'\n':' ');
   }
   return 0;
}
