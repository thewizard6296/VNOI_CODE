Const   fi  =   '';
        fo  =   '';
        maxn=   30111;
        maxm=   201111;
Type    pter=   ^pt;
        pt  =   record u,cl:longint; b:boolean; dx,link:pter; end;
Var     f,f2:   text;
        a   :   array[1..maxn]of pter;
        num,low :   array[1..maxn]of longint;
        d,goc   :   array[1..maxm]of longint;
        s       :   array[1..maxm]of pter;
        n,m,cnt,tp  :   longint;
Procedure inp;
   var i,u,v,m:longint; last:pter;
   begin
     assign(f,fi); reset(f);
     assign(f2,fo); rewrite(f2);
     read(f,n,m);
     for i:=1 to m do
       begin
         read(f,u,v);
         last:=a[u]; new(a[u]);
         a[u]^.u:=v; a[u]^.b:=true; a[u]^.link:=last;
         last:=a[v]; new(a[v]);
         a[v]^.u:=u; a[v]^.b:=true; a[v]^.link:=last;
         a[u]^.dx:=a[v]; a[v]^.dx:=a[u];
       end;
     close(f);
   end;
Function min(a,b:longint):longint;
   begin
     if a<b then min:=a else min:=b;
   end;
Procedure DFS(u:longint);
   var v:longint; x,xx,p:pter;
   begin
     inc(cnt);
     num[u]:=cnt; low[u]:=cnt;
     x:=a[u];
     while x<>nil do
       begin
         v:=x^.u; xx:=x; x:=x^.link;
         if not xx^.b then continue;
         xx^.b:=false; xx^.dx^.b:=false;
         if num[v]>0 then low[u]:=min(low[u],num[v])
         else
           begin
             inc(m); s[m]:=xx;
             DFS(v);
             low[u]:=min(low[u],low[v]);
             if low[v]>=num[u] then
               begin
                 inc(tp); goc[tp]:=u;
                 repeat
                   p:=s[m]; dec(m);
                   p^.cl:=tp;
                 until p=xx;
               end;
           end;
       end;
   end;
Procedure predone;
   var i:longint;
   begin
     goc[1]:=1;
     for i:=1 to n do
       if num[i]=0 then DFS(i);
   end;
Procedure solve;
   var u,i,k:longint; x:pter;
   begin
     for u:=1 to n do
       begin
         x:=a[u];
         while x<>nil do
           begin
             inc(d[x^.cl]); x:=x^.link;
           end;
       end;
     k:=1;
     for i:=1 to tp do
       if d[i]>d[k] then k:=i;
     writeln(f2,d[k]+1);
     {write(f2,goc[k],' ');
     for u:=1 to n do
       begin
         x:=a[u];
         while x<>nil do
           begin
             if x^.cl=k then write(f2,x^.u,' ');
             x:=x^.link;
           end;
       end;}
     close(f2);
   end;
Begin
  inp;
  predone;
  solve;
End.