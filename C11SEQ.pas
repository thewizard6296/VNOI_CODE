const
    fi      =   '';//C11seq.inp';
    fo      =   '';//C11seq.out';
    maxn    =   100010;
 
 var
    fin,fout        :   text;
    n,l,r           :   longint;
    a,b             :   array[0..maxn]of int64;
 
procedure   mof;
begin
    assign(fin,fi); reset(fin);
    assign(fout,fo); rewrite(fout);
end;
 
procedure   dongf;
begin
    close(fin); close(fout);
end;
 
procedure   nhap;
var i:longint;
begin
    readln(fin,n,l,r);
    for i:=1 to n do begin
        read(fin,a[i]);
        a[i]:=a[i]+a[i-1];
    end;
end;
 
function    find(x:int64; d,c:longint):longint;
var inf,sup,mid:longint;
begin
    inf:=d-1; sup:=c+1;
    repeat
        mid:=(inf+sup) shr 1;
        if x>a[mid] then inf:=mid
            else sup:=mid;
    until inf+1=sup;
    exit(inf);
end;
 
function    megasort(d,c:longint):int64;
var i,j,m:longint;
    tg:int64;
begin
    if d=c then begin
        if (a[d]-a[d-1]>=l) and (a[d]-a[d-1]<=r) then
            tg:=1
        else tg:=0;
    end
    else begin
        m:=(d+c) shr 1;
        tg:=megasort(d,m)+megasort(m+1,c);
        for i:=d to m do
            tg:=tg+find(a[i-1]+r+1,m+1,c)-find(a[i-1]+l,m+1,c);
 
        {dung mang phu b de sap xep}
        for i:=m downto d do b[i]:=a[i];
        for j:=m+1 to c do b[c+m+1-j]:=a[j];
        for m:=d to c do begin
            if b[i]<b[j] then begin
                a[m]:=b[i]; inc(i);
            end
            else begin
                a[m]:=b[j]; dec(j);
            end;
        end;
    end;
    megasort:=tg;
end;
 
procedure   solve;
begin
    writeln(fout,megasort(1,n));
end;
 
BEGIN
    mof;
    nhap;
    solve;
    dongf;
END.