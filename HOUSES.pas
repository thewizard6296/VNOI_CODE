{$mode objfpc}
 
const
  fi = '';
  fo = '';
  max= 101;
 
var
  a : array[1..max] of longint;
  x : array[1..max] of longint;
  free : array[1..max] of boolean;
  n , l , count , c : longint;
  g : textfile;
 
procedure enter;
var
  f : textfile;
  i : longint;
begin
  assignfile(f,fi);reset(f);
  assignfile(g,fo);rewrite(g);
  readln(f,l,n);
  for i := 1 to n do read(f,a[i]);
  closefile(f);
end;
 
procedure print;
var
  i : longint;
begin
  inc(count);
  for i := 1 to l do write(g,x[i],' ');
  writeln(g);
  if count = 1000 then
  begin
    closefile(g);
    halt;
  end;
end;
 
procedure attempt(k,q : longint);
var
  i , j , k1 , t , u : longint;
begin
  if (q > n) or (k > l) then exit;
  t := 0;
  for i := 1 to n do
  if free[i] then
    t := t + a[i];
  u := l-k+1-t;
  for i := u downto 0 do
  begin
    for j := 1 to n do
    if free[j] then
      begin
        for k1 := 1 to a[j] do
        x[i+k+k1-1] := j;
        free[j] := false;
        if q = n then print
        else attempt(i+k+a[j],q+1);
        free[j] := true;
        for k1 := i+k to l do x[k1] := 0;
      end;
  end;
end;
 
procedure solve;
var
  i , j , t : longint;
begin
  t := 0;
  for i := 1 to n do
  t := t + a[i];
  c := l - t;
  fillchar(free , sizeof(free) , true);
  fillchar(x , sizeof(x) , 0);
  count := 0;
  for i := 1 to n do
  begin
    fillchar(x , sizeof(x) , 0);
    for j := 1 to a[i] do
    x[j] := i;
    if n = 1 then
    begin
      for j := 1 to l do write(g,x[j],' ');
      writeln(g);
    end;
    free[i] := false;
    attempt(a[i]+1,2);
    free[i] := true;
  end;
end;
 
begin
  enter;
  solve;
  closefile(g);
end. 