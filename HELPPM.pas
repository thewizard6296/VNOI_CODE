#include <iostream>
 
using namespace std;
int a[505][505];
int s[505];
int main(){
	int m,n,k;
	int stm,enm,sum;
	int minarea=INT_MAX,mxa,mya,mxb,myb; //xrow ycol
	int tarea,txa,tya,txb,tyb;
	cin>>m>>n>>k;
	for(int i=0;i<m;i++)
	for(int j=0;j<n;j++)
		cin>>a[i][j];
	for(int st=0;st<n;st++){
		memset(s,0,sizeof(s));
		for(int en=st;en<n;en++){
			for(int i=0;i<m;i++) 
				s[i]+=a[i][en];
			stm=0;enm=0;sum=s[0];
			while(stm<m && enm<m){
				if(sum>=k){
					txa=stm;txb=enm;
					tya=st;tyb=en;
					tarea=(txb-txa+1)*(tyb-tya+1);
					if(tarea<minarea){
						minarea=tarea;
						mxa=txa;mxb=txb;
						mya=tya;myb=tyb;
					}
					sum-=s[stm];
					stm++;
				}
				else{
					enm++;
					sum+=s[enm];
				}
			}
		}
	}
	if(minarea==INT_MAX)cout<<-1<<endl;
	else{
		cout<<minarea<<endl;
		cout<<mxa+1<<" "<<mya+1<<" "<<mxb+1<<" "<<myb+1<<endl;
	}
	//char ch;cin>>ch;
	return 0;
}