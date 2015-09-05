#include<algorithm>
#include<vector>
#include<map>
using namespace std;
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define PB(a) push_back(a)
#define MP make_pair
#define TR(c, it) for(typeof((c).begin()) it=(c).begin(); it!=(c).end(); it++)
#define EXIST(c, x) c.find(x)!=c.end()
typedef vector<int> VI;
typedef vector<VI> VVI;
typedef pair<int, int> II;
typedef pair<int, II> III;
typedef vector<II> VII;
typedef vector<VII> VVII;
typedef long long LL;
const int DBG = 0;
const int HOME = 0;
const int MAXN = 110;
const int INF = 1000000001;

int T, n, x, y;
LL res;
map<int, int> q;

void push(int x){
   if(EXIST(q, x)) q[x]++;
   else q.insert(MP(x, 1));
}

int pop(){
   int t = q.begin()->first;
   if(!(--q[t])) q.erase(q.begin());
   return t;
}

void maket(){
   freopen("HEAP1.inp", "w", stdout);
   
   n = 20000; printf("1\n%d\n", n);
   FOR(i, 0, n) printf("50000 ");
   fclose(stdout);
}

int main(){
   //maket(); return(0);

   if(HOME){
      freopen("HEAP1.inp", "r", stdin);
      freopen("HEAP1.out", "w", stdout);
   }
   
   scanf("%d", &T);
   while(T--){
      scanf("%d", &n);
      q.clear();
      FOR(i, 0, n){
         scanf("%d", &x); push(x);
      }
      res = 0;
      FOR(i, 1, n){
         x = pop(); y = pop();
         if(DBG) printf("POP: %d %d\n", x, y);
         res += x+y;
         push(x+y);
      }
      
      if(HOME) printf("%I64d\n", res);
      else printf("%lld\n", res);
   }

   return 0;
}
