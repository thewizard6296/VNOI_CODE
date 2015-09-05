const fi = '';
      fo = '';
      emax = 100005;
      maxc = 6000;
 
var   d, heap, pos: array[1..emax] of longint;
      m, n, mn, nHeap: longint;
      ok: boolean;
 
procedure readfile;
var f: text;
    i: longint;
begin
  assign(f, fi); reset(f);
  readln(f, n);
  for i := 1 to n do read(f, d[i]);
  close(f);
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
  pos[heap[1]] := 0;
  v := heap[nHeap];
  dec(nHeap);
  r := 1;
  while r * 2 < nHeap do
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
var u, v, s: longint;
begin
  ok := false;
  if n <= 2 then
    begin
      for u := 1 to n do
        if d[u] <= 0 then exit;
      ok := true;
      exit;
    end;
  s := 0;
  for u := 1 to n do s := s + d[u];
  if s <= 0 then exit;
  nHeap := 0;
  for v := 1 to n do update(v);
  repeat
    u := pop;
    if d[u] > 0 then
      begin
        ok := true;
        break;
      end;
    if (u = 1) or (u = n) then break;
    d[u - 1] := d[u - 1] + d[u];
    update(u - 1);
    d[u + 1] := d[u + 1] + d[u];
    update(u + 1);
    d[u] := -d[u];
    update(u);
  until nHeap = 0;
end;
 
procedure writefile;
var f: text;
    i, u: longint;
begin
  assign(f, fo); rewrite(f);
  if ok then
    for i := 1 to n do write(f, d[i], ' ')
  else writeln(f, -1);
  close(f);
end;
 
begin
  readfile;
  dijkstra;
  writefile;
end. 