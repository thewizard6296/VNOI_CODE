Uses math;
Const   fi  =   '';
        fo  =   '';
Var     f,f2:   text;
        cl,s,l,r:   array[1..36011]of longint;
        n,x,y   :   longint;
Procedure tomau(node,node0,node1,k:longint);
   begin
     cl[node]:=k;
     if k=1 then
       begin s[node]:=0; l[node]:=0; r[node]:=0; end
     else
       begin
         s[node]:=node1-node0+1;
         l[node]:=s[node]; r[node]:=s[node];
       end;
   end;
Procedure init(node,node0,node1:longint);
   var m:longint;
   begin
     tomau(node,node0,node1,0);
     if node0=node1 then exit;
     m:=(node0+node1)div 2;
     init(node*2,node0,m);
     init(node*2+1,m+1,node1);
   end;
Procedure modify(node,node0,node1,k:longint);
   var m:longint;
   begin
     if (x<=node0)and(node1<=y) then
       tomau(node,node0,node1,k)
     else
       begin
         m:=(node0+node1)div 2;
         if cl[node]<>2 then
           begin
             tomau(node*2,node0,m,cl[node]);
             tomau(node*2+1,m+1,node1,cl[node]);
           end;
         if x<=m then modify(node*2,node0,m,k);
         if y>m then modify(node*2+1,m+1,node1,k);
 
         s[node]:=max( max(s[node*2], s[node*2+1]) , r[node*2]+l[node*2+1] );
         l[node]:=l[node*2]; r[node]:=r[node*2+1];
         if cl[node*2]=0 then inc(l[node], l[node*2+1]);
         if cl[node*2+1]=0 then inc(r[node], r[node*2]);
 
         if cl[node*2]=cl[node*2+1] then cl[node]:=cl[node*2]
         else cl[node]:=2;
       end;
   end;
Procedure process;
   var i,k,m:longint;
   begin
     assign(f,fi); reset(f);
     assign(f2,fo); rewrite(f2);
     read(f,n); read(f,m);
     init(1,1,n);
     for i:=1 to m do
       begin
         read(f,k); dec(k);
         if k in [0,1] then
           begin
             read(f,x,y);
             modify(1,1,n,k);
           end
         else writeln(f2,s[1]);
       end;
     close(f); close(f2);
   end;
Begin
  process;
End.
 