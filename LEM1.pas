Uses math;
Const           Fi      =       '';
                Fo      =       '';
Type            Diem    =       Record
                        X,Y     :       Longint;
                end;
Var             A,B     :       Array[1..1000] of diem;
                N,M     :       Integer;
                Re      :       double;
Procedure       Openf;
  begin
       assign(input,fi);reset(input);
       assign(output,fo);rewrite(output);
  end;
Procedure       Inp;
 var i:integer;
  begin
       readln(n,m);
       for i:=1 to n do readln(a[i].x,a[i].y);
       for i:=1 to m do readln(b[i].x,b[i].y);
  end;
Function        Len(a,b:diem):double;
  begin
       len:=sqr(a.x-b.x)+sqr(a.y-b.y);
  end;
Function        Distance(p,q,r:diem):double;
 var u,v,t,c,d:double;
  begin
       u:=q.x-p.x;
       v:=q.y-p.y;
       t:=(u*(r.x-p.x)+v*(r.y-p.y))/(sqr(u)+sqr(v));
       c:=p.x+u*t;
       d:=p.y+v*t;
       if (p.y<=d) and (d<=q.y) then distance:=sqr(r.x-c)+sqr(r.y-d)
       else distance:=200000000;
  end;
Procedure       Solve;
 var i,j:longint;
     x:double;
  begin
       re:=200000000;
       for i:=1 to n do
         for j:=1 to m do
           begin
             if len(a[i],b[j])<re then re:=len(a[i],b[j]);
             if re=0 then
             write;
             if i<n then
               if distance(a[i],a[i+1],b[j])<re then re:=distance(a[i],a[i+1],b[j]);
             if j<m then
               if distance(b[j],b[j+1],a[i])<re then re:=distance(b[j],b[j+1],a[i]);
           end;
       writeln(sqrt(re):0:3);
  end;
Procedure       Main;
  begin
       inp;
       solve;
  end;
Procedure       Closef;
  begin
       close(input);
       close(output);
  end;
BEGIN
      Openf;
      Main;
      Closef;
END.