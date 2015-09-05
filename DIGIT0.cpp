#include<algorithm>
#include<cassert>
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
const int INF = 1000000001;

int n;
char s[MAXN];
int c[26];

int cnt(int n, int p){
   int t = 0;
   while(n/=p) t += n;
   return t;
}

int main(){
   if(HOME){
      freopen("DIGIT0.inp", "r", stdin);
      freopen("DIGIT0.out", "w", stdout);
   }
   
   gets(s);
   n = strlen(s);
   assert(isalpha(s[n-1]));
   FOR(i, 0, n) c[ s[i]-'a' ]++;
   
   int p2 = cnt(n, 2), p5= cnt(n, 5);
   if(DBG) printf("2^%d 5^%d\n", p2, p5);
   FOR(i, 0, 26) p2 -= cnt(c[i], 2), p5 -= cnt(c[i], 5);
   if(DBG) printf("2^%d 5^%d\n", p2, p5);
   printf("%d\n", p2<?p5);

   return 0;
}
