const fi = '';
      fo = '';
      nmax = 100001;
      maxc = 1000000000000000;
 
var   s, t, n, l1, l2, l3, c1, c2, c3: longint;
      d, g: array[0..nmax] of qword;
 
procedure readfile;
var f: text;
    i: longint;
begin
  assign(f, fi); reset(f);
  read(f, l1, l2, l3, c1, c2, c3);
  read(f, n);
  read(f, s, t);
  for i := 1 to n - 1 do read(f, d[i + 1]);
  close(f);
end;
 
procedure tim(i, x, y, l: longint; var j: longint);
var tb: longint;
begin
  while x < y do
    begin
      tb := (x + y) div 2;
      if d[i] - d[tb] <= l then y := tb
      else x := tb + 1;
    end;
  j := x;
end;
 
function min(x, y, z: qword): qword;
begin
  min := x;
  if y < min then min := y;
  if z < min then min := z;
end;
 
procedure slove;
var j1, j2, j3: longint;
    i: longint;
begin
  for i := s + 1 to t do
    begin
      g[i] := maxc;
      tim(i, s, i, l1, j1);
      if j1 > s then
        begin
          tim(i, s, j1, l2, j2);
          if j2 > s then
            tim(i, s, j2, l3, j3)
          else j3 := j2;
        end
      else
        begin
          j2 := j1;
          j3 := j1;
        end;
      g[i] := min(g[j1] + c1, g[j2] + c2, g[j3] + c3);
    end;
end;
 
procedure writefile;
var f: text;
begin
  assign(f, fo); rewrite(f);
  writeln(f, g[t]);
  close(f);
end;
 
begin
  readfile;
  slove;
  writefile;
end.
 