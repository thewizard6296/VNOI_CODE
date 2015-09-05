Program Cinema;
Const   fi='';
        fo='';
Var     f,f2:text; i,j,x,y,gt,m,n,k:longint;
        a:array[1..1000,1..1000] of longint;
{----------------------------------------------------------------------------}
Procedure Xuly;
Begin
        Assign(f,fi); reset(f);
        Readln(f,m,n); Readln(f,k); x:=1; y:=0;
        For i:=1 to k do
                Begin
                        Read(f,gt);
                        For j:=1 to gt do
                                Begin
                                        If (x mod 2)=1 then
                                                Begin
                                                        y:=y+1;
                                                        If y>n then
                                                            Begin
                                                                   x:=x+1; y:=n;
                                                            End;
                                                End
                                        Else
                                                Begin
                                                        y:=y-1;
                                                        If y<1 then
                                                            Begin
                                                                   x:=x+1; y:=1;
                                                            End;
                                                End;
                                        a[x,y]:=i;
                                End;
                End;
        Close(f);
End;
{----------------------------------------------------------------------------}
Procedure Xuat;
Begin
        Assign(f,fo); rewrite(f);
        For i:=1 to m do
                Begin
                        For j:=1 to n do write(f,a[i,j],' ');
                        Writeln(f);
                End;
        Close(f);
End;
{----------------------------------------------------------------------------}
Begin
        Xuly;
        Xuat;
End.
 