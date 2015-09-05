#include<algorithm>
using namespace std;
#define FOR(i, a, b) for(int i=(a), _b=(b); i < _b; ++i)
#define FORE(i, a, b) for(int i=(a), _b=(b); i <= _b; ++i)
#define FORD(i, a, b) for(int i=(a), _b=(b); i >= _b; --i)
#define PB(a) push_back(a)

const int DBG = 0;
const int HOME = 0;
const int MAXN = 110;
const int RADIX = 1000000000;
const int INF = 1000000001;

struct bigInt{
   int l, d[500];
   bigInt(int x = 0){
      memset(d, 0, sizeof d);
      l = 1; d[0] = x;
   }
   
   void add(int x){
      d[0] += x;
      FOR(i, 0, l) d[i+1] += d[i]/RADIX, d[i] %= RADIX;
      if(d[l]) l++;
   }
   
   void mul(int x){
      long long t = 0;
      FOR(i, 0, l){
         t += (long long)(d[i])*x;
         d[i] = int(t%RADIX);
         t /= RADIX;
      }
      if(t) d[l++] = t;
   }

   void zprint(int x){
      char s[10];
      sprintf(s, "%d", x);
      FOR(i, strlen(s), 9) putchar('0');
      printf("%s", s);
   }
   
   void print(){
      printf("%d", d[l-1]);
      FORD(i, l-2, 0) zprint(d[i]);
   }
   void println(){
      printf("%d", d[l-1]);
      FORD(i, l-2, 0) zprint(d[i]);
      putchar('\n');
   }
};

int main(){
   if(HOME){
      freopen("CWAY.inp", "r", stdin);
      freopen("CWAY.out", "w", stdout);
   }
   int n;
   scanf("%d", &n);
   bigInt res(1);
   FOR(i, 1, n-1){ res.mul(i); res.add(1); }
   res.println();

   return 0;
}
