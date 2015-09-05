Const   fi  =   '';
        fo  =   '';
        maxn=   31;
        maxs=   3000111;
Var     f,f2:   text;
        a   :   array[1..maxn]of longint;
        r,d :   array[1..maxs]of longint;
        free:   array[1..maxs]of boolean;
        n,ss,tt,k   :   longint;
Function getbit(i:longint; x:longint):longint;
   begin
     getbit:=(x shr i) and longint(1);
   end;
Procedure batbit(i:longint; var x:longint);
   begin
     x:=(longint(1) shl i) or x;
   end;
Procedure tatbit(i:longint; var x:longint);
   begin
     x:=x and (not (longint(1) shl i) );
   end;
Procedure inp;
   var i,u,j,c,nn:longint;
   begin
     assign(f,fi); reset(f);
     assign(f2,fo); rewrite(f2);
     read(f,n,k);
     for i:=1 to n do
       begin
         read(f,nn); u:=0;
         for j:=1 to n do batbit(j-1,u);
         for j:=1 to nn do
           begin
             read(f,c);
             tatbit(c-1,u);
           end;
         a[i]:=u;
       end;
     for i:=1 to n do
       begin
         read(f,u);
         if u=1 then batbit(i-1,ss);
       end;
     close(f);
   end;
Procedure solve;
   var u,i,t,w,v,j:longint;
   begin
     w:=1; t:=1; r[1]:=ss;
     fillchar(free,sizeof(free),true);
     free[r[1]]:=false;
     tt:=0; batbit(k-1,tt);
     if tt=ss then begin writeln(f2,0); close(f2); halt; end;
     repeat
       u:=r[t]; inc(t);
       for i:=1 to n do
         begin
           v:=u;
           batbit(i-1,v);
           v:=v and a[i];
           if free[v] then
             begin
               free[v]:=false;
               d[v]:=d[u]+1;
               if v=tt then exit;
               inc(w); r[w]:=v;
             end;
         end;
     until t>w;
     writeln(f2,-1);
     close(f2);
     halt;
   end;
Begin
  inp;
  solve;
  writeln(f2,d[tt]);
  close(f2);
End. 