const
  finp='';
  fout='';
  maxN=100001;
 
type
  heap=record
    p,v:longint;
  end;
 
var
  p,d,vt:array[0..maxN] of longint;
  kt:array[0..maxN] of boolean;
  n,dem,nheap:longint;
  h:array[0..maxN]of heap;
 
procedure docdl;
  var
    i:longint;
  begin
    read(n);
    for i:=1 to n do read(p[i]);
    for i:=1 to n do read(d[i]);
  end;
 
procedure Sort(l, r: longint);
var
  i, j, x, y: longint;
begin
  i := l; j := r; x := d[(l+r) DIV 2];
  repeat
    while d[i] < x do i := i + 1;
    while x < d[j] do j := j - 1;
    if i <= j then
    begin
      y := d[i]; d[i] := d[j]; d[j] := y;
      y := p[i]; p[i] := p[j]; p[j] := y;
      y := vt[i]; vt[i] := vt[j]; vt[j] := y;
      i := i + 1; j := j - 1;
    end;
  until i > j;
  if l < j then Sort(l, j);
  if i < r then Sort(i, r);
end;
 
procedure khoitao;
  var
    i:longint;
  begin
    nheap:=0;
    fillchar(kt,sizeof(kt),true);
    for i:=1 to n do vt[i]:=i;
    sort(1,n);
  end;
 
procedure upheap(pos:longint);
  var
    dad:longint;
    key:heap;
  begin
    key:=h[pos];dad:=pos div 2;
    while (dad>0)and(h[dad].v<key.v) do
      begin
        h[pos]:=h[dad];
        pos:=dad;
        dad:=pos div 2;
      end;
    h[pos]:=key;
  end;
 
procedure downheap(pos:longint);
  var
    son:longint;
    key:heap;
  begin
    key:=h[pos];son:=pos*2;
    while son<=nheap do
      begin
        if (son<nheap)and(h[son].v<h[son+1].v) then son:=son+1;
        if h[son].v<key.v then break;
        h[pos]:=h[son];
        pos:=son;
        son:=pos*2;
      end;
    h[pos]:=key;
  end;
 
procedure put(x:longint);
  begin
    inc(nheap);
    h[nheap].v:=p[x];
    h[nheap].p:=x;
    upheap(nheap);
  end;
 
function extractmax:longint;
  begin
    extractmax:=h[1].v;
    kt[h[1].p]:=false;
    h[1]:=h[nheap];
    dec(nheap);
    downheap(1);
  end;
 
procedure xuli;
  var
    i,tg,x:longint;
  begin
    khoitao;
    tg:=0;dem:=0;
    for i:=1 to n do
      begin
        put(i);
        tg:=tg+p[i];
        if tg>d[i] then
          begin
            x:=extractmax;
            tg:=tg-x;
            inc(dem);
          end;
      end;
  end;
 
procedure inkq;
  var
    i:longint;
  begin
    writeln(dem);
    for i:=1 to n do
      if kt[i] then write(vt[i],' ');
    for i:=1 to n do
      if not kt[i] then write(vt[i],' ');
  end;
 
begin
 
  assign(input,finp);reset(input);
  assign(output,fout);rewrite(output);
 
  docdl;
  xuli;
  inkq;
  close(input);close(output);
 
end.