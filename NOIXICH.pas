const fi='xich.inp';
fo='xich.out';
var n,kq:longint;
a:array[1..10000000]of longint;

procedure doc;
var i:longint;
begin
assign(input,fi);
reset(input);
readln(n);
for i:=1 to n do read(a[i]);
close(input);
end;

procedure inkq;
var i:longint;
begin
assign(output,fo);
rewrite(output);
write(kq);
close(output);
end;

procedure qs(l,r:longint);
var key,i,j,tg:longint;
begin
if l>=r then exit;
i:=l;
j:=r;
key:=a[(l+r+1)div 2];
repeat
while a[i]<key do inc(i);
while a[j]>key do dec(j);
if i<=j then
begin
tg:=a[i];
a[i]:=a[j];
a[j]:=tg;
inc(i);
dec(j);
end;
until i>j;
qs(l,j);
qs(i,r);
end;

procedure xuli;
var i:longint;
begin
for i:=1 to n do
begin
if kq+a[i]=n-i-1 then begin kq:=kq+a[i];exit;end;
if kq+a[i]<n-i-1 then kq:=kq+a[i];
if kq+a[i]>n-i-1 then begin kq:=kq+(a[i]-(kq+a[i]-n+i+1))+1; exit;end;
end;
end;

begin
doc;
qs(1,n);
xuli;
inkq;
end.