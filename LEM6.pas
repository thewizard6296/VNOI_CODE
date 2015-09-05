Uses math;
Const   fi  =   '';
        fo  =   '';
        maxn=   1011;
        cs  =   100000000;
Type    big =   record
                    n:longint;
                    a:array[1..100]of longint;
                end;
Var     f,f2:   text;
        a   :   array[-1..maxn]of longint;
        s   :   array[0..1,-1..maxn]of big;
        n,m :   longint;
Procedure inp;
   var i:longint;
   begin
     assign(f,fi); reset(f);
     assign(f2,fo); rewrite(f2);
     read(f,n,m);
     for i:=1 to m do read(f,a[i]);
     close(f);
   end;
Procedure tong(var a,b,c:big);
   var i,t,nho:longint;
   begin
     t:=max(a.n,b.n);
     nho:=0;
     for i:=1 to t do
       begin
         c.a[i]:=a.a[i]+b.a[i]+nho;
         nho:=c.a[i] div cs;
         c.a[i]:=c.a[i] mod cs;
       end;
     if nho>0 then begin inc(t); c.a[t]:=nho; end;
     c.n:=t;
   end;
Procedure solve;
   var i,j,ii,i1:longint;
   begin
     for j:=-1 to n do
       begin s[0,j].a[1]:=1; s[0,j].n:=1; end;
     for i:=1 to m do
       begin
         ii:=i mod 2; i1:=1-ii;
         fillchar(s[ii],sizeof(s[ii]),0);
         for j:=0 to n do
           if j>=a[i] then
             tong(s[i1,j-a[i]-1],s[ii,j-1],s[ii,j]);
       end;
   end;
Procedure Out;
   var i,j:longint; st:string;
   begin
     m:=m mod 2;
     write(f2,s[m,n].a[s[m,n].n]);
     for i:=s[m,n].n-1 downto 1 do
       begin
         str(s[m,n].a[i],st);
         for j:=1 to 8-length(st) do insert('0',st,1);
         write(f2,st);
       end;
     close(f2);
   end;
Begin
  inp;
  solve;
  Out;
End.
 