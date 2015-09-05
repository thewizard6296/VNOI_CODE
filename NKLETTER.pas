Uses math;
Const input='';
      output='';
 
Var fi,fo:text;
    se,sb:string;
    kq:longint;
 
Procedure nhap;
begin
    readln(fi,se);
    readln(fi,sb);
end;
 
Function ktra(n:longint):longint;
var i,j:longint;
begin
    j:=1;
    ktra:=0;
    for i:=n to length(se) do
      if (j<=length(sb)) and (se[i]=sb[j]) then inc(j)
        else  if (j<=length(sb)) then exit else break;
    ktra:=j-1;
end;
 
Procedure xuly;
var i:longint;
begin
    kq:=0;
    for i:=1 to length(se) do kq:=max(kq,ktra(i));
end;
 
Procedure ghi;
begin
     writeln(fo,length(se)+length(sb)-kq);
end;
 
BEGIN
  assign(fi,input);
  reset(fi);
 
  assign(fo,output);
  rewrite(fo);
 
  nhap;
  xuly;
  ghi;
 
  close(fi);
  close(fo);
END.
 