#include<algorithm>
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define MP(a, b) make_pair(a, b)
using namespace std;
const int DBG = 0;
const int HOME = 0;
const int MAXN = 110;
const int MAXK = 1010;
const int INF = 1000000001;

int n, m, k, np;
int g[MAXN][MAXN], tr[MAXN][MAXN], c[MAXN][MAXN];
int o[MAXK][3];
int p[MAXN];

void path(int u, int v){
   if(tr[u][v]==-1) p[np++] = u;
   else{
      path(u, tr[u][v]);
      path(tr[u][v], v);
   }
}

int main(){
   if(HOME){
      freopen("floyd.inp", "r", stdin);
      freopen("floyd.out", "w", stdout);
   }

   scanf("%d %d %d", &n, &m, &k);
   
   FOR(i, 0, n) FOR(j, 0, n)
   {
      g[i][j] = i==j ? 0 : INF;
      tr[i][j] = -1; c[i][j] = 1;
   }
   
   int u, v, x;
   FOR(i, 0, m)
   {
      scanf("%d %d %d", &u, &v, &x);
      u--; v--;
      g[u][v] = g[v][u] = x;
      c[u][v] = c[v][u] = 2;
   }
   
   if(DBG)
   {
      FOR(i, 0, n) FOR(j, 0, n) printf("%4d%c", g[i][j], j==n-1?'\n':' ');
   }
   
   FOR(i, 0, k){
      scanf("%d %d %d", &x, &u, &v);
      u--; v--;
      o[i][0] = x; o[i][1] = u; o[i][2]=v;
   }
   
   FOR(t, 0, n) FOR(i, 0, n) FOR(j, 0, n) if(g[i][j] > g[i][t]+g[t][j]){
      g[i][j] = g[i][t]+g[t][j], tr[i][j] = t;
      c[i][j] = c[i][t] + c[t][j] - 1;
   }

   if(DBG){
      FOR(i, 0, n) FOR(j, 0, n) printf("%4d%c", g[i][j], j==n-1?'\n':' ');
   }
      
   FOR(i, 0, k)
      if(o[i][0]){
         np = 0;
         path(o[i][1], o[i][2]);
         if(o[i][1] != o[i][2])p[np++] = o[i][2];
         printf("%d ", np);
         FOR(j, 0, np) printf("%d ", p[j]+1);
         printf("\n");

      }
      else printf("%d\n", g[o[i][1]][o[i][2]]);

   return 0;
}
