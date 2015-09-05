#include<algorithm>
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define MP(a, b) make_pair(a, b)
using namespace std;
const int DBG = 0;
const int HOME = 0;
const int MAXN = 210;
const int INF = 1000000001;

int n;
int a[MAXN][MAXN], f[MAXN][MAXN];

int main(){
   if(HOME){
      freopen("DISNEY.inp", "r", stdin);
      freopen("DISNEY1.out", "w", stdout);
   }
   
   scanf("%d", &n);
   FOR(i, 0, n) FOR(j, 0, n) scanf("%d", &a[i][j]);
   FOR(i, 0, n) a[i][n] = a[i][0];
   
   FOR(i, 0, n+1) FOR(j, 0, n+1) f[i][j] = INF;
   f[0][0] = 0;
   
   FOR(i, 0, n+1){
      FOR(j, i+1, n+1) f[i][j] <?= f[i][i]+a[i][j]; //(i,i)-->(i,j);
      FOR(j, i+1, n+1) f[i+1][j] <?= f[i][i+1]+a[i][j]; //(i,i+1)-->(i+1,j)
      FOR(j, i+2, n+1) f[i+1][j] <?= f[i][j]+a[i][i+1]; //(i,j)-->(i+1,j)
   }
   
   printf("%d\n", f[n][n]);

   return 0;
}
