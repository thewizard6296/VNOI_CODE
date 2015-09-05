Program                         LSFIGHT;
CONST                           FI='';
                                FO='';
Var                             A:array[0..500,0..500] Of 0..1;
                                F:array[0..500,0..500] Of Boolean;
                                next:array[1..500] Of Integer;
                                N,Result:longint;
(*=====================================*)
Procedure                       Nhap;
Var                             i,j:Longint;
Begin
        Assign(Input,Fi); Reset(Input);
        Readln(n);
        For i:=1 to n do
        Begin
                For j:=1 to n do read(a[i,j]);
                readln;
        End;
        CLose(Input);
End;
(*=====================================*)
Procedure                       Lam;
Var                             i,j,k,d:longint;
Begin
        Fillchar(F,sizeof(F),False);
        For i:=1 to n do
        next[i]:=i mod n +1;
        For i:=1 to n do
        F[i,next[i]]:=True;
        For d:=2 to n do
        For i:=1 to n do
        Begin
                J:=i+d;
                If J>n then J:=J-n;
                k:=next[i];
                While k<>i do
                Begin
                        If (F[i,k]) and (F[k,j]) then
                        If (A[i,k]=1) or (A[j,k]=1) then
                        Begin
                                F[i,j]:=True;
                                Break;
                        End;
                        K:=Next[k];
                End;
        End;
        Result:=0;
        For i:=1 to n do
        If F[i,i] then Inc(Result);
        Writeln(Result);
        For i:=1 to n do
        If F[i,i] then writeln(i);
End;
(*=====================================*)
Begin
        Assign(Output,Fo); Rewrite(Output);
        Nhap;
        Lam;
        CLose(Output);
End.