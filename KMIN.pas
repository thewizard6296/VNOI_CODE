const
        fi='';
        maxn=52000;
        max1=3000;
        max2=10000;
type
        coo=record x,y:longint; end;
var
        i,n,m,k,hs:longint;
        a,b:array[1..maxn] of longint;
        h:array[1..max1*max1] of coo;
        g:array[1..max2,1..max2] of boolean;
        p:coo;
function d(p:coo):longint;
 begin
   exit(a[p.x]+b[p.y]);
 end;
procedure swap(var u,v:coo);
 var
        p:coo;
 begin
   p:=u; u:=v; v:=p;
 end;
procedure add(u,v:longint);
 var
        i:longint;
        p:coo;
 begin
   p.x:=u; p.y:=v;
   if (p.x>m) or (p.y>n) or g[u,v] then exit;
   g[u,v]:=true;
   inc(hs);
   h[hs]:=p;
   i:=hs;
   while (i>1) and (d(h[i])<d(h[i div 2])) do
    begin
      swap(h[i],h[i div 2]);
      i:=i div 2;
    end;
 end;
procedure del;
 var
        i,l,r,sl:longint;
 begin
   h[1]:=h[hs];
   dec(hs);
   i:=1;
   repeat
     l:=i*2; r:=i*2+1;
     if (l<=hs) and (d(h[i])>d(h[l])) then sl:=l else sl:=i;
     if (r<=hs) and (d(h[sl])>d(h[r])) then sl:=r;
     if sl<>i then
      begin
        swap(h[i],h[sl]);
        i:=sl;
      end else break;
   until false;
 end;
procedure qs(i,j:longint);
 var
        l,r,mid,p:longint;
 begin
   if i>=j then exit;
   l:=i; r:=j;
   mid:=a[(l+r) div 2];
   repeat
     while a[l]<mid do inc(l);
     while a[r]>mid do dec(r);
     if l<=r then
      begin
        p:=a[l]; a[l]:=a[r]; a[r]:=p;
        inc(l); dec(r);
      end;
   until l>r;
   if l<j then qs(l,j);
   if i<r then qs(i,r);
 end;
BEGIN
  assign(input,fi); reset(input);
  read(n,m,k);
  for i:=1 to n do read(a[i]);
  qs(1,n);
  b:=a;
  for i:=1 to m do read(a[i]);
  qs(1,m);
  add(1,1);
  for i:=1 to k do
   begin
     writeln(a[h[1].x]+b[h[1].y]);
     add(h[1].x+1,h[1].y);
     add(h[1].x,h[1].y+1);
     del;
   end;
END. 