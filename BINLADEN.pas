const fi = '';
      fo = '';
      mmax = 2250;
      nmax = 11;
      emax = 25000;
      maxc = 10000000;
 
type  arr = array[0..mmax, 0..nmax] of longint;
 
var   c: array[1..2] of arr;
      heap, pos: array[0..emax] of longint;
      d: array[0..emax] of qword;
      free: array[0..emax] of boolean;
      m, n, mn, nHeap: longint;
 
procedure readfile;
var f: text;
    i, j: longint;
begin
  assign(f, fi); reset(f);
  readln(f, m, n);
  mn := m * n;
  for i := 1 to m do
    begin
      for j := 1 to n do read(f, c[1][i, j]);
      readln(f);
      for j := 1 to n - 1 do read(f, c[2][i, j]);
      readln(f);
    end;
  close(f);
end;
 
procedure init;
var i: longint;
begin
  fillchar(free, sizeof(free), true);
  fillchar(pos, sizeof(pos), 0);
  for i := 1 to mn do d[i] := maxc;
  nHeap := 0;
end;
 
procedure update(v: longint);
var con, cha: longint;
begin
  con := pos[v];
  if con = 0 then
    begin
      inc(nHeap);
      con := nHeap;
    end;
  cha := con div 2;
  while (cha > 0) and (d[v] < d[heap[cha]]) do
    begin
      heap[con] := heap[cha];
      pos[heap[con]] := con;
      con := cha;
      cha := con div 2;
    end;
  heap[con] := v;
  pos[v] := con;
end;
 
function pop: longint;
var c, r, v: longint;
begin
  pop := heap[1];
  v := heap[nHeap];
  dec(nHeap);
  r := 1;
  while r * 2 <= nHeap do
    begin
      c := r * 2;
      if (c < nHeap) and (d[heap[c]] > d[heap[c + 1]]) then inc(c);
      if d[v] <= d[heap[c]] then break;
      heap[r] := heap[c];
      pos[heap[r]] := r;
      r := c;
    end;
  heap[r] := v;
  pos[v] := r;
end;
 
procedure dijkstra;
var u, v, i, q, r: longint;
begin
  for v := 1 to n do
    begin
      d[v] := c[1][1, v];
      update(v);
    end;
  repeat
    u := pop;
    if u = mn then break;
    free[u] := false;
    q := (u - 1) div n;
    r := u - q * n;
    {Tren}
    if q > 0 then
      begin
        v := (q - 1) * n + r;
        if free[v] and (d[v] > d[u] + c[1][q + 1, r]) then
          begin
            d[v] := d[u] + c[1][q + 1, r];
            update(v);
          end;
      end;
    {Duoi}
    if q < m - 1 then
      begin
        v := (q + 1) * n + r;
        if free[v] and (d[v] > d[u] + c[1][q + 2, r]) then
          begin
            d[v] := d[u] + c[1][q + 2, r];
            update(v);
          end;
      end;
    {Trai}
    if r > 1 then
      begin
        v := q * n + r - 1;
        if free[v] and (d[v] > d[u] + c[2][q + 1, r - 1]) then
          begin
            d[v] := d[u] + c[2][q + 1, r - 1];
            update(v);
          end;
      end;
    {Phai}
    if r < n then
      begin
        v := q * n + r + 1;
        if free[v] and (d[v] > d[u] + c[2][q + 1, r]) then
          begin
            d[v] := d[u] + c[2][q + 1, r];
            update(v);
          end;
      end;
  until nHeap = 0;
end;
 
procedure writefile;
var f: text;
    i, u: longint;
begin
  assign(f, fo); rewrite(f);
  writeln(f, d[mn]);
  close(f);
end;
 
begin
  readfile;
  init;
  dijkstra;
  writefile;
end.