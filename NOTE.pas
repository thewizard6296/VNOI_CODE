uses    crt;
const   fi='';
        fo='';
var     n:integer;
        vt:longint;
        f,g:text;
        d:boolean;
procedure       mofile;
begin
        assign(f,fi);
        reset(f);
        assign(g,fo);
        rewrite(g);
end;
procedure       dongfile;
begin
        close(f);
        close(g);
end;
procedure       tinh;
var     l,r,mid:int64;
        i:integer;
begin
        d:=true;
        l:=1;
        r:=1;
        for i:=1 to n do r:=r*2;
        r:=r-1;
        repeat
                mid:=(r+l) div 2;
                if vt=mid then break;
                if vt>mid then
                begin
                        l:=mid+1;
                        d:=true;
                end
                else
                begin
                        r:=mid-1;
                        d:=false;
                end;
        until r=l;
        if d then writeln(g,'D')
        else writeln(g,'U');
end;
procedure       xl;
begin
        repeat
                readln(f,n,vt);
                if (n<>0) and (vt<>0) then tinh;
        until (n=0) and (vt=0);
end;
BEGIN
        clrscr;
        mofile;
        xl;
        dongfile;
END.