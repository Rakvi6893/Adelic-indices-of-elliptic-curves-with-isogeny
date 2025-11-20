//312.28.1.a.1

x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),2);
for i in [1..3] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
-6*x[1]^3 - 36*x[1]^2*x[2] - 78*x[1]*x[2]^2 + x[2]*x[3]^2
]); // Model taken from Zywina's github repo
Pts:=PointSearch(C,100);
E:=EllipticCurve(C,Pts[1]);
Rank(E); //0 true
TorsionSubgroup(E); // Z/2Z 
