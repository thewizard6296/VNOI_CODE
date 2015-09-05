using namespace std;
#include<algorithm>
#include<vector>
#include<list>
#include<map>
#include<set>
#include<queue>
#include<stack>
#include<cmath>
#include<cassert>
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define MP make_pair
#define PB push_back
#define TR(c, it) for(typeof((c).begin()) it=(c).begin(); it!=(c).end(); it++)

typedef pair<int, int> II;
typedef vector<int> VI;
typedef vector<II> VII;
typedef vector<VI> VVI;
typedef vector<VII> VVII;

const int DBG = 0;
const int HOME = 0;
const int MAXN = 10+1500;
const int INF = 1000000001;

int move[][9] =  {{1, 1, 0,
                   1, 1, 0,
                   0, 0, 0},
                   
                  {1, 1, 1,
                   0, 0, 0,
                   0, 0, 0},
                   
                  {0, 1, 1,
                   0, 1, 1,
                   0, 0, 0},
                   
                  {1, 0, 0,
                   1, 0, 0,
                   1, 0, 0},
                   
                  {0, 1, 0,
                   1, 1, 1,
                   0, 1, 0},
                   
                  {0, 0, 1,
                   0, 0, 1,
                   0, 0, 1},
                   
                  {0, 0, 0,
                   0, 1, 1,
                   0, 1, 1},
                   
                  {0, 0, 0,
                   0, 0, 0,
                   1, 1, 1},
                   
                  {0, 0, 0,
                   1, 1, 0,
                   1, 1, 0},
                 };

int a[9];
int best = INF;

void solve(int id, int n){
   if(id == 9){
      FOR(i, 0, 9) if(a[i]%4 != 0) return;
      best <?= n;
      return;
   }
   
   FOR(c, 0, 4){
      solve(id+1, n+c);
      FOR(i, 0, 9) a[i] += move[id][i];
   }
}


int main(){
   if(HOME){
      freopen("CLOCK.inp", "r", stdin);
      freopen("CLOCK.out", "w", stdout);
   }

   char s[128];
   FOR(i, 0, 3){
      gets(s);
      FOR(j, 0, 3) a[i*3+j] = s[j] - '0';
   }
   
   solve(0, 0);
   printf("%d\n", best);

   return 0;
}
