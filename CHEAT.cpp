#include<algorithm>
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define MP(a, b) make_pair(a, b)
using namespace std;
const int DBG = 0;
const int HOME = 0;
const int MAXN = 100010;

int n;
int a[MAXN], s[MAXN];

bool check(){
   int max = 0, top = 0;
   FOR(i, 0, n){
      if(a[i]<max){
         if(a[i] != s[top]) return false;
         top--;
      }
      else{
         FOR(j, max+1, a[i]) s[++top] = j;
         max = a[i];
      }
   }
   return true;
}

int main(){
   if(HOME){
      freopen("cheat.inp", "r", stdin);
      freopen("cheat.out", "w", stdout);
   }
   
   scanf("%d", &n);
   FOR(i, 0, n) scanf("%d", a+i);

   if(check()) printf("NO\n");
   else printf("YES\n");

   return 0;
}
