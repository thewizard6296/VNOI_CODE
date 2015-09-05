uses    crt;
const   max=255;
        fi='';
        fo='';
type    m1=array[0..max,0..max] of byte;
var     f:text;
        s1,s2,s:string;
        w:m1;
        l1,l2:integer;
procedure       nhapdl;
begin
        assign(f,fi);
        reset(f);
        readln(f,s1);
        l1:=length(s1);
        readln(f,s2);
        l2:=length(s2);
        readln(f,s);
        close(f);
end;
procedure       xl;
var     i,j:integer;
begin
        for i:=1 to l1 do w[i,0]:=1;
        for j:=1 to l2 do w[0,j]:=2;
        for i:=1 to l1 do
                for j:=1 to l2 do
                begin
                        if (w[i-1,j]>0) and (s1[i]=s[i+j]) then w[i,j]:=1;
                        if (w[i,j-1]>0) and (s2[j]=s[i+j]) then w[i,j]:=2;
                end;
end;
procedure       trace(i,j:integer);
begin
        if w[i,j]>0 then
        begin
                case w[i,j] of
                1:      trace(i-1,j);
                2:      trace(i,j-1);
                end;
                write(f,w[i,j]);
        end;
end;
procedure       ghikq;
begin
        assign(f,fo);
        rewrite(f);
        trace(l1,l2);
        close(f);
end;
BEGIN
        clrscr;
        nhapdl;
        xl;
        ghikq;
END.