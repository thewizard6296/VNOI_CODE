Const   fi  =   '';
        fo  =   '';
        maxn=   100111;
        mm  =   133793;
Type    pter=   ^pt;
        pt  =   record i:longint; link:pter; end;
Var     f,f2:   text;
        a   :   array[0..maxn]of longint;
        c   :   array[0..maxn,1..100]of longint;
        h   :   array[0..mm]of pter;
        n,kq:   longint;
Procedure inp;
   var i:longint;
   begin
     assign(f,fi); reset(f);
     assign(f2,fo); rewrite(f2);
     read(f,n);
     for i:=1 to n do read(f,a[i]);
     close(f);
   end;
Function find(s:longint):longint;
   var i:longint; x:pter;
   begin
     x:=h[abs(s) mod mm];
     while x<>nil do
       begin
         i:=x^.i; x:=x^.link;
         if a[i]=s then
           begin find:=i; exit; end;
       end;
     find:=0;
   end;
Procedure add(i:longint);
   var u:longint; x,p:pter;
   begin
     u:=abs(a[i]) mod mm; x:=h[u];
     while x<>nil do
       begin
         p:=x; x:=x^.link;
         if a[p^.i]=a[i] then
           begin p^.i:=i; exit; end;
       end;
     p:=h[u]; new(h[u]);
     h[u]^.i:=i; h[u]^.link:=p;
   end;
Procedure solve;
   var i,u,d:longint;
   begin
     for i:=1 to n do
       begin
         for d:=1 to 100 do
           begin
             u:=find(a[i]-d);
             c[i,d]:=c[u,d]+1;
             if c[i,d]>kq then kq:=c[i,d];
           end;
         add(i);
       end;
     writeln(f2,kq);
     close(f2);
   end;
Begin
  inp;
  solve;
End.